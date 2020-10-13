import 'package:flutter/material.dart';
import 'package:towdah/pages/Registration.dart';
import 'package:towdah/pages/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();
class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm>{
TextEditingController _passwordTextController = new TextEditingController();
  final Map< String  , dynamic> _formData = {
    'email': null,
    'phoneNumber': null,
    'password': null,
    'acceptTerms': false
  };
  final _formKey = GlobalKey <FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
//       decoration: BoxDecoration(
//         image: DecorationImage(
//           image: AssetImage("assets/Artists.jpg"),
//           fit: BoxFit.cover,
//         ),
//       ),
      body:SingleChildScrollView(


      child:Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        

         decoration: BoxDecoration(
           image: DecorationImage(
             image: AssetImage("assets/Artists.jpg"),
             fit: BoxFit.contain,

           ),
         ),
       

          child: Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
            child: Stack(
              children: [

             Form(

               key: _formKey,
               child:Container (
                  child: Column(

                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:<Widget>[
                      Center(
                        child: Image.asset('assets/face.png',
                        width:70,
                          height:70,
                          color:Colors.white,

                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text('Towdah',
                            style: TextStyle(color: Colors.teal,
                              letterSpacing: 10,
                              fontFamily: 'Caveat',
                              fontWeight: FontWeight.bold,
                                fontSize: 50
                        ),
                       ),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'E-Mail', filled: true,),
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
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Password', filled: true),
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
                      FlatButton(onPressed:(){
                        print("you pressed this button");
                        if(_formKey.currentState.validate()){
                          _formKey.currentState.save();
                          validateAndSubmit();
                          Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => Home()));
                        }
                      },
                          color: Colors.teal,
                          textColor: Colors.grey[700],
                          child: Text('Login'),
                          shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                          Radius.circular(20)))

                      ),

                      //other signing in options
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
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
                          Container(
                            padding: EdgeInsets.only(top: 15, left: 20),
                            child: InkWell(

                              child: Text('sing in with google',
                                style: TextStyle(
                                    color: Colors.teal,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat',
                                    decoration: TextDecoration.underline
                                ),
                              ),
                              onTap:(){
                                signInWithGoogle().then((result) {
                                  if (result != null) {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => Home()));
                                  }
                                });
                              },
                            ),
                          ),
                        ],
                      ),

                      //go to create account
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

                    ]
                  ),
               ),
             )
              ]
            ),
          ),

             ),
      ),
    );
          }
             //user signing in
          Future validateAndSubmit()async {
            FirebaseUser user =await _auth.signInWithEmailAndPassword(email:  _formData["email"].trim(), password:_formData["password"].trim()  )
                .then((user) {
              print("your in already ${user.credential}");
              //print("Email:${user}")
            });
          }

          // google signing in
          Future<String> signInWithGoogle()async {

            await Firebase.initializeApp();

            final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
            final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

            final AuthCredential credential = GoogleAuthProvider.credential(
              accessToken: googleSignInAuthentication.accessToken,
              idToken: googleSignInAuthentication.idToken,
            );

            final UserCredential authResult = await _auth.signInWithCredential(credential);
            final User user = authResult.user;

            if (user != null) {
              assert(!user.isAnonymous);
              assert(await user.getIdToken() != null);

              final User currentUser = _auth.currentUser;
              assert(user.uid == currentUser.uid);

              print('signInWithGoogle succeeded: $user');

              return '$user';
            }

              return null;
            }

        }
