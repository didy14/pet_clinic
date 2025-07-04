import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_login/editProfileScreen.dart';
import 'package:user_login/logOut.dart';
import 'package:user_login/profilePhoto.dart';

class Myprofilescreen extends StatefulWidget {
  const Myprofilescreen({super.key});

  @override
  State<Myprofilescreen> createState() => _MyprofilescreenState();
}

class _MyprofilescreenState extends State<Myprofilescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Profile"),
        centerTitle: true,
        backgroundColor: Colors.amberAccent,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Center(
            child: Column(
              children: [
                Stack(
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/images/download.jpg'),
                      // Add your image
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            isDismissible: false,
                            context: context,
                            builder: (_) => Profilephoto(),
                          );

                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(CupertinoIcons.camera_circle_fill),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Text(
                  "Dida",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "dida@gamil.com",
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          const Divider(),
          const ListTile(
            leading: Icon(Icons.email),
            title: Text("dida@gmail.com"),
          ),
          const ListTile(
            leading: Icon(Icons.phone),
            title: Text("+1 234 567 8901"),
          ),
          const ListTile(
            leading: Icon(Icons.home),
            title: Text("123 Pet Street, Animal City"),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text("Edit Profile"),
            onTap: () {
              showDialog(context: context, builder: (_) => Editprofilescreen());
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Logout"),
            onTap: () {
              showDialog(context: context, builder: (_) => Logout());
            },
          ),
        ],
      ),
    );
  }
}
