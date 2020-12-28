import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ContainerResponsive(
      width: double.infinity,
      height: 800.h,
      //decoration: BoxDecoration(color: Color(0xFF3589a1)),
      child: Stack(
        children: [
          ContainerResponsive(
              alignment: Alignment.centerLeft,
              child: Image.network('assets/assets/logo.png')),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ContainerResponsive(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        child: TextResponsive("Films",
                            style: Theme.of(context)
                                .textTheme
                                .headline4
                                .copyWith(
                                    decoration: TextDecoration.underline)),
                        onTap: () {},
                      )),
                  MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        child: TextResponsive("Games",
                            style: Theme.of(context).textTheme.headline4),
                        onTap: () {},
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
