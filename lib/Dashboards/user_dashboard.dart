import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_login/Dashboards/About/contact.dart';
import 'package:user_login/Dashboards/About/emergency.dart';
import 'package:user_login/Dashboards/About/location.dart';
import 'package:user_login/Dashboards/menuPage.dart';
import 'package:user_login/Dashboards/sideBar.dart';
import 'package:user_login/appointmentScreens/appointmentScreen.dart';
import 'package:user_login/appointmentScreens/doctorsPage.dart';
import 'package:user_login/appointmentScreens/newAppointment.dart';
import 'package:user_login/appointmentScreens/services.dart';
import 'package:user_login/medicalReportScreen.dart';
import 'package:user_login/MyPets/myPetsScreen.dart';
import 'package:user_login/myProfileScreen.dart';
import 'package:user_login/notificationScreen.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class Dashboard extends StatefulWidget {
  final dynamic splashData;
  const Dashboard({super.key, this.splashData});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    print("splash data🎶🎶: ${widget.splashData}");
    return PopScope(
      canPop: false,
      child: Scaffold(
        key: _scaffoldKey,
        endDrawer: Sidebar(),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.amber,
          elevation: 0,
          title: const Text(
            'Home',
            style: TextStyle(
              fontSize: 17,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            Stack(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.notifications,
                    size: 35,
                    color: Colors.black,
                  ),
                  //open side bar
                  onPressed: () {
                    _scaffoldKey.currentState?.openEndDrawer();
                  },
                ),
                Positioned(
                  top: 5,
                  right: 8,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        '2',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    "Welcome..",
                    style: TextStyle(fontSize: 28, color: Colors.black),
                  ),
                  const SizedBox(height: 3),
                  const Text(
                    "Your Pet is here now!",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),

                  const SizedBox(height: 10),

                  //  Horizontal Sliding Ads Section
                  const Text(
                    "Promoted Ads",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  Divider(),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 120,
                    width: 400,
                    child: PageView(
                      controller: PageController(viewportFraction: 0.9),
                      scrollDirection: Axis.horizontal,
                      children: const [
                        AdItem(
                          title: "",
                          //icon: Icons.add,
                          imageUrl: 'assets/images/ads8.png',
                          //color: Colors.orange,
                        ),
                        AdItem(
                          title: "",
                          imageUrl: 'assets/images/ads.jpg',
                          //icon: Icons.local_hospital,
                          //color: Colors.green,
                        ),

                        AdItem(
                          title: "",
                          imageUrl: 'assets/images/ads7.png',
                          //icon: Icons.local_hospital,
                          //color: Colors.green,
                        ),
                        AdItem(title: "", imageUrl: 'assets/images/ads4.jpg'),
                        AdItem(
                          title: '',
                          imageUrl: 'assets/images/ads5.png',
                          //icon: Icons.pets,
                          //color: Colors.purple,
                        ),
                        AdItem(title: '', imageUrl: 'assets/images/ads6.png'),
                      ],
                    ),
                  ),
                  Divider(),

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Smallwidget(
                          title: "Appointments",
                          icon: Icons.calendar_month,
                          color: Colors.amber,
                          navigate: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => Newappointment(
                                  splashData: widget.splashData,
                                ),
                              ),
                            );
                          },
                        ),

                        Smallwidget(
                          title: "Emergency",
                          icon: CupertinoIcons.clock,
                          color: Colors.greenAccent,
                          navigate: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => Emergency()),
                            );
                          },
                        ),

                        Smallwidget(
                          title: "Find clinic",
                          icon: Icons.location_on_outlined,
                          color: Colors.redAccent,
                          navigate: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => Location()),
                            );
                          },
                        ),

                        Smallwidget(
                          icon: Icons.phone,
                          color: Colors.green,
                          title: "Contact",
                          navigate: () {
                            showDialog(
                              context: context,
                              builder: (_) => Contact(),
                            );
                          },
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 20),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: const SizedBox(height: 30),
                      ),
                      const Text(
                        "Our Services",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 190),
                        child: GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => Services(
                                //splasData: widget.splashData,
                                splashData: widget.splashData,
                              ),
                            ),
                          ),
                          child: Icon(Icons.arrow_forward_ios_sharp, size: 20),
                        ),
                      ),
                    ],
                  ),

                  Divider(endIndent: 15, thickness: 0.5),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ServiceItem(
                          splashData: widget.splashData,
                          title: "Bathing: ",
                          text:
                              " Keep your pets fresh, clean and happy with our gentle bath and grooming",
                          ImageUrl: 'assets/images/bathing.png',
                          hint: "Bathing",
                          //color: Colors.blue,
                        ),

                        ServiceItem(
                          splashData: widget.splashData,
                          title: "Hair Triming:",
                          text:
                              "Stylish and hygienic haircuts tailored to your pet’s breed and comfort.",
                          ImageUrl: 'assets/images/haircutting.png',
                          hint: "Hair Triming",
                          //color: Colors.pink,
                        ),
                        ServiceItem(
                          splashData: widget.splashData,
                          title: "Vaccinations:",
                          text:
                              "Protect your pet’s health with timely and trusted vaccinations from licensed vets",
                          ImageUrl: 'assets/images/vaccination.png',
                          hint: "Vaccination",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        ' Our Veterinarians.',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 150),
                        child: GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => Doctorspage()),
                          ),
                          child: Icon(Icons.arrow_forward_ios_sharp, size: 20),
                        ),
                      ),
                    ],
                  ),

                  Divider(endIndent: 15, thickness: 0.5),

                  //for Doctors
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Doctorwidget(
                          title: "Dr Dora Johnson",
                          ImageUrl: 'assets/images/Dr1.png',
                          description: " General Practise",
                          experiance: "3 years of experiance",
                          status: "Available",
                          color: Colors.blue,
                        ),

                        Doctorwidget(
                          title: "Dr Maria Elvis",
                          ImageUrl: 'assets/images/Dr2.png',
                          description: "Surgery & Emergency",
                          experiance: "5 years of experiance",
                          status: "Busy",
                          color: Colors.grey,
                        ),

                        Doctorwidget(
                          title: "Dr Elly Dvid",
                          ImageUrl: 'assets/images/Dr3.png',
                          description: "",
                          experiance: " 1 year of experiance",
                          status: "Available",
                          color: Colors.blue,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        //for menu
        floatingActionButton: SpeedDial(
          spaceBetweenChildren: 20,
          icon: Icons.menu,
          activeIcon: Icons.close,
          backgroundColor: Colors.amber,
          children: [
            SpeedDialChild(
              child: Icon(Icons.settings, color: Colors.amberAccent, size: 40),
              label: 'Settings',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => Myprofilescreen()),
              ),
            ),
            SpeedDialChild(
              //elevation: 20,
              child: Icon(
                Icons.health_and_safety,
                color: Colors.amberAccent,
                size: 40,
              ),
              label: 'Medical Report',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => MedicalReportScreen(
                    name: "Max",
                    species: "cat",
                    age: "3",
                    imagePath: 'assets/images/Max.jpg',
                  ),
                ),
              ),
            ),

            SpeedDialChild(
              child: Icon(Icons.add, color: Colors.amberAccent, size: 40),
              label: 'My Pets',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => Mypetsscreen(
                    splashData: widget.splashData),
                ),
              ),
            ),
            SpeedDialChild(
              child: Icon(
                Icons.calendar_month,
                color: Colors.amberAccent,
                size: 40,
              ),
              label: 'Appointments',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      Appointmentscreen(splashData: widget.splashData),
                ),
              ),
            ),
          ],
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
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.15),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
          border: Border.all(color: Colors.grey.withOpacity(0.1)),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.amber.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, size: 28, color: Colors.amber),
            ),
            const SizedBox(width: 16),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 16,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}

