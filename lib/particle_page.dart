import 'dart:math';

import 'package:flutter/material.dart';
import 'package:connectwithme/particle_constraints.dart';
import 'package:connectwithme/particle_item.dart';

class ParticlePage extends StatefulWidget {
  final int count;
  const ParticlePage({super.key, this.count = 10});

  @override
  State<ParticlePage> createState() => _ParticlePageState();
}

class _ParticlePageState extends State<ParticlePage>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void didChangeDependencies() {
    debugPrint("didChangeDependencies");
    setState(() {});

    super.didChangeDependencies();
  }

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    super.initState();

    controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: RadialGradient(
                  focalRadius: 5.0,
                  radius: 2,
                  colors: [
                    Color(0xFF03045e),
                    Color(0xFF0077b6),
                  ],
                ),
              ),
            ),
          ),
          ..._getAnimatedList(),
        ],
      ),
    );
  }

  List<Widget> _getAnimatedList() {
    List<Widget> children = <Widget>[];
    for (int i = 0; i < 25; i++) {
      children.add(
        ParticleItem(
          controller: controller,
          height: getHeight(context).toInt(),
          width: getWidth(context).toInt(),
        ),
      );
    }

    return children;
  }
}

class RandomHelper {
  Random random = Random();

  int getRandomInt(int max) {
    return random.nextInt(max);
  }
}

RandomHelper randomHelper = RandomHelper();
