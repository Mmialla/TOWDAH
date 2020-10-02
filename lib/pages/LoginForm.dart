import 'package:flutter/material.dart';
import 'package:towdah/pages/Registration.dart';


class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginData {
  String name = "";
  String password = "";

}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey <FormState>();
  _LoginData _data = new _LoginData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
          children: [
            Form(
              key: _formKey,
              child: Container(
                width: 700,
                height: 500,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text('Towdah',
                        style: TextStyle(color: Colors.teal,
                            letterSpacing: 10,
                            fontFamily: 'Caveat',
                            fontWeight: FontWeight.bold,

                            fontSize: 50),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                            labelText: "Name",
                            border: OutlineInputBorder(
                                gapPadding: 3.3,
                                borderRadius: BorderRadius.circular(3.3)
                            )
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter name';
                          } else {
                            //show something
                            _data.name = value;
                            return "Data: ${_data.name}";
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Password",
                          border: OutlineInputBorder(
                              gapPadding: 3.3,
                              borderRadius: BorderRadius.circular(3.3)
                          ),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter password';
                          } else {
                            //show something
                            return 'Password entered';
                          }
                        },
                      ),
                    ),

                    Container(
                        child: RaisedButton(onPressed: () {
                          if (_formKey.currentState.validate()) {
                            Navigator.pushNamed(context, '/home');
                            setState(() {
                              _data.name = _data.name;
                            });
                            Scaffold.of(context)
                                .showSnackBar(
                                SnackBar(content: Text("All is good")));
                          }
                        },
                            color: Colors.teal,
                            textColor: Colors.grey[700],
                            child: Text('Login'),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(20))))

                    ),
                    SizedBox(height: 5.0,),
                    Container(
                      padding: EdgeInsets.only(top: 15, left: 20),
                      child: InkWell(

                        child: Text('Forgot Password',
                          style: TextStyle(
                              color: Colors.teal,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                              decoration: TextDecoration.underline
                          ),),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Center(
                          child: Text('New to Towdah?',
                            style: TextStyle(fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold),),
                        ),
                        SizedBox(width: 5),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => RegisterPage()));
                          },

                          child: Text('Sign Up!',
                            style: TextStyle(
                                color: Colors.teal,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline
                            ),),
                        )

                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.3),
                      child: Center(

                          child: _data.name.isEmpty ? Text('') : Text(
                              "welcome ${_data.name} ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 19.0,
                              )
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ]
      ),
    );
  }
}
