import 'package:flutter/material.dart';

Future<DateTime?> showCompactDatePicker({
  required BuildContext context,
  required DateTime initialDate,
  required DateTime firstDate,
  required DateTime lastDate,
}) {
  final clamped = initialDate.isBefore(firstDate)
      ? firstDate
      : initialDate.isAfter(lastDate)
      ? lastDate
      : initialDate;
  return showDialog<DateTime>(
    context: context,
    builder: (_) => _CompactDatePickerDialog(
      initialDate: clamped,
      firstDate: firstDate,
      lastDate: lastDate,
    ),
  );
}

class _CompactDatePickerDialog extends StatefulWidget {
  final DateTime initialDate;
  final DateTime firstDate;
  final DateTime lastDate;

  const _CompactDatePickerDialog({
    required this.initialDate,
    required this.firstDate,
    required this.lastDate,
  });

  @override
  State<_CompactDatePickerDialog> createState() =>
      _CompactDatePickerDialogState();
}

class _CompactDatePickerDialogState extends State<_CompactDatePickerDialog> {
  late DateTime _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.initialDate;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 48, vertical: 60),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CalendarDatePicker(
            initialDate: _selected,
            firstDate: widget.firstDate,
            lastDate: widget.lastDate,
            onDateChanged: (d) => setState(() => _selected = d),
          ),
          Divider(
            height: 1,
            thickness: 1,
            color: Theme.of(context).dividerColor,
          ),
          Row(
            mainAxisAlignment: .end,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, _selected),
                child: const Text('OK'),
              ),
              const SizedBox(width: 4),
            ],
          ),
        ],
      ),
    );
  }
}
