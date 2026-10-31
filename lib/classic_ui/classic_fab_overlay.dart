import 'package:fl_clash/ui/context.dart';
import 'package:flutter/widgets.dart';

/// Places a thumb-reachable primary action over a page without modifying
/// upstream's shared scaffold or any business/state provider.
class ClassicFabOverlay extends StatelessWidget {
  const ClassicFabOverlay({
    super.key,
    required this.child,
    required this.action,
  });

  final Widget child;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    final action = this.action;
    if (action == null) return child;

    return Stack(
      fit: StackFit.expand,
      children: [
        child,
        PositionedDirectional(
          end: 16,
          bottom: 16 + context.bottomInset,
          child: action,
        ),
      ],
    );
  }
}
