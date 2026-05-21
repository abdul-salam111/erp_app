import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../core/services/session_manager.dart';
import '../../../../../core/theme/theme_utils.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import '../../../../../routes/route_names.dart';
import '../../../auth_exports.dart';

class OrganizationSelectionView extends StatefulWidget {
  const OrganizationSelectionView({super.key});

  @override
  State<OrganizationSelectionView> createState() =>
      _OrganizationSelectionViewState();
}

class _OrganizationSelectionViewState
    extends State<OrganizationSelectionView> {
  bool _isLoading = false;

  List<Organization> get _organizations =>
      SessionController.instance.loggedInUser?.organizations ?? [];

  Future<void> _selectOrganization(Organization org) async {
    setState(() => _isLoading = true);
    await SessionController.instance.saveSelectedOrganization(org);
    if (mounted) {
      setState(() => _isLoading = false);
      context.goNamed(RouteNames.dashboard);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Select Organization'),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _organizations.isEmpty
          ? Center(
              child: Text(
                'No organizations found.',
                style: context.bodyMedium,
              ),
            )
          : ListView.separated(
              padding: context.pagePadding,
              itemCount: _organizations.length,
              separatorBuilder: (_, __) =>
                  SizedBox(height: context.gridSpacing),
              itemBuilder: (context, index) {
                final org = _organizations[index];
                return _OrganizationCard(
                  org: org,
                  onTap: () => _selectOrganization(org),
                );
              },
            ),
    );
  }
}

class _OrganizationCard extends StatelessWidget {
  final Organization org;
  final VoidCallback onTap;

  const _OrganizationCard({required this.org, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: context.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: context.border),
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: context.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(Iconsax.building, color: context.primary, size: 24),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Text(
                    org.name ?? '',
                    style: context.titleSmall.copyWith(
                      fontWeight: .w600,
                    ),
                  ),
                  if (org.product?.name != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      org.product!.name!,
                      style: context.bodySmall.copyWith(
                        color: context.textSecondary,
                      ),
                    ),
                  ],
                  if (org.tenant?.name != null) ...[
                    const SizedBox(height: 2),
                    Text(
                      org.tenant!.name!,
                      style: context.labelSmall.copyWith(
                        color: context.textDisabled,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            Icon(
              Iconsax.arrow_right_3,
              color: context.textSecondary,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
