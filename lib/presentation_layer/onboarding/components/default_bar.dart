import 'package:Islami/core/utils/assets.dart';
import 'package:flutter/material.dart';

class DefaultBar extends StatelessWidget {
  const DefaultBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150, // Set the height of the container
      width: MediaQuery.of(context).size.width, // Take full width of the screen
      child: Stack(
        children: [
          Positioned(
            top: 10,
            right: 50,
            child: Image.asset(
              ImageAssets.Mosque,
              width: MediaQuery.of(context).size.width * 0.67,
            ),
          ),
          Positioned(
            top: 70,
            right: 50,
            child: Image.asset(
              ImageAssets.islami,
              width: MediaQuery.of(context).size.width * 0.67,
            ),
          ),
        ],
      ),
    );
  }
}
