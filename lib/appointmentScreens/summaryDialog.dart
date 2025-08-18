import 'package:flutter/material.dart';

class Summarydialog extends StatefulWidget {
  final dynamic service;
  final dynamic pet;
  final dynamic Date;
  final dynamic selectedTime;
  final dynamic splashData;
  Summarydialog({
    super.key,
    this.service,
    this.pet,
    this.Date,
    this.selectedTime,
    this.splashData,
  });

  @override
  State<Summarydialog> createState() => _SummarydialogState();
}

class _SummarydialogState extends State<Summarydialog> {
  @override
  Widget build(BuildContext context) {
    print("Time${widget.selectedTime}");
    return Center(
      child: Material(
        child: SizedBox(
          width: 400,
          height: 400,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    child: Icon(
                      Icons.check_box,
                      size: 4.0,
                      color: Colors.green[400],
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    "Summary",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 50,
                    left: 20,
                    bottom: 20,
                    right: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Service", style: TextStyle(fontSize: 17)),
                      Text(
                        widget.service,
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.orangeAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    bottom: 20,
                    right: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Pet", style: TextStyle(fontSize: 17)),
                      Text(
                        widget.pet,
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.orangeAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        bottom: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Date", style: TextStyle(fontSize: 17)),
                          Text(
                            widget.Date.toString().substring(0, 10),
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.orangeAccent,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        bottom: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Time", style: TextStyle(fontSize: 17)),

                          Text(
                            widget.selectedTime.toString(),
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.orangeAccent,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
