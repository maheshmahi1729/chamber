import 'package:flutter/material.dart';

class SuggestionTile extends StatefulWidget {
  const SuggestionTile({Key? key}) : super(key: key);

  @override
  State<SuggestionTile> createState() => _SuggestionTileState();
}

class _SuggestionTileState extends State<SuggestionTile> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: height * 0.23,
        width: width * 0.85,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Color(0x4d000000),
              blurRadius: 12,
              offset: Offset(4, 4),
            ),
          ],
          color: const Color(0xff262626),
        ),
        child: Row(
          children: [
            SizedBox(
              height: height * 0.23,
              width: width * 0.3,
              child: Image.asset(
                "assets/images/AmazonIcon.png",
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              height: height * 0.23,
              width: width * 0.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Sony ASR -48 GS430 \nWireless Headset  ",
                        style: TextStyle(
                          fontFamily: "Barlow",
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "4.4",
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
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      // ignore: prefer_const_constructors
                      Text(
                        "\$159.00",
                        style: TextStyle(
                            fontFamily: "Barlow",
                            color: Color(0xff585858),
                            fontSize: 18,
                            decoration: TextDecoration.lineThrough),
                      ),
                      SizedBox(width: 9),
                      Text(
                        "\$89.00",
                        style: TextStyle(
                          fontFamily: "Barlow",
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
