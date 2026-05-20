import 'package:flutter/material.dart';
import '../theme/theme_utils.dart';

class OverviewStatCard extends StatelessWidget {
  final String   label;
  final String   value;
  final IconData icon;
  final Color    color;

  const OverviewStatCard({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
      clipBehavior: .hardEdge,
      decoration: BoxDecoration(
        color:        context.white,
        borderRadius: .circular(10),
        border:       .all(color: const Color(0xFFEDEDED)),
        boxShadow: [
          BoxShadow(
            color:      Colors.black.withValues(alpha: 0.03),
            blurRadius: 4,
            offset:     const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: .stretch,
        children: [
          Container(width: 4, color: color.withValues(alpha: 0.20)),
          Expanded(
            child: Padding(
              padding: .symmetric(horizontal: 10, vertical: 9),
              child: Row(
                crossAxisAlignment: .center,
                children: [
                  Container(
                    width:  30,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: .circular(8),
                      color:        color.withValues(alpha: 0.10),
                    ),
                    child: Icon(icon, color: color, size: 16),
                  ),
                  const SizedBox(width: 9),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: .start,
                      mainAxisAlignment:  .center,
                      children: [
                        Text(
                          value,
                          style: context.bodyMedium.copyWith(
                            fontWeight: .w700,
                            color:      context.textPrimary,
                            fontSize:   13,
                            height:     1,
                          ),
                          maxLines: 1,
                          overflow: .ellipsis,
                        ),
                        const SizedBox(height: 3),
                        Text(
                          label,
                          style: context.labelSmall.copyWith(
                            color:    context.textSecondary,
                            fontSize: 10,
                            height:   1.1,
                          ),
                          maxLines: 1,
                          overflow: .ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      ),
    );
  }
}
class OverviewItem {
  final String   label;
  final IconData icon;
  final Color    color;

  const OverviewItem({
    required this.label,
    required this.icon,
    required this.color,
  });
}
