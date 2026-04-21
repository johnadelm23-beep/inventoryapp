import 'package:flutter/material.dart';
import 'package:inventory_app/features/auth/ui/auth_screen.dart';

class InventoryApp extends StatelessWidget {
  const InventoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "appFont"),
      home: AuthScreen(),
    );
  }
}
