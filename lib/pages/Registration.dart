import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:firebase_database/firebase_database.dart";
import 'package:google_sign_in/google_sign_in.dart';
final FirebaseAuth _auth = FirebaseAuth.instance;
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
      backgroundColor: Colors.blueGrey,
      body: Container(
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage("assets/Artists"),
        //     fit: BoxFit.cover,
        //   ),
        // ),
        child:ListView(
        children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Container(
          //   color : Colors.grey[300],
          //   child: Stack(
          //     children: <Widget>[
          //       Center(
          //         child: Container(
          //           child: Text('Sign Up!',style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.teal),),
          //           color: Colors.blueGrey,
          //         ),
          //       )
          //     ],
          //   ),
          // ),
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
                FlatButton( 
                  color:Colors.purple,
                  child:Text("create Account"),
                  onPressed:()=> _createUser(),
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
                    child: FlatButton(
                      onPressed: (){
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
      )
  ],
      ),
      )
    );

  }

  Future signUpWithEmailPassword() async{
    FirebaseUser user =await _auth.createUserWithEmailAndPassword(email: '${emailController}', password: '${passwordController}')
        .then((user) {
          print("User Created ${user.credential}");
          //print("Email:${user}")
    });
}

 Future _createUser() async{
    FirebaseUser user = await _auth.createUserWithEmailAndPassword(email: "paulJames@gmal.com", password:"test1235")
        .then((user){
          print("user created");
    }
    );

 }
  //   FirebaseUser user = await _auth.createUserWithEmailAndPassword(
  //     email:"jonathan@gmail.com",password:"salome");
  //   .then((user)){
  //     print("user created ${user.displayname }");
  //   };
  // }

}


