import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

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
              // Animated title row
              Row(
                children: [
                  Icon(
                    Icons.contact_mail,
                    color: theme.colorScheme.primary,
                    size: 24,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Get in Touch',
                    style: theme.textTheme.titleLarge,
                  ),
                ],
              )
                  .animate()
                  .fadeIn(duration: 500.ms)
                  .scale(begin: const Offset(0.9, 0.9)),

              const SizedBox(height: 20),

              // First row of buttons animated
              Row(
                children: [
                  Expanded(
                    child: _buildContactButton(
                      context,
                      'Facebook',
                      Icons.facebook,
                      () => _launchFaceBook(),
                    ).animate().fadeIn().slideX(begin: -0.2, duration: 600.ms),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildContactButton(
                      context,
                      'LinkedIn',
                      FontAwesomeIcons.linkedin,
                      () => _launchLinkedIn(),
                    ).animate().fadeIn(delay: 200.ms).slideX(begin: 0.2),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // Second row of buttons animated
              Row(
                children: [
                  Expanded(
                    child: _buildContactButton(
                      context,
                      'GitHub',
                      FontAwesomeIcons.github,
                      () => _launchGitHub(),
                    ).animate().fadeIn(delay: 400.ms).slideX(begin: -0.2),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildContactButton(
                      context,
                      'Twitter',
                      FontAwesomeIcons.twitter,
                      () => _launchTwitter(),
                    ).animate().fadeIn(delay: 600.ms).slideX(begin: 0.2),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactButton(
    BuildContext context,
    String label,
    IconData icon,
    VoidCallback onPressed,
  ) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 18),
      label: Text(label),
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 12),
      ),
    );
  }

  Future<void> _launchFaceBook() async {
    const url = 'https://www.facebook.com/etiini.precious.90';
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _launchLinkedIn() async {
    const url = 'https://www.linkedin.com/in/eti-ini-precious-76601a248/';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    }
  }

  Future<void> _launchGitHub() async {
    const url = 'https://github.com/Miss-presh';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    }
  }

  Future<void> _launchTwitter() async {
    final Uri url = Uri.parse('https://x.com/EtiPreciou83812');
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      debugPrint('Could not launch $url');
    }
  }
}
