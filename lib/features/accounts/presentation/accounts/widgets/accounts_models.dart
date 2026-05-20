enum CustomerStatus { actionRequired, partial }

enum TileAction { addReceipt, postponeInvoice }

class CustomerRow {
  final String initials;
  final String name;
  final String city;
  final String invoiceNo;
  final String date;
  final String paid;
  final String total;
  final CustomerStatus status;

  const CustomerRow({
    required this.initials,
    required this.name,
    required this.city,
    required this.invoiceNo,
    required this.date,
    required this.paid,
    required this.total,
    required this.status,
  });
}
