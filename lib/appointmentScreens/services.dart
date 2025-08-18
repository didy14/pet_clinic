import 'package:flutter/material.dart';

class Services extends StatefulWidget {
  const Services({super.key});

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar:
    AppBar(
      backgroundColor: Colors.amber,
      title: const Text("Services Provided"),
    ),
   
    body: ListView.builder(
      itemBuilder: (context, index) {
        return _serviceList();
      },
    )
  
    );
  } 
}

_serviceList() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(border: Border.all(color: Colors.amber),
      borderRadius: BorderRadius.circular(0.5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Bathing:", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.amber),),
         Icon(Icons.design_services)
        ],
      )
    ),
  );
}
