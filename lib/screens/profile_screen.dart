// lib/screens/profile_screen.dart
import 'package:flutter/material.dart';
import 'package:profile_app/widgets/badge_section.dart';
import 'package:profile_app/widgets/cv_button.dart';
import 'package:profile_app/widgets/testimonial_section.dart';
import '../widgets/profile_header.dart';
import '../widgets/about_section.dart';
import '../widgets/skills_section.dart';
import '../widgets/contact_section.dart';
import '../widgets/contact_form.dart';
import '../widgets/projects_section.dart';

class ProfileScreen extends StatelessWidget {
  final VoidCallback onToggleTheme;

  const ProfileScreen({
    super.key,
    required this.onToggleTheme,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        actions: [
          IconButton(
            icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
            onPressed: onToggleTheme,
          ),
        ],
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            ProfileHeader(),
            CvButton(),
            SizedBox(height: 20),
            SizedBox(height: 20),
            AboutSection(),
            SizedBox(height: 20),
            SkillsSection(),
            SizedBox(height: 20),
            ContactSection(),
            SizedBox(height: 20),
            ContactForm(),
            SizedBox(height: 20),
            ProjectsSection(),
            SizedBox(height: 20),
            TestimonialSection(),
            SizedBox(height: 20),
            BadgeSection(),
          ],
        ),
      ),
    );
  }
}
