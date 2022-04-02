import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:recipe_app/pages/login.dart';
import 'package:recipe_app/widgets/mainwidgets.dart';

class signUp extends StatefulWidget {
  signUp({Key? key}) : super(key: key);

  @override
  _signUpState createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  TextEditingController fnameController = TextEditingController();
  TextEditingController snameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwController = TextEditingController();
  TextEditingController passwConfirmController = TextEditingController();
  late ScaffoldMessengerState scaffoldMessenger;
  @override
  Widget build(BuildContext context) {
    scaffoldMessenger = ScaffoldMessenger.of(context);
    return Scaffold(
      // appBar: PreferredSize(
      //     preferredSize: Size.fromHeight(40),
      //     child: AppBar(
      //       automaticallyImplyLeading: true,
      //       backgroundColor: Colors.orange[100],
      //     )
      //     ),
      body: SingleChildScrollView(
        child: Builder(builder: (context) {
          return Container(
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
                        size: Size.fromRadius(70),
                        child: Image(
                          image: AssetImage('assets/images/logo.jpg'),
                          width: 250,
                          alignment: Alignment.bottomCenter,
                        )),
                  ),
                ),
                mylabels("Sign Up", size: 26.0, textColor: Colors.orange),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        mylabels("First name"),
                        mytextFields("Enter first name", fnameController),
                        mylabels("Second name"),
                        mytextFields("Enter second name", snameController),
                        mylabels("Username"),
                        mytextFields("Enter Username", emailController),
                        mylabels("Password"),
                        mytextFields("Enter Password", passwController),
                        mylabels("Confirm Password"),
                        mytextFields(
                            "Confirm Password", passwConfirmController),
                      ],
                    ),
                  ),
                ),
                OutlinedButton(
                  onPressed: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (BuildContext context) => LoginPage()));
                    validate_regitration();
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.deepOrange),
                    alignment: Alignment.center,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      child: Text(
                        "Already have an account?, Sign In",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.blue[900],
                            backgroundColor: Colors.grey),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    LoginPage()));
                      },
                    )
                  ],
                )
              ],
            ),
          );
        }),
      ),
    );
  }

  void validate_regitration() {
    if (fnameController.text.isEmpty) {
      scaffoldMessenger.showSnackBar(mySnackBar("Provide first name"));
      return;
    } else if (snameController.text.isEmpty) {
      scaffoldMessenger.showSnackBar(mySnackBar("Provide second name"));
      return;
    } else if (emailController.text.isEmpty) {
      scaffoldMessenger.showSnackBar(mySnackBar("Provide email as username"));
      return;
    } else if (passwController.text.isEmpty) {
      scaffoldMessenger.showSnackBar(mySnackBar("Provide password"));
      return;
    } else if (passwConfirmController.text.isEmpty) {
      scaffoldMessenger
          .showSnackBar(mySnackBar("Provide password confirmation"));
      return;
    } else if (passwController.text != passwConfirmController.text) {
      scaffoldMessenger.showSnackBar(mySnackBar("Passwords do not match"));
    }
  }
}
