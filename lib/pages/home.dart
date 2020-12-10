import 'package:flutter/material.dart';
import 'package:towdah/pages/LoginForm.dart';
import 'package:towdah/pages/popupmenu.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

//instance variables
final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();


class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Towdah"),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          PopupMenuButton(
            onSelected: choiceAction ,
            itemBuilder: (BuildContext context){
              return Constants.choices.map((String choice){
                return PopupMenuItem<String>(
                  value:choice ,
                  child: Text(choice),
                );

              }).toList();
            },
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0,6,0,0),
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 0,
            mainAxisSpacing: 4,
            children: [

              Column(
                children: [
                  // FlatButton(
                  //   child: ,
                  //   onPressed: (){},
                  // )
                  Expanded(flex: 10, child: Image.asset('assets/Recents.jpg')),
                  Expanded(child: Text('recents')),
                ],
              ),

              InkWell(
                child: Column(
                  children: [
                    // FlatButton(
                    //   child: ,
                    //   onPressed: (){},
                    // )
                    Expanded(flex: 10, child: Image.asset('assets/Favorites.jpg')),
                    Expanded(child: Text('favorites')),
                  ],
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/fav');
                }
              ),

              InkWell(
                child: Column(
                  children: [
                    // FlatButton(
                    //   child: ,
                    //   onPressed: (){},
                    // )
                    Expanded(flex: 10, child: Image.asset('assets/Artists.jpg')),
                    Expanded(child: Text('Artists')),
                  ],
                ),
                onTap: ()
                {
                  Navigator.pushNamed(context, '/artist');
                }
              ),



              Column(
                children: [
                  // FlatButton(
                  //   child: ,
                  //   onPressed: (){},
                  // )
                  Expanded(flex: 10, child: Image.asset('assets/Library.jpg')),
                  Expanded(child: Text('library')),
                ],
              ),

              InkWell(
                child: Column(
                  children: [
                    // FlatButton(
                    //   child: ,
                    //   onPressed: (){},
                    // )
                    Expanded(flex: 10, child: Image.asset('assets/Playlist.jpg')),
                    Expanded(child: Text('playlist')),
                  ],
                ),
                onTap: () {
                  {
                    Navigator.pushNamed(context, '/playlist');
                  }
                },
              ),


              // Image.asset('assets/Artists.jpg'),
              // Image.asset('assets/Library.jpg'),
              // Image.asset('assets/Recents.jpg'),
              // Image.asset('assets/Composer.jpg'),
            ],
          ),
        ),
      ),
    );
    // appBar: AppBar(
    //   title: Text('Towdah'),
    //   centerTitle: false,
    //   actions: [
    //
    //     IconButton(icon: Icon(Icons.search), onPressed: meshy_),
    //     IconButton(icon: Icon(Icons.more_vert),
    //       onPressed: () =>debugPrint('more options coming soon!'),
    //     ),
    //   ],
    //
    // ),
    //
    //
    //
    // body: Container(
    //   alignment: Alignment.center,
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         CustomButton()
    //
    //       ],
    //     ),
    // ),
    // );
  }

    //choose action on the popupmenu
  void choiceAction(String choice) {
    if (choice == Constants.settings){

      }
    if (choice == Constants.sign_out){
      signOutGoogle();
      signOut();
      runApp(
          new MaterialApp(
            home: LoginForm(),
          )

      );

    }
    if (choice == Constants.subscribe){

    }
  }

  // sign out with google
 Future <void> signOutGoogle() async{
   await googleSignIn.signOut();

   print("User Signed Out");
 }
  signOut() async {
    await _auth.signOut();
  }
}
