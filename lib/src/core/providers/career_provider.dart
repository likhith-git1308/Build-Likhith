import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/career_model.dart';

final careerProvider = StateNotifierProvider<CareerNotifier, AsyncValue<List<CareerModel>>>(
  (ref) => CareerNotifier(),
);

class CareerNotifier extends StateNotifier<AsyncValue<List<CareerModel>>> {
  CareerNotifier() : super(const AsyncValue.loading());

  Future<void> loadCareers() async {
    state = const AsyncValue.loading();
    try {
      final careers = _generateSampleCareers();
      state = AsyncValue.data(careers);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  List<CareerModel> _generateSampleCareers() {
    return [
      CareerModel(
        id: '1',
        name: 'AI Engineer',
        description: 'Build intelligent systems with machine learning',
        icon: 'ai_icon',
        skills: ['Python', 'TensorFlow', 'PyTorch', 'Mathematics'],
        phases: ['Fundamentals', 'ML Basics', 'Advanced ML', 'Specialization'],
        totalXpRequired: 10000,
      ),
      CareerModel(
        id: '2',
        name: 'Software Engineer',
        description: 'Develop scalable software solutions',
        icon: 'software_icon',
        skills: ['Java', 'C++', 'System Design', 'Algorithms'],
        phases: ['Basics', 'OOP', 'Design Patterns', 'System Design'],
        totalXpRequired: 8000,
      ),
      CareerModel(
        id: '3',
        name: 'Full Stack Developer',
        description: 'Master front-end and back-end development',
        icon: 'fullstack_icon',
        skills: ['React', 'Node.js', 'Databases', 'DevOps'],
        phases: ['Frontend', 'Backend', 'Databases', 'Deployment'],
        totalXpRequired: 9000,
      ),
      CareerModel(
        id: '4',
        name: 'Data Scientist',
        description: 'Extract insights from data using analytics',
        icon: 'data_scientist_icon',
        skills: ['Python', 'Statistics', 'SQL', 'Visualization'],
        phases: ['Basics', 'Analytics', 'ML', 'Advanced'],
        totalXpRequired: 8500,
      ),
      CareerModel(
        id: '5',
        name: 'Data Engineer',
        description: 'Build data pipelines and infrastructure',
        icon: 'data_engineer_icon',
        skills: ['SQL', 'Spark', 'Kafka', 'Cloud'],
        phases: ['SQL', 'ETL', 'Big Data', 'Cloud'],
        totalXpRequired: 9000,
      ),
      CareerModel(
        id: '6',
        name: 'Cybersecurity Engineer',
        description: 'Protect systems and data from threats',
        icon: 'security_icon',
        skills: ['Networking', 'Linux', 'Cryptography', 'Penetration Testing'],
        phases: ['Fundamentals', 'Security', 'Offensive', 'Advanced'],
        totalXpRequired: 9500,
      ),
      CareerModel(
        id: '7',
        name: 'Cloud Engineer',
        description: 'Architect cloud solutions',
        icon: 'cloud_icon',
        skills: ['AWS', 'Azure', 'Kubernetes', 'Terraform'],
        phases: ['Cloud Basics', 'Services', 'Architecture', 'DevOps'],
        totalXpRequired: 8500,
      ),
      CareerModel(
        id: '8',
        name: 'DevOps Engineer',
        description: 'Streamline deployment and operations',
        icon: 'devops_icon',
        skills: ['Docker', 'Kubernetes', 'CI/CD', 'Monitoring'],
        phases: ['Linux', 'Containerization', 'Orchestration', 'Advanced'],
        totalXpRequired: 8000,
      ),
      CareerModel(
        id: '9',
        name: 'Mobile Developer',
        description: 'Create mobile applications',
        icon: 'mobile_icon',
        skills: ['Flutter', 'Dart', 'Mobile UI', 'APIs'],
        phases: ['Dart Basics', 'Flutter', 'Advanced UI', 'Publishing'],
        totalXpRequired: 7500,
      ),
      CareerModel(
        id: '10',
        name: 'UI/UX Designer',
        description: 'Design beautiful and intuitive interfaces',
        icon: 'design_icon',
        skills: ['Figma', 'UI Design', 'UX Research', 'Prototyping'],
        phases: ['Design Basics', 'UI', 'UX', 'Prototyping'],
        totalXpRequired: 6500,
      ),
    ];
  }
}