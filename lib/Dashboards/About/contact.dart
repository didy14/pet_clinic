import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        child: Container(
          width: 350,
          height: 350,
          margin: const EdgeInsets.symmetric(horizontal: 5),
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.amber),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Icon(
                    Icons.apps_rounded,
                    size: 40,
                    color: Colors.amber,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Address",
                    style: TextStyle(fontSize: 17, color: Colors.black),
                  ),
                  Text("Mombasa 1st floor, Zanzibar"),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Email",
                    style: TextStyle(fontSize: 17, color: Colors.black),
                  ),
                  Text("petclinic@gmail.com", style: TextStyle(color: Colors.blueAccent, fontSize: 15),),
                ],
              ),
              
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Call Center",
                    style: TextStyle(fontSize: 17, color: Colors.black),
                  ),
                  Text("+255 623 388 338 "),
                ],
              ),
              
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/whatsapp.jpg",
                    width: 40,
                    height: 30,
                  ),
                  Image.asset("assets/images/ig.jpg", width: 40, height: 30),
                  Image.asset(
                    "assets/images/facebook.png",
                    width: 40,
                    height: 40,
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
