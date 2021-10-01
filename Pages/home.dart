import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:tcard/tcard.dart';
import 'package:flutter/gestures.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List img = [
    'https://media.istockphoto.com/photos/self-management-is-a-freelancers-greatest-tool-picture-id1294442411?b=1&k=20&m=1294442411&s=170667a&w=0&h=DzebibUiw8fb056LdMdG5oKURp9LJHfohv_nSG1d764=',
    'https://images.pexels.com/photos/2700587/pexels-photo-2700587.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    'https://gank.io/images/31f92f7845f34f05bc10779a468c3c13',
    'https://images.pexels.com/photos/1777689/pexels-photo-1777689.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    'https://images.pexels.com/photos/1678829/pexels-photo-1678829.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
  ];
  late TCardController _tcard = TCardController();
  var directionSwip, showInswer;
  var value;
  Future refresh() async {
    await Future.delayed(const Duration(seconds: 1));
    _tcard.reset();
  }

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _selectedIndex == 3
            ? PreferredSize(
                preferredSize: const Size.fromHeight(60.0),
                child: Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(top: 0),
                  child: AppBar(
                    title: Row(
                      children: [
                        const Icon(Icons.search, color: Colors.pink),
                        Container(
                            margin: const EdgeInsets.only(left: 10),
                            child: const Text(
                              "Search 0 Matches",
                              style: TextStyle(color: Colors.black54),
                            )),
                      ],
                    ),
                  ),
                ))
            : PreferredSize(
                preferredSize: const Size.fromHeight(60.0),
                child: Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(top: 0),
                  child: AppBar(
                    // backgroundColor: Colors.white,
                    // foregroundColor: Colors.red,
                    // backgroundColor :Colors.white,
                    // elevation: 18,
                    title: Image.asset(
                      "icon/logobar.png",
                      width: 100,
                    ),
                  ),
                )),
        bottomNavigationBar: BottomNavigationBar(
            elevation: 18,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            // currentIndex: selectedIndex,
            // onTap: (index){print("$index");},
            items: [
              BottomNavigationBarItem(
                icon: IconButton(
                  icon: Image.asset(
                    "icon/logo.png",
                    width: 120,
                  ),
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 0;
                      try {
                        _tcard.reset();
                      } catch (e) {
                        print("EROR === $e");
                      }
                    });
                  },
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: IconButton(
                  icon: const Icon(
                    Icons.grid_view,
                    color: Colors.pink,
                    size: 27,
                  ),
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 1;
                    });
                  },
                ),
                label: "Search",
              ),
              BottomNavigationBarItem(
                icon: IconButton(
                  icon: const Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 27,
                  ),
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 2;
                    });
                  },
                ),
                label: "Star",
              ),
              BottomNavigationBarItem(
                icon: IconButton(
                  icon: const Icon(
                    Icons.wysiwyg,
                    color: Colors.pinkAccent,
                    size: 27,
                  ),
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 3;
                    });
                  },
                ),
                label: "Chat",
              ),
              BottomNavigationBarItem(
                icon: IconButton(
                  icon: const Icon(
                    Icons.account_circle,
                    color: Colors.pink,
                    size: 27,
                  ),
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 4;
                    });
                  },
                ),
                label: "Account",
              ),
            ]),
        floatingActionButton: _selectedIndex == 3
            ? FloatingActionButton(
                backgroundColor: Colors.white,
                child: const Icon(
                  Icons.shield,
                  color: Colors.blue,
                ),
                onPressed: () {},
              )
            : null,
        body: _selectedIndex == 0
            ? Center(
                child: RefreshIndicator(
                    onRefresh: refresh,
                    child: CustomScrollView(
                        physics: const BouncingScrollPhysics(),
                        slivers: <Widget>[
                          SliverToBoxAdapter(
                              child: Column(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TCard(
                                controller: _tcard,
                                slideSpeed: 20,
                                delaySlideFor: 500,
                                lockYAxis: false,
                                onBack: (val, __) {
                                  setState(() {
                                    print(
                                        "===========onBack ($val) ($__)============");
                                  });
                                },
                                onForward: (val, __) {
                                  setState(() {
                                    print(
                                        "===========onForward ($val) (${__.direction})============");
                                    directionSwip = __.direction;
                                    if (directionSwip == SwipDirection.Right) {
                                      showInswer = "right";
                                      print("************* $showInswer");
                                    } else {
                                      showInswer = "left";
                                      print("************* $showInswer");
                                    }
                                  });
                                },
                                onEnd: () {
                                  setState(() {
                                    print("===========OnEnd============");
                                  });
                                },
                                size: const Size(double.infinity, 600),
                                cards: List.generate(
                                  img.length,
                                  (int index) {
                                    return Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            img[index],
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        boxShadow: const [
                                          BoxShadow(
                                            offset: Offset(0, 17),
                                            blurRadius: 23.0,
                                            spreadRadius: -13.0,
                                            color: Colors.black54,
                                          )
                                        ],
                                      ),
                                      child: Stack(
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.all(10),
                                            alignment: Alignment.bottomCenter,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                CircleAvatar(
                                                  radius: 25,
                                                  backgroundColor:
                                                      Colors.orange.shade100,
                                                  child: CircleAvatar(
                                                      backgroundColor:
                                                          Colors.orange,
                                                      radius: 20,
                                                      child: IconButton(
                                                        iconSize: 20,
                                                        icon: const Icon(
                                                            Icons.replay),
                                                        onPressed: () async {
                                                          setState(() {
                                                            value = 1;
                                                          });
                                                          // await Future.delayed(const Duration(seconds: 1));
                                                          try {
                                                            _tcard.back();
                                                          } catch (e) {
                                                            print(
                                                                "EROR $e ======");
                                                          }
                                                        },
                                                      )),
                                                ),
                                                CircleAvatar(
                                                  radius: 35,
                                                  backgroundColor:
                                                      Colors.red.shade100,
                                                  child: CircleAvatar(
                                                      backgroundColor:
                                                          Colors.red,
                                                      radius: 30,
                                                      child: IconButton(
                                                        iconSize: 34,
                                                        icon: const Icon(
                                                            Icons.close),
                                                        onPressed: () async {
                                                          setState(() {
                                                            value = 0;
                                                          });
                                                          // await Future.delayed(const Duration(seconds: 1));
                                                          try {
                                                            _tcard.forward(
                                                                direction:
                                                                    SwipDirection
                                                                        .Left);
                                                          } catch (e) {
                                                            print(
                                                                "EROR $e ======");
                                                          }
                                                        },
                                                      )),
                                                ),
                                                CircleAvatar(
                                                  radius: 25,
                                                  backgroundColor:
                                                      Colors.blue.shade100,
                                                  child: CircleAvatar(
                                                      backgroundColor:
                                                          Colors.blueAccent,
                                                      radius: 20,
                                                      child: IconButton(
                                                        iconSize: 20,
                                                        icon: const Icon(
                                                            Icons.star),
                                                        onPressed: () async {
                                                          setState(() {
                                                            value = 1;
                                                          });
                                                          // await Future.delayed(const Duration(seconds: 1));
                                                          try {
                                                            _tcard.forward(
                                                                direction:
                                                                    SwipDirection
                                                                        .Right);
                                                          } catch (e) {
                                                            print(
                                                                "EROR $e ======");
                                                          }
                                                        },
                                                      )),
                                                ),
                                                CircleAvatar(
                                                  radius: 35,
                                                  backgroundColor:
                                                      Colors.greenAccent,
                                                  child: CircleAvatar(
                                                      backgroundColor:
                                                          Colors.green,
                                                      radius: 30,
                                                      child: IconButton(
                                                        iconSize: 34,
                                                        icon: const Icon(
                                                            Icons.favorite),
                                                        onPressed: () async {
                                                          setState(() {
                                                            value = 1;
                                                          });
                                                          // await Future.delayed(const Duration(seconds: 1));
                                                          try {
                                                            _tcard.forward(
                                                                direction:
                                                                    SwipDirection
                                                                        .Right);
                                                          } catch (e) {
                                                            print(
                                                                "EROR $e ======");
                                                          }
                                                        },
                                                      )),
                                                ),
                                                CircleAvatar(
                                                  radius: 25,
                                                  backgroundColor:
                                                      Colors.purple.shade100,
                                                  child: CircleAvatar(
                                                      backgroundColor:
                                                          Colors.purple,
                                                      radius: 20,
                                                      child: IconButton(
                                                        iconSize: 20,
                                                        icon: const Icon(
                                                            Icons.bolt),
                                                        onPressed: () async {
                                                          setState(() {
                                                            value = 0;
                                                          });
                                                          // await Future.delayed(const Duration(seconds: 1));
                                                          try {
                                                            _tcard.forward(
                                                                direction:
                                                                    SwipDirection
                                                                        .Right);
                                                          } catch (e) {
                                                            print(
                                                                "EROR $e ======");
                                                          }
                                                        },
                                                      )),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ))
                        ])),
              )
            : _selectedIndex == 1
                ? Center(
                    child: CustomScrollView(
                        physics: const BouncingScrollPhysics(),
                        slivers: <Widget>[
                        SliverToBoxAdapter(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)),
                                    color: Color(0xfff8019a)),
                                width: double.infinity,
                                height: 250,
                                margin: const EdgeInsets.all(15),
                                child: Stack(
                                  alignment: Alignment.centerRight,
                                  children: [
                                    Image.asset(
                                      "icon/searchTinder.jpg",
                                      fit: BoxFit.fill,
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          bottom: 80, right: 150),
                                      child: const Text(
                                        "Photo Verified",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 32,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          top: 140, right: 125),
                                      child: const Text(
                                        "Get Verified On Tinder ",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          top: 190, right: 230),
                                      child: const Text(
                                        "Photo Verified",
                                        style: TextStyle(
                                          color: Color(0xFF858484),
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                    Container(
                                        margin: const EdgeInsets.only(
                                            top: 190, right: 10),
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(18.0),
                                            ),
                                            primary: Colors.white, // background
                                            onPrimary:
                                                Colors.white, // foreground
                                          ),
                                          onPressed: () {},
                                          child: const Text(
                                            'TRY NOW',
                                            style: TextStyle(
                                              color: Color(0xFF000000),
                                            ),
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                              Container(
                                  margin: const EdgeInsets.only(left: 15),
                                  child: const Text(
                                    "For you",
                                    style: TextStyle(
                                        fontSize: 25, color: Colors.black),
                                  )),
                              Row(
                                children: [
                                  Expanded(
                                      child: Container(
                                    // alignment: Alignment.center,
                                    margin: const EdgeInsets.all(8),
                                    height: 300,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                          "icon/gamers.jpeg",
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(12)),
                                    ),
                                    child: Stack(
                                      children: [
                                        Container(
                                            margin: const EdgeInsets.only(
                                                top: 120, left: 45, right: 0),
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          18.0),
                                                ),
                                                primary:
                                                    Colors.white, // background
                                                onPrimary:
                                                    Colors.white, // foreground
                                              ),
                                              onPressed: () {},
                                              child: const Text(
                                                'Gamers',
                                                style: TextStyle(
                                                  color: Color(0xFF000000),
                                                ),
                                              ),
                                            )),
                                        Container(
                                          margin: const EdgeInsets.only(
                                              top: 220, left: 10),
                                          child: const Text(
                                            "Find Your Perfect Match",
                                            style: TextStyle(
                                              color: Color(0xFFFFFFFF),
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(
                                              top: 270, left: 10),
                                          child: const Text(
                                            "Passions",
                                            style: TextStyle(
                                              color: Color(0xFFA1A1A1),
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                                  Expanded(
                                      child: Container(
                                    // alignment: Alignment.center,
                                    margin: const EdgeInsets.all(8),
                                    height: 300,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                          "icon/gamers.jpeg",
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(12)),
                                    ),
                                    child: Stack(
                                      children: [
                                        Container(
                                            margin: const EdgeInsets.only(
                                                top: 120, left: 45, right: 0),
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          18.0),
                                                ),
                                                primary:
                                                    Colors.white, // background
                                                onPrimary:
                                                    Colors.white, // foreground
                                              ),
                                              onPressed: () {},
                                              child: const Text(
                                                'Gamers',
                                                style: TextStyle(
                                                  color: Color(0xFF000000),
                                                ),
                                              ),
                                            )),
                                        Container(
                                          margin: const EdgeInsets.only(
                                              top: 220, left: 10),
                                          child: const Text(
                                            "Find Your Perfect Match",
                                            style: TextStyle(
                                              color: Color(0xFFFFFFFF),
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(
                                              top: 270, left: 10),
                                          child: const Text(
                                            "Passions",
                                            style: TextStyle(
                                              color: Color(0xFFA1A1A1),
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      child: Container(
                                    // alignment: Alignment.center,
                                    margin: const EdgeInsets.all(8),
                                    height: 300,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                          "icon/gamers.jpeg",
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(12)),
                                    ),
                                    child: Stack(
                                      children: [
                                        Container(
                                            margin: const EdgeInsets.only(
                                                top: 120, left: 45, right: 0),
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          18.0),
                                                ),
                                                primary:
                                                    Colors.white, // background
                                                onPrimary:
                                                    Colors.white, // foreground
                                              ),
                                              onPressed: () {},
                                              child: const Text(
                                                'Gamers',
                                                style: TextStyle(
                                                  color: Color(0xFF000000),
                                                ),
                                              ),
                                            )),
                                        Container(
                                          margin: const EdgeInsets.only(
                                              top: 220, left: 10),
                                          child: const Text(
                                            "Find Your Perfect Match",
                                            style: TextStyle(
                                              color: Color(0xFFFFFFFF),
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(
                                              top: 270, left: 10),
                                          child: const Text(
                                            "Passions",
                                            style: TextStyle(
                                              color: Color(0xFFA1A1A1),
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                                  Expanded(
                                      child: Container(
                                    // alignment: Alignment.center,
                                    margin: const EdgeInsets.all(8),
                                    height: 300,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                          "icon/gamers.jpeg",
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(12)),
                                    ),
                                    child: Stack(
                                      children: [
                                        Container(
                                            margin: const EdgeInsets.only(
                                                top: 120, left: 45, right: 0),
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          18.0),
                                                ),
                                                primary:
                                                    Colors.white, // background
                                                onPrimary:
                                                    Colors.white, // foreground
                                              ),
                                              onPressed: () {},
                                              child: const Text(
                                                'Gamers',
                                                style: TextStyle(
                                                  color: Color(0xFF000000),
                                                ),
                                              ),
                                            )),
                                        Container(
                                          margin: const EdgeInsets.only(
                                              top: 220, left: 10),
                                          child: const Text(
                                            "Find Your Perfect Match",
                                            style: TextStyle(
                                              color: Color(0xFFFFFFFF),
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(
                                              top: 270, left: 10),
                                          child: const Text(
                                            "Passions",
                                            style: TextStyle(
                                              color: Color(0xFFA1A1A1),
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                                ],
                              ),
                            ],
                          ),
                        )
                      ]))
                : _selectedIndex == 2
                    ? SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              alignment: Alignment.center,
                              margin: const EdgeInsets.all(30),
                              child: const Text(
                                "Upgrade To Gold To See People Who have already liked you.",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      "icon/recently.png",
                                    ),
                                    fit: BoxFit.fill,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)),
                                  color: Color(0xfff8019a)),
                              width: 200,
                              height: 300,
                              margin: const EdgeInsets.all(15),
                              child: null,
                            ),
                            Container(
                                width: double.infinity,
                                alignment: Alignment.center,
                                margin: const EdgeInsets.only(top: 70),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 10),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40.0),
                                    ),
                                    primary:
                                        Colors.amber.shade800, // background
                                    onPrimary: Colors.amber, // foreground
                                  ),
                                  onPressed: () {},
                                  child: const Text(
                                    'SEE WHO Likes YOU',
                                    style: TextStyle(
                                      fontSize: 26,
                                      color: Color(0xFFFFFFFF),
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      )
                    : _selectedIndex == 3
                        ? SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                          "icon/playhot.png",
                                        ),
                                        fit: BoxFit.fill,
                                      ),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(12)),
                                      color: Color(0xfff8019a)),
                                  width: double.infinity,
                                  height: 170,
                                  margin: const EdgeInsets.all(15),
                                  child: null,
                                ),
                                Container(
                                    margin: const EdgeInsets.only(left: 18),
                                    child: const Text(
                                      "New Matches",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25,
                                          color: Colors.pinkAccent),
                                    )),
                                Row(
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                  "icon/recently.png",
                                                ),
                                                fit: BoxFit.fill,
                                              ),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(12)),
                                              color: Color(0xfff8019a)),
                                          width: 120,
                                          height: 170,
                                          margin: const EdgeInsets.all(15),
                                          child: null,
                                        ),
                                        const Text(
                                          "Likes",
                                          style: TextStyle(
                                            fontSize: 18,
                                          ),
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                  "icon/covid.png",
                                                ),
                                                fit: BoxFit.fill,
                                              ),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(12)),
                                              color: Color(0xfff8019a)),
                                          width: 120,
                                          height: 170,
                                          margin: const EdgeInsets.all(15),
                                          child: null,
                                        ),
                                        const Text(
                                          "Vaccine",
                                          style: TextStyle(
                                            fontSize: 18,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                Container(
                                    margin: const EdgeInsets.only(left: 18),
                                    child: const Text(
                                      "Messages ❶",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25,
                                          color: Colors.pinkAccent),
                                    )),
                                const SizedBox(
                                  height: 20,
                                ),
                                ListTile(
                                  leading: Image.asset("icon/logo.png"),
                                  title: Row(
                                    children: const [
                                      Text(
                                        "Team Tinder ",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22,
                                        ),
                                      ),
                                      Icon(
                                        Icons.verified,
                                        color: Colors.pink,
                                      )
                                    ],
                                  ),
                                  subtitle: const Text(
                                      "Thank you for being a  Tinder mem..."),
                                )
                              ],
                            ),
                          )
                        : _selectedIndex == 4
                            ? SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(top: 10),
                                        child: const CircleAvatar(
                                          radius: 55,
                                          backgroundImage:
                                              AssetImage("icon/avatar.jpg"),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 10),
                                        width: double.infinity,
                                        alignment: Alignment.center,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              child: const Text("Winter ,19",
                                                  style: TextStyle(
                                                      fontSize: 22,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black)),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const Icon(Icons.verified_outlined)
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Column(
                                            children: [
                                              CircleAvatar(
                                                backgroundColor:
                                                    const Color(0xFFD1D1D1),
                                                radius: 25,
                                                child: IconButton(
                                                    onPressed: () {},
                                                    icon: const Icon(
                                                        Icons.settings,
                                                        color: Colors.white)),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              const Text("SETTINGS"),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              const SizedBox(
                                                height: 40,
                                              ),
                                              CircleAvatar(
                                                backgroundColor: Colors.pink,
                                                radius: 35,
                                                child: IconButton(
                                                    onPressed: () {},
                                                    icon: const Icon(
                                                      Icons.photo_camera,
                                                      color: Colors.white,
                                                      size: 30,
                                                    )),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              const Text("ADD MEDIA"),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              CircleAvatar(
                                                backgroundColor:
                                                    const Color(0xFFD1D1D1),
                                                radius: 25,
                                                child: IconButton(
                                                    onPressed: () {},
                                                    icon: const Icon(
                                                        Icons.shield,
                                                        color: Colors.white)),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              const Text("SAFETY"),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 20),
                                      Container(
                                          width: double.infinity,
                                          height: 250,
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(120),
                                                topRight: Radius.circular(120)),
                                            color: Color(0xFFDDDDDD),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              const SizedBox(
                                                height: 40,
                                              ),
                                              Container(
                                                padding: const EdgeInsets.only(
                                                    left: 90),
                                                // color: Colors.red,
                                                alignment: Alignment.center,
                                                width: double.infinity,
                                                child: ListTile(
                                                  title: const Text(
                                                      "Get Tinder Gold™"),
                                                  leading: Image.asset(
                                                    "icon/goldlogo.png",
                                                    width: 40,
                                                  ),
                                                ),
                                              ),
                                              const Text(
                                                  "See Who Like You & more !"),
                                              Container(
                                                  width: double.infinity,
                                                  alignment: Alignment.center,
                                                  margin: const EdgeInsets.only(
                                                      top: 70),
                                                  child: ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 30,
                                                          vertical: 10),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(40.0),
                                                      ),
                                                      primary: Colors
                                                          .white, // background
                                                      onPrimary: Colors
                                                          .white, // foreground
                                                    ),
                                                    onPressed: () {},
                                                    child: const Text(
                                                      'Get Tinder Gold™',
                                                      style: TextStyle(
                                                        fontSize: 26,
                                                        color:
                                                            Color(0xFFFFAE00),
                                                      ),
                                                    ),
                                                  )),
                                            ],
                                          ))
                                    ],
                                  ),
                                ),
                              )
                            : null);
  }
}
