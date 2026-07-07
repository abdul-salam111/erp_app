import 'dart:io';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import '../../../../../core/theme/theme_exports.dart';
import '../../../domain/entities/scanned_document.dart';

class DocumentViewPage extends StatefulWidget {
  final ScannedDocument document;

  const DocumentViewPage({super.key, required this.document});

  @override
  State<DocumentViewPage> createState() => _DocumentViewPageState();
}

class _DocumentViewPageState extends State<DocumentViewPage> {
  late final PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  int get _pageCount => widget.document.imagePaths.length;

  Future<void> _share() async {
    final files = widget.document.imagePaths.map((p) => XFile(p)).toList();
    await Share.shareXFiles(files);
  }

  Future<void> _rename() async {
    final controller = TextEditingController(text: widget.document.name);
    await showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: ctx.grey900,
        title: Text(
          'Rename',
          style: TextStyle(color: ctx.textPrimary),
        ),
        content: TextField(
          controller: controller,
          autofocus: true,
          style: TextStyle(color: ctx.textPrimary),
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: ctx.border),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: ctx.primary),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(
              'Cancel',
              style: TextStyle(color: ctx.textSecondary),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(
              'Save',
              style: TextStyle(color: ctx.primary),
            ),
          ),
        ],
      ),
    );
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.black,
      appBar: AppBar(
        backgroundColor: context.black,
        foregroundColor: context.textPrimary,
        title: Column(
          crossAxisAlignment: .start,
          children: [
            Text(
              widget.document.name,
              style: context.titleMedium.copyWith(
                color: context.textPrimary,
                fontWeight: .w600,
              ),
            ),
            if (_pageCount > 1)
              Text(
                'Page ${_currentPage + 1} of $_pageCount',
                style: context.bodySmall.copyWith(color: context.textSecondary),
              ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: _pageCount,
              onPageChanged: (i) => setState(() => _currentPage = i),
              itemBuilder: (context, index) {
                return InteractiveViewer(
                  child: Image.file(
                    File(widget.document.imagePaths[index]),
                    fit: .contain,
                    errorBuilder: (_, __, ___) => Center(
                      child: Icon(
                        Icons.broken_image,
                        color: context.textDisabled,
                        size: 64,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          if (_pageCount > 1)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Row(
                mainAxisAlignment: .center,
                children: List.generate(_pageCount, (i) {
                  final active = i == _currentPage;
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    width: active ? 20 : 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color: active ? context.primary : context.grey600,
                      borderRadius: BorderRadius.circular(3),
                    ),
                  );
                }),
              ),
            ),
          Container(
            color: context.grey900,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Row(
              mainAxisAlignment: .spaceEvenly,
              children: [
                _ActionButton(
                  icon: Icons.share,
                  label: 'Share',
                  onTap: _share,
                ),
                _ActionButton(
                  icon: Icons.edit,
                  label: 'Rename',
                  onTap: _rename,
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).padding.bottom),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ActionButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: .min,
        children: [
          Icon(icon, color: context.textPrimary, size: 24),
          const SizedBox(height: 4),
          Text(
            label,
            style: context.labelSmall.copyWith(color: context.textPrimary),
          ),
        ],
      ),
    );
  }
}
