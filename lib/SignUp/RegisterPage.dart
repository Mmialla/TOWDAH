import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
final FirebaseAuth mAuth = FirebaseAuth.instance;
class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => new _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>{
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override

  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          color : Colors.grey[300],
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(15, 110, 0, 0),
                child: Text('Sign Up!',style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.teal),),
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 10, left: 20, right: 20),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  labelText: 'NAME',
                  labelStyle: TextStyle(
                     fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    color: Colors.teal
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal)
                  )
                ),
              ),
              TextField(
                controller:emailController,
                decoration: InputDecoration(
                labelText: 'EMAIL',
                  labelStyle: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                  color: Colors.teal
                  ),
                  focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal)
                  )
                  ),
                  ),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                    labelText: 'PASSWORD',
                    labelStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        color: Colors.teal
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal)
                    )
                ),
              ),
              TextField(
                decoration: InputDecoration(
                    labelText: 'REPEAT PASSWORD',
                    labelStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        color: Colors.teal
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal)
                    ),
                ),
              ),
              SizedBox(height: 40, width: 100),
              Container(
                height: 40,
                width: 100,
                child: Material(
                  borderRadius: BorderRadius.circular(20),
                  shadowColor: Colors.greenAccent,
                  color: Colors.teal,
                  elevation: 7.0,
                  child: GestureDetector(
                    onTap: (){
                      signUpWithEmailPassword();
                    },
                    child: Center(
                      child: Text('sign up', style: TextStyle(color: Colors.white, fontFamily: 'Montserrat'),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    ),
    );

  }
  void signUpWithEmailPassword()
  async {
    FirebaseUser User;
    try{
    User =(await mAuth.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text)) as FirebaseUser;
  }catch(e){
    print(e.toString());
    }
  }

}


