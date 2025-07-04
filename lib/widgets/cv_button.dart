import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CvButton extends StatelessWidget {
  const CvButton({
    super.key,

  });



  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ElevatedButton.icon(
      onPressed: () async {
        final Uri cvUrl = Uri.parse(
          'https://docs.google.com/document/d/1WdRY4AAC6H6By0I4XG2WsLfq5_YyXnIg/view',
        );
        if (await canLaunchUrl(cvUrl)) {
          await launchUrl(cvUrl,
              mode: LaunchMode.externalApplication);
        } else {
          throw 'Could not launch CV link';
        }
      },
      label: Text(
        'Download CV',
        style: theme.textTheme.bodyLarge?.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor:
            theme.colorScheme.primary, // background color
        padding: const EdgeInsets.symmetric(
            horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        elevation: 4,
      ),
    );
  }
}