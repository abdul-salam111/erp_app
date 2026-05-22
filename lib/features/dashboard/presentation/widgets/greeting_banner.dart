import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../core/theme/theme_utils.dart';
import '../../../../core/utils/utils_exports.dart';
import '../../../../routes/route_exports.dart';
import 'package:mantic_erp_app/core/constants/app_conts.dart';

class DashboardHeader extends StatelessWidget {
  final String userName;
  final String orgName;

  const DashboardHeader({
    super.key,
    required this.userName,
    required this.orgName,
  });

  String get _greeting {
    final hour = DateTime.now().hour;
    if (hour < 12) return AppConstants.goodMorning;
    if (hour < 17) return AppConstants.goodAfternoon;
    return AppConstants.goodEveningMsg;
  }

  String get _formattedDate {
    final now = DateTime.now();

    return now.formatted;
  }

  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.paddingOf(context).top;
    final hPad = context.pagePadding.left;

    return Container(
      clipBehavior: .hardEdge,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [context.primary, context.primary.withValues(alpha: 0.72)],
          begin: .topLeft,
          end: .bottomRight,
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(28),
          bottomRight: Radius.circular(28),
        ),
      ),
      child: Stack(
        children: [
          // ── Decorative circles ──
          Positioned(
            right: -35,
            top: top - 35,
            child: _Circle(size: 150, opacity: 0.07),
          ),
          Positioned(
            right: 55,
            top: top + 18,
            child: _Circle(size: 70, opacity: 0.05),
          ),
          Positioned(
            left: -25,
            bottom: -15,
            child: _Circle(size: 100, opacity: 0.05),
          ),

          // ── Content ──
          Padding(
            padding: EdgeInsets.only(
              top: top + 14,
              bottom: 20,
              left: hPad,
              right: hPad,
            ),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                // ── App-bar row ──
                Row(
                  children: [
                    _HeaderIconBtn(
                      icon: Icons.menu_rounded,
                      onTap: () => Scaffold.of(context).openDrawer(),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        AppConstants.eRPDashboard,
                        style: context.titleSmall.copyWith(
                          color: Colors.white,
                          fontWeight: .w600,
                          letterSpacing: 0.3,
                        ),
                      ),
                    ),
                    // Notification with badge
                    Stack(
                      clipBehavior: .none,
                      children: [
                        _HeaderIconBtn(
                          icon: Iconsax.notification,
                          onTap: () =>
                              context.pushNamed(RouteNames.alert_panel),
                        ),
                        Positioned(
                          top: 6,
                          right: 6,
                          child: Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: Color(0xFFFF5252),
                              shape: .circle,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 8),
                    // Avatar
                    CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.white.withValues(alpha: 0.18),
                      child: const Icon(
                        Iconsax.profile_circle,
                        color: Colors.white,
                        size: 19,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                // ── Greeting row ──
                Row(
                  crossAxisAlignment: .end,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: .start,
                        children: [
                          Text(
                            _greeting,
                            style: context.labelMedium.copyWith(
                              color: Colors.white.withValues(alpha: 0.80),
                              fontWeight: .w500,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            userName,
                            style: context.headlineSmall.copyWith(
                              color: Colors.white,
                              fontWeight: .w700,
                              height: 1.1,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Container(
                                padding: .symmetric(horizontal: 8, vertical: 3),
                                decoration: BoxDecoration(
                                  color: Colors.white.withValues(alpha: 0.15),
                                  borderRadius: .circular(20),
                                ),
                                child: Row(
                                  mainAxisSize: .min,
                                  children: [
                                    Icon(
                                      Iconsax.buildings,
                                      color: Colors.white.withValues(
                                        alpha: 0.85,
                                      ),
                                      size: 11,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      orgName,
                                      style: context.labelSmall.copyWith(
                                        color: Colors.white.withValues(
                                          alpha: 0.90,
                                        ),
                                        fontWeight: .w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // Date pill
                    Container(
                      padding: .symmetric(horizontal: 11, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.15),
                        borderRadius: .circular(20),
                      ),
                      child: Row(
                        mainAxisSize: .min,
                        children: [
                          Icon(
                            Iconsax.calendar,
                            color: Colors.white.withValues(alpha: 0.85),
                            size: 13,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            _formattedDate,
                            style: context.labelSmall.copyWith(
                              color: Colors.white,
                              fontWeight: .w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Header icon button ───────────────────────────────────────────────────────

class _HeaderIconBtn extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _HeaderIconBtn({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 38,
        height: 38,
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.15),
          borderRadius: .circular(10),
        ),
        child: Icon(icon, color: Colors.white, size: 20),
      ),
    );
  }
}

// ─── Decorative circle ────────────────────────────────────────────────────────

class _Circle extends StatelessWidget {
  final double size;
  final double opacity;

  const _Circle({required this.size, required this.opacity});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: .circle,
        color: Colors.white.withValues(alpha: opacity),
      ),
    );
  }
}
