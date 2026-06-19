import 'package:flutter/material.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/theme/theme_exports.dart';
import '../../../../../core/widgets/widgets.dart';
import '../../../../accounts/domain/entities/ledger_statement_entity.dart';

class AcStatementTab extends StatelessWidget {
  const AcStatementTab({super.key});

  static final _mockStatements = [
    LedgerStatementEntity(
      finYearId: 2,
      ttlDebit: 9200,
      ttlCredit: 5000,
      balance: 4200,
      finYear: const LedgerFinYearEntity(id: 2, name: 'FY 2024-25'),
      ledgerTypes: [
        LedgerTypeEntity(
          type: 'Sales',
          ttlDebit: 9200,
          ttlCredit: 0,
          balance: 9200,
          ledgers: [
            const LedgerEntryEntity(isOpening: true, drAmount: 0, crAmount: 4000, balance: -4000),
            LedgerEntryEntity(
              isOpening: false,
              featureName: 'Sales Invoice',
              docNbr: 'SI-2401',
              docDate: DateTime(2024, 8, 15),
              drAmount: 4200,
              crAmount: 0,
              balance: 200,
              featureId: 1,
              parentEntityId: 1,
            ),
            LedgerEntryEntity(
              isOpening: false,
              featureName: 'Sales Invoice',
              docNbr: 'SI-2402',
              docDate: DateTime(2024, 10, 3),
              drAmount: 3800,
              crAmount: 0,
              balance: 4000,
              featureId: 1,
              parentEntityId: 2,
            ),
            LedgerEntryEntity(
              isOpening: false,
              featureName: 'Sales Invoice',
              docNbr: 'SI-2403',
              docDate: DateTime(2025, 1, 20),
              drAmount: 1200,
              crAmount: 0,
              balance: 5200,
              featureId: 1,
              parentEntityId: 3,
            ),
          ],
        ),
        LedgerTypeEntity(
          type: 'Payments',
          ttlDebit: 0,
          ttlCredit: 5000,
          balance: -5000,
          ledgers: [
            LedgerEntryEntity(
              isOpening: false,
              featureName: 'Receipt',
              docNbr: 'RV-2401',
              docDate: DateTime(2024, 9, 1),
              drAmount: 0,
              crAmount: 3000,
              balance: 2200,
              featureId: 2,
              parentEntityId: 4,
            ),
            LedgerEntryEntity(
              isOpening: false,
              featureName: 'Receipt',
              docNbr: 'RV-2402',
              docDate: DateTime(2024, 11, 14),
              drAmount: 0,
              crAmount: 2000,
              balance: 200,
              featureId: 2,
              parentEntityId: 5,
            ),
          ],
        ),
      ],
    ),
    LedgerStatementEntity(
      finYearId: 1,
      ttlDebit: 12000,
      ttlCredit: 12000,
      balance: 0,
      finYear: const LedgerFinYearEntity(id: 1, name: 'FY 2023-24'),
      ledgerTypes: [
        LedgerTypeEntity(
          type: 'Sales',
          ttlDebit: 12000,
          ttlCredit: 0,
          balance: 12000,
          ledgers: [
            const LedgerEntryEntity(isOpening: true, drAmount: 0, crAmount: 0, balance: 0),
            LedgerEntryEntity(
              isOpening: false,
              featureName: 'Sales Invoice',
              docNbr: 'SI-2301',
              docDate: DateTime(2023, 8, 10),
              drAmount: 7500,
              crAmount: 0,
              balance: 7500,
              featureId: 1,
              parentEntityId: 6,
            ),
            LedgerEntryEntity(
              isOpening: false,
              featureName: 'Sales Invoice',
              docNbr: 'SI-2302',
              docDate: DateTime(2024, 2, 5),
              drAmount: 4500,
              crAmount: 0,
              balance: 12000,
              featureId: 1,
              parentEntityId: 7,
            ),
          ],
        ),
        LedgerTypeEntity(
          type: 'Payments',
          ttlDebit: 0,
          ttlCredit: 12000,
          balance: -12000,
          ledgers: [
            LedgerEntryEntity(
              isOpening: false,
              featureName: 'Receipt',
              docNbr: 'RV-2301',
              docDate: DateTime(2023, 10, 20),
              drAmount: 0,
              crAmount: 7500,
              balance: 4500,
              featureId: 2,
              parentEntityId: 8,
            ),
            LedgerEntryEntity(
              isOpening: false,
              featureName: 'Receipt',
              docNbr: 'RV-2302',
              docDate: DateTime(2024, 3, 15),
              drAmount: 0,
              crAmount: 4500,
              balance: 0,
              featureId: 2,
              parentEntityId: 9,
            ),
          ],
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return AccountsStatementsBody(
      yearCards: [
        for (final s in _mockStatements)
          AccountsYearCard(
            finYearName: s.finYear?.name ?? '',
            balance: (s.balance ?? 0).toDouble(),
            ttlDebit: (s.ttlDebit ?? 0).toDouble(),
            ttlCredit: (s.ttlCredit ?? 0).toDouble(),
            groups: [
              for (final lt in (s.ledgerTypes ?? []))
                if ((lt.ledgers ?? []).isNotEmpty &&
                    !(lt.ttlDebit == 0 && lt.ttlCredit == 0 && lt.balance == 0))
                  (type: lt.type ?? '', entries: (lt.ledgers ?? []).cast()),
            ],
            rowBuilder: (entry) => AccountsLedgerRow(
              ledger: entry,
              onTap: (ctx, date, dr, cr) => showDialog(
                context: ctx,
                builder: (_) => AccountsLedgerDetailDialog(
                  ledger: entry,
                  date: date,
                  dr: dr,
                  cr: cr,
                  bottomSection: SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () => Navigator.of(ctx).pop(),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: ctx.textSecondary,
                        side: BorderSide(color: ctx.border),
                        shape: RoundedRectangleBorder(borderRadius: .circular(10)),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: Text(AppConstants.close, style: ctx.bodySmall),
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
