import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parkol/reusable_widget/reusable_widget.dart';
import 'package:parkol/signup.dart';
import 'package:parkol/landing.dart';
import 'package:parkol/services/api_services.dart';
import 'package:parkol/utils/color_utils.dart'; // Import your API service


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Instantiate your API service
  ApiLogin apiLogin = ApiLogin();

Future<void> login() async {
  try {
    // Get user input from text controllers
    String username = usernameController.text;
    String password = passwordController.text;

    // Call the login API endpoint using your instantiated ApiService
    bool loginSuccess = await ApiLogin.login(username, password);

    // Check if the login was successful
    if (loginSuccess) {
      // Show success popup
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Login Successful"),
            content: Text("You have successfully logged in."),
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

      // Navigate to the landing screen on successful login
      Navigator.push(context, MaterialPageRoute(builder: (context) => Landing()));
    } else {
      // Show error popup
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Login Failed"),
            content: Text("Login failed. Please check your credentials."),
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
    }
  } catch (error) {
    // Handle other errors (you may want to log the error or perform additional actions)
    print('Login failed: $error');
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            padding: EdgeInsets.fromLTRB(
              20, MediaQuery.of(context).size.height * 0.2, 20, 0),
              child: Column(
                children: <Widget>[
                logoWidget("assets/logo2.png"),
                SizedBox(
                  height: 30,
                ),
                reusableTextField("Enter Username", 
                Icons.person_2_outlined, 
                false, 
                usernameController),
                  SizedBox(
                  height: 20, 
                ),
                reusableTextField("Enter Password", 
                Icons.lock, 
                true, 
                passwordController),
                SizedBox(
                  height: 20, 
                ),
                signInSignUpbutton(context, true, (){
                  login();
                }),
                signUpOption(context)
              ],
              ),
          ),
        ),
      ),
    );
  }


Row signUpOption(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text(
        "Don't have an account?",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Signup()),
          );
        },
        child: Text.rich(
          TextSpan(
            text: "Sign Up",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ],
  );
}

}
