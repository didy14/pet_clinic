import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_login/appointmentScreens/summaryDialog.dart';

class Newappointment extends StatefulWidget {
  final dynamic services;
  const Newappointment({super.key, this.services});

  @override
  State<Newappointment> createState() => _NewappointmentState();
}

class _NewappointmentState extends State<Newappointment> {
  List<dynamic> services2 = [];
  
  String? selectedService;

  List<String> pets = ['Bella', 'Max', 'Charlie', 'Luna'];
  String? selectedPet;

  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _pickTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  @override
  void initState() {
    services2 = widget.services;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("services $services2");
    return Center(
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Icon(
                    CupertinoIcons.checkmark_alt_circle_fill,
                    size: 50,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: Text(
                    "New Appointments",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text("Services", style: TextStyle(fontSize: 16)),
                const SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  height: 60,
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Center(
                    child: DropdownButtonFormField<String>(
                      isExpanded: true,
                      value: selectedService,
                      decoration: InputDecoration.collapsed(
                        hintText: 'Select a service',
                      ),
                      items: services2.map((item) {
                        return DropdownMenuItem<String>(
                          value: item["service_id"].toString(),
                          child: Text(item["name"]),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedService = newValue;
                        });
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 20),
                Text("Pets", style: TextStyle(fontSize: 16)),
                const SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  height: 60,
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Center(
                    child: DropdownButtonFormField<String>(
                      isExpanded: true,
                      value: selectedPet,
                      decoration: InputDecoration.collapsed(
                        hintText: 'Select a pet',
                      ),
                      items: pets.map((String pet) {
                        return DropdownMenuItem<String>(
                          value: pet,
                          child: Text(pet),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedPet = newValue;
                        });
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Date", style: TextStyle(fontSize: 16)),
                    Text("Time", style: TextStyle(fontSize: 16)),
                  ],
                ),
                const SizedBox(height: 8),
                // Date and Time Picker UI
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: _pickDate,
                      child: Container(
                        width: 120,
                        height: 40,
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Center(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              selectedDate != null
                                  ? "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"
                                  : "Pick date",
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: _pickTime,
                        child: Container(
                          width: 120,
                          height: 40,
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              selectedTime != null
                                  ? selectedTime!.format(context)
                                  : "Pick time",
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // Submit Button
                Center(
                  child: GestureDetector(
                    onTap: () {
                      if (selectedService == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Please select a service."),
                          ),
                        );
                      } else if (selectedPet == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Please select a pet.")),
                        );
                      } else if (selectedDate == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Please choose a date."),
                          ),
                        );
                      } else if (selectedTime == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Please choose a time."),
                          ),
                        );
                      } else {
                        showDialog(
                          context: context,
                          builder: (_) => Summarydialog(
                            service: selectedService,
                            pet: selectedPet,
                            Date: selectedDate,
                            Time: selectedTime,
                          ),
                        );
                      }
                    },
                    child: Container(
                      height: 30,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Center(
                        child: Text(
                          "Submit",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
