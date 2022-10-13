import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';

class Back extends StatefulWidget {
  final Widget child;

  const Back({
    super.key,
    required this.child,
  });

  @override
  State<Back> createState() => _BackState();
}

class _BackState extends State<Back> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return AnimatedBackground(
      behaviour: RandomParticleBehaviour(
        options: const ParticleOptions(
          baseColor: Colors.grey,
          spawnOpacity: 0.0,
          opacityChangeRate: 0.25,
          minOpacity: 0.1,
          maxOpacity: 0.4,
          spawnMinSpeed: 15.0,
          spawnMaxSpeed: 30.0,
          spawnMinRadius: 15.0,
          spawnMaxRadius: 35.0,
          particleCount: 20,
        ),
      ),
      vsync: this,
      child: widget.child,
    );
  }
}
