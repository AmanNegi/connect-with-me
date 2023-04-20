import 'package:flutter/material.dart';
import 'package:connectwithme/colors.dart';
import 'package:connectwithme/configs.dart';
import 'package:connectwithme/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Get values from the `configs.json` file
  configs.value = await getConfigsData();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: configs.value['name'],
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
