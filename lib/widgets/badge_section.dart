// lib/widgets/badge_section.dart
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BadgeSection extends StatelessWidget {
  const BadgeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final List<Map<String, dynamic>> badges = [
      {
        'title': 'Flutter Beginner',
        'description': 'Completed 10 Flutter projects.',
        'icon': FontAwesomeIcons.award,
      },
      {
        'title': 'Web Developer',
        'description': 'Designed Advanced Web Apps.',
        'icon': FontAwesomeIcons.laptopCode,
      },
      {
        'title': 'Problem Solver',
        'description': 'Solved 100+ coding problems.',
        'icon': FontAwesomeIcons.lightbulb,
      },
      {
        'title': 'Team Player',
        'description': 'Collaborated on group projects.',
        'icon': FontAwesomeIcons.users,
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.emoji_events, color: theme.colorScheme.primary),
                  const SizedBox(width: 8),
                  Text('Achievement Badges', style: theme.textTheme.titleLarge),
                ],
              ),
              const SizedBox(height: 20),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: badges.map((badge) => _buildBadgeCard(context, badge)).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBadgeCard(BuildContext context, Map<String, dynamic> badge) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.colorScheme.primary.withValues(alpha: 0.3)),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(badge['icon'], color: theme.colorScheme.primary, size: 28),
          const SizedBox(height: 8),
          Text(
            badge['title'],
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            badge['description'],
            style: theme.textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
