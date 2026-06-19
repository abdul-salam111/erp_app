import '../../constants/const_exports.dart';
import '../../utils/utils_exports.dart';

String formatAccountsBalance(double balance) {
  final abs = balance.abs();
  final suffix = balance >= 0 ? AppConstants.dr : AppConstants.cr;
  return 'Rs. ${abs.formatPrice()} $suffix';
}
