import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  ImageContainer({this.heightImage, this.widthImage});
  double? heightImage;
  double? widthImage;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: heightImage,
        width: widthImage,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/appLogo.png'), fit: BoxFit.fill)),
      ),
    );
  }
}
