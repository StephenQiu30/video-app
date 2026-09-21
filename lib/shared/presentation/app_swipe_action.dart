import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// Slidable owns the gesture only; Shad owns the visible action and focus state.
final class AppSwipeAction extends StatelessWidget {
  const AppSwipeAction({
    required this.onPressed,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.icon,
    required this.label,
    super.key,
  });
  final ValueChanged<BuildContext>? onPressed;
  final Color backgroundColor;
  final Color foregroundColor;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) => Expanded(
    child: ShadButton.ghost(
      height: double.infinity,
      expands: true,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      padding: const EdgeInsets.all(8),
      enabled: onPressed != null,
      onPressed: onPressed == null
          ? null
          : () {
              Slidable.of(context)?.close();
              onPressed!(context);
            },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 20),
          const SizedBox(height: 4),
          Text(label, textAlign: TextAlign.center),
        ],
      ),
    ),
  );
}
