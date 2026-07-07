import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/di/di_exports.dart';
import '../../../../../core/theme/theme_exports.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import '../blocs/scan_document_bloc.dart';
import '../blocs/scan_document_event.dart';
import '../blocs/scan_document_state.dart';
import '../../../domain/entities/scanned_document.dart';
import '../widgets/doc_card.dart';
import '../widgets/name_document_sheet.dart';
import 'document_view_page.dart';

class ScanDocumentView extends StatelessWidget {
  const ScanDocumentView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<ScannerBloc>()..add(const DocumentsLoaded()),
      child: const _ScanDocumentBody(),
    );
  }
}

class _ScanDocumentBody extends StatefulWidget {
  const _ScanDocumentBody();

  @override
  State<_ScanDocumentBody> createState() => _ScanDocumentBodyState();
}

class _ScanDocumentBodyState extends State<_ScanDocumentBody> {
  final _searchController = TextEditingController();
  String _query = '';

  bool _isSelecting = false;
  final Set<String> _selectedIds = {};

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _enterSelectionMode(String firstId) {
    setState(() {
      _isSelecting = true;
      _selectedIds
        ..clear()
        ..add(firstId);
      // Clear search while selecting
      _searchController.clear();
      _query = '';
    });
  }

  void _exitSelectionMode() {
    setState(() {
      _isSelecting = false;
      _selectedIds.clear();
    });
  }

  void _toggleSelection(String id) {
    setState(() {
      if (_selectedIds.contains(id)) {
        _selectedIds.remove(id);
        if (_selectedIds.isEmpty) _isSelecting = false;
      } else {
        _selectedIds.add(id);
      }
    });
  }

  void _selectAll(List<ScannedDocument> docs) {
    setState(() => _selectedIds.addAll(docs.map((d) => d.id)));
  }

