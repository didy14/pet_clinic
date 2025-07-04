import 'package:flutter/material.dart';
import 'package:user_login/MyPets/addPets.dart';

class Mypetsscreen extends StatefulWidget {
  const Mypetsscreen({super.key});

  @override
  State<Mypetsscreen> createState() => _MypetsscreenState();
}

class _MypetsscreenState extends State<Mypetsscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              const Text(
                "MyPets",
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),

              // Row 1: Add New + Bella (only Add New navigates)
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const Addpets()),
                      ),
                      child: Container(
                        height: 200,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Icon(
                              Icons.add,
                              size: 80,
                              color: Colors.amberAccent,
                            ),
                            SizedBox(height: 10),
                            Text("New", style: TextStyle(fontSize: 16)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),

                  // Bella (no navigation)
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Column(
                        children: const [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage('assets/images/Bella.jpg'),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Bella",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text("Age: 2 years"),
                          Text("Species: Dog"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Row 2: Max + Charlie (no navigation)
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Column(
                        children: const [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage('assets/images/Max.jpg'),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Max",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text("Age: 3 years"),
                          Text("Species: Cat"),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Column(
                        children: const [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage('assets/images/Charlie.jpg'),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Charlie",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text("Age: 1.5 years"),
                          Text("Species: Rabbit"),
                        ],
                      ),
                    ),
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
