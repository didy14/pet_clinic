import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Logout extends StatefulWidget {
  const Logout({super.key});

  @override
  State<Logout> createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        borderRadius: BorderRadius.circular(10),
        child: SizedBox(
          width: 300,
          height: 300,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                      child: Icon(
                        CupertinoIcons.xmark_circle,
                        size: 40,
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    "Are you sure you want to LogOut?",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.redAccent, fontSize: 17),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 40,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 70,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Center(
                            child: Text(
                              "Cancel",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),

                      GestureDetector(
                        onTap: () {
                          Navigator.popUntil(context, (route) => route.isFirst);
                          ScaffoldMessenger.of(
                            context,
                          ).showSnackBar(SnackBar(content: Text("Logged out")));
                        },
                        child: Container(
                          width: 50,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Center(
                            child: Text(
                              "Yes",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
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
