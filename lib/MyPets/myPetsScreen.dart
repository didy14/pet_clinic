import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:user_login/MyPets/addPets.dart';
import 'package:user_login/MyPets/deletePets.dart';

class Mypetsscreen extends StatefulWidget {
  const Mypetsscreen({super.key});

  @override
  State<Mypetsscreen> createState() => _MypetsscreenState();
}

class _MypetsscreenState extends State<Mypetsscreen> {
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
              MaterialPageRoute(builder: (_) => Addpets()),
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

_allPets(){

}
}
