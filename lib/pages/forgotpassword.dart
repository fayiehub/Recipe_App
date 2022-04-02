import 'package:flutter/material.dart';
import 'package:recipe_app/widgets/mainwidgets.dart';
import 'package:recipe_app/pages/login.dart';

class Passwordreset extends StatelessWidget {
  const Passwordreset({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (context) {
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
              mylabels("Please enter email to reset password",
                  size: 19.0, textColor: Colors.black),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      mylabels("Email"),
                      TextField(
                        decoration: InputDecoration(labelText: "Enter email"),
                      ),
                    ],
                  ),
                ),
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => LoginPage()));
                },
                child: Text(
                  "Continue",
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
            ],
          ),
        );
      }),
    );
  }
}
