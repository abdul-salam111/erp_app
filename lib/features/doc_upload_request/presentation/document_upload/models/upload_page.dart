/// One page in the upload-preview organizer. Every source (a scanned
/// photo, a picked image, or a single page rasterized out of a picked PDF)
/// ends up as one of these so the grid can treat them identically —
/// reorder, delete, zoom — regardless of where the page came from.
class UploadPage {
  final String id;
  final String imagePath;

  const UploadPage({required this.id, required this.imagePath});
}
