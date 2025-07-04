import 'package:flutter/material.dart';

class Editprofilescreen extends StatefulWidget {
  const Editprofilescreen({super.key});

  @override
  State<Editprofilescreen> createState() => _EditprofilescreenState();
}

class _EditprofilescreenState extends State<Editprofilescreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        child: SizedBox(
          width: 400,
          height: 400,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    child: Icon(
                      Icons.person,
                      size: 50,
                      color: Colors.grey[400],
                    ),
                  ),
                ),
                Text("Email"),
                Container(
                  height: 30,
                  width: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      decoration: InputDecoration.collapsed(
                        hintText: "Enter your email",
                        hintStyle: TextStyle(
                          fontSize: 11,
                          color: Colors.grey[400],
                        ),
                      ),
                    ),
                  ),
                ),
                //space
                SizedBox(height: 10),
                Text("Name"),
                Container(
                  height: 30,
                  width: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      decoration: InputDecoration.collapsed(
                        hintText: "Enter your name",
                        hintStyle: TextStyle(
                          fontSize: 11,
                          color: Colors.grey[400],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text("Mobile Number"),
                Container(
                  height: 30,
                  width: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      decoration: InputDecoration.collapsed(
                        hintText: "Enter your number",
                        hintStyle: TextStyle(
                          fontSize: 11,
                          color: Colors.grey[400],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: GestureDetector( onTap: () {
                     Navigator.pop(
                  context
                );
                  },
                    child: Container(
                      height: 30,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Center(
                        child: Text(
                          "Submit",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
