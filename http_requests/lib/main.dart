import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http_requests/screens/tabs.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 131, 56, 236),
  brightness: Brightness.dark,
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TabsScreen(),
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: kColorScheme,
        textTheme: GoogleFonts.latoTextTheme(),
      ),
    );
  }
}
