import 'package:flutter/material.dart';

class Artist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Artists",
          style: TextStyle(
              fontFamily: "DancingScript-Bold.ttf"),
        ),
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
          padding: const EdgeInsets.fromLTRB(0,7,0,0),
          child: GridView.count(
            crossAxisCount: 3,
            crossAxisSpacing: 0,
            mainAxisSpacing: 3,
            children: [


              InkWell(
                  child: Column(
                    children: [
                      // FlatButton(
                      //   child: ,
                      //   onPressed: (){},
                      // )
                      Expanded(flex: 6, child: Image.asset('assets/Artists.jpg')),
                      Expanded(child: Text('artist 01')),
                    ],
                  ),
                  onTap: ()
                  {
                    Navigator.pushNamed(context, '/artist01');
                  }
              ),

              Column(
                children: [
                  // FlatButton(
                  //   child: ,
                  //   onPressed: (){},
                  // )
                  Expanded(flex: 6, child: Image.asset('assets/Artists.jpg')),
                  Expanded(child: Text('artist 02')),
                ],
              ),

              Column(
                children: [
                  // FlatButton(
                  //   child: ,
                  //   onPressed: (){},
                  // )
                  Expanded(flex: 6, child: Image.asset('assets/Artists.jpg')),
                  Expanded(child: Text('artist 03')),
                ],
              ),

              InkWell(
                child: Column(
                  children: [
                    // FlatButton(
                    //   child: ,
                    //   onPressed: (){},
                    // )
                    Expanded(flex: 6, child: Image.asset('assets/Artists.jpg')),
                    Expanded(child: Text('artist 04')),
                  ],
                ),
                // onTap: () {
                //   {
                //     Navigator.pushNamed(context, '/playlist');
                //   }
                // },
              ),

              Column(
                children: [
                  // FlatButton(
                  //   child: ,
                  //   onPressed: (){},
                  // )
                  Expanded(flex: 6, child: Image.asset('assets/Artists.jpg')),
                  Expanded(child: Text('artist 05')),
                ],
              ),

              InkWell(
                child: Column(
                  children: [
                    // FlatButton(
                    //   child: ,
                    //   onPressed: (){},
                    // )
                    Expanded(flex: 6, child: Image.asset('assets/Artists.jpg')),
                    Expanded(child: Text('artist 06')),
                  ],
                ),
                // onTap: () {
                //   Navigator.pushNamed(context, '/fav');
                // }
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
