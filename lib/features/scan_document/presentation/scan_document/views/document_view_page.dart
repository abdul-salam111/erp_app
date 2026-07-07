import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
        backgroundColor: ctx.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        title: Text(
          'Rename Document',
          style: ctx.titleMedium.copyWith(
            color: ctx.black,
            fontWeight: .w600,
          ),
        ),
        content: TextField(
          controller: controller,
          autofocus: true,
          style: TextStyle(color: ctx.black),
          decoration: InputDecoration(
            filled: true,
            fillColor: ctx.grey50,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: ctx.primary),
            ),
            hintText: 'Document name',
            hintStyle: TextStyle(color: ctx.grey400),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(
              'Cancel',
              style: TextStyle(color: ctx.grey500),
            ),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx),
            style: FilledButton.styleFrom(
              backgroundColor: ctx.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              'Save',
              style: TextStyle(color: ctx.white),
            ),
          ),
        ],
      ),
    );
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: context.grey50,
        appBar: AppBar(
          backgroundColor: context.white,
          foregroundColor: context.black,
          elevation: 0,
          surfaceTintColor: context.white,
          shadowColor: const Color(0x14000000),
          centerTitle: false,
          title: Column(
            crossAxisAlignment: .start,
            mainAxisSize: .min,
            children: [
              Text(
                widget.document.name,
                style: context.titleMedium.copyWith(
                  color: context.black,
                  fontWeight: .w600,
                ),
              ),
              if (_pageCount > 1)
                Text(
                  'Page ${_currentPage + 1} of $_pageCount',
                  style: context.bodySmall.copyWith(color: context.grey500),
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
                  return Padding(
                    padding: const EdgeInsets.all(16),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        color: context.white,
                        child: InteractiveViewer(
                          child: Image.file(
                            File(widget.document.imagePaths[index]),
                            fit: .contain,
                            errorBuilder: (_, __, ___) => Center(
                              child: Column(
                                mainAxisSize: .min,
                                children: [
                                  Icon(
                                    Icons.broken_image_outlined,
                                    color: context.grey300,
                                    size: 64,
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    'Could not load image',
                                    style: context.bodySmall.copyWith(
                                      color: context.grey400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            if (_pageCount > 1)
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
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
                        color: active ? context.primary : context.grey300,
                        borderRadius: BorderRadius.circular(3),
                      ),
                    );
                  }),
                ),
              ),
            _BottomBar(
              onShare: _share,
              onRename: _rename,
            ),
          ],
        ),
      ),
    );
  }
}

class _BottomBar extends StatelessWidget {
  final VoidCallback onShare;
  final VoidCallback onRename;

  const _BottomBar({required this.onShare, required this.onRename});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.white,
        border: Border(
          top: BorderSide(color: context.grey200, width: 1),
        ),
      ),
      padding: EdgeInsets.fromLTRB(
        24,
        12,
        24,
        12 + MediaQuery.of(context).padding.bottom,
      ),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton.icon(
              onPressed: onShare,
              icon: const Icon(Icons.ios_share_rounded, size: 18),
              label: const Text('Share'),
              style: OutlinedButton.styleFrom(
                foregroundColor: context.primary,
                side: BorderSide(color: context.primary),
                padding: const EdgeInsets.symmetric(vertical: 13),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                textStyle: context.bodySmall.copyWith(fontWeight: .w600),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: FilledButton.icon(
              onPressed: onRename,
              icon: const Icon(Icons.drive_file_rename_outline_rounded, size: 18),
              label: const Text('Rename'),
              style: FilledButton.styleFrom(
                backgroundColor: context.primary,
                foregroundColor: context.white,
                padding: const EdgeInsets.symmetric(vertical: 13),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                textStyle: context.bodySmall.copyWith(fontWeight: .w600),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
