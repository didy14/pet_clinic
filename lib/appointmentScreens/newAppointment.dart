import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_login/Dashboards/user_dashboard.dart';
import 'package:user_login/appointmentScreens/services.dart';
import 'package:user_login/appointmentScreens/summaryDialog.dart';
import 'package:user_login/utilis/config.dart';
import 'dart:convert'; // for decoding string to json

class Newappointment extends StatefulWidget {
 // final dynamic splasData;
  final dynamic splashData;
  const Newappointment({super.key, this.splashData});

  @override
  State<Newappointment> createState() => _NewappointmentState();
}

class _NewappointmentState extends State<Newappointment> {
  List<Step> stepList() => [
    Step(
      stepStyle: _activeCurrentStep == 0
          ? StepStyle(color: Colors.amber)
          : StepStyle(color: Colors.grey),
      state: _activeCurrentStep <= 0 ? StepState.editing : StepState.complete,
      isActive: _activeCurrentStep >= 0,
      title: Text('Appointment'),
      content: Center(child: _appointmentBody()),
    ),
    Step(
      stepStyle: _activeCurrentStep == 1
          ? StepStyle(color: Colors.amber)
          : StepStyle(color: Colors.grey),
      state: _activeCurrentStep <= 1 ? StepState.editing : StepState.complete,
      isActive: _activeCurrentStep >= 1,
      title: Text('Time'),
      content: _time_slots(),
    ),
    Step(
      stepStyle: _activeCurrentStep == 2
          ? StepStyle(color: Colors.amber)
          : StepStyle(color: Colors.grey),
      state: _activeCurrentStep <= 2 ? StepState.editing : StepState.complete,
      isActive: _activeCurrentStep >= 2,
      title: Text('Confirm'),
      content: Center(
        child: Summarydialog(
          service: selectedServices,
          pet: selectedPet,
          Date: selectedDate,
          selectedTime: timeSelected,
          splashData: widget.splashData,
        ),
      ),
    ),
  ];

  String selectedHint = "Select Service";
  bool isTapped = false;
  int? selectedIndex;
  dynamic timeSelected;

  List<dynamic> services2 = [];
  List<dynamic> pets2 = [];
  dynamic timeSlotData;
  String? selectedPet;

  
  String? selectedServices;

  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  String? splashData;

  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
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

  _submit() {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Your appointment is submitted')));
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => Dashboard(splashData: widget.splashData),
      ),
    );
  }

  int _activeCurrentStep = 0;
  bool isCurrentStep = false;
  @override
  void initState() {
    services2 = widget.splashData["services"];
    pets2 = widget.splashData["pets_spicies"];


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SafeArea(
        child: Scaffold(
          body: Stepper(
            type: StepperType.horizontal,
            currentStep: _activeCurrentStep,
            steps: stepList(),
            // onStepContinue takes us to the next step
            onStepContinue: () {
              if (_activeCurrentStep < (stepList().length - 1)) {
                if (_activeCurrentStep == 0) {
                  _slots_availability();
                } else if (_activeCurrentStep == 1 && timeSelected == null) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text('please select time')));
                } else {
                  setState(() {
                    _activeCurrentStep += 1;
                  });
                }
              } else {
                _submit();
              }
            },
            // onStepCancel takes us to the previous step
            onStepCancel: () {
              if (_activeCurrentStep == 0) {
                Navigator.pop(context);
              }

              setState(() {
                _activeCurrentStep -= 1;
              });
            },

            // onStepTap allows to directly click on the particular step we want
            onStepTapped: (int index) {},
            controlsBuilder: (BuildContext context, ControlsDetails details) {
              return Row(
                children: <Widget>[
                  ElevatedButton(
                    onPressed: details.onStepContinue,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 1, 87, 4),
                    ),

                    child: _activeCurrentStep == 2
                        ? Text('Submit', style: TextStyle(color: Colors.white))
                        : Text('Next', style: TextStyle(color: Colors.white)),
                  ),
                  TextButton(
                    onPressed: details.onStepCancel,
                    child: _activeCurrentStep == 0
                        ? Text('Cancel', style: TextStyle(color: Colors.black))
                        : Text('Back', style: TextStyle(color: Colors.black)),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  _appointmentBody() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
              border: Border.all(color: Colors.amber),
            ),
            child: Center(
              child: DropdownButtonFormField<String>(
                isExpanded: true,
                value: selectedServices,
                decoration: InputDecoration.collapsed(hintText: selectedHint),
                items: services2.map((item) {
                  return DropdownMenuItem<String>(
                    value: item["service_name"].toString(),
                    child: Text(item["service_name"]),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedServices = newValue;
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
              border: Border.all(color: Colors.amber),
            ),
            child: Center(
              child: DropdownButtonFormField<String>(
                isExpanded: true,
                value: selectedPet,
                decoration: InputDecoration.collapsed(hintText: 'Select a pet'),
                items: pets2.map((pet) {
                  return DropdownMenuItem<String>(
                    value: pet["pet_name"],
                    child: Text(pet["pet_name"]),
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
          Text("Date", style: TextStyle(fontSize: 16)),
          const SizedBox(height: 8),
          // Date and Time Picker UI
          GestureDetector(
            onTap: _pickDate,
            child: Container(
              width: double.infinity,
              height: 60,
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.amber),
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

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  _slots_availability() async {
    if (selectedServices == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('please select a servcie')));
    } else if (selectedPet == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('please select a pet')));
    } else if (selectedDate == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('please select a date')));
    } else {
      String url = Config.slots_availability;
      Dio dio = Dio();
      Options options = Options(responseType: ResponseType.plain);
      options.contentType = 'application/x-www-form-urlencoded';
      Map<String, String> postedData = {"date": "12/8/2025", "status_id": "1"};
      String jsonPlayload = jsonEncode(postedData);
      String dateSelected =
          "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}";
      String slotData = "date=$dateSelected&status_id=1";
      print(url);
      print(jsonPlayload);
      try {
        Response response = await dio.post(
          url,
          options: options,
          data: slotData,
        );

        print(" fetching time_slots😍😍: $response");
        dynamic decodedString = jsonDecode(response.toString());
        dynamic code = decodedString['code'];
        String message = decodedString['message'];

        if (code == 200) {
          dynamic data = decodedString["data"];
          timeSlotData = data;
          //print("here❤️:${timeSlotData.length}");
          setState(() {
            _activeCurrentStep += 1;
          });
        } else {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(message)));
        }
      } on DioError catch (exception) {
        print("Dio error: $exception");

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('')));
      } catch (exception) {}
    }
  }

  _time_slots() {
    return SizedBox(
      height: 200,
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Display 3 items horizontally
          crossAxisSpacing: 12, // Spacing between columns
          mainAxisSpacing: 12, // Spacing between rows
          childAspectRatio: 3.0, // Aspect ratio of each child (width/height)
        ),
        itemCount: timeSlotData == null ? 0 : timeSlotData.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
                timeSelected =
                    "${timeSlotData[index]["start_time"]} - ${timeSlotData[index]["end_time"]}";
              });
              print("selected_slot_id ${timeSelected}");
            },
            child: Container(
              height: 200,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0.8),
                border: BoxBorder.all(color: Colors.amber),
                color: selectedIndex == index
                    ? Colors.amber.shade200
                    : Colors.transparent,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "from",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "to",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${timeSlotData[index]["start_time"]}"),
                        Text("${timeSlotData[index]["end_time"]}"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
