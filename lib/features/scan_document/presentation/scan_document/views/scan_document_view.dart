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

class _ScanDocumentBody extends StatelessWidget {
  const _ScanDocumentBody();

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
            backgroundColor: context.grey900,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
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
        final docs = state is ScannerLoaded
            ? state.documents
            : <ScannedDocument>[];
        final isScanning = state is ScannerScanning;

        return Scaffold(
          appBar: CustomAppBar(title: 'Documents'),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: isScanning
                ? null
                : () => context.read<ScannerBloc>().add(const ScanStarted()),
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
                      Text(
                        'Scan',
                        style: TextStyle(color: context.white),
                      ),
                    ],
                  ),
          ),
          body: docs.isEmpty
              ? const _EmptyState()
              : GridView.builder(
                  padding: context.pagePadding,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: context.gridColumnCount,
                    mainAxisSpacing: context.gridSpacing,
                    crossAxisSpacing: context.gridSpacing,
                    childAspectRatio: 0.72,
                  ),
                  itemCount: docs.length,
                  itemBuilder: (context, index) {
                    final doc = docs[index];
                    return DocCard(
                      document: doc,
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => DocumentViewPage(document: doc),
                        ),
                      ),
                      onDelete: () => _confirmDelete(context, doc.id),
                    );
                  },
                ),
        );
      },
    );
  }

  Future<void> _confirmDelete(BuildContext context, String id) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: ctx.grey900,
        title: Text(
          'Delete document?',
          style: TextStyle(color: ctx.textPrimary),
        ),
        content: Text(
          'This action cannot be undone.',
          style: TextStyle(color: ctx.textSecondary),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(
              'Cancel',
              style: TextStyle(color: ctx.textSecondary),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(
              'Delete',
              style: TextStyle(color: ctx.error),
            ),
          ),
        ],
      ),
    );
    if (confirmed == true && context.mounted) {
      context.read<ScannerBloc>().add(DocumentDeleted(id));
    }
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
          Icon(Icons.document_scanner, color: context.textDisabled, size: 80),
          const SizedBox(height: 16),
          Text(
            'No documents yet',
            style: context.titleLarge.copyWith(color: context.textPrimary),
          ),
          const SizedBox(height: 8),
          Text(
            'Tap Scan to begin',
            style: context.bodyMedium.copyWith(color: context.textSecondary),
          ),
        ],
      ),
    );
  }
}
