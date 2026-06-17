class CareerModel {
  final String id;
  final String name;
  final String description;
  final String icon;
  final List<String> skills;
  final List<String> phases;
  final int totalXpRequired;

  CareerModel({
    required this.id,
    required this.name,
    required this.description,
    required this.icon,
    required this.skills,
    required this.phases,
    required this.totalXpRequired,
  });

  factory CareerModel.fromJson(Map<String, dynamic> json) {
    return CareerModel(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      icon: json['icon'] as String,
      skills: List<String>.from(json['skills'] as List),
      phases: List<String>.from(json['phases'] as List),
      totalXpRequired: json['totalXpRequired'] as int,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'description': description,
    'icon': icon,
    'skills': skills,
    'phases': phases,
    'totalXpRequired': totalXpRequired,
  };
}