import 'package:flutter/material.dart';
import '../../../../../core/theme/theme_exports.dart';

class CreditDetailsAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String customer;
  final String city;
  final String creditRating;
  final Color ratingColor;

  const CreditDetailsAppBar({
    super.key,
    required this.customer,
    required this.city,
    required this.creditRating,
    required this.ratingColor,
  });

  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight + 12 + kTextTabBarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: context.primary,
      toolbarHeight: kToolbarHeight + 12,
      leadingWidth: 40,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white, size: 18),
        onPressed: () => Navigator.pop(context),
      ),
      centerTitle: false,
      title: Column(
        crossAxisAlignment: .start,
        children: [
          Text(
            customer,
            style: context.titleMedium.copyWith(
              color: context.white,
              fontSize: 15,
              fontWeight: .w600,
            ),
            maxLines: 1,
            overflow: .ellipsis,
          ),
          Text(
            city,
            style: context.labelSmall.copyWith(
              color: context.white.withValues(alpha: 0.75),
              fontSize: 11,
              fontWeight: .w400,
            ),
            maxLines: 1,
            overflow: .ellipsis,
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 14),
          child: Column(
            mainAxisAlignment: .center,
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(color: ratingColor, shape: .circle),
                alignment: .center,
                child: Text(
                  creditRating,
                  style: context.labelSmall.copyWith(
                    color: context.white,
                    fontSize: 13,
                    fontWeight: .w700,
                  ),
                ),
              ),
              const SizedBox(height: 2),
              Text(
                'CR',
                style: context.labelSmall.copyWith(
                  color: context.white.withValues(alpha: 0.7),
                  fontSize: 9,
                  fontWeight: .w500,
                ),
              ),
            ],
          ),
        ),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(kTextTabBarHeight),
        child: ColoredBox(
          color: AppColors.primaryDark,
          child: TabBar(
            indicatorColor: Colors.white,
            indicatorWeight: 3,
            indicatorSize: .tab,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white.withValues(alpha: 0.55),
            labelStyle: context.bodySmall.copyWith(
              fontSize: 12,
              fontWeight: .w600,
            ),
            unselectedLabelStyle: context.bodySmall.copyWith(
              fontSize: 12,
              fontWeight: .w400,
            ),
            dividerColor: Colors.transparent,
            tabs: const [
              Tab(text: 'Home'),
              Tab(text: 'A/C Statement'),
            ],
          ),
        ),
      ),
    );
  }
}
