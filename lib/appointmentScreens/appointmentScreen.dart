import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:user_login/appointmentScreens/newAppointment.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Appointmentscreen extends StatefulWidget {
  final dynamic splashData;
  
  const Appointmentscreen({super.key, this.splashData});

  @override
  State<Appointmentscreen> createState() => _AppointmentscreenState();
}

class _AppointmentscreenState extends State<Appointmentscreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late Timer _timer;
  DateTime nextAppointment = DateTime(2025, 6, 20, 14, 30);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _timer = Timer.periodic(Duration(minutes: 1), (timer) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    final now = DateTime.now();
    final remaining = nextAppointment.difference(now);
    final days = remaining.inDays;
    final hours = remaining.inHours % 24;
    final minutes = remaining.inMinutes % 60;
    final totalMinutes = remaining.inMinutes;
    final maxMinutes = Duration(days: 7).inMinutes;
    final percent = (1 - (totalMinutes / maxMinutes)).clamp(0.0, 1.0);

    return Scaffold(
      appBar: AppBar(
        title: Text("Appointments"),
        centerTitle: true,
        backgroundColor: Colors.amberAccent,
        actions: [
          Column(
            children: [
              IconButton(
                icon: Icon(Icons.add, size: 30),
                onPressed: () {
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
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Text(
            "Upcoming Appointment",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              color: Colors.amber,
            ),
            textAlign: TextAlign.center,
          ),
          Column(children: [SizedBox(height: 20)]),
          CircularPercentIndicator(
            radius: 100.0,
            lineWidth: 12.0,
            percent: percent,
            progressColor: Colors.amber,
            backgroundColor: Colors.amberAccent.shade100,
            circularStrokeCap: CircularStrokeCap.round,
            center: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.access_time_filled,
                  size: 30,
                  color: Colors.amberAccent,
                ),
                SizedBox(height: 8),
                Text(
                  "$days d $hours h $minutes m",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  "remaining",
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
          SizedBox(height: 25),
          TabBar(
            controller: _tabController,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.amber,
            tabs: const [
              Tab(text: "All"),
              Tab(text: "Upcoming"),
              Tab(text: "Completed"),
              Tab(text: "Pending"),
            ],
          ),
          SizedBox(height: 20),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                AppointmentList(filter: 'all'),
                AppointmentList(filter: 'Upcoming'),
                AppointmentList(filter: 'Completed'),
                AppointmentList(filter: 'pending'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //call service API
  /*void fetchServices() async {
    print("here");
    String url = "http://10.67.208.242:8082/api/auth/services";
    Dio dio = Dio();
    Options options = Options();
    options.contentType = 'application/x-www-form-urlencoded';

    try {
      Response response = await dio.get(url, data: "", options: options);

      print(" Services response: $response");
      dynamic decodedString = jsonDecode(response.toString());
      dynamic code = decodedString['code'];
      String message = decodedString['message'];

      if (code == 200) {
        dynamic data = decodedString['data'];
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Newappointment(services: data),
          ),
        );
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(message)));
      }
    } on DioError catch (exception) {
      print("Dio error: $exception");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Network error: ${exception.message}')),
      );
    } catch (exception) {}
  }*/
}

// Dummy widget for appointment list
class AppointmentList extends StatelessWidget {
  final String filter;

  const AppointmentList({required this.filter});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> data = [
      {
        'title': 'Rabies Vaccines ',
        'type': 'vaccination',
        'date': DateTime(2025, 6, 20),
        'petName': 'Bella',
      },

      {
        'title': 'General CheckUp',
        'type': 'pending',
        'date': DateTime(2025, 6, 25),
        'petName': 'Charlie',
      },
    ];

    final filtered = data.where((a) {
      if (filter == 'all') return true;
      return a['type'] == filter;
    }).toList();

    return ListView.builder(
      itemCount: filtered.length,
      itemBuilder: (_, i) {
        final appt = filtered[i];
        return ListTile(
          title: Text(appt['title']),
          subtitle: Text(
            "${appt['petName']} • ${DateFormat.yMMMd().format(appt['date'])}",
          ),
          leading: Icon(Icons.pets, color: Colors.amberAccent),
          trailing: Icon(Icons.arrow_forward_ios, size: 16),
        );
      },
    );
  }
}
