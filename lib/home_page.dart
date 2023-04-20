import 'package:flutter/material.dart';
import 'package:connectwithme/configs.dart';
import 'package:connectwithme/particle_page.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double amount = 0;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: _getBody(width, height),
    );
  }

  Stack _getBody(double width, double height) {
    return Stack(
      children: [
        const Positioned.fill(child: ParticlePage()),
        Positioned.fill(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                configs.value['name'],
                style: const TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 45,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Text(
                configs.value['username'],
                style: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 250,
                height: 40,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    HoverableItem(
                        icon: "assets/github.png",
                        onPressed: () {
                          launchUrl(Uri.parse(configs.value['github']));
                        }),
                    HoverableItem(
                      icon: "assets/twitter.png",
                      onPressed: () {
                        launchUrl(Uri.parse(configs.value['twitter']));
                      },
                    ),
                    HoverableItem(
                      icon: "assets/devpost.png",
                      onPressed: () {
                        launchUrl(Uri.parse(configs.value['devpost']));
                      },
                    ),
                    HoverableItem(
                      icon: "assets/linkedin.png",
                      onPressed: () {
                        launchUrl(Uri.parse(configs.value['linkedin']));
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          right: 0,
          bottom: 20,
          child: RotatedBox(
            quarterTurns: -1,
            child: Text(
              "BUILD USING FLUTTER",
              style: TextStyle(
                  fontSize: 26,
                  color: Colors.white.withOpacity(0.1),
                  fontWeight: FontWeight.w700,
                  letterSpacing: 2.0),
            ),
          ),
        ),
      ],
    );
  }
}

class HoverableItem extends StatefulWidget {
  final String icon;
  final Function onPressed;
  const HoverableItem({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  State<HoverableItem> createState() => _HoverableItemState();
}

class _HoverableItemState extends State<HoverableItem> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: isHovering ? 40 : 30,
      width: isHovering ? 40 : 30,
      child: MouseRegion(
        onEnter: (e) => setState(() => isHovering = true),
        onExit: (e) => setState(() => isHovering = false),
        child: GestureDetector(
          child: Image.asset(
            widget.icon,
            color: isHovering ? const Color(0xFF00b4d8) : Colors.white,
            fit: BoxFit.cover,
          ),
          onTap: () {
            setState(() {});
            widget.onPressed();
          },
        ),
      ),
    );
  }
}
