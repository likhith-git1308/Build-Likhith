import 'package:flutter_riverpod/flutter_riverpod.dart';

final progressProvider = StateNotifierProvider<ProgressNotifier, ProgressState>(
  (ref) => ProgressNotifier(),
);

class ProgressNotifier extends StateNotifier<ProgressState> {
  ProgressNotifier()
      : super(
          ProgressState(
            xp: 0,
            level: 1,
            streakDays: 0,
            totalXp: 0,
          ),
        );

  void addXp(int amount) {
    final newXp = state.xp + amount;
    final newTotalXp = state.totalXp + amount;
    final newLevel = (newTotalXp ~/ 1000) + 1;

    state = state.copyWith(
      xp: newXp % 1000,
      level: newLevel,
      totalXp: newTotalXp,
    );
  }

  void incrementStreak() {
    state = state.copyWith(streakDays: state.streakDays + 1);
  }

  void resetStreak() {
    state = state.copyWith(streakDays: 0);
  }
}

class ProgressState {
  final int xp;
  final int level;
  final int streakDays;
  final int totalXp;

  ProgressState({
    required this.xp,
    required this.level,
    required this.streakDays,
    required this.totalXp,
  });

  ProgressState copyWith({
    int? xp,
    int? level,
    int? streakDays,
    int? totalXp,
  }) {
    return ProgressState(
      xp: xp ?? this.xp,
      level: level ?? this.level,
      streakDays: streakDays ?? this.streakDays,
      totalXp: totalXp ?? this.totalXp,
    );
  }
}