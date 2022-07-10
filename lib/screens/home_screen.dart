import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

import '../widget/home_screen_widgets.dart';
import 'cart_screen.dart';
import 'menu_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<double> hord = [5, 12, 5];
  List<String> filters = ["Recent", "Popular", "Best", "Top"];
  List<bool> activeFilters = [true, false, false, false];
  late ScrollController listviewController;
  void filterState(int index) {
    setState(() {
      for (int i = 0; i < activeFilters.length; i++) {
        activeFilters[i] = false;
      }
      activeFilters[index] = true;
    });
    var _height = MediaQuery.of(context).size.height;
  }

  @override
  void initState() {
    listviewController = ScrollController(initialScrollOffset: 896 * 0.35);

    super.initState();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color(0xff1F1F1F),
      drawer: Drawer(child: MenuScreen()),
      body: ListView(
        children: [
          SizedBox(
            height: height,
            width: width,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  right: 0,
                  top: 0,
                  child: Image.asset("assets/images/background.png"),
                ),
                Positioned(
                  top: height * 0.12,
                  child: Container(
                      width: width * 0.9,
                      height: height * 0.073,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: const Color(0xff2F3134),
                          width: 2,
                        ),
                        color: const Color(0xff262626),
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search_rounded,
                            color: Color(0xff909090),
                          ),
                          hintText: "Search",
                          contentPadding: EdgeInsets.all(20),
                          disabledBorder: InputBorder.none,
                          hintStyle: TextStyle(
                              fontFamily: 'Barlow',
                              fontWeight: FontWeight.w400,
                              fontSize: width * 0.036,
                              color: Color(0xff909090)),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(width * 0.0121),
                              borderSide: BorderSide.none,
                              gapPadding: 10),
                        ),
                      )),
                ),
                SizedBox(
                  height: height,
                  width: width,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 2),
                        child: Column(
                          children: [
                            SizedBox(
                              height: height * 0.05,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      _scaffoldKey.currentState!.openDrawer();
                                    },
                                    child: SvgPicture.asset(
                                        "assets/images/menu.svg")),
                                GestureDetector(
                                  onTap: (() {
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => CartScreen()),
                                        (route) => true);
                                  }),
                                  child: SvgPicture.asset(
                                      "assets/images/cart.svg"),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: height * 0.03,
                            ),
                            SizedBox(
                              height: height * 0.095,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.27,
                        width: width,
                        child: ListView.builder(
                            itemCount: 3,
                            controller: listviewController,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Hording(
                                    index: index,
                                  ));
                            }),
                      ),
                      Container(
                        height: 10,
                        width: width,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    hord[0] = 12;
                                    hord[1] = 5;
                                    hord[2] = 5;
                                  });
                                  listviewController.animateTo(height * 0.4 * 0,
                                      duration: Duration(milliseconds: 100),
                                      curve: Curves.bounceIn);
                                },
                                child: Container(
                                  width: hord[0],
                                  height: hord[0],
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    hord[1] = 12;
                                    hord[0] = 5;
                                    hord[2] = 5;
                                  });
                                  listviewController.animateTo(
                                      1 * height * 0.38,
                                      duration: Duration(milliseconds: 100),
                                      curve: Curves.bounceIn);
                                },
                                child: Container(
                                  width: hord[1],
                                  height: hord[1],
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    hord[2] = 12;
                                    hord[1] = 5;
                                    hord[0] = 5;
                                  });
                                  listviewController.animateTo(
                                      2 * height * 0.38,
                                      duration: Duration(milliseconds: 100),
                                      curve: Curves.bounceIn);
                                },
                                child: Container(
                                  width: hord[2],
                                  height: hord[2],
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.07,
                        width: width,
                        child: ListView.builder(
                            keyboardDismissBehavior:
                                ScrollViewKeyboardDismissBehavior.onDrag,
                            scrollDirection: Axis.horizontal,
                            itemCount: filters.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      filterState(index);
                                    },
                                    child: Container(
                                      child: Container(
                                        width: width * 0.25,
                                        height: height * 0.065,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          gradient: activeFilters[index]
                                              ? const LinearGradient(
                                                  stops: [0.2, 0.8],
                                                  transform: GradientRotation(
                                                      3.14 / 2),
                                                  begin: Alignment.bottomLeft,
                                                  end: Alignment.topRight,
                                                  colors: [
                                                    Color(0xff61b1cc),
                                                    Color(0xff4c52b0),
                                                  ],
                                                )
                                              : null,
                                          border: !activeFilters[index]
                                              ? Border.all(
                                                  color:
                                                      const Color(0xff2F3134),
                                                  width: 2,
                                                )
                                              : null,
                                          color: !activeFilters[index]
                                              ? const Color(0xff2F3134)
                                              : null,
                                        ),
                                        child: Center(
                                          child: Text(
                                            filters[index],
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontFamily: "Barlow",
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ));
                            }),
                      ),
                      SizedBox(
                        height: height * 0.32,
                        width: width,
                        child: activeFilters[0]
                            ? StreamBuilder<
                                    QuerySnapshot<Map<String, dynamic>>>(
                                stream: FirebaseFirestore.instance
                                    .collection('Products')
                                    .snapshots(),
                                builder: (context, snapShot) {
                                  if (snapShot.hasData) {
                                    final docs = snapShot.data!.docs;

                                    return ListView.builder(
                                        itemCount: docs.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Product(
                                                id: docs[index]['id'],
                                                fairPrice: docs[index]
                                                        ['fairPrice']
                                                    .toString(),
                                                price: docs[index]['price']
                                                    .toString(),
                                                rating: docs[index]['rating']
                                                    .toString(),
                                                image: docs[index]['image'],
                                                name: docs[index]['Name'],
                                              ));
                                        });
                                  } else {
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                })
                            : ListView.builder(
                                itemCount: 2,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Product(
                                        id: "docs[index]['id'],",
                                        fairPrice: "3999",
                                        price: "2599",
                                        rating: "4.5",
                                        image:
                                            "assets/images/product${index + 1}.png",
                                        name: "Boat",
                                      ));
                                }),
                      ),
                      // SizedBox(
                      //   height: height * 0.32,
                      //   width: width,
                      //   child: ListView.builder(
                      //       scrollDirection: Axis.horizontal,
                      //       itemBuilder: (context, index) {
                      //         return Padding(
                      //             padding: const EdgeInsets.all(8.0),
                      //             child: Product(
                      //               image: "assets/images/product2.png",
                      //               name: "Boat Ws54",
                      //             ));
                      //       }),
                      // ),
                      Expanded(
                        child: const Align(
                          alignment: FractionalOffset.bottomCenter,
                          child: BottomNavigation(),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
