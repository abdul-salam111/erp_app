import 'package:flutter/material.dart';
import '../../../../../core/theme/theme_exports.dart';
import '../widgets/ac_statement_tab.dart';
import '../widgets/credit_details_app_bar.dart';
import '../widgets/home_tab.dart';

class CreditManagementDetailsView extends StatelessWidget {
  final String customer;
  final String city;
  final String creditRating;
  final Color ratingColor;
  final String balance;
  final int? partyId;

  const CreditManagementDetailsView({
    super.key,
    required this.customer,
    this.city = '',
    required this.creditRating,
    required this.ratingColor,
    required this.balance,
    this.partyId,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: context.grey50,
        appBar: CreditDetailsAppBar(
          customer: customer,
          city: city,
          creditRating: creditRating,
          ratingColor: ratingColor,
        ),
        body: TabBarView(
          children: [HomeTab(balance: balance), AcStatementTab(partyId: partyId)],
        ),
      ),
    );
  }
}
