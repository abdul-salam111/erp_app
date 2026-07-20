import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../routes/route_exports.dart';
import '../../../../../core/di/di_exports.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/theme_utils.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import '../../../system_exports.dart';

class SystemView extends StatelessWidget {
  const SystemView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<SystemBloc>(),
      child: const _SystemBody(),
    );
  }
}

class _SystemBody extends StatefulWidget {
  const _SystemBody();

  @override
  State<_SystemBody> createState() => _SystemBodyState();
}

class _SystemBodyState extends State<_SystemBody>
    with SingleTickerProviderStateMixin {
  static const _sections = <_SystemSection>[
    _SystemSection(
      title: 'General',
      items: [
        _SystemMenuItem(
          label: 'Setup',
          subtitle: 'Configure system',
          icon: Iconsax.setting_2,
          color: AppColors.primary,
          routeName: RouteNames.system_setup,
        ),
      ],
    ),
    _SystemSection(
      title: 'Security',
      items: [
        _SystemMenuItem(
          label: 'Users',
          subtitle: 'Manage system users',
          icon: Iconsax.profile_2user,
          color: AppColors.teal,
          routeName: RouteNames.security,
        ),
        _SystemMenuItem(
          label: 'Roles',
          subtitle: 'Manage security roles',
          icon: Iconsax.security_user,
          color: AppColors.purple,
        ),
        _SystemMenuItem(
          label: 'PC Authorization',
          subtitle: 'Manage PC authorization',
          icon: Iconsax.shield_tick,
          color: AppColors.orange,
        ),
      ],
    ),
  ];

  late final AnimationController _entranceController;

  @override
  void initState() {
    super.initState();
    _entranceController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..forward();
  }

  @override
  void dispose() {
    _entranceController.dispose();
    super.dispose();
  }

  Animation<double> _staggerFor(int index, int total) {
    final start = (index / (total + 1)).clamp(0.0, 1.0);
    final end = ((index + 2) / (total + 1)).clamp(0.0, 1.0);
    return CurvedAnimation(
      parent: _entranceController,
      curve: Interval(start, end, curve: Curves.easeOutCubic),
    );
  }

  @override
  Widget build(BuildContext context) {
    final entries = <Widget>[const _SystemHeaderBanner()];
    for (final section in _sections) {
      entries.add(_SectionLabel(title: section.title));
      entries.addAll(section.items.map((item) => _SystemTile(item: item)));
    }

    return Scaffold(
      backgroundColor: context.background,
      appBar: CustomAppBar(title: 'System'),
      body: ListView.separated(
        padding: context.pagePadding.copyWith(top: 16, bottom: 24),
        itemCount: entries.length,
        separatorBuilder: (_, __) => SizedBox(height: context.gridSpacing),
        itemBuilder: (context, index) {
          final animation = _staggerFor(index, entries.length);
          return FadeTransition(
            opacity: animation,
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 0.18),
                end: Offset.zero,
              ).animate(animation),
              child: entries[index],
            ),
          );
        },
      ),
    );
  }
}

class _SystemHeaderBanner extends StatelessWidget {
  const _SystemHeaderBanner();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
        Responsive.value<double>(context, phone: 16, tablet: 20, ipad: 24),
      ),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: .topLeft,
          end: .bottomRight,
          colors: [AppColors.primary, AppColors.primaryDark],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.3),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          const _PulsingEmoji(emoji: '⚙️'),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Text(
                  'System Control Center',
                  style: context.titleMedium.copyWith(
                    color: AppColors.white,
                    fontWeight: .w700,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Setup, users, roles & device access',
                  style: context.bodySmall.copyWith(
                    color: AppColors.white.withValues(alpha: 0.85),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PulsingEmoji extends StatefulWidget {
  final String emoji;

  const _PulsingEmoji({required this.emoji});

  @override
  State<_PulsingEmoji> createState() => _PulsingEmojiState();
}

class _PulsingEmojiState extends State<_PulsingEmoji>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final t = Curves.easeInOut.transform(_controller.value);
        return Transform.rotate(
          angle: (t - 0.5) * 0.35,
          child: Transform.scale(scale: 1 + t * 0.08, child: child),
        );
      },
      child: Container(
        width: 52,
        height: 52,
        alignment: .center,
        decoration: BoxDecoration(
          color: AppColors.white.withValues(alpha: 0.18),
          shape: .circle,
        ),
        child: Text(widget.emoji, style: const TextStyle(fontSize: 26)),
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  final String title;

  const _SectionLabel({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 4),
      child: Text(
        title.toUpperCase(),
        style: context.labelSmall.copyWith(
          color: context.textSecondary,
          fontWeight: .w700,
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}

class _SystemTile extends StatefulWidget {
  final _SystemMenuItem item;

  const _SystemTile({required this.item});

  @override
  State<_SystemTile> createState() => _SystemTileState();
}

class _SystemTileState extends State<_SystemTile> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    final item = widget.item;
    return AnimatedScale(
      scale: _pressed ? 0.97 : 1,
      duration: const Duration(milliseconds: 120),
      child: Material(
        color: context.surface,
        borderRadius: BorderRadius.circular(14),
        child: InkWell(
          borderRadius: BorderRadius.circular(14),
          onHighlightChanged: (value) => setState(() => _pressed = value),
          onTap: () => item.routeName != null
              ? context.pushNamed(item.routeName!)
              : AppToastsUtils.showInfoTop(
                  context,
                  '${item.label} — coming soon',
                ),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 14,
              vertical: Responsive.value<double>(
                context,
                phone: 12,
                tablet: 14,
                ipad: 16,
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: context.border),
            ),
            child: Row(
              children: [
                _GlowingIcon(icon: item.icon, color: item.color),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      Text(
                        item.label,
                        style: context.titleSmall.copyWith(
                          fontWeight: .w600,
                          color: context.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        item.subtitle,
                        style: context.bodySmall.copyWith(
                          color: context.textSecondary,
                        ),
                        maxLines: 1,
                        overflow: .ellipsis,
                      ),
                    ],
                  ),
                ),
                Icon(
                  Iconsax.arrow_right_3,
                  size: 18,
                  color: context.grey400,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _GlowingIcon extends StatefulWidget {
  final IconData icon;
  final Color color;

  const _GlowingIcon({required this.icon, required this.color});

  @override
  State<_GlowingIcon> createState() => _GlowingIconState();
}

class _GlowingIconState extends State<_GlowingIcon>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = Responsive.value<double>(
      context,
      phone: 44,
      tablet: 48,
      ipad: 52,
    );
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final t = Curves.easeInOut.transform(_controller.value);
        return Container(
          width: size,
          height: size,
          alignment: .center,
          decoration: BoxDecoration(
            color: widget.color.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: widget.color.withValues(alpha: 0.15 + t * 0.2),
                blurRadius: 6 + t * 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Transform.scale(scale: 1 + t * 0.06, child: child),
        );
      },
      child: Icon(widget.icon, color: widget.color, size: 22),
    );
  }
}

class _SystemSection {
  final String title;
  final List<_SystemMenuItem> items;

  const _SystemSection({required this.title, required this.items});
}

class _SystemMenuItem {
  final String label;
  final String subtitle;
  final IconData icon;
  final Color color;
  final String? routeName;

  const _SystemMenuItem({
    required this.label,
    required this.subtitle,
    required this.icon,
    required this.color,
    this.routeName,
  });
}
