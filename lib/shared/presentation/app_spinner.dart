import 'package:flutter/widgets.dart';
import 'package:phosphor_icons/phosphor_icons.dart';

/// shadcn_ui has linear Progress; its circular Spinner is composed from icons.
final class AppSpinner extends StatefulWidget {
  const AppSpinner({this.color, super.key});
  final Color? color;
  @override
  State<AppSpinner> createState() => _AppSpinnerState();
}

final class _AppSpinnerState extends State<AppSpinner>
    with SingleTickerProviderStateMixin {
  late final _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1000),
  );
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (MediaQuery.disableAnimationsOf(context)) {
      _controller.stop();
    } else {
      _controller.repeat();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Semantics(
    excludeSemantics: true,
    child: RotationTransition(
      turns: _controller,
      child: Icon(
        PhosphorIconsRegular.spinnerGap,
        size: 20,
        color: widget.color ?? IconTheme.of(context).color,
      ),
    ),
  );
}
