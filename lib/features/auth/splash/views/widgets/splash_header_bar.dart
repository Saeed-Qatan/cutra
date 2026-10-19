import 'package:flutter/material.dart';

/// Renders the top metadata header bar for Splash screen (`VER. 1.0` & `ENG-TOOL`).
class SplashHeaderBar extends StatelessWidget {
  const SplashHeaderBar({super.key});

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontSize: 10,
      fontFamily: 'IBMPlexSans',
      fontWeight: FontWeight.w500,
      letterSpacing: 2.0,
      color: Color(0x998E8E8E),
    );

    return const Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('VER. 1.0', style: textStyle),
          Text('ENG-TOOL', style: textStyle),
        ],
      ),
    );
  }
}
