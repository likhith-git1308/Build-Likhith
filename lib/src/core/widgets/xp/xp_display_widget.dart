import 'package:flutter/material.dart';
import '../../config/theme/app_colors.dart';

class XPDisplayWidget extends StatelessWidget {
  final int currentXp;
  final int totalXpForLevel;
  final int level;
  final double size;

  const XPDisplayWidget({
    Key? key,
    required this.currentXp,
    required this.totalXpForLevel,
    required this.level,
    this.size = 60,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final percentage = currentXp / totalXpForLevel;

    return Column(
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [AppColors.xpColor, AppColors.primary],
            ),
          ),
          child: Center(
            child: Text(
              'Lv $level',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: LinearProgressIndicator(
            minHeight: 6,
            value: percentage,
            backgroundColor: AppColors.border,
            valueColor: const AlwaysStoppedAnimation<Color>(AppColors.xpColor),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          '$currentXp / $totalXpForLevel XP',
          style: const TextStyle(
            fontSize: 12,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}