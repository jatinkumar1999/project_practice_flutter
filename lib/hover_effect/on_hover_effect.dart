import 'package:flutter/material.dart';
import 'package:sprung/sprung.dart';

class OnHoverEffect extends StatefulWidget {
  final Function(bool isHover) child;

  const OnHoverEffect({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<OnHoverEffect> createState() => _OnHoverEffectState();
}

class _OnHoverEffectState extends State<OnHoverEffect> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final Matrix4 isHovering = Matrix4.identity()
      ..scale(1.1)
      ..translate(6, -3, 2);

    final Matrix4 transform = isHovered ? isHovering : Matrix4.identity();
    return MouseRegion(
        onEnter: (event) => onEntered(true),
        onExit: (event) => onEntered(false),
        cursor: SystemMouseCursors.click,
        // opaque: true,
        child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Sprung.underDamped,
            transform: transform,
            child: widget.child(isHovered)));
  }

  onEntered(bool isHover) {
    isHovered = isHover;
    setState(() {});
  }
}
