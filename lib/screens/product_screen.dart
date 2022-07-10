import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:imageview360/imageview360.dart';
import 'package:seo/screens/order_screen.dart';

import 'ar_view_screen.dart';
import 'order_success_screen.dart';

class ProductScreen extends StatefulWidget {
  ProductScreen({Key? key, required this.id}) : super(key: key);
  String id;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    super.initState();
    for (int i = 1; i < 36; i++) {
      setState(() {
        imageList.add(AssetImage('assets/images/model_1/$i.jpg'));
      });
    }
  }

  List<ImageProvider> imageList = <ImageProvider>[];
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
          padding: EdgeInsets.all(4),
          height: height,
          width: width,
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
          child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
              stream: FirebaseFirestore.instance
                  .collection('Products')
                  .doc(widget.id)
                  .get()
                  .asStream(),
              builder: (context, snapShot) {
                print("name ${snapShot.data!.get('Name')}");
                print("description ${snapShot.data!.get('description')}");
                List colors = snapShot.data!['colors'];
                if (snapShot.hasData) {
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        top: 20,
                        left: 20,
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Positioned(
                        top: height * 0.01,
                        child: SizedBox(
                          // height: height * 0.4,
                          // width: width * 0.8,
                          child: Image.asset(
                            "assets/images/background3.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Positioned(
                        top: height * 0.16,
                        child: SizedBox(
                            height: height * 0.25,
                            // child: ImageView360(
                            //   key: UniqueKey(),
                            //   imageList: imageList,
                            //   // autoRotate: true, //Optional
                            //   rotationCount: 2, //Optional
                            //   rotationDirection: RotationDirection.anticlockwise, //Optional
                            //   frameChangeDuration: Duration(milliseconds: 50), //Optional
                            //   swipeSensitivity: 2, //Optional
                            //   allowSwipeToRotate: true, //Optional
                            //   onImageIndexChanged: (currentImageIndex) {
                            //     //Optional
                            //     print("currentImageIndex: $currentImageIndex");
                            //   },
                            // ),
                            child: Image.network(
                              snapShot.data!['image'],
                              fit: BoxFit.contain,
                            )),
                      ),
                      Positioned(
                        top: height * 0.4,
                        child: SizedBox(
                          // height: height * 0.25,
                          child: Image.asset(
                            "assets/images/base.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      DraggableScrollableSheet(
                          initialChildSize: 0.55,
                          minChildSize: 0.4,
                          maxChildSize: 0.65,
                          builder: (context, scrollController) {
                            return Container(
                              width: width,
                              decoration: const BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x4d000000),
                                    blurRadius: 12,
                                    offset: Offset(4, 4),
                                  ),
                                ],
                                color: Color(0xff262626),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30),
                                ),
                              ),
                              child: SingleChildScrollView(
                                controller: scrollController,
                                child: Center(
                                  child: SizedBox(
                                    width: width * 0.9,
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              snapShot.data!['Name'],
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 24,
                                                fontFamily: "Barlow",
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Icon(
                                              Icons.favorite_border_rounded,
                                              color: Color(0xFFFFFFFF),
                                            )
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "\$${snapShot.data!['fairPrice']}",
                                              style: TextStyle(
                                                decoration:
                                                    TextDecoration.lineThrough,
                                                color: Color(0xff585858),
                                                fontSize: 18,
                                                fontFamily: "Barlow",
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            SizedBox(width: 8),
                                            Text(
                                              "\$${snapShot.data!['price']}",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontFamily: "Barlow",
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "${snapShot.data!['rating']}",
                                              style: TextStyle(
                                                fontFamily: "Barlow",
                                                color: Colors.white,
                                                fontSize: 12,
                                              ),
                                            ),
                                            SizedBox(width: 4),
                                            Icon(
                                              Icons.star,
                                              color: Colors.yellow,
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        const Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "Color",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontFamily: "Barlow",
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: SizedBox(
                                            height: 30,
                                            width: double.parse(
                                                    colors.length.toString()) *
                                                40,
                                            child: ListView.builder(
                                                itemCount: colors.length,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemBuilder: (context, index) {
                                                  return Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 5.0),
                                                    child: Container(
                                                      height: 30,
                                                      width: 30,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: Color(
                                                          int.parse(
                                                              colors[index]),
                                                        ),
                                                      ),
                                                      child: Center(
                                                        child: Container(
                                                          height: 25,
                                                          width: 25,
                                                          decoration:
                                                              BoxDecoration(
                                                            border: Border.all(
                                                                width: 2,
                                                                color: Colors
                                                                    .black),
                                                            shape:
                                                                BoxShape.circle,
                                                            color: Color(
                                                              int.parse(colors[
                                                                  index]),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        const Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "Product Details ",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontFamily: "Barlow",
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),

                                        SizedBox(
                                          height: 20,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: RichText(
                                              text: TextSpan(
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    fontFamily: "Barlow",
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                  text: snapShot
                                                      .data!['description']
                                                      .toString(),
                                                  children: [
                                                TextSpan(
                                                  text: "Read More",
                                                  style: TextStyle(
                                                    color: Color(0xff28a1e6),
                                                    fontSize: 15,
                                                    fontFamily: "Barlow",
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ])),
                                        ),

                                        Container(
                                          width: width * 0.8,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            gradient: LinearGradient(
                                              begin: Alignment.bottomRight,
                                              end: Alignment.topLeft,
                                              colors: [
                                                Color(0xff437ed6),
                                                Color(0xff33a6df)
                                              ],
                                            ),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: MaterialButton(
                                              onPressed: () {
                                                print(
                                                    snapShot.data!['itemView']);
                                                Navigator.pushAndRemoveUntil(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ARViewScreen(
                                                              itemFile: snapShot
                                                                      .data![
                                                                  'itemView'],
                                                            )),
                                                    (route) => true);
                                              },
                                              child: Text(
                                                "View in real time",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: width * 0.04,
                                                  fontFamily: "Barlow",
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Container(
                                          width: width * 0.8,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            gradient: LinearGradient(
                                              begin: Alignment.bottomRight,
                                              end: Alignment.topLeft,
                                              colors: [
                                                Color(0xff437ed6),
                                                Color(0xff33a6df)
                                              ],
                                            ),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: MaterialButton(
                                                onPressed: () {
                                                  Navigator.pushAndRemoveUntil(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            OrderScreen(
                                                          id: snapShot
                                                              .data!['id'],
                                                        ),
                                                      ),
                                                      (route) => true);
                                                },
                                                child: Text(
                                                  "Buy now",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: width * 0.04,
                                                    fontFamily: "Barlow",
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                )),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        // SizedBox(
                                        //   // width: width * 0.4,
                                        //   child: SwipingButton(
                                        //     backgroundColor: Color(0xff28A1E6),
                                        //     buttonTextStyle: TextStyle(
                                        //       fontSize: 14,
                                        //       fontFamily: "Barlow",
                                        //       fontWeight: FontWeight.w700,
                                        //     ),
                                        //     iconColor: Color(0xffA4A4A4),
                                        //     swipeButtonColor: Colors.white,
                                        //     height: 55,
                                        //     onSwipeCallback: () {},
                                        //     text: 'See best  deals',
                                        //   ),
                                        // )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          })
                    ],
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white70,
                    ),
                  );
                }
              })),
    );
  }
}
