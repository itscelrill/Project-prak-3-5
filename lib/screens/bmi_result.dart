import 'package:flutter/material.dart';
import '../models/bmi_category.dart';
import '../services/storage_service.dart';

class BmiResultScreen extends StatelessWidget {
  final bool isMale;
  final double height;
  final double weight;

  const BmiResultScreen({
    super.key,
    required this.isMale,
    required this.height,
    required this.weight,
  });

  double calculateBmi() => weight / ((height / 100) * (height / 100));

  BmiCategory getCategory(double bmi) {
    if (bmi < 18.5) {
      return BmiCategory(
        min: 0,
        max: 18.5,
        label: 'Underweight',
        advice: 'Perbanyak makanan bergizi',
      );
    } else if (bmi < 25.0) {
      return BmiCategory(
        min: 18.5,
        max: 25.0,
        label: 'Normal',
        advice: 'Pertahankan pola hidup sehat',
      );
    } else if (bmi < 30.0) {
      return BmiCategory(
        min: 25.0,
        max: 30.0,
        label: 'Overweight',
        advice: 'Kurangi makanan berlemak & olahraga rutin',
      );
    } else {
      return BmiCategory(
        min: 30.0,
        max: double.infinity,
        label: 'Obese',
        advice: 'Segera konsultasi dokter & atur pola makan',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final bmi = calculateBmi();
    final cat = getCategory(bmi);

    return Scaffold(
      appBar: AppBar(title: const Text('BMI Result')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Your BMI', style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 8),
                Text(
                  bmi.toStringAsFixed(1),
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: cat.color,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Category: ${cat.label}',
                  style: TextStyle(fontSize: 22, color: cat.color),
                ),
                const SizedBox(height: 12),
                Text(
                  'Advice: ${cat.advice}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                Icon(cat.icon, size: 48, color: cat.color),

                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () async {
                    await StorageService.clearCache();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Cache BMI berhasil dihapus"),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text("CLEAR CACHE"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
