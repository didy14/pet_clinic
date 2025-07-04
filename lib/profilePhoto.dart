import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Profilephoto extends StatefulWidget {
  const Profilephoto({super.key});

  @override
  State<Profilephoto> createState() => _ProfilephotoState();
}

class _ProfilephotoState extends State<Profilephoto> {
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10),
      child: SizedBox(
        height: 200,
        width: 400,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(CupertinoIcons.xmark),
                    ),

                    Text(
                      "Profile photo",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    Icon(CupertinoIcons.delete),
                  ],
                ),
              ),
              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                       
                    },
                    child: Column(
                      children: [
                        Icon(CupertinoIcons.camera_circle_fill, size: 50),
                        Text(
                          "Camera",
                          style: TextStyle(color: Colors.black, fontSize: 17),
                          
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Icon(CupertinoIcons.photo_fill, size: 40),
                      Text(
                        "Gallery",
                        style: TextStyle(color: Colors.black, fontSize: 17),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.person_2_rounded, size: 40),
                      Text(
                        "Avatar",
                        style: TextStyle(color: Colors.black, fontSize: 17),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
