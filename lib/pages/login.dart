import 'package:flutter/material.dart';
import 'package:recipe_app/pages/forgotpassword.dart';
import 'package:recipe_app/pages/registration.dart';
import 'package:recipe_app/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../widgets.dart';
import 'dashboard.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late ScaffoldMessengerState scaffoldMessenger;
  @override
  Widget build(BuildContext context) {
    scaffoldMessenger = ScaffoldMessenger.of(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  "https://images.pexels.com/photos/357573/pexels-photo-357573.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Align(
                child: ClipOval(
                  child: SizedBox.fromSize(
                      size: Size.fromRadius(100),
                      child: Image(
                        image: AssetImage('assets/images/logo.jpg'),
                        width: 250,
                        alignment: Alignment.bottomCenter,
                      )),
                ),
              ),
              mylabels("Login", size: 26.0, textColor: Colors.orange),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      mylabels("Username"),
                      mytextFields("Enter username", usernameController),
                      mylabels(" "),
                      mylabels("Password"),
                      mytextFields("Enter password", passwordController),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: OutlinedButton(
                              onPressed: () {
                                loginFunction();
                                //use shared preferences to store username and first name
                              },
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.deepOrange),
                                alignment: Alignment.center,
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(95, 8, 8, 8),
                        child: OutlinedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          Passwordreset()));
                            },
                            child: Text(
                              "Forgot password?",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.deepOrange),
                              alignment: Alignment.center,
                            )),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            child: Text(
                              "Don't have an account?, Sign Up",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.blue[900],
                                  backgroundColor: Colors.grey),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) => signUp(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void loginFunction() {
    if (usernameController.text.isEmpty && passwordController.text.isEmpty) {
      scaffoldMessenger
          .showSnackBar(mySnackBar("Provide Username and Password"));
      return;
    } else if (passwordController.text.isEmpty) {
      scaffoldMessenger.showSnackBar(mySnackBar("Provide Password"));
      return;
    } else if (usernameController.text.isEmpty) {
      scaffoldMessenger.showSnackBar(mySnackBar("Provide UserName"));
      return;
    } else {
      signIn(usernameController.text, passwordController.text);
    }
  }

  signIn(String username, pass) async {
    DialogBuilder(context).showLoadingIndicator(
        "Please wait as we authenticate you", "Authentication");
    Map data = {'username': username, 'password': pass};
    var jsonResponse;
    var response = await http
        .post(Uri.parse("https://localhost/recipeapp/login.php"), body: data);
    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      if (jsonResponse != null) {
        setState(() {
          DialogBuilder(context).hideOpenDialog();
        });
        int isRegistered = jsonResponse['code'];
        if (isRegistered == 1) {
          //correct password
          var fname = jsonResponse['firstName'];
          print(fname);
          //move to dashboard
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => Dashboard()));
        } else {
          //wrongpassword use SnackBar to Show
        }
      }
    } else {
      setState(() {
        DialogBuilder(context).hideOpenDialog();
      });
    }
  }
}
