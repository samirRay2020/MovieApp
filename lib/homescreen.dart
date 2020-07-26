import 'package:flutter/material.dart';
import 'components/moviestate.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  int tabPageindex = 0;
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(vsync: this, length: 4);
    _controller.addListener(() {
      setState(() {
        tabPageindex = _controller.index;
      });
    });
  }
  // @override
  // void initState() {

  //   super.initState();
  //    child:Builder(
  //       builder:(BuildContext context){
  //         final TabController tabController = DefaultTabController.of(context);
  //         tabController.addListener(() {
  //           if(!tabController.indexIsChanging){
  //             tabPageindex = tabController.index;
  //           }
  //         });

  //       }));
  // }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Center(child: Image.asset('assets/icons/appname.png')),
        // leading: IconButton(
        //     padding: EdgeInsets.all(kDefaultPadding),
        //     icon: SvgPicture.asset('assets/icons/menu.svg'),
        //     onPressed: () {
        //       Scaffold.of(context).openDrawer();
        //     }),
        // actions: <Widget>[
        //   IconButton(
        //       padding: EdgeInsets.all(kDefaultPadding),
        //       icon: SvgPicture.asset('assets/icons/search.svg'),
        //       onPressed: () {})
        // ],
        bottom: TabBar(
            unselectedLabelColor: Colors.redAccent,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.redAccent, Colors.orangeAccent],
              ),
              borderRadius: BorderRadius.circular(50.0),
            ),
            controller: _controller,
            isScrollable: true,
            tabs: [
              Tab(
                child: Text(
                  'Gun Cinema',
                  style: TextStyle(
                      color:
                          tabPageindex == 0 ? Colors.black : Colors.grey[800],
                      fontSize: tabPageindex == 0 ? 20 : 17,
                      fontWeight: tabPageindex == 0
                          ? FontWeight.bold
                          : FontWeight.normal,
                      fontFamily: 'Fondamento'),
                ),
              ),
              Tab(
                child: Text(
                  'Gopi Krishna',
                  style: TextStyle(
                      color:
                          tabPageindex == 1 ? Colors.black : Colors.grey[800],
                      fontSize: tabPageindex == 1 ? 20 : 17,
                      fontFamily: 'Fondamento',
                      fontWeight: tabPageindex == 1
                          ? FontWeight.bold
                          : FontWeight.normal),
                ),
              ),
              Tab(
                child: Text(
                  'Qfx',
                  style: TextStyle(
                    color: tabPageindex == 2 ? Colors.black : Colors.grey[800],
                    fontSize: tabPageindex == 2 ? 20 : 17,
                    fontFamily: 'Fondamento',
                    fontWeight:
                        tabPageindex == 2 ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Big Movies',
                  style: TextStyle(
                    color: tabPageindex == 3 ? Colors.black : Colors.grey[800],
                    fontSize: tabPageindex == 3 ? 20 : 17,
                    fontFamily: 'Fondamento',
                    fontWeight:
                        tabPageindex == 3 ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ),
            ]),
      ),
      body: TabBarView(
        controller: _controller,
        children: <Widget>[
          Body(
            indexTab: 'guncinema',
          ),
          Body(
            indexTab: 'gopi Krishna',
          ),
          Body(
            indexTab: 'qfx',
          ),
          Body(
            indexTab: 'bigmovies',
          ),
          // Text('hello'),
          // Text('hello'),
          // Text('hello'),
          // Text('hello'),
        ],
      ),
    );
  }
}
