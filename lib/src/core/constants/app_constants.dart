class AppConstants {
  static const String baseUrl = 'https://api.buildlikhith.com';
  static const Duration apiTimeout = Duration(seconds: 30);
  static const List<String> careers = [
    'AI Engineer',
    'Software Engineer',
    'Full Stack Developer',
    'Data Scientist',
    'Data Engineer',
    'Cybersecurity Engineer',
    'Cloud Engineer',
    'DevOps Engineer',
    'Mobile Developer',
    'UI/UX Designer',
  ];
  static const int xpPerLevel = 1000;
  static const int maxLevel = 100;
  static const int xpPerMission = 50;
  static const int streakBonusXp = 20;
  static const List<String> premiumFeatures = [
    'Mock Interviews',
    'Resume Reviews',
    'Technical Tests',
    'Career Reports',
    'Interview Preparation Packs',
  ];
  static const String userKey = 'user';
  static const String authTokenKey = 'auth_token';
  static const String careerSelectionKey = 'career_selection';
  static const String lastSyncKey = 'last_sync';
}