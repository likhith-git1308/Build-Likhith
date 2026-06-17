import 'package:flutter/material.dart';
import '../../config/theme/app_colors.dart';

class StreakWidget extends StatelessWidget {
  final int streakDays;
  final VoidCallback? onTap;

  const StreakWidget({
    Key? key,
    required this.streakDays,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [AppColors.streakColor, Color(0xFFFFB84D)],
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              '🔥',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(width: 6),
            Text(
              '$streakDays',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}