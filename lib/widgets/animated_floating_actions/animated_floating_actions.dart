import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:mobile/widgets/animated_floating_actions/action_button.dart';
import 'package:mobile/widgets/animated_floating_actions/action_config.dart';
import 'package:mobile/widgets/animated_floating_actions/constant_values.dart';
import 'package:mobile/widgets/animated_floating_actions/master_button.dart';

/// A widget that contains a master button (a FloatingActionButton that is
/// always visible) and multiple action buttons that start off hidden.
/// On forward animation, the action buttons animate into view with a fade
/// transition and slide up from under the master button to a location determined
/// by the index of each button. On reversing the animation, the action buttons
/// fade out and slide back down.
class AnimatedFloatingActions extends StatefulWidget {
  final List<ActionConfig> actionConfigs;
  const AnimatedFloatingActions({super.key, required this.actionConfigs});

  @override
  State<AnimatedFloatingActions> createState() =>
      AnimatedFloatingActionsState();
}

class AnimatedFloatingActionsState extends State<AnimatedFloatingActions>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _expansion;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      value: initialAnimationValue,
      vsync: this,
      duration: const Duration(milliseconds: durationMilliseconds),
    );
    _expansion = CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
      reverseCurve: Curves.easeOutQuad,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleExpansion() {
    if (_controller.isAnimating) return;

    final bool shouldExpand = !_controller.isCompleted;
    shouldExpand ? _controller.forward() : _controller.reverse();
  }

  Size _getStackContainerSize(int actionsCount, bool showLabels) {
    final spacing =
        showLabels ? actionButtonSpacingWithLabel : actionButtonSpacing;
    final height = masterButtonSize + (actionsCount * (iconSize + spacing));
    // Note: The extra pixels are added to the height and width to prevent
    // the content from being cut off
    return Size(masterButtonSize + 1, height + 5);
  }

  @override
  Widget build(BuildContext context) {
    // FIXME: Add to settings the possiblility to toggle this property
    const bool showLabels = true;
    final size =
        _getStackContainerSize(widget.actionConfigs.length, showLabels);

    return SizedBox(
      width: size.width,
      height: size.height,
      child: Stack(
        children: [
          ...widget.actionConfigs.mapIndexed(
            (index, config) => ActionButton(
              config: config,
              expansion: _expansion,
              index: index,
              showLabel: showLabels,
            ),
          ),
          MasterButton(
            onPressed: _toggleExpansion,
          ),
        ],
      ),
    );
  }
}
