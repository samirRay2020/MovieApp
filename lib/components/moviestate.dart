import 'package:flutter/material.dart';
import 'moviescounter.dart';
import 'component_list.dart';

class Body extends StatefulWidget {
  final String indexTab;
  Body({this.indexTab});
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int isPassing = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ComponentList((value) {
            setState(() {
              isPassing = value;
            });
          }),
          SizedBox(
            height: 25,
          ),
          MoviesCounter(
            theatreName: widget.indexTab,
            isIndexCheck: isPassing,
            commonHallName: isPassing == 0 ? 'released' : 'commingsoon',
            lengthOfItems: isPassing == 0 ? 5 : 3,
          ),
        ],
      ),
    );
  }
}

// String checkForHallName(isPassing) {
//   if (isPassing == 0)
//     return ('guncinema');
//   else {
//     if (isPassing == 1)
//       return ('gopi Krishna');
//     else {
//       if (isPassing == 2)
//         return ('qfx');
//       else
//         return ('bigmovies');
//     }
//   }
// }
