import 'package:flutter/material.dart';

import '../widget/suggestion_tile.dart';

class SuggestionScreen extends StatefulWidget {
  const SuggestionScreen({Key? key}) : super(key: key);

  @override
  State<SuggestionScreen> createState() => _SuggestionScreenState();
}

class _SuggestionScreenState extends State<SuggestionScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: height * 0.1,
        elevation: 0,
        backgroundColor: Color(0xff1f1f1f),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        title: Text(
          "Sony ASR -48",
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Barlow",
            fontSize: width * 0.057,
          ),
        ),
      ),
      backgroundColor: Color(0xff1f1f1f),
      body: Column(
        children: [
          SizedBox(
            width: width * 0.9,
            height: height * 0.75,
            child: ListView.builder(itemBuilder: (context, index) {
              return SuggestionTile();
            }),
          ),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Container(
                width: width,
                height: height * 0.12,
                color: const Color(0xff262626),
                child: Center(
                  child: Container(
                    height: height * 0.05,
                    width: width * 0.5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: const LinearGradient(
                          stops: [0.5, 0.8],
                          transform: GradientRotation(3.14 / 2),
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          colors: [
                            Color(0xff61b1cc),
                            Color(0xff4c52b0),
                          ],
                        )),
                    child: MaterialButton(
                      onPressed: () {},
                      child: Center(
                        child: Text(
                          "See others",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: "Barlow",
                            fontWeight: FontWeight.w500,
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
    );
  }
}
