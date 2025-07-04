import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:user_login/dashboard.dart';
import 'dart:ui';

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
                width: 300,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: Colors.white.withOpacity(0.3)),
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
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Row(
                          children: [
                            Checkbox(value: false, onChanged: null),
                            Text(
                              "Remember me",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),

                        Text(
                          "Forgot Password?",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () => validate(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white.withOpacity(0.3),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 80,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: _isloading
                          ? CircularProgressIndicator()
                          : Text('LOGIN', style: TextStyle(letterSpacing: 2)),
                    ),
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
    String url = "http://192.168.209.242:8082/api/auth/register";
    Dio dio = Dio();
    Options options = Options();
    options.contentType = 'application/x-www-form-urlencoded';

    String postedData =
        "username=${emailController.text}&password=${passwordController.text}";

    try {
      Response response = await dio.post(
        url,
        data: postedData,
        options: options,
      );

      print(" Register response: $response");
      dynamic decodedString = jsonDecode(response.toString());
      dynamic code = decodedString['code'];
      String message = decodedString['message'];

      if (code == 200) {
        setState(() {
          _isloading = false;
        });
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Dashboard()),
        );
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
      print("Dio error: $exception");
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


      //appBar: AppBar(centerTitle: true, title: Text('Login')),
      //body: Padding(
      // padding: EdgeInsets.all(20),
      // child: Column(
      //children: [
      //TextField(
      //controller: emailController,
      // decoration: InputDecoration(labelText: 'Email',
      //border: OutlineInputBorder(),
      // ),

      // ),
      // TextField(
      //controller: passwordController,
      // obscureText: _obscurePassword,
      // decoration: InputDecoration(
      // labelText: 'Password',
      //border: OutlineInputBorder(),
      //suffixIcon: IconButton(
      //icon: Icon(
      //_obscurePassword ? Icons.visibility : Icons.visibility_off,
      // ),
      //onPressed: () {
      // setState(() {
      // _obscurePassword = !_obscurePassword;
      //});
      //},
      //),
      // ),
      // ),
      //SizedBox(height: 20),
      //ElevatedButton(
      // onPressed: () => login(context),
      // child: Text('Login'),
      //),
      //TextButton(
      //onPressed: () {
      //Navigator.push(
      //context,
      // MaterialPageRoute(builder: (context) => SignUpPage()),
      //);
      //},
      //child: Row(
      //children: [
      //Text("Don't have an account? "),
      // Text("signUp", style: TextStyle(color: Colors.blueAccent)),
      // ],
      //),
      // ),
      //],
      //),
      //),
    //);
  //}
//}

//signing up
/*class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _obscurePassword = true;

  void signUp(BuildContext context) {
    String email = emailController.text;
    String password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Name and password cannot be blank')),
      );
    } else if (password.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Password must be at least 6 characters long')),
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Account created for $email')));
      Navigator.pop(context); // Go back to login after sign up
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Sign Up')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              obscureText: _obscurePassword,
              decoration: InputDecoration(
                labelText: 'Password',
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
              ),
            ),

            Center(
              child: ElevatedButton(
                onPressed: () => signUp(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Set button color to blue
                  foregroundColor: Colors.white, // Set text color to white
                ),
                child: Text('Sign Up'),
              ),
            ),

            TextButton(
              onPressed: () {
                Navigator.pop(context); // Back to login
              },
              child: Row(
                children: [
                  Text("Already have an account?"),
                  Text("Login", style: TextStyle(color: Colors.blueAccent)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}*/
