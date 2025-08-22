import 'package:flutter/material.dart';
import 'package:user_login/Dashboards/user_dashboard.dart';
import 'package:user_login/appointmentScreens/newAppointment.dart';

class Services extends StatefulWidget {
  //final dynamic splasData;
  final dynamic splashData;
  const Services({super.key, this.splashData});

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  dynamic services;

  @override
  void initState() {
    services = widget.splashData["services"];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(" services $services😂😂");
    print("${widget.splashData}❤️❤️");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text("Services Provided"),
      ),

      body: ListView.builder(
        itemCount: services.length,
        itemBuilder: (context, index) {
          return _serviceList(services[index]);
        },
      ),
    );
  }

  _serviceList(dynamic services) {
  
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: 140,
      width: 100,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.amber),
        borderRadius: BorderRadius.circular(0.5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(5),
            child: Container(
              height: 120,
              width: 60,
              decoration: BoxDecoration(
                color: Colors.amberAccent,
                border: Border.all(color: Colors.red),
                borderRadius: BorderRadius.circular(0.5),
              ),
              child: Icon(
                Icons.bookmark_add_outlined,
                color: Colors.white,
                size: 25,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  services["service_name"],
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber,
                    decoration: TextDecoration.underline,
                  ),
                ),
                Text(services["description"]),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 9),
                      child: GestureDetector(
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_)=> Newappointment(
                         
                         splashData: widget.splashData,
                        ))),
                        child: Container(
                          height: 30,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.amberAccent,
                            border: Border.all(color: Colors.red),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(child: Text("Book Now")),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

}

