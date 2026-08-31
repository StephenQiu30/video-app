import 'package:flutter/material.dart';

final class AppDropdownOption<T> {
  const AppDropdownOption({required this.label, required this.value});

  final String label;
  final T value;
}

final class AppDropdownField<T> extends StatelessWidget {
  const AppDropdownField({
    required this.label,
    required this.onSelected,
    required this.options,
    required this.value,
    this.enabled = true,
    super.key,
  });

  final bool enabled;
  final String label;
  final ValueChanged<T?> onSelected;
  final List<AppDropdownOption<T>> options;
  final T value;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<T>(
      enabled: enabled,
      expandedInsets: EdgeInsets.zero,
      initialSelection: value,
      label: Text(label),
      menuHeight: 304,
      onSelected: onSelected,
      requestFocusOnTap: false,
      dropdownMenuEntries: [
        for (final option in options)
          DropdownMenuEntry<T>(value: option.value, label: option.label),
      ],
    );
  }
}
