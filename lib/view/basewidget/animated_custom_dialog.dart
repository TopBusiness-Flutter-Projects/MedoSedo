import 'package:flutter/material.dart';
import 'dart:math' as math;

void showAnimatedDialog(BuildContext context, Widget dialog,
    {bool isFlip = false, bool dismissible = true}) {
  showGeneralDialog(
    context: context,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: Colors.black.withOpacity(0.5),
    pageBuilder: (context, animation1, animation2) => dialog,
    transitionDuration: Duration(milliseconds: 500),
    transitionBuilder: (context, a1, a2, widget) {
      if (isFlip) {
        return Rotation3DTransition(
          turns: Tween<double>(begin: math.pi, end: 2.0 * math.pi).animate(
              CurvedAnimation(
                  parent: a1, curve: Interval(0.0, 1.0, curve: Curves.linear))),
          child: FadeTransition(
            opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
                CurvedAnimation(
                    parent: a1,
                    curve: Interval(0.5, 1.0, curve: Curves.elasticOut))),
            child: widget,
          ),
        );
      } else {
        return ScaleTransition(
          scale: a1,
          child: FadeTransition(
            opacity: a1,
            child: widget,
          ),
        );
      }
    },
  );
}

class Rotation3DTransition extends AnimatedWidget {
  const Rotation3DTransition({
    Key? key,
    required Animation<double> turns,
    this.child,
  })  : assert(turns != null),
        super(key: key, listenable: turns);

  Animation<double> get turns => listenable as Animation<double>;

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final double turnsValue = turns.value;
    final Matrix4 transform = Matrix4.identity()
      ..setEntry(3, 2, 0.0006)
      ..rotateY(turnsValue);
    return Transform(
      transform: transform,
      alignment: Alignment.center,
      child: child,
    );
  }
}
