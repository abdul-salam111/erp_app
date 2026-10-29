import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:printing/printing.dart';
import '../models/upload_page.dart';

/// Turns the picked/scanned source paths into a flat, ordered list of pages
/// ready for the organizer grid. Plain images become a page as-is; any PDF
/// is rasterized page-by-page (via the `printing` package) into images, so
/// every page — whatever it came from — is just an image after this call.
Future<List<UploadPage>> buildUploadPages(List<String> sourcePaths) async {
  final pages = <UploadPage>[];
  var seq = 0;

  for (final path in sourcePaths) {
    if (path.toLowerCase().endsWith('.pdf')) {
      final images = await _explodePdfToImages(path);
      for (final imagePath in images) {
        pages.add(UploadPage(id: 'page_${seq++}', imagePath: imagePath));
      }
    } else {
      pages.add(UploadPage(id: 'page_${seq++}', imagePath: path));
    }
  }

  return pages;
}

Future<List<String>> _explodePdfToImages(String pdfPath) async {
  final bytes = await File(pdfPath).readAsBytes();
  final dir = await getTemporaryDirectory();
  final stamp = DateTime.now().millisecondsSinceEpoch;

  final images = <String>[];
  var pageIndex = 0;
  await for (final page in Printing.raster(bytes, dpi: 150)) {
    final png = await page.toPng();
    final file = File('${dir.path}/pdf_page_${stamp}_$pageIndex.png');
    await file.writeAsBytes(png);
    images.add(file.path);
    pageIndex++;
  }

  return images;
}
