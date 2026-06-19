import 'package:flutter/material.dart';
import '../../../../../core/theme/theme_exports.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/widgets.dart';

class CashbookShimmerBody extends StatelessWidget {
  const CashbookShimmerBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(
        left: context.pagePadding.left,
        right: context.pagePadding.right,
        top: 12,
        bottom: 16,
      ),
      children: [
        ShimmerBox(height: 12, width: 90, radius: 4),
        const SizedBox(height: 10),
        const _ShimmerYearCard(),
        const SizedBox(height: 8),
        const _ShimmerYearCard(rowCount: 3),
      ],
    );
  }
}

class _ShimmerYearCard extends StatelessWidget {
  final int rowCount;
  const _ShimmerYearCard({this.rowCount = 4});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.white,
        borderRadius: .circular(10),
        border: Border.all(color: context.border),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            child: Row(
              children: [
                ShimmerBox(height: 24, width: 24, radius: 6),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      ShimmerBox(height: 12, width: 100, radius: 4),
                      const SizedBox(height: 5),
                      ShimmerBox(height: 10, width: 160, radius: 4),
                    ],
                  ),
                ),
                ShimmerBox(height: 30, width: 80, radius: 6),
              ],
            ),
          ),
          ...List.generate(
            rowCount,
            (_) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Row(
                children: [
                  ShimmerBox(height: 40, width: 40, radius: 12),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: .start,
                      children: [
                        ShimmerBox(height: 12, width: double.infinity, radius: 4),
                        const SizedBox(height: 5),
                        ShimmerBox(height: 10, width: 80, radius: 4),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: .end,
                    children: [
                      ShimmerBox(height: 14, width: 70, radius: 4),
                      const SizedBox(height: 4),
                      ShimmerBox(height: 11, width: 60, radius: 4),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
