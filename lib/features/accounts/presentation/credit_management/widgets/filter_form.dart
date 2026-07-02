import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/theme/theme_exports.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/widgets.dart';
import '../../../domain/entities/party_list_item_entity.dart';

class FilterForm extends StatelessWidget {
  final DateTime date;
  final TextEditingController partyController;
  final List<PartyListItemEntity> parties;
  final ApiStatus partiesStatus;
  final ValueChanged<String> onPartyChanged;
  final VoidCallback onPickDate;
  final VoidCallback onView;

  const FilterForm({
    super.key,
    required this.date,
    required this.partyController,
    required this.parties,
    required this.partiesStatus,
    required this.onPartyChanged,
    required this.onPickDate,
    required this.onView,
  });

  @override
  Widget build(BuildContext context) {
    final isLoading = partiesStatus == ApiStatus.INITIAL ||
        partiesStatus == ApiStatus.LOADING;

    return Padding(
      padding: .all(8),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: context.white,
          borderRadius: .circular(8),
          border: .all(color: context.border),
        ),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            _FormLabel(text: AppConstants.partyBtn),
            const SizedBox(height: 6),
            SearchableDropdown(
              items: isLoading ? [] : parties.map((p) => p.name).toList(),
              controller: partyController,
              hintText: isLoading ? 'Loading...' : AppConstants.selectPartyHint,
              onChanged: onPartyChanged,
              fieldHeight: 35,
            ),
            const SizedBox(height: 10),
            _FormLabel(text: AppConstants.dateLabel),
            const SizedBox(height: 6),
            _DateTile(
              label: date.format(AppConstants.ddMMMYyyyLabel),
              onTap: onPickDate,
            ),
            const SizedBox(height: 10),
            CustomButton(
              text: AppConstants.view,
              onPressed: onView,
              radius: 6,
              elevation: 0,
              fontsize: 14,
              size: const Size(double.infinity, 35),
              backgroundColor: context.primary.withAlpha(60),
              textColor: context.primary,
            ),
          ],
        ),
      ),
    );
  }
}

class _FormLabel extends StatelessWidget {
  final String text;
  const _FormLabel({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.labelSmall.copyWith(
        color: context.textSecondary,
        fontWeight: .w500,
        fontSize: 12,
      ),
      maxLines: 1,
      overflow: .ellipsis,
    );
  }
}

class _DateTile extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const _DateTile({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 35,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: context.surface,
          borderRadius: .circular(6),
          border: .all(color: context.border.withAlpha(50)),
        ),
        child: Row(
          children: [
            Icon(Iconsax.calendar_1, size: 16, color: context.textSecondary),
            const SizedBox(width: 6),
            Expanded(
              child: Text(
                label,
                style: context.bodySmall.copyWith(
                  color: context.textPrimary,
                  fontSize: 12,
                ),
                overflow: .ellipsis,
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              size: 18,
              color: context.grey500,
            ),
          ],
        ),
      ),
    );
  }
}
