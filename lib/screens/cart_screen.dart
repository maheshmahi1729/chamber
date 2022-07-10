import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:seo/screens/order_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  String _id = '';
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xff1F1F1F),
      body: Container(
        padding: EdgeInsets.all(4),
        height: height,
        width: width,
        child: Column(children: [
          StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .doc(FirebaseAuth.instance.currentUser!.uid)
                  .collection('cart')
                  .snapshots(),
              builder: ((context, snapshot) {
                if (snapshot.hasData) {
                  var data = snapshot.data!.docs;
                  _id = data[0]['id'];

                  return SizedBox(
                    height: height * 0.9,
                    width: width,
                    child: ListView.builder(
                        itemCount: data.length + 1,
                        itemBuilder: (context, index) {
                          return index == 0
                              ? Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Align(
                                        alignment: Alignment.centerLeft,
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
                                    ),
                                    Expanded(
                                      flex: 9,
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "CART",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Barlow',
                                            fontSize: 24,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              : Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: cartProduct(data[index - 1]['id']),
                                );
                        }),
                  );
                } else {
                  return Container(
                    height: height * 0.9,
                    width: width,
                    child: Center(
                      child: Text("Add items to card",
                          style: TextStyle(color: Colors.white)),
                    ),
                  );
                }
              })),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Container(
                height: height * 0.1,
                width: width,
                color: Color(0xff252525),
                child: Center(
                  child: Container(
                    width: width * 0.8,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        end: Alignment.topLeft,
                        colors: [Color(0xff437ed6), Color(0xff33a6df)],
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: MaterialButton(
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OrderScreen(id: _id)),
                                (route) => true);
                          },
                          child: Text(
                            "Checkout",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: width * 0.045,
                              fontFamily: "Barlow",
                              fontWeight: FontWeight.w600,
                            ),
                          )),
                    ),
                  ),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }

  Widget cartProduct(String id) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance
            .collection('Products')
            .doc(id)
            .get()
            .asStream(),
        builder: (context, snapshot) {
          return Container(
            padding: EdgeInsets.all(15),
            width: width * 0.9,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Color(0x4d000000),
                  blurRadius: 12,
                  offset: Offset(4, 4),
                ),
              ],
              color: Color(0xff262626),
            ),
            child: Row(
              children: [
                SizedBox(
                  height: height * 0.14,
                  width: width * 0.4,
                  // child: Image.asset('assets/images/product1.png'),

                  child: Image.network(snapshot.data!['image']),
                ),
                Container(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${snapshot.data!['Name']}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "${snapshot.data!['rating']}",
                          // "4.4",
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "\$${snapshot.data!['fairPrice']}",
                          // "\$1699",
                          style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: Color(0xff585858),
                            fontSize: 18,
                            fontFamily: "Barlow",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 8),
                        Text(
                          "\$${snapshot.data!['price']}",
                          // "\$1099",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: "Barlow",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ))
              ],
            ),
          );
        });
  }
}
