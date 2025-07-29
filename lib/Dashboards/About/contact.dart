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
                  child: Icon(Icons.apps_rounded, size: 40, color: Colors.amber),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Address",
                    style: TextStyle(fontSize: 17, color: Colors.black),
                  ),
        
                  Text(
                    "Email",
                    style: TextStyle(fontSize: 17, color: Colors.black),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(""),
                  Text("petclinic@gmail.com", style: TextStyle(fontSize: 15, color: Colors.blue),)
                ],
              ),
        
              //space
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [ 
                  Text("Mobile Number", style: TextStyle(fontSize: 17, color: Colors.black),),
                 Text("P.O.Box", style: TextStyle(fontSize: 17, color: Colors.black),)],
                 
              ),
              SizedBox(height:10 ,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("+255 773 165 882",),
                  Text("hapa")
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/whatsapp.jpg", width: 40, height: 30,),
                  Image.asset("assets/images/ig.jpg",width: 40, height: 30,),
               Image.asset("assets/images/facebook.png", width: 40, height: 40,)
                ],
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
