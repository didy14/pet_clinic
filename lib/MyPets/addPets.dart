import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:user_login/MyPets/myPetsScreen.dart';
import 'dart:io';

import 'package:user_login/utilis/config.dart';

class Addpets extends StatefulWidget {
  const Addpets({super.key});

  @override
  State<Addpets> createState() => _AddpetsState();
}

class _AddpetsState extends State<Addpets> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController sexController = TextEditingController();
  final TextEditingController speciesController = TextEditingController();
  final TextEditingController colorController = TextEditingController();
  File? imageFile;

  Future<void> pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        imageFile = File(picked.path);
      });
    }
  }

  List<dynamic> sex = [];
  List<dynamic> pet_spicies = [];
  String? selectedSex;
  String? selectedSpecies;
  String? selectedHint = "Choose";

  // void submitPet() {
  //   final name = nameController.text.trim();
  //   final sex = sexController.text.trim();
  //   final color = colorController.text.trim();
  //   final species = speciesController.text.trim();

  //   // if (name.isEmpty ||
  //   //     sex.isEmpty ||
  //   //     species.isEmpty ||
  //   //     color.isEmpty ||
  //   //     imageFile == null) {
  //   //   ScaffoldMessenger.of(context).showSnackBar(
  //   //     const SnackBar(content: Text("Please complete all fields")),
  //   //   );
  //   //   return;
  //   // }

  //   // For now, just go back
  //   Navigator.pop(context);
  // }

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
                backgroundImage: imageFile != null
                    ? FileImage(imageFile!)
                    : null,
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
              controller: colorController,
              decoration: const InputDecoration(labelText: "Color"),
              //keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            Text("Sex", style: TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              height: 40,
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black),
              ),
              child: Center(
                child: DropdownButtonFormField<String>(
                  isExpanded: true,
                  value: selectedSex,
                  decoration: InputDecoration.collapsed(hintText: selectedHint),
                  items: sex.map((item) {
                    return DropdownMenuItem<String>(
                      value: item["sex_id"].toString(),
                      child: Text(item["sex_name"]),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedSex = newValue;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 20),

            Container(
              width: double.infinity,
              height: 40,
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black),
              ),
              child: Center(
                child: DropdownButtonFormField<String>(
                  isExpanded: true,
                  value: selectedSpecies,
                  decoration: InputDecoration.collapsed(hintText: selectedHint),
                  items: pet_spicies.map((item) {
                    return DropdownMenuItem<String>(
                      value: item["pet_species_id"].toString(),
                      child: Text(item["pets__species_name"]),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedSpecies = newValue;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 30,),

            ElevatedButton(onPressed: validate, child: const Text("Add Pet")),
          ],
        ),
      ),
    );
  }

  validate() {
    if (nameController.text.trim() == "") {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Please fill pet name ')));
    } else if (sexController.text.trim() == "") {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Please write pet sex')));
    } else {
      addPets();
    }
  }

  void addPets() async {
    String url = Config.add_pets;
    Dio dio = Dio();
    Options options = Options(responseType: ResponseType.plain);
    options.contentType = 'application/x-www-form-urlencoded';

    Map<String, String> postedData = {
      "pet_name": nameController.text,
      "pet_species_id": speciesController.text,
      "user_id": colorController.text,
      "pet_color": colorController.text,
      "pet_sex": sexController.text,
    };
    String jsonPlayload = jsonEncode(postedData);
    try {
      Response response = await dio.post(
        url,
        data: postedData,
        options: options,
      );

      dynamic decodedString = jsonDecode(response.toString());
      dynamic code = decodedString['code'];
      String message = decodedString['message'];

      if (code == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('A new pet was added successfully')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error in adding pet please try again later')),
        );
      }
    } on DioError catch (exception) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Network error: ${exception.message}')),
      );
    } catch (exception) {}
  }
}
