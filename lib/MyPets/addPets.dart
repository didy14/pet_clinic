import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Addpets extends StatefulWidget {
  const Addpets({super.key});

  @override
  State<Addpets> createState() => _AddpetsState();
}

class _AddpetsState extends State<Addpets> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController speciesController = TextEditingController();
  File? imageFile;

  Future<void> pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        imageFile = File(picked.path);
      });
    }
  }

  void submitPet() {
    final name = nameController.text.trim();
    final age = ageController.text.trim();
    final species = speciesController.text.trim();

    if (name.isEmpty || age.isEmpty || species.isEmpty || imageFile == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please complete all fields")),
      );
      return;
    }

    // For now, just go back
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add New Pet")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            GestureDetector(
              onTap: pickImage,
              child: CircleAvatar(
                radius: 60,
                backgroundImage: imageFile != null ? FileImage(imageFile!) : null,
                child: imageFile == null
                    ? const Icon(Icons.add_a_photo, size: 40)
                    : null,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: "Pet Name"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: ageController,
              decoration: const InputDecoration(labelText: "Age"),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            TextField(
              controller: speciesController,
              decoration: const InputDecoration(labelText: "Species"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: submitPet,
              child: const Text("Add Pet"),
            ),
          ],
        ),
      ),
    );
  }
}
