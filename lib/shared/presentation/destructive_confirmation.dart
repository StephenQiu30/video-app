import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

Future<bool> showDestructiveConfirmation({
  required BuildContext context,
  required String title,
  required String description,
  required String cancelLabel,
  required String confirmLabel,
}) async {
  final result = await showShadDialog<bool>(
    context: context,
    builder: (dialogContext) => ShadDialog.alert(
      title: Text(title),
      actions: [
        ShadButton.ghost(
          onPressed: () => Navigator.of(dialogContext).pop(false),
          height: 0,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Flexible(child: Text(cancelLabel)),
        ),
        ShadButton.destructive(
          onPressed: () => Navigator.of(dialogContext).pop(true),
          height: 0,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Flexible(child: Text(confirmLabel)),
        ),
      ],
      description: Text(description),
    ),
  );
  return result ?? false;
}
