// lib/main.dart
import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'screens/profile_screen.dart';

void main() {
  runApp(const ProfileApp());
}

class ProfileApp extends StatefulWidget {
  const ProfileApp({super.key});

  @override
  State<ProfileApp> createState() => _ProfileAppState();
}

class _ProfileAppState extends State<ProfileApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.light
          ? ThemeMode.dark
          : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Profile',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: _themeMode,
      home: ProfileScreen(onToggleTheme: (){
        toggleTheme();
      },),
      debugShowCheckedModeBanner: false,
    );
  }
}
