import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => new _RegisterPageState();
}
final _formKey = GlobalKey<FormState>();

class _RegisterPageState extends State<RegisterPage>{
  TextEditingController _passwordTextController = new TextEditingController();
  final Map< String  , dynamic> _formData = {
    'email': null,
    'phoneNumber': null,
    'password': null,
    'acceptTerms': false
  };
  @override

  Widget build(BuildContext context) {
    return new Scaffold(
      //resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.blueGrey,
      body: Form(
        key: _formKey,
        child:ListView(
        children: [
          Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

            Container(
            padding: EdgeInsets.only(top: 10, left: 20, right: 20),
              child: Column(
              children: <Widget>[

                TextFormField(
                      decoration: InputDecoration(
                          labelText: 'E-Mail', filled: true, fillColor: Colors.white),
                keyboardType: TextInputType.emailAddress,
                validator: (String value) {
                  //begins********************
                  if (value.isEmpty ||
                      !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                          .hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                }, //ends******************
                onSaved: (String value) {
                  _formData['email'] = value;
                },
                ),
                SizedBox(height: 40,width:100 ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Password', filled: true, fillColor: Colors.white),
                  obscureText: true,
                  controller: _passwordTextController,
                  validator: (String value) {
                    //begins**********
                    if (value.isEmpty || value.length < 6) {
                      return 'Password invalid,should have more than 6 characters';
                    }
                    return null;
                  }, //end********************
                  onSaved: (String value) {
                    _formData['password'] = value;
                  },
                ),
                 SizedBox(height:40 , width:100),
                 TextFormField(
                  decoration: InputDecoration(
                      labelText: 'confirm Password', filled: true, fillColor: Colors.white),
                  obscureText: true,
                  validator: (String value) {
                    //begins
                    if (_passwordTextController.text != value) {
                      return 'Passwords do not match!';
                    }
                    return null;
                  }, //ends...
                ),


                 Container(
                   height: 40,
                   width: 100,
                   child: Material(
                     borderRadius: BorderRadius.circular(20),
                     shadowColor: Colors.greenAccent,
                     color: Colors.teal,
                     elevation: 7.0,
                    child: FlatButton(
                      color:Colors.teal,
                      child:Text("create Account"),
                      onPressed:(){
                        if( _formKey.currentState.validate()){
                          _formKey.currentState.save();
                          _createUser();
                          signInWithEmailPassword();
                        }
                      },
                    ),
                ),
                 ),
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

  Future signInWithEmailPassword() async{
    FirebaseUser user =await _auth.signInWithEmailAndPassword(email:  _formData["email"].trim(), password:_formData["password"].trim()  )
        .then((user) {
          print("your in already ${user.credential}");
          //print("Email:${user}")
    });
}

   Future _createUser() async{
    print("jonathan ${_formData["email"]}");
    FirebaseUser user = await _auth.createUserWithEmailAndPassword(email:  _formData["email"].trim() , password:_formData["password"].trim() )
        .then((user){
          print("user created");
    }
    );

 }

}


