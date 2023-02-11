import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:connectwithme/particle_page.dart';

class ParticleItem extends StatefulWidget {
  final AnimationController controller;
  final int height, width;
  const ParticleItem({
    Key? key,
    required this.controller,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  State<ParticleItem> createState() => _ParticleItemState();
}

class _ParticleItemState extends State<ParticleItem> {
  late Animation<Offset> nextPosition;
  late Offset currentTarget;

  AnimationStatus status = AnimationStatus.forward;

  @override
  void initState() {
    currentTarget = getNextPosition();

    nextPosition = Tween<Offset>(
      begin: getNextPosition(),
      end: currentTarget,
    ).animate(widget.controller);

    super.initState();

    nextPosition.addListener(handler);
  }

  handler() async {
    AnimationStatus currentStatus = widget.controller.status;

    if (currentStatus != status) {
      status = currentStatus;

      Offset newTarget = await getNextPositionOffthread();

      nextPosition.removeListener(handler);
      nextPosition = Tween<Offset>(
        begin: currentTarget,
        end: newTarget,
      ).animate(
        CurvedAnimation(
          parent: widget.controller,
          curve: Curves.easeInCubic,
        ),
      );
      currentTarget = newTarget;

      nextPosition.addListener(handler);
    }
    // setState(() {});
  }

  Future<Offset> getNextPositionOffthread() {
    return compute((v) {
      return Offset(
        randomHelper.getRandomInt(widget.width).toDouble(),
        randomHelper.getRandomInt(widget.height).toDouble(),
      );
    }, 0);
  }

  Offset getNextPosition() {
    return Offset(
      randomHelper.getRandomInt(widget.width).toDouble(),
      randomHelper.getRandomInt(widget.height).toDouble(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.controller,
      child: Container(
        height: 5,
        width: 5,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.7),
        ),
      ),
      builder: (context, child) {
        return AnimatedPositioned(
          duration: const Duration(seconds: 2),
          top: nextPosition.value.dy,
          left: nextPosition.value.dx,
          child: child ?? Container(),
        );
      },
    );
  }
}
