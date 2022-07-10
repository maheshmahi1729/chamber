import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class ARViewScreen extends StatefulWidget {
  ARViewScreen({Key? key, required this.itemFile}) : super(key: key);
  String itemFile;

  @override
  State<ARViewScreen> createState() => _ARViewScreenState();
}

class _ARViewScreenState extends State<ARViewScreen> {
  @override
  Widget build(BuildContext context) {
    print(widget.itemFile);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
      padding: EdgeInsets.all(4),
      height: height,
      width: width,
      child: ModelViewer(
        src: 'https://modelviewer.dev/shared-assets/models/Astronaut.glb',
        // src: widget.itemFile.split("?")[0],
        alt: "A 3D model of an astronaut",
        ar: true,
        autoRotate: true,
        cameraControls: true,
      ),
    ));
  }
}
