import 'package:flutter/material.dart';
import 'package:user_login/appointmentScreens/appointmentScreen.dart';
import 'package:user_login/medicalReportScreen.dart';
import 'package:user_login/MyPets/myPetsScreen.dart';
import 'package:user_login/myProfileScreen.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

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
                "Your Pet's",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const Text(
                "is here now!",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 40),

              // First row with two items
              Row(
                children: [
                  Expanded(
                    child: DashboardItem(
                      title: "Appointments",
                      icon: Icons.calendar_month,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const Appointmentscreen(),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: DashboardItem(
                      title: "Medical Records",
                      icon: Icons.health_and_safety_rounded,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const MedicalReportScreen(
                            name: "Bella",
                            species: "Dog",
                            age: "2 years",
                            imagePath: 'assets/images/Bella.jpg',
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Second row with two items
              Row(
                children: [
                  Expanded(
                    child: DashboardItem(
                      title: "My Pets",
                      icon: Icons.pets,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const Mypetsscreen(),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: DashboardItem(
                      title: "My Profile",
                      icon: Icons.person,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const Myprofilescreen(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Single item for Notifications
              DashboardItem(
                title: "Notifications",
                icon: Icons.notifications,
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('No new notifications')),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DashboardItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final GestureTapCallback? onTap;

  const DashboardItem({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.amber),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
