import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class TestimonialSection extends StatelessWidget {
  const TestimonialSection({super.key});

  
  final List<Map<String, dynamic>> testimonials = const [
    {
      'text':
          '“This profile app is amazing! It showcases skills and projects beautifully.”',
      'name': '- Dami Ola, Flutter Developer',
      'image': 'assets/images/tomi 2.jpg',
    },
    {
      'text':
          '“I was impressed by the smooth animations and layout. A clean presentation!”',
      'name': '- Mercy Okache, UI Designer',
      'image': 'assets/images/profile.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
                  Icon(Icons.reviews, color: theme.colorScheme.primary),
                  const SizedBox(width: 8),
                  Text('Testimonials', style: theme.textTheme.titleLarge),
                ],
              ),
              const SizedBox(height: 20),

             
              Column(
                children: List.generate(testimonials.length, (index) {
                  final t = testimonials[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: _TestimonialCard(
                      text: t['text'],
                      name: t['name'],
                      image: Image.asset(
                        t['image'],
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    ).animate()
                     .fadeIn(duration: 500.ms, delay: (index * 300).ms)
                     .slideY(begin: 0.2),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TestimonialCard extends StatelessWidget {
  final String text;
  final Image image;
  final String name;

  const _TestimonialCard({
    required this.text,
    required this.image,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: theme.dividerColor),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: theme.textTheme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              ClipOval(child: image),
              const SizedBox(width: 10),
              Text(
                name,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
