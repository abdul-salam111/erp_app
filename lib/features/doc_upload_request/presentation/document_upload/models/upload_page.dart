/// One page in the upload-preview organizer. Every source (a scanned
/// photo, a picked image, or a single page rasterized out of a picked PDF)
/// ends up as one of these so the grid can treat them identically —
/// reorder, delete, zoom — regardless of where the page came from.
///
/// [sourcePdfPath]/[sourcePdfPageIndex]/[sourcePdfPageCount] are only set
/// for a page rasterized out of a PDF — they let the upload step detect
/// "this is still that exact, untouched PDF" and send the original file
/// instead of a rebuilt one.
class UploadPage {
  final String id;
  final String imagePath;
  final String? sourcePdfPath;
  final int? sourcePdfPageIndex;
  final int? sourcePdfPageCount;

  const UploadPage({
    required this.id,
    required this.imagePath,
    this.sourcePdfPath,
    this.sourcePdfPageIndex,
    this.sourcePdfPageCount,
  });
}
