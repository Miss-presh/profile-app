import 'package:flutter/material.dart';

class ProfileHeader extends StatefulWidget {
  const ProfileHeader({super.key});

  @override
  State<ProfileHeader> createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  double _profilePictureSize = 120;
  bool _isIncreasing = true;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: 320,
      child: Stack(
        children: [
          // Cover Image
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  theme.colorScheme.primary,
                  theme.colorScheme.secondary,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Image.asset(
              'assets/images/cover.jpg',
              fit: BoxFit.cover,
            ),
          ),

          // Profile Picture
          Positioned(
            bottom: 60,
            left: 0,
            right: 0,
            child: Center(
              child: GestureDetector(
                onTap: () {
                  if (_isIncreasing) {
                    if (_profilePictureSize < 180) {
                      setState(() {
                        _profilePictureSize += 10;
                      });
                    } else if (_profilePictureSize == 180) {
                      setState(() {
                        _isIncreasing = false; // start decreasing
                        _profilePictureSize -= 10;
                      });
                    }
                  } else {
                    if (_profilePictureSize > 120) {
                      setState(() {
                        _profilePictureSize -= 10;
                      });
                    } else if (_profilePictureSize == 120) {
                      setState(() {
                        _isIncreasing = true; // start increasing again
                        _profilePictureSize += 10;
                      });
                    }
                  }
                },
                child: Container(
                  width: _profilePictureSize,
                  height: _profilePictureSize,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: 4,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    radius: 56,
                    backgroundImage:
                        const AssetImage('assets/images/profile.jpg'),
                    backgroundColor: Colors.grey[300],
                  ),
                ),
              ),
            ),
          ),

          // Name and Title + Download Button
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Text(
                  'Essien Eti-Ini Precious',
                  style: theme.textTheme.headlineMedium!.copyWith(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4),
                Text(
                  'Flutter Developer',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
