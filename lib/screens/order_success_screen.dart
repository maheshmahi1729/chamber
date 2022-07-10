import 'package:flutter/material.dart';

import 'home_screen.dart';

class OrderConfirmationsScreen extends StatefulWidget {
  const OrderConfirmationsScreen({Key? key}) : super(key: key);

  @override
  State<OrderConfirmationsScreen> createState() =>
      _OrderConfirmationsScreenState();
}

class _OrderConfirmationsScreenState extends State<OrderConfirmationsScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: 414,
        height: 896,
        decoration: BoxDecoration(
          color: Color(0xff1f1f1f),
        ),
        padding: const EdgeInsets.only(
          top: 40,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Booking confirmation",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
            SizedBox(height: 106),
            Container(
              width: 170,
              height: 170,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Color(0xff3d92dc),
                  width: 10,
                ),
                color: Colors.white,
              ),
              child: Center(
                child: Icon(Icons.charging_station, size: 60),
              ),
            ),
            Container(
              width: 261,
              height: 81,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Order Success!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontFamily: "Barlow",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 9),
                  Text(
                    "Your orders have been placed successfully,",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: "Barlow",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 9),
                  Text(
                    "For more details, go to my orders.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: "Barlow",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 106),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Container(
                  width: width,
                  height: 118,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xff252525),
                      width: 1,
                    ),
                    color: Color(0xff262626),
                  ),
                  child: Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: 342,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          gradient: LinearGradient(
                            begin: Alignment.bottomRight,
                            end: Alignment.topLeft,
                            colors: [Color(0xff437ed6), Color(0xff33a6df)],
                          ),
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()),
                                (route) => false);
                          },
                          child: Center(
                            child: Text(
                              "Continue shopping",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: "Barlow",
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
