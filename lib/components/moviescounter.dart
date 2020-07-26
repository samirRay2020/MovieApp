import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:movieapp/components/extra_url.dart';
import 'package:movieapp/constants.dart';
import 'package:movieapp/details/details_top.dart';

class MoviesCounter extends StatefulWidget {
  final int isIndexCheck;
  final commonHallName;
  final int lengthOfItems;
  final String theatreName;
  MoviesCounter(
      {this.isIndexCheck,
      this.commonHallName,
      this.lengthOfItems,
      this.theatreName});
  @override
  _MoviesCounterState createState() => _MoviesCounterState();
}

class _MoviesCounterState extends State<MoviesCounter> {
  PageController _pageController;

  var mydata;
  int initialpage = 0;

  @override
  void initState() {
    super.initState();

    DatabaseReference ref =
        FirebaseDatabase.instance.reference().child(widget.theatreName);

    ref.once().then((DataSnapshot snapshot) {
      if (this.mounted) {
        setState(() {
          mydata = snapshot.value;
        });
      }
    });

    _pageController = PageController(
      viewportFraction: 0.75,
      initialPage: initialpage,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
        child: mydata != null
            ? AspectRatio(
                aspectRatio: 0.85,
                child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      initialpage = value;
                    });
                  },
                  controller: _pageController,
                  itemCount: widget.lengthOfItems,
                  itemBuilder: (context, index) => MyCard(
                    movieUrl: mydata[0][widget.commonHallName][0][index + 1],
                    movienames: mydata[0][widget.commonHallName][1][index + 1],
                    mydata: mydata,
                    pageIndex: initialpage,
                    isIndexChecks: widget.isIndexCheck,
                    cinemaName: widget.theatreName,
                    hallName: widget.commonHallName,
                  ),
                ),
              )
            : SpinKitCircle(
                color: Colors.blue,
                size: 35.0,
              ));
  }
}

class MyCard extends StatelessWidget {
  final String movieUrl;
  final String movienames;
  final mydata;
  final int pageIndex;
  final isIndexChecks;
  final cinemaName;
  final hallName;
  MyCard(
      {this.movieUrl,
      this.movienames,
      this.mydata,
      this.pageIndex,
      this.isIndexChecks,
      this.cinemaName,
      this.hallName});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (hallName == 'released') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => movieUrl !=
                      'https://upload.wikimedia.org/wikipedia/commons/6/64/Poster_not_available.jpg'
                  ? DetailsList(
                      mydata: mydata,
                      cinemaName: cinemaName,
                      pageIndex: pageIndex,
                      isValueCheck: isIndexChecks == 0
                          ? 'detailsreleased'
                          : 'detailscommingsoon',
                    )
                  : ExtraUrl(),
            ),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ExtraUrl()),
          );
        }
      },
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: kDefaultPadding + 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50.0),
                child: Image.network(
                  movieUrl,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              movienames,
              style: Theme.of(context).textTheme.headline5.copyWith(
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
