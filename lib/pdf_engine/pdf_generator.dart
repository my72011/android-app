import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import '../models/user_model.dart';
import '../models/workout_plan_model.dart';
import '../models/exercise_model.dart';
import '../nutrition_engine/nutrition_calculator.dart';

class PdfGenerator {
  /// Generates and shares/prints the PDF
  static Future<void> generateAndPrint({
    required UserModel user,
    required WeeklyPlanModel plan,
    required List<ExerciseModel> exerciseLibrary,
  }) async {
    final pdf = pw.Document();
    final nutrition = NutritionCalculator.calculate(user);

    // Map exercise IDs to models for easy lookup
    final exMap = {for (var e in exerciseLibrary) e.id: e};

    // --- PAGE 1: PROFILE & NUTRITION ---
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (context) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Header(level: 0, text: 'GymCoach Pro - Personal Report'),
            pw.SizedBox(height: 20),
            pw.Header(level: 1, text: 'User Profile'),
            pw.Paragraph(text: 'Name: ${user.name}'),
            pw.Paragraph(text: 'Age: ${user.age} | Gender: ${user.gender}'),
            pw.Paragraph(text: 'Height: ${user.heightCm} cm | Weight: ${user.weightKg} kg'),
            pw.Paragraph(text: 'Goal: ${user.goal.replaceAll('_', ' ').toUpperCase()}'),
            pw.SizedBox(height: 20),
            
            pw.Header(level: 1, text: 'Nutrition & Metrics'),
            pw.Table.fromTextArray(
              headers: ['Metric', 'Value'],
              data: [
                ['BMI', '${nutrition.bmi.toStringAsFixed(1)} (${nutrition.bmiCategory})'],
                ['BMR', '${nutrition.bmr.round()} kcal'],
                ['TDEE', '${nutrition.tdee.round()} kcal'],
                ['Target Calories', '${nutrition.targetCalories} kcal'],
                ['Protein', '${nutrition.proteinGrams} g'],
                ['Carbs', '${nutrition.carbsGrams} g'],
                ['Fat', '${nutrition.fatGrams} g'],
              ],
            ),
          ],
        ),
      ),
    );

    // --- PAGE 2+: WORKOUT PLAN ---
    for (var daily in plan.weekSchedule) {
      pdf.addPage(
        pw.Page(
          pageFormat: PdfPageFormat.a4,
          build: (context) {
            return pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Header(level: 0, text: '${daily.dayName} - ${daily.focus}'),
                pw.SizedBox(height: 10),
                if (daily.isRestDay)
                  pw.Center(
                    child: pw.Text('REST DAY', style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold)),
                  )
                else
                  pw.Table.fromTextArray(
                    headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                    headers: ['Exercise', 'Sets', 'Reps', 'Rest'],
                    data: daily.exercises.map((set) {
                      final ex = exMap[set.exerciseId];
                      return [
                        ex?.name ?? 'Unknown',
                        '${set.sets}',
                        '${set.reps}',
                        '${set.restSeconds}s',
                      ];
                    }).toList(),
                  ),
              ],
            );
          },
        ),
      );
    }

    // Print/Share the PDF
    await Printing.layoutPdf(onLayout: (PdfPageFormat format) async => pdf.save());
  }
}