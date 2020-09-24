import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class ScaffoldExample extends StatelessWidget {
  meshy_(){
    debugPrint("soon you'll be able to search for cool songs");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Towdah'),
        centerTitle: false,
        actions: [

          IconButton(icon: Icon(Icons.search), onPressed: meshy_),
          IconButton(icon: Icon(Icons.more_vert),
            onPressed: () =>debugPrint('more options coming soon!'),
          ),
        ],

      ),



      body: Container(
        alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton()

            ],
          ),
      ),
    );
  }
}



class CustomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final snackBar = SnackBar(content:Text('Where Gospel Breathes'),);
        Scaffold.of(context).showSnackBar(snackBar);
      },

      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
                borderRadius:BorderRadius.circular(8.0)
            ),
        child: Text('Towdah'),
        ),
    );
  }
}


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text('hello Flutter!',
          textDirection: TextDirection.ltr,)
    );
  }
}

