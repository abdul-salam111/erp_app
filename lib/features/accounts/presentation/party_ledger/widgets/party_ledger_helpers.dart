import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/utils/utils_exports.dart';

String formatPartyLedgerBalance(double balance) {
  final abs = balance.abs();
  final suffix = balance >= 0 ? AppConstants.dr : AppConstants.cr;
  return 'Rs. ${abs.formatPrice()} $suffix';
}
