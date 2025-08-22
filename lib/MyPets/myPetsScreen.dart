import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_login/MyPets/addPets.dart';
import 'package:user_login/MyPets/deletePets.dart';
import 'package:user_login/utilis/config.dart';

class Mypetsscreen extends StatefulWidget {
  final dynamic splashData;
  const Mypetsscreen({super.key, this.splashData});

  @override
  State<Mypetsscreen> createState() => _MypetsscreenState();
}

class _MypetsscreenState extends State<Mypetsscreen> {
  String user_id = "";
  @override
  void initState() {
    preparedData();
    all_pets();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text("MyPets"),
      ),

      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return _myPets();
        },
      ),
      floatingActionButton: SpeedDial(
        spaceBetweenChildren: 20,
        icon: Icons.menu,
        backgroundColor: Colors.amber,
        children: [
          SpeedDialChild(
            child: Icon(Icons.add, color: Colors.amber),
            label: "Add Pet",
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => Addpets(splashData: widget.splashData),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _myPets() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 110,
        width: 50,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.amber),
          borderRadius: BorderRadius.circular(0.5),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                height: 150,
                width: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Name: Bella"),
                  Text("Sex: male"),
                  Text("Color: brown"),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 20,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: BoxBorder.all(color: Colors.black),
                          ),
                          child: GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => Addpets()),
                            ),
                            child: Center(child: Text("Edit")),
                          ),
                        ),
                        SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (_) => Deletepets(),
                            );
                          },
                          child: Container(
                            height: 20,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: BoxBorder.all(color: Colors.black),
                            ),
                            child: Center(child: Text("delete")),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  all_pets() async {
    String url = Config.all_pets;
    Dio dio = Dio();
    Options options = Options(responseType: ResponseType.plain);
    options.contentType = 'application/x-www-form-urlencoded';

    try {
      Response response = await dio.post(url, data: "", options: options);

      dynamic decodedString = jsonDecode(response.toString());
      dynamic code = decodedString['code'];

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
  
  void preparedData() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    user_id = preferences.getString(Config.user_id)!;
    
  }
}
