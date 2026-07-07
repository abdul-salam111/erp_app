import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
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
  bool _isBusy = false;

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

  Future<void> _showShareOptions() async {
    await showModalBottomSheet<void>(
      context: context,
      backgroundColor: context.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      builder: (ctx) => _ShareSheet(
        pageCount: _pageCount,
        onSharePdf: () {
          Navigator.pop(ctx);
          _shareAsPdf();
        },
        onShareImages: () {
          Navigator.pop(ctx);
          _shareAsImages();
        },
      ),
    );
  }

  Future<void> _shareAsPdf() async {
    setState(() => _isBusy = true);
    try {
      final pdf = pw.Document();

      for (final path in widget.document.imagePaths) {
        final bytes = await File(path).readAsBytes();
        final image = pw.MemoryImage(bytes);
        pdf.addPage(
          pw.Page(
            pageFormat: PdfPageFormat.a4,
            margin: pw.EdgeInsets.zero,
            build: (_) => pw.Image(image, fit: pw.BoxFit.contain),
          ),
        );
      }

      final dir = await getTemporaryDirectory();
      final safeName = widget.document.name.replaceAll(RegExp(r'[^\w\s-]'), '_');
      final file = File('${dir.path}/$safeName.pdf');
      await file.writeAsBytes(await pdf.save());

      await SharePlus.instance.share(
        ShareParams(
          files: [XFile(file.path, mimeType: 'application/pdf')],
          subject: widget.document.name,
        ),
      );
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to create PDF: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _isBusy = false);
    }
  }

  Future<void> _shareAsImages() async {
    final files = widget.document.imagePaths.map((p) => XFile(p)).toList();
    await SharePlus.instance.share(ShareParams(files: files));
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
            child: Text('Cancel', style: TextStyle(color: ctx.grey500)),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx),
            style: FilledButton.styleFrom(
              backgroundColor: ctx.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text('Save', style: TextStyle(color: ctx.white)),
          ),
        ],
      ),
    );
    // Defer disposal until after the dialog pop animation completes so the
    // TextField's animation doesn't touch a disposed controller.
    Future.delayed(const Duration(milliseconds: 300), controller.dispose);
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
              isBusy: _isBusy,
              onShare: _showShareOptions,
              onRename: _rename,
            ),
          ],
        ),
      ),
    );
  }
}

class _ShareSheet extends StatelessWidget {
  final int pageCount;
  final VoidCallback onSharePdf;
  final VoidCallback onShareImages;

  const _ShareSheet({
    required this.pageCount,
    required this.onSharePdf,
    required this.onShareImages,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        20,
        16,
        20,
        20 + MediaQuery.of(context).padding.bottom,
      ),
      child: Column(
        mainAxisSize: .min,
        crossAxisAlignment: .start,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: context.grey300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Share as',
            style: context.titleMedium.copyWith(
              color: context.black,
              fontWeight: .w600,
            ),
          ),
          const SizedBox(height: 16),
          _ShareOption(
            icon: Icons.picture_as_pdf_rounded,
            iconColor: const Color(0xFFE53935),
            title: 'PDF',
            subtitle: pageCount == 1
                ? '1 page • single file'
                : '$pageCount pages combined into one file',
            onTap: onSharePdf,
          ),
          const SizedBox(height: 10),
          _ShareOption(
            icon: Icons.image_outlined,
            iconColor: const Color(0xFF1E88E5),
            title: 'Images',
            subtitle: pageCount == 1
                ? '1 image file'
                : '$pageCount separate image files',
            onTap: onShareImages,
          ),
        ],
      ),
    );
  }
}

class _ShareOption extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _ShareOption({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.grey50,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: iconColor.withValues(alpha: 0.10),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: iconColor, size: 22),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      title,
                      style: context.bodySmall.copyWith(
                        color: context.black,
                        fontWeight: .w600,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: context.labelSmall.copyWith(
                        color: context.grey500,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.chevron_right, color: context.grey400, size: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class _BottomBar extends StatelessWidget {
  final bool isBusy;
  final VoidCallback onShare;
  final VoidCallback onRename;

  const _BottomBar({
    required this.isBusy,
    required this.onShare,
    required this.onRename,
  });

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
              onPressed: isBusy ? null : onShare,
              icon: isBusy
                  ? SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: context.primary,
                      ),
                    )
                  : const Icon(Icons.ios_share_rounded, size: 18),
              label: Text(isBusy ? 'Preparing…' : 'Share'),
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
