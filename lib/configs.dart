import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ValueNotifier<Map> configs = ValueNotifier<Map>({});

Future<Map<String, dynamic>> getConfigsData() async {
  Map<String, dynamic> data = {};
  try {
    final String jsonString =
        await rootBundle.loadString('assets/configs.json');
    Map? response = json.decode(jsonString);

    if (response != null && response.isNotEmpty) {
      data = response as Map<String, dynamic>;
    }
  } catch (e) {
    debugPrint("Ensure that you have filled your details in configs.json$e");
    throw Exception("No configs.json file found");
  }

  return data;
}