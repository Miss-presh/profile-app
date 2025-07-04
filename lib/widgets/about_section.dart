import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final chips = [
      'Mobile Development',
      'UI/UX Design',
      'Problem Solving',
      'Learning'
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Animated title row
              Row(
                children: [
                  Icon(
                    Icons.person_outline,
                    color: theme.colorScheme.primary,
                    size: 24,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'About Me',
                    style: theme.textTheme.titleLarge,
                  ),
                ],
              )
                  .animate()
                  .fadeIn(duration: 500.ms)
                  .scale(begin: const Offset(0.9, 0.9)),

              const SizedBox(height: 16),

              // Animated paragraph
              Text(
                'I\'m a passionate junior developer on a journey to master the art of mobile development. Starting with curiosity and a love for building things, I’ve been steadily growing my skills in Flutter and Dart, turning ideas into interactive apps. This app reflects my learning path and my goal of becoming a mobile dev boss.',
                style: theme.textTheme.bodyLarge,
                textAlign: TextAlign.justify,
              ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.2),

              const SizedBox(height: 16),

              // Animated interest chips
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: List.generate(
                  chips.length,
                  (index) => _buildInterestChip(context, chips[index])
                      .animate()
                      .fadeIn(delay: (index * 200).ms)
                      .slideY(begin: 0.2),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInterestChip(BuildContext context, String label) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: theme.colorScheme.primary.withAlpha(20),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: theme.colorScheme.primary.withAlpha(80),
        ),
      ),
      child: Text(
        label,
        style: theme.textTheme.bodyMedium?.copyWith(
          color: theme.colorScheme.primary,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
