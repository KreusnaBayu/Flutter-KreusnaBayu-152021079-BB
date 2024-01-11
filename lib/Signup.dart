import 'package:flutter/material.dart';
import 'package:parkol/Login.dart';
import 'package:parkol/reusable_widget/reusable_widget.dart';
import 'package:parkol/services/api_services.dart';
import 'package:parkol/utils/color_utils.dart'; // Import your API service

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  // Instantiate your API service
  ApiService apiService = ApiService();

Future<void> signup() async {
  try {
    // Get user input
    String username = usernameController.text;
    String password = passwordController.text;
    String confirmPassword = confirmPasswordController.text;

    // Validate input (add your validation logic)

    // Call the signup API endpoint
    await ApiService.signup(username, password);

    // Show success popup
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Signup Successful"),
          content: Text("You have successfully signed up."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );

    // Navigate to the map screen on successful signup
    Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
  } catch (error) {
    // Show error popup
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Signup Failed"),
          content: Text("Signup failed. Please try again."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );

    // Handle errors (you may want to log the error or perform additional actions)
    print('Signup failed: $error');
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: Container(
               width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            hexStringToColor("191D88"),
            hexStringToColor("1450A3"),
            hexStringToColor("337CCF")
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter
          )
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
              child: Column(
                children: <Widget>[
                  logoWidget("assets/logo2.png"),
                SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Username", 
                Icons.person_2_outlined, 
                false, 
                usernameController),
                                  const SizedBox(
                    height: 20,
                  ),
                reusableTextField("Enter Password", 
                Icons.person_2_outlined, 
                false, 
                passwordController),
                                  const SizedBox(
                    height: 20,
                  ),
                reusableTextField("Enter Confirm Password", 
                Icons.lock, 
                false, 
                confirmPasswordController),
                const SizedBox(
                  height: 20,
                ),
                signInSignUpbutton(context, true, (){
                  signup();
                }),
                ],
              ),
      ),
    )
      )
    );
  }
}
