import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:watchapp/global_variables.dart';
import 'package:watchapp/home_page.dart';
import 'package:device_preview/device_preview.dart';
import 'package:watchapp/product_details.dart';

import 'cart_provider.dart';

void main() {
  runApp(
    DevicePreview(
      builder: (context) =>
      const MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create : (context) => CartProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Watch App',
        theme: ThemeData(
          inputDecorationTheme: const InputDecorationTheme(
            hintStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
            prefixIconColor: Color.fromRGBO(119, 119, 119, 1),
          ),
          fontFamily: 'Mont',
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(176, 145, 69, 1),
            primary: const Color.fromRGBO(176, 145, 69, 1),
          ),
          textTheme: const TextTheme(
            titleLarge: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
            titleMedium: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            bodySmall: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            )
          ),
        ),
        home:  HomePage(),
      ),
    );
  }
}