  Future<void> _deleteSelected(BuildContext context) async {
    final count = _selectedIds.length;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: ctx.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        title: Text(
          'Delete $count ${count == 1 ? 'document' : 'documents'}?',
          style: ctx.titleMedium.copyWith(color: ctx.black, fontWeight: .w600),
        ),
        content: Text(
          'This action cannot be undone.',
          style: ctx.bodySmall.copyWith(color: ctx.grey500),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text('Cancel', style: TextStyle(color: ctx.grey500)),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: FilledButton.styleFrom(
              backgroundColor: ctx.error,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text('Delete', style: TextStyle(color: ctx.white)),
          ),
        ],
      ),
    );
    if (confirmed == true && context.mounted) {
      context
          .read<ScannerBloc>()
          .add(DocumentsDeleted(_selectedIds.toList()));
      _exitSelectionMode();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ScannerBloc, ScannerState>(
      listener: (context, state) async {
        if (state is ScannerError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: context.error,
            ),
          );
        }
        if (state is ScannerNamingDocument) {
          final name = await showModalBottomSheet<String>(
            context: context,
            isScrollControlled: true,
            backgroundColor: context.white,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            ),
            builder: (_) => const NameDocumentSheet(),
          );
          if (context.mounted) {
            if (name != null && name.isNotEmpty) {
              context.read<ScannerBloc>().add(
                    DocumentNamed(imagePaths: state.imagePaths, name: name),
                  );
            } else {
              context.read<ScannerBloc>().add(const DocumentsLoaded());
            }
          }
        }
      },
      builder: (context, state) {
        final allDocs =
            state is ScannerLoaded ? state.documents : <ScannedDocument>[];
        final isScanning = state is ScannerScanning;

        final docs = _query.isEmpty
            ? allDocs
            : allDocs
                .where(
                    (d) => d.name.toLowerCase().contains(_query.toLowerCase()))
                .toList();

        final selectedCount = _selectedIds.length;
        final allSelected =
            allDocs.isNotEmpty && _selectedIds.length == allDocs.length;

        return Scaffold(
          backgroundColor: context.grey50,
          appBar: _isSelecting
              ? AppBar(
                  backgroundColor: context.white,
                  foregroundColor: context.black,
                  elevation: 0,
                  surfaceTintColor: context.white,
                  leading: TextButton(
                    onPressed: _exitSelectionMode,
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: context.primary),
                    ),
                  ),
                  leadingWidth: 80,
                  title: Text(
                    '$selectedCount selected',
                    style: context.titleMedium.copyWith(
                      color: context.black,
                      fontWeight: .w600,
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: allSelected
                          ? _exitSelectionMode
                          : () => _selectAll(allDocs),
                      child: Text(
                        allSelected ? 'Deselect All' : 'Select All',
                        style: TextStyle(color: context.primary),
                      ),
                    ),
                  ],
                )
              : CustomAppBar(title: 'Documents'),
          floatingActionButton: _isSelecting
              ? null
              : FloatingActionButton.extended(
                  onPressed: isScanning
                      ? null
                      : () =>
                          context.read<ScannerBloc>().add(const ScanStarted()),
                  backgroundColor: context.primary,
                  label: isScanning
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: AppColors.white,
                          ),
                        )
                      : Row(
                          children: [
                            Icon(Icons.document_scanner, color: context.white),
                            const SizedBox(width: 8),
                            Text('Scan', style: TextStyle(color: context.white)),
                          ],
                        ),
                ),
          bottomNavigationBar: _isSelecting
              ? _SelectionActionBar(
                  selectedCount: selectedCount,
                  onDelete: () => _deleteSelected(context),
                )
              : null,
          body: Column(
            children: [
              if (!_isSelecting && allDocs.isNotEmpty)
                Padding(
                  padding: context.pagePadding.copyWith(bottom: 4),
                  child: TextField(
                    controller: _searchController,
                    onChanged: (v) => setState(() => _query = v),
                    style: context.bodySmall.copyWith(color: context.black),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: context.white,
                      hintText: 'Search documents…',
                      hintStyle: TextStyle(color: context.grey400),
                      prefixIcon: Icon(
                        Icons.search,
                        color: context.grey400,
                        size: 20,
                      ),
                      suffixIcon: _query.isNotEmpty
                          ? IconButton(
                              icon: Icon(
                                Icons.close,
                                color: context.grey400,
                                size: 18,
                              ),
                              onPressed: () {
                                _searchController.clear();
                                setState(() => _query = '');
                              },
                            )
                          : null,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 12,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: context.grey200),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: context.grey200),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: context.primary),
                      ),
                    ),
                  ),
                ),
              Expanded(
                child: allDocs.isEmpty
                    ? const _EmptyState()
                    : docs.isEmpty
                        ? _NoResults(query: _query)
                        : GridView.builder(
                            padding: context.pagePadding,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: context.gridColumnCount,
                              mainAxisSpacing: context.gridSpacing,
                              crossAxisSpacing: context.gridSpacing,
                              childAspectRatio: 0.72,
                            ),
                            itemCount: docs.length,
                            itemBuilder: (context, index) {
                              final doc = docs[index];
                              final selected = _selectedIds.contains(doc.id);
                              return DocCard(
                                document: doc,
                                isSelecting: _isSelecting,
                                isSelected: selected,
                                onTap: () {
                                  if (_isSelecting) {
                                    _toggleSelection(doc.id);
                                  } else {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (_) =>
                                            DocumentViewPage(document: doc),
                                      ),
                                    );
                                  }
                                },
                                onLongPress: () {
                                  if (!_isSelecting) {
                                    _enterSelectionMode(doc.id);
                                  }
                                },
                              );
                            },
                          ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _SelectionActionBar extends StatelessWidget {
  final int selectedCount;
  final VoidCallback onDelete;

  const _SelectionActionBar({
    required this.selectedCount,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.white,
        border: Border(top: BorderSide(color: context.grey200)),
      ),
      padding: EdgeInsets.fromLTRB(
        20,
        12,
        20,
        12 + MediaQuery.of(context).padding.bottom,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              '$selectedCount ${selectedCount == 1 ? 'document' : 'documents'} selected',
              style: context.bodySmall.copyWith(color: context.grey500),
            ),
          ),
          FilledButton.icon(
            onPressed: selectedCount == 0 ? null : onDelete,
            icon: const Icon(Icons.delete_outline_rounded, size: 18),
            label: Text('Delete ($selectedCount)'),
            style: FilledButton.styleFrom(
              backgroundColor: context.error,
              foregroundColor: context.white,
              disabledBackgroundColor: context.grey200,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              textStyle: context.bodySmall.copyWith(fontWeight: .w600),
            ),
          ),
        ],
      ),
    );
  }
}

class _NoResults extends StatelessWidget {
  final String query;

  const _NoResults({required this.query});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: .min,
        children: [
          Icon(Icons.search_off_rounded, color: context.grey300, size: 64),
          const SizedBox(height: 16),
          Text(
            'No results for "$query"',
            style: context.titleMedium.copyWith(
              color: context.black,
              fontWeight: .w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Try a different name',
            style: context.bodySmall.copyWith(color: context.grey400),
          ),
        ],
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: .min,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: context.primary.withValues(alpha: 0.08),
              shape: .circle,
            ),
            child: Icon(
              Icons.document_scanner_outlined,
              color: context.primary,
              size: 48,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'No documents yet',
            style: context.titleMedium.copyWith(
              color: context.black,
              fontWeight: .w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Tap Scan to scan your first document',
            style: context.bodySmall.copyWith(color: context.grey400),
          ),
        ],
      ),
    );
  }
}
