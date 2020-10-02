import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Towdah"),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () => debugPrint('more options coming soon!'),
          ),
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
}
