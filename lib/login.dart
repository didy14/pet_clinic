import 'dart:convert';
import 'package:dio/dio.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_login/Dashboards/receptionist_dashboard.dart';
import 'package:user_login/Dashboards/user_dashboard.dart';
import 'dart:ui';

import 'package:user_login/registration.dart';
import 'package:user_login/utilis/config.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _isloading = false;
  //fire base
  /*Future<void> loginUserwithEmailandPassword() async {
    try {
      final UserCredential = FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      print(UserCredential);
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 241, 187, 35),
              Color.fromARGB(111, 187, 175, 15),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),

        child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                width: 370,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: Colors.green),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.person, size: 40, color: Colors.indigo),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.3),
                        prefixIcon: const Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                        hintText: 'Email ID',
                        hintStyle: const TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 15),
                    TextField(
                      controller: passwordController,
                      obscureText: _obscurePassword,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.3),
                        prefixIcon: const Icon(Icons.lock, color: Colors.white),
                        hintText: 'Password',
                        hintStyle: const TextStyle(color: Colors.white),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () => validate(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: _isloading
                          ? CircularProgressIndicator()
                          : Text('SIGN IN', style: TextStyle(letterSpacing: 2)),
                    ),
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: () {
                        //await loginUserwithEmailandPassword();
                      },
                      child: GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => Registration()),
                        ),

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Row(
                              children: [
                                //Checkbox(value: false, onChanged: null),
                                Text(
                                  "dont you have an account? ",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),

                                Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    /*Center(
                      child: Text(
                              "Forgot Password?",
                              style: TextStyle(color: Colors.white, fontSize: 14),
                            ),
                    ),*/
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  //validation
  validate() {
    setState(() {
      _isloading = true;
    });
    if (emailController.text.trim() == "" &&
        passwordController.text.trim() == "") {
      setState(() {
        _isloading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Name and password cannot be blank')),
      );
    } else {
      loginRequest();
    }
  }

  void loginRequest() async {
    String url = Config.login;
    Dio dio = Dio();
    Options options = Options(responseType: ResponseType.plain);
    options.contentType = 'application/x-www-form-urlencoded';

    Map<String, String> postedData = {
      "user_email": emailController.text,
      "password": passwordController.text,
    };

    String jsonPlayload = jsonEncode(postedData);
    try {
      Response response = await dio.post(
        url,
        data: postedData,
        options: options,
      );

      print(" Login response 😊😊: $response");
      dynamic decodedString = jsonDecode(response.toString());
      String message = decodedString['message'];

      if (message == "Authenticated") {
        String token = decodedString['token'];
        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.setString(Config.token, token);

        fetchingSplash();
      } else {
        setState(() {
          _isloading = false;
        });
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(message)));
      }
    } on DioError catch (exception) {
      setState(() {
        _isloading = false;
      });
      print("Dio error: $exception");

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Invalid userID or password')));
    } catch (exception) {
      setState(() {
        _isloading = false;
      });
    }
  }

  void fetchingSplash() async {
    String url = Config.splash;
    Dio dio = Dio();
    Options options = Options(responseType: ResponseType.plain);
    options.contentType = 'application/x-www-form-urlencoded';
    try {
      Response response = await dio.get(url, options: options);

      print(" PullingData response 😊😊: $response");
      dynamic decodedString = jsonDecode(response.toString());
      dynamic code = decodedString['code'];
      String message = decodedString['message'];
      
      if (code == 200) {
        dynamic data = decodedString['data'];
        String splashData = decodedString['data'].toString();
        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.setString(Config.splashData, splashData);
        
        Navigator.push(context, MaterialPageRoute(builder: (_) => Dashboard(
          splashData: data
        )));
      } else {
        setState(() {
          _isloading = false;
        });
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(message)));
      }
    } on DioError catch (exception) {
      setState(() {
        _isloading = false;
      });
      print("Dio error: $exception");

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('data fetching failed. please  try again later'),
        ),
      );
    } catch (exception) {
      setState(() {
        _isloading = false;
      });
    }
  }
}
