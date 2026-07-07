import 'package:flutter/material.dart';
import '../../../../../core/theme/theme_exports.dart';

class NameDocumentSheet extends StatefulWidget {
  const NameDocumentSheet({super.key});

  @override
  State<NameDocumentSheet> createState() => _NameDocumentSheetState();
}

class _NameDocumentSheetState extends State<NameDocumentSheet> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _controller = TextEditingController(
      text: 'Document ${now.day}/${now.month}/${now.year}',
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      child: Column(
        mainAxisSize: .min,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: context.grey700,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Name your document',
            style: context.titleMedium.copyWith(color: context.textPrimary),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _controller,
            autofocus: true,
            style: TextStyle(color: context.textPrimary),
            decoration: InputDecoration(
              filled: true,
              fillColor: context.grey800,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: context.primary),
              ),
              hintText: 'Document name',
              hintStyle: TextStyle(color: context.textDisabled),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: context.border),
                    foregroundColor: context.textPrimary,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('Cancel'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    final name = _controller.text.trim();
                    if (name.isNotEmpty) Navigator.pop(context, name);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: context.primary,
                    foregroundColor: context.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('Save'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
