import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:Proworktree/utilities/constants.dart';

class PageHeading extends StatelessWidget {
  final String heading;
  PageHeading({this.heading});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Hero(
          tag: 'hero',
          child: Container(
            width: 100,
            height: 100,
            child: Lottie.asset('assets/login_animation.json'),
          ),
        ),
        Text(
          heading,
          style: kBrandHeadingStyle,
        ),
      ],
    );
  }
}
