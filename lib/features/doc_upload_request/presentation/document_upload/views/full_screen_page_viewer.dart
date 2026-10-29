import 'dart:io';
import 'package:flutter/material.dart';
import '../../../../../core/theme/theme_exports.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../models/upload_page.dart';

class FullScreenPageViewer extends StatefulWidget {
  final List<UploadPage> pages;
  final int initialIndex;
  final ValueChanged<List<UploadPage>> onPagesChanged;

  const FullScreenPageViewer({
    super.key,
    required this.pages,
    required this.initialIndex,
    required this.onPagesChanged,
  });

  @override
  State<FullScreenPageViewer> createState() => _FullScreenPageViewerState();
}

class _FullScreenPageViewerState extends State<FullScreenPageViewer> {
  late List<UploadPage> _pages;
  late final PageController _controller;
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _pages = List.of(widget.pages);
    _currentIndex = widget.initialIndex;
    _controller = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _deleteCurrent() {
    _pages.removeAt(_currentIndex);
    widget.onPagesChanged(List.of(_pages));

    if (_pages.isEmpty) {
      Navigator.of(context).pop();
      return;
    }

    setState(() {
      if (_currentIndex >= _pages.length) _currentIndex = _pages.length - 1;
    });
    AppToastsUtils.showSuccessTop(context, 'Page removed');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.background,
      appBar: AppBar(
        backgroundColor: context.background,
        foregroundColor: context.textPrimary,
        elevation: 0,
        surfaceTintColor: context.background,
        title: Text('Page ${_currentIndex + 1} of ${_pages.length}'),
        actions: [
          IconButton(
            onPressed: _deleteCurrent,
            icon: const Icon(Icons.delete_outline_rounded),
          ),
        ],
      ),
      body: PageView.builder(
        controller: _controller,
        itemCount: _pages.length,
        onPageChanged: (i) => setState(() => _currentIndex = i),
        itemBuilder: (context, index) => InteractiveViewer(
          minScale: 1,
          maxScale: 4,
          child: Center(
            child: Image.file(
              File(_pages[index].imagePath),
              fit: .contain,
              errorBuilder: (_, __, ___) => Icon(
                Icons.broken_image_outlined,
                color: context.textDisabled,
                size: 64,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
