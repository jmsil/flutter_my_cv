import 'package:flutter/material.dart';

class CvContainer extends AspectRatio {
  CvContainer(double borderSize, double radius, String? asset, Widget? child)
    :
    super(
      aspectRatio: 1,
      child: Container(
        decoration: ShapeDecoration(
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(radius)),
            side: BorderSide(width: borderSize / 2, color: Colors.blueGrey[100]!)
          ),
          image: asset == null
            ? null : DecorationImage(fit: BoxFit.cover, image: AssetImage('assets/$asset'))
        ),
        child: child
      )
    );
}