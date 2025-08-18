import 'dart:convert';

import 'package:dio/dio.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:user_login/login.dart';
import 'dart:ui';

import 'package:user_login/utilis/config.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final TextEditingController first_nameController = TextEditingController();
  final TextEditingController last_nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  bool _obscurePassword = true;
  bool _isloading = false;

  //firebase
  /* Future<void> createUserwithEmailandPassword() async {
    try {
      final UserCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
          );
      print(UserCredential);
    } on FirebaseAuthException   catch (e) {
      print(e.message);
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(110, 235, 220, 17),
              Color.fromARGB(255, 75, 65, 33),
            ],
            //begin: Alignment.topLeft,
            //end: Alignment.bottomRight,
          ),
        ),

        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 40, color: Colors.indigo),
                ),
                SizedBox(height: 20),
                Text(
                  "Create new account",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        "Already A Member? ",
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => LoginPage()),
                      ),
                      child: Text(
                        "Sign In",
                        style: TextStyle(color: Colors.blue, fontSize: 17),
                      ),
                    ),
                  ],
                ),
            
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(width: 10, height: 10),
                    Expanded(
                      child: TextField(
                        controller: first_nameController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.3),
            
                          prefixIcon: const Icon(
                            Icons.person,
                            color: Colors.amber,
                          ),
                          hintText: 'first name ',
                          hintStyle: const TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: TextField(
                        controller: last_nameController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.3),
                          prefixIcon: const Icon(
                            Icons.person,
                            color: Colors.amber,
                          ),
                          hintText: 'last name',
                          hintStyle: const TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(width: 10),
                  ],
                ),
            
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    bottom: 10,
                    left: 10,
                    right: 10,
                  ),
                  child: SizedBox(
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.3),
                        prefixIcon: const Icon(Icons.email, color: Colors.amber),
                        hintText: 'Email',
                        hintStyle: const TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    bottom: 10,
                    left: 10,
                    right: 10,
                  ),
                  child: SizedBox(
                    child: TextField(
                      controller: phoneController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.3),
                        prefixIcon: const Icon(Icons.phone, color: Colors.amber),
                        hintText: 'phone number',
                        hintStyle: const TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
            
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                    left: 10,
                    right: 10,
                  ),
                  child: SizedBox(
                    child: TextField(
                      controller: passwordController,
                      obscureText: _obscurePassword,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.3),
                        prefixIcon: const Icon(Icons.lock, color: Colors.amber),
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
                          borderRadius: BorderRadius.circular(100),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 10),
            
                /*ElevatedButton(
                  onPressed: () async {
                    await createUserwithEmailandPassword();
                  },
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => LoginPage()),
                    ),
            
                    child: const Text("SIGN UP"),
                  ),
                ),*/
                GestureDetector(
                  
                  onTap: () => validate(),
                  
                  
                  child: Center(
                    child: _isloading
                        ? CircularProgressIndicator()
                        : Text(
                            'Create an account',
                            style: TextStyle(
                              letterSpacing: 2,
                              color: const Color.fromARGB(255, 2, 34, 59),
                              fontSize: 17,
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

  validate() {
    setState(() {
      _isloading = true;
    });
    if (first_nameController.text.trim() == "") {
      setState(() {
        _isloading = false;
      });
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(' First name  can not be blank')));
    }
    else if (last_nameController.text.trim() == "") {
      setState(() {
        _isloading = false;
      });
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Last name  can not be blank')));
    }
    else if (emailController.text.trim() == "") {
      setState(() {
        _isloading = false;
      });
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Email can not be blank')));
    } else if (phoneController.text.trim() == "") {
      setState(() {
        _isloading = false;
      });
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(' phone number cannot be blank')));
    } else if (passwordController.text.trim() == "" &&
        passwordController.text.trim() == "") {
      setState(() {
        _isloading = false;
      });
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('password cannot be blank')));
    } else {
      registrationRequest();
    }
  }

  void registrationRequest() async {
    String url = Config.register;
    Dio dio = Dio();
    Options options = Options(responseType: ResponseType.plain);
    options.contentType = 'application/x-www-form-urlencoded';
    
    Map<String, String> postedData = {
      "first_name": first_nameController.text,
      "last_name": last_nameController.text,
      "phone_number": phoneController.text,
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

      print("Register response 😒😒: $response");
      dynamic decodedString = jsonDecode(response.toString());
      dynamic code = decodedString['code'];
      String message = decodedString['message'];

      if (code == 200) {
        setState(() {
          _isloading = false;
        });
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Acount created successfully')));
      } else {
        setState(() {
          _isloading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('')));
      }
    } on DioError catch (exception) {
      setState(() {
        _isloading = false;
      });
      print("Dio error 😊😊😊: $exception");

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Network error: ${exception.message}')),
      );
    } catch (exception) {
      setState(() {
        _isloading = false;
      });
    }
  }
}
