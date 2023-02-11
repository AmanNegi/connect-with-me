import 'package:flutter/material.dart';
import 'package:portfolio_web/colors.dart';
import 'package:portfolio_web/configs.dart';
import 'package:portfolio_web/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  configs.value = await getConfigsData();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aman Negi',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: colorList[1],
        ),
        fontFamily: "Poppins",
      ),
      home: const HomePage(),
    );
  }
}
