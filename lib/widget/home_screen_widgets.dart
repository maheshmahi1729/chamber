import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:seo/screens/fav_screen.dart';
import 'package:seo/screens/product_screen.dart';

class Hording extends StatefulWidget {
  Hording({Key? key, required this.index}) : super(key: key);
  int index;

  @override
  State<Hording> createState() => _HordingState();
}

class _HordingState extends State<Hording> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.26,
      width: width * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          stops: [0.2, 0.8],
          transform: GradientRotation(3.14 / 2),
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            Color(0xff61b1cc),
            Color(0xff4c52b0),
          ],
        ),
      ),
      child: Stack(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Positioned(
            left: 20,
            top: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 152,
                  child: Text(
                    "50% Off\ on electronics",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  width: 90,
                  height: 32,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.only(
                    top: 3,
                    bottom: 5,
                  ),
                  child: Center(
                    child: Text(
                      "Explore Now",
                      style: TextStyle(
                        color: const Color(0xff5c9ac5),
                        fontSize: width * 0.03,
                        fontFamily: "Barlow",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 2,
            top: 0,
            child: SizedBox(
              width: width * 0.4,
              child: Image.asset(
                "assets/images/background2.png",
                fit: BoxFit.contain,
              ),
            ),
          ),
          Positioned(
            right: 2,
            bottom: 0,
            child: SizedBox(
              width: width * 0.4,
              child: Image.asset(
                "assets/images/duplicate.png",
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Product extends StatefulWidget {
  Product({
    Key? key,
    required this.image,
    required this.name,
    required this.price,
    required this.fairPrice,
    required this.rating,
    required this.id,
  }) : super(key: key);
  String name;
  String image;
  String price;
  String fairPrice;
  String rating;
  String id;
  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.all(8),
      width: width * 0.4,
      height: height * 0.32,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xff2F3134), width: 2),
        boxShadow: const [
          BoxShadow(
            color: Color(0x4d000000),
            blurRadius: 12,
            offset: Offset(4, 4),
          ),
        ],
        color: const Color(0xff262626),
      ),
      child: MaterialButton(
        onPressed: (() {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) => ProductScreen(
                        id: widget.id,
                      )),
              (route) => true);
        }),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: width * 0.4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: width * 0.22,
                      child: Text(
                        widget.name,
                        style: TextStyle(
                          color: Color(0xffecebeb),
                          fontSize: 18,
                          fontFamily: "Barlow",
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        FirebaseFirestore.instance
                            .collection('users')
                            .doc(FirebaseAuth.instance.currentUser!.uid)
                            .collection('fav')
                            .add({"id": widget.id}).then((value) {
                          const snackBar = SnackBar(
                            content: Text(
                              'Added to favorite',
                              style: TextStyle(
                                  color: Colors.white, fontFamily: 'Barlow'),
                            ),
                          );

                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        });
                      },
                      child: Icon(
                        Icons.favorite_border,
                        color: Color(0xffecebeb),
                        size: width * 0.05,
                      ),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Text(
                    "${widget.rating}",
                    style: TextStyle(
                      color: Color(0xffecebeb),
                      fontSize: 15,
                      fontFamily: "Barlow",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Icon(
                    Icons.star,
                    size: 18,
                    color: Color(0xffe6b53c),
                  )
                ],
              ),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                    height: height * 0.14,
                    // child: Image.asset(widget.image),
                    child: widget.name == "Boat"
                        ? Image.asset(widget.image)
                        : Image.network(widget.image)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "\$${widget.fairPrice}",
                        style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Color(0xff585858),
                          fontSize: 13,
                          fontFamily: "Barlow",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "\$${widget.price}",
                        style: TextStyle(
                          color: Color(0xffecebeb),
                          fontSize: 15,
                          fontFamily: "Barlow",
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                  Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        gradient: const LinearGradient(
                          stops: [0.2, 0.8],
                          transform: GradientRotation(3.14 / 2),
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          colors: [
                            Color(0xff61b1cc),
                            Color(0xff4c52b0),
                          ],
                        )),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: GestureDetector(
                        onTap: () {
                          FirebaseFirestore.instance
                              .collection('users')
                              .doc(FirebaseAuth.instance.currentUser!.uid)
                              .collection('cart')
                              .add({"id": widget.id}).then((value) {
                            const snackBar = SnackBar(
                              content: Text(
                                'successfully added to cart',
                                style: TextStyle(
                                    color: Colors.white, fontFamily: 'Barlow'),
                              ),
                            );

                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          });
                        },
                        child: Center(
                          child: Icon(
                            Icons.add,
                            color: Color(0xfff8f8f8),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  bool home = true;
  bool favourite = false;
  bool profile = false;
  void setHome() {
    if (!home) {
      setState(() {
        home = true;
        favourite = false;
        profile = false;
      });
    }
  }

  void setFavourite() {
    if (!favourite) {
      setState(() {
        favourite = true;
        home = false;
        profile = false;
      });
      Timer(Duration(milliseconds: 200), () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => FavScreen()),
            (route) => true);
      });
    }
  }

  void setProfile() {
    if (!profile) {
      setState(() {
        profile = true;
        home = false;
        favourite = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.06,
      width: width,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xff252525),
          width: 1,
        ),
        color: const Color(0xff262626),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          home
              ? Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      gradient: const LinearGradient(
                        stops: [0.2, 0.8],
                        transform: GradientRotation(3.14 / 2),
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [
                          Color(0xff61b1cc),
                          Color(0xff4c52b0),
                        ],
                      )),
                  child: const Center(
                    child: Icon(
                      Icons.home_outlined,
                      color: Color(0xfff8f8f8),
                    ),
                  ),
                )
              : GestureDetector(
                  onTap: () {
                    setHome();
                  },
                  child: const SizedBox(
                    width: 32,
                    height: 32,
                    // decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(4),
                    //     gradient: const LinearGradient(
                    //       stops: [0.2, 0.8],
                    //       transform: GradientRotation(3.14 / 2),
                    //       begin: Alignment.bottomLeft,
                    //       end: Alignment.topRight,
                    //       colors: [
                    //         Color(0xff61b1cc),
                    //         Color(0xff4c52b0),
                    //       ],
                    //     )),
                    child: Center(
                      child: Icon(
                        Icons.home_outlined,
                        color: Color(0xfff8f8f8),
                      ),
                    ),
                  ),
                ),
          favourite
              ? Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      gradient: const LinearGradient(
                        stops: [0.2, 0.8],
                        transform: GradientRotation(3.14 / 2),
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [
                          Color(0xff61b1cc),
                          Color(0xff4c52b0),
                        ],
                      )),
                  child: const Center(
                    child: Icon(
                      Icons.favorite_rounded,
                      color: Color(0xfff8f8f8),
                    ),
                  ),
                )
              : GestureDetector(
                  onTap: () {
                    setFavourite();
                  },
                  child: const SizedBox(
                    width: 32,
                    height: 32,
                    // decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(4),
                    //     gradient: const LinearGradient(
                    //       stops: [0.2, 0.8],
                    //       transform: GradientRotation(3.14 / 2),
                    //       begin: Alignment.bottomLeft,
                    //       end: Alignment.topRight,
                    //       colors: [
                    //         Color(0xff61b1cc),
                    //         Color(0xff4c52b0),
                    //       ],
                    //     )),
                    child: Center(
                      child: Icon(
                        Icons.favorite_outline_rounded,
                        color: Color(0xfff8f8f8),
                      ),
                    ),
                  ),
                ),
          // profile
          //     ? Container(
          //         width: 32,
          //         height: 32,
          //         decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(4),
          //             gradient: const LinearGradient(
          //               stops: [0.2, 0.8],
          //               transform: GradientRotation(3.14 / 2),
          //               begin: Alignment.bottomLeft,
          //               end: Alignment.topRight,
          //               colors: [
          //                 Color(0xff61b1cc),
          //                 Color(0xff4c52b0),
          //               ],
          //             )),
          //         child: const Center(
          //           child: Icon(
          //             Icons.person_outline_rounded,
          //             color: Color(0xfff8f8f8),
          //           ),
          //         ),
          //       )
          //     : GestureDetector(
          //         onTap: () {
          //           setProfile();
          //         },
          //         child: const SizedBox(
          //           width: 32,
          //           height: 32,
          //           // decoration: BoxDecoration(
          //           //     borderRadius: BorderRadius.circular(4),
          //           //     gradient: const LinearGradient(
          //           //       stops: [0.2, 0.8],
          //           //       transform: GradientRotation(3.14 / 2),
          //           //       begin: Alignment.bottomLeft,
          //           //       end: Alignment.topRight,
          //           //       colors: [
          //           //         Color(0xff61b1cc),
          //           //         Color(0xff4c52b0),
          //           //       ],
          //           //     )),
          //           child: Center(
          //             child: Icon(
          //               Icons.person_outline_rounded,
          //               color: Color(0xfff8f8f8),
          //             ),
          //           ),
          //         ),
          //       ),
        ],
      ),
    );
  }
}
