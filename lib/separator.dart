import 'package:flutter/material.dart';

class CvSep {
  static const SizedBox sep8 = SizedBox(width: 8, height: 8);
  static const SizedBox sep12 = SizedBox(width: 12, height: 12);
  static const SizedBox sep16 = SizedBox(width: 16, height: 16);
  static const SizedBox sep40 = SizedBox(width: 40, height: 40);

  static const EdgeInsets allEdgeInsets8 = EdgeInsets.all(8);
  static const EdgeInsets horEdgeInsets8 = EdgeInsets.symmetric(horizontal: 8);
  static const EdgeInsets allEdgeInsets16 = EdgeInsets.all(16);
  static const EdgeInsets horEdgeInsets32 = EdgeInsets.symmetric(horizontal: 32);
  static const EdgeInsets verEdgeInsets32 = EdgeInsets.symmetric(vertical: 32);

  static final Divider div = Divider(
    height: 8,
    thickness: 2,
    color: Colors.blueGrey[600]
  );
}