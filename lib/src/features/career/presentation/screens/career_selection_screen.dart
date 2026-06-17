import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/models/career_model.dart';
import '../../../../core/providers/career_provider.dart';
import '../../../../core/widgets/career/career_card.dart';
import '../../../../config/theme/app_colors.dart';

class CareerSelectionScreen extends ConsumerStatefulWidget {
  const CareerSelectionScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<CareerSelectionScreen> createState() =>
      _CareerSelectionScreenState();
}

class _CareerSelectionScreenState extends ConsumerState<CareerSelectionScreen> {
  late CareerModel? _selectedCareer;

  @override
  void initState() {
    super.initState();
    _selectedCareer = null;
    Future.microtask(
      () => ref.read(careerProvider.notifier).loadCareers(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final careersAsync = ref.watch(careerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Your Career Path'),
        elevation: 0,
      ),
      body: careersAsync.when(
        data: (careers) => SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Select the career path that interests you',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 16),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.85,
                ),
                itemCount: careers.length,
                itemBuilder: (context, index) {
                  final career = careers[index];
                  final isSelected =
                      _selectedCareer?.id == career.id;

                  return CareerCard(
                    name: career.name,
                    description: career.description,
                    icon: career.icon,
                    isSelected: isSelected,
                    onTap: () {
                      setState(() {
                        _selectedCareer = career;
                      });
                    },
                  );
                },
              ),
              const SizedBox(height: 24),
              if (_selectedCareer != null)
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/dashboard');
                    },
                    child: const Text('Continue'),
                  ),
                ),
            ],
          ),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stack) => Center(
          child: Text('Error: $error'),
        ),
      ),
    );
  }
}