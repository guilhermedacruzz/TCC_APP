import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';

class PageBase extends StatefulWidget {
  final String title1;
  final String title2;
  final String subtitle;
  final Widget child;
  final String footerText;
  final Function footerAction;
  final String footerButtonText;

  const PageBase({
    super.key,
    required this.title1,
    required this.title2,
    required this.subtitle,
    required this.child,
    required this.footerText,
    required this.footerAction,
    required this.footerButtonText,
  });

  @override
  State<PageBase> createState() => _PageBaseState();
}

class _PageBaseState extends State<PageBase> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBackground(
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
        child: Container(
          padding: const EdgeInsets.all(35),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      "assets/images/sapo.png",
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.title1,
                              style: Theme.of(context).textTheme.headline2,
                            ),
                            Text(
                              widget.title2,
                              style: Theme.of(context).textTheme.headline2,
                            ),
                            Text(
                              widget.subtitle,
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ],
                        ),
                      ),
                      widget.child,
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.footerText,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    const SizedBox(width: 25),
                    TextButton(
                      onPressed: () {
                        widget.footerAction();
                      },
                      child: Text(
                        widget.footerButtonText,
                        style: Theme.of(context).textTheme.button?.merge(
                              TextStyle(
                                color: Theme.of(context).highlightColor,
                              ),
                            ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