//AdItem widget used in PageView
class AdItem extends StatelessWidget {
  final String title;
  final Color color;
  final String? imageUrl;

  const AdItem({
    super.key,
    required this.title,
    required this.imageUrl,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 200,
        width: 200,
        padding: const EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: AssetImage(imageUrl!),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

//small widgets after adds
class Smallwidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback navigate;

  const Smallwidget({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    required this.navigate,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: navigate,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          children: [
            Container(
              width: 100,
              height: 50,
              margin: const EdgeInsets.symmetric(horizontal: 0.5),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.amber),
              ),
              child: Expanded(
                child: Column(
                  children: [
                    Icon(icon, size: 15, color: color),
                    Text(
                      title,
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ServiceItem extends StatelessWidget {
  final String title;
  final String text;
  final ImageUrl;
  final Color color;
  final String hint;
  final dynamic splashData;

  const ServiceItem({
    super.key,
    required this.title,
    required this.text,
    required this.ImageUrl,
    this.color = Colors.white,
    required this.hint,
    this.splashData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 180,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.amber),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(ImageUrl, width: 150, height: 150, fit: BoxFit.fitHeight),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
                Text(text, style: TextStyle(fontSize: 15, color: Colors.black)),
                SizedBox(height: 15),
                Container(
                  height: 30,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.black),
                    color: Colors.amber,
                  ),

                  child: Center(
                    child: GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              Newappointment(splashData: splashData),
                        ),
                      ),
                      child: Text(
                        "Book now",
                        style: TextStyle(fontSize: 17, color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Doctorwidget extends StatelessWidget {
  final String title;
  final String ImageUrl;
  final String description;
  final String experiance;
  final String status;
  final Color color;

  const Doctorwidget({
    super.key,
    required this.title,
    required this.ImageUrl,
    required this.description,
    required this.experiance,
    required this.status,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        width: 200,
        height: 240,
        margin: const EdgeInsets.symmetric(horizontal: 0.5),
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.amber),
        ),
        child: Column(
          children: [
            CircleAvatar(backgroundImage: AssetImage(ImageUrl), radius: 40),
            SizedBox(height: 15),
            Text(
              title,
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              description,
              style: TextStyle(fontSize: 17, color: Colors.black),
            ),

            SizedBox(height: 15),
            Text(experiance),

            SizedBox(height: 15),
            Expanded(
              child: Container(
                height: 30,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: color,
                  //color: const Color.fromARGB(255, 88, 167, 233),
                ),

                child: Center(
                  child: Text(
                    status,
                    style: TextStyle(fontSize: 17, color: Colors.black),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

 
}

/*import 'package:flutter/material.dart';
import 'package:user_login/Dashboards/sideBar.dart';
import 'package:user_login/appointmentScreens/appointmentScreen.dart';
import 'package:user_login/medicalReportScreen.dart';
import 'package:user_login/MyPets/myPetsScreen.dart';
import 'package:user_login/myProfileScreen.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home ',
          style: TextStyle(fontSize: 17, color: Colors.black),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              showDialog(context: context, builder: (_) => Sidebar()); 
            },
           child:  Icon(Icons.person, size: 20),
          ),
        ],
      ),

      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              const Text(
                "Welcome..",
                style: TextStyle(fontSize: 28, color: Colors.black),
              ),
              const SizedBox(height: 10),
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
              Expanded(
                child: DashboardItem(
                  title: "Notifications",
                  icon: Icons.notifications,
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
                        MaterialPageRoute(builder: (_) => const Mypetsscreen()),
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
}*/
