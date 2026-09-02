import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/local_storage/mill_config_store.dart';
import '../../../../../core/theme/theme_exports.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import '../../../../../routes/route_names.dart';

// Settings specific to the Partah module — app-wide preferences (theme,
// sign out, organization) already live in the main app drawer, so this
// screen intentionally doesn't duplicate them.
class PartahSettingsView extends StatefulWidget {
  const PartahSettingsView({super.key});

  @override
  State<PartahSettingsView> createState() => _PartahSettingsViewState();
}

class _PartahSettingsViewState extends State<PartahSettingsView> {
  MillType? _millType;

  @override
  void initState() {
    super.initState();
    MillConfigStore.getMillType().then((type) {
      if (mounted) setState(() => _millType = type);
    });
  }

  Future<void> _showBaseWeightSheet() async {
    final selected = await showModalBottomSheet<MillType>(
      context: context,
      backgroundColor: context.transparent,
      builder: (_) => _BaseWeightSheet(current: _millType),
    );
    if (selected == null) return;
    await MillConfigStore.setMillType(selected);
    if (!mounted) return;
    setState(() => _millType = selected);
    AppToastsUtils.showSuccessTop(context, 'Base weight set to ${selected.displayKgLabel} kg');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.background,
      appBar: const CustomAppBar(title: 'Partah Settings'),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: context.pagePadding.top),
        children: [
          _SectionHeader(title: 'Products'),
          _SettingsTile(
            icon: Icons.inventory_2_outlined,
            iconColor: AppColors.skyBlue,
            title: 'Manage Products',
            subtitle: 'Add, edit or remove mill products',
            onTap: () => context.pushNamed(RouteNames.manage_products),
          ),
          _Divider(),
          _SectionHeader(title: 'Base Weight'),
          _SettingsTile(
            icon: Icons.scale_rounded,
            iconColor: AppColors.goldenrod,
            title: 'Bag Weight',
            subtitle: _millType != null
                ? '${_millType!.label} — ${_millType!.displayKgLabel} kg'
                : 'Not set — defaults to 100 kg',
            onTap: _showBaseWeightSheet,
          ),
          _Divider(),
          _SectionHeader(title: 'About'),
          _SettingsTile(
            icon: Icons.factory_outlined,
            iconColor: AppColors.terracotta,
            title: 'Partah',
            subtitle: 'Rate & profit calculator for mills',
          ),
        ],
      ),
    );
  }
}

// ─── Base Weight Sheet ────────────────────────────────────────────────────────

class _BaseWeightSheet extends StatelessWidget {
  final MillType? current;
  const _BaseWeightSheet({required this.current});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
      child: Column(
        mainAxisSize: .min,
        crossAxisAlignment: .start,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(color: context.divider, borderRadius: BorderRadius.circular(2)),
            ),
          ),
          heightBox(20),
          Text('Base Bag Weight', style: context.titleMedium.copyWith(fontWeight: .w700)),
          heightBox(4),
          Text(
            'All Partah calculations are based on this raw bag weight.',
            style: context.bodySmall.copyWith(color: context.textSecondary),
          ),
          heightBox(16),
          for (final option in MillType.values)
            _BaseWeightOption(
              option: option,
              isSelected: option == current,
              onTap: () => Navigator.of(context).pop(option),
            ),
        ],
      ),
    );
  }
}

class _BaseWeightOption extends StatelessWidget {
  final MillType option;
  final bool isSelected;
  final VoidCallback onTap;

  const _BaseWeightOption({required this.option, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
        color: isSelected ? context.primary.withAlpha(18) : context.background,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: isSelected ? context.primary : context.border, width: isSelected ? 1.5 : 1),
      ),
      child: Row(
        children: [
          Icon(
            isSelected ? Icons.radio_button_checked_rounded : Icons.radio_button_off_rounded,
            size: 20,
            color: isSelected ? context.primary : context.textDisabled,
          ),
          widthBox(12),
          Text(option.label, style: context.bodyMedium.copyWith(fontWeight: .w600)).expanded(),
          Text(
            '${option.displayKgLabel} kg',
            style: context.bodyMedium.copyWith(
              color: isSelected ? context.primary : context.textSecondary,
              fontWeight: .w700,
            ),
          ),
        ],
      ),
    ).onTap(onTap);
  }
}

// ─── Section Header ───────────────────────────────────────────────────────────

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title.toUpperCase(),
      style: context.labelSmall.copyWith(color: context.textSecondary, fontWeight: .w700, letterSpacing: 1.2),
    ).withPadding(const EdgeInsets.fromLTRB(20, 16, 20, 6));
  }
}

// ─── Settings Tile ────────────────────────────────────────────────────────────

class _SettingsTile extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  const _SettingsTile({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(color: iconColor.withAlpha(24), borderRadius: BorderRadius.circular(10)),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          widthBox(14),
          Column(
            crossAxisAlignment: .start,
            children: [
              Text(title, style: context.bodyMedium.copyWith(fontWeight: .w600)),
              heightBox(2),
              Text(subtitle, style: context.bodySmall.copyWith(color: context.textSecondary)),
            ],
          ).expanded(),
          if (onTap != null) Icon(Icons.chevron_right_rounded, color: context.textDisabled, size: 20),
        ],
      ).withPadding(const EdgeInsets.symmetric(horizontal: 20, vertical: 12)),
    );
  }
}

// ─── Section Divider ──────────────────────────────────────────────────────────

class _Divider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Divider(height: 1, indent: 20, endIndent: 20, color: context.divider);
  }
}
