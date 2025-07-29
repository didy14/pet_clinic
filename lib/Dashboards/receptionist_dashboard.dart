import 'package:flutter/material.dart';
import 'package:user_login/Dashboards/receptionist_list.dart';

class ReceptionistDashboard extends StatefulWidget {
  const ReceptionistDashboard({super.key});

  @override
  State<ReceptionistDashboard> createState() => _ReceptionistDashboardState();
}

class _ReceptionistDashboardState extends State<ReceptionistDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text("Dashboard", style: TextStyle(fontSize: 20, color: Colors.black87),) ,
        
      ),
      endDrawer: EndDrawerButton(onPressed: () => showDialog(context: context, builder: (_) =>ReceptionistList())),
    
    bottomNavigationBar : BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_outlined),
            label: 'Appointments'),
            BottomNavigationBarItem(
              icon:Icon(Icons.person_2),
              label: 'Doctors'),
              
               
              
            
      ]
      )
    );
  }
}