import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:portfolio_web/configs.dart';
import 'package:portfolio_web/particle_page.dart';
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
                  color: Color(0xFFcaf0f8),
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
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    HoverableItem(
                        icon: MdiIcons.github,
                        onPressed: () {
                          launchUrl(Uri.parse(configs.value['github']));
                        }),
                    HoverableItem(
                      icon: MdiIcons.twitter,
                      onPressed: () {
                        launchUrl(Uri.parse(configs.value['twitter']));
                      },
                    ),
                    HoverableItem(
                      icon: MdiIcons.devTo,
                      onPressed: () {
                        launchUrl(Uri.parse(configs.value['devpost']));
                      },
                    ),
                    HoverableItem(
                      icon: MdiIcons.linkedin,
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
              style: GoogleFonts.ubuntu(
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
  final IconData icon;
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
    return MouseRegion(
      onEnter: (e) => setState(() => isHovering = true),
      onExit: (e) => setState(() => isHovering = false),
      child: IconButton(
        icon: Icon(
          widget.icon,
          color: isHovering ? const Color(0xFF00b4d8) : Colors.white,
          size: isHovering ? 40 : 24,
        ),
        onPressed: () {
          setState(() {});
          widget.onPressed();
        },
      ),
    );
  }
}