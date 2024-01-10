import 'package:flutter/material.dart';
import 'src/white/initial_page.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialApp(
    home: InitialPage(),
    debugShowCheckedModeBanner: false,
  ));
}

