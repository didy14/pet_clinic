import 'package:flutter/material.dart';

class MedicalReportScreen extends StatelessWidget {
  final String name;
  final String species;
  final String age;
  final String imagePath;

  const MedicalReportScreen({
    super.key,
    required this.name,
    required this.species,
    required this.age,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medical Report'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(imagePath),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text("Species: $species"),
                    Text("Age: $age"),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 30),

            sectionTitle("Vaccination History"),
            infoCard([
              "Rabies - Jan 15, 2024 (Next: Jan 2025)",
              "Parvo - Feb 10, 2024 (Next: Feb 2025)",
            ]),

            sectionTitle("Medical Conditions"),
            infoCard([
              "Ear infection (treated)",
              "Mild skin allergy",
            ]),

            sectionTitle("Medications"),
            infoCard([
              "Bravecto - 1 chew every 3 months",
              "Allergy spray - once a day",
            ]),

            sectionTitle("Vet Visits"),
            infoCard([
              "June 5, 2024 - Dr. Omar - Follow-up for ear infection",
              "May 10, 2024 - Routine checkup",
            ]),

            sectionTitle("Allergies"),
            infoCard([
              "Chicken-based food",
            ]),

            sectionTitle("Lab Test Results"),
            infoCard([
              "Blood Test: Normal",
              "X-ray: Clear",
            ]),

            sectionTitle("Notes from Vet"),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey.shade100,
              ),
              child: const Text(
                "Continue with current diet. Return in 6 months for general screening.",
                style: TextStyle(fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget sectionTitle(String title) => Padding(
        padding: const EdgeInsets.only(top: 24.0, bottom: 8),
        child: Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      );

  Widget infoCard(List<String> items) => Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: items
              .map((item) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2.0),
                    child: Text("- $item"),
                  ))
              .toList(),
        ),
      );
}
