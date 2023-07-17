import 'package:covid_19/constains.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'line_chart.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final int effectedNum;
  final Color iconColor;
  final Function() press;
  const InfoCard({
    super.key, required this.title, required this.effectedNum, required this.iconColor, required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return GestureDetector(
          onTap: press,
          child: Container(
            width: constraints.maxWidth / 2 - 10,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: iconColor.withOpacity(0.15),
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(
                          'assets/icons/running.svg',
                          width: 12,
                          height: 12,
                          color: iconColor,
                        ),
                      ),
                      SizedBox(width: 5,),
                      Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.w100,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: RichText(
                          text: TextSpan(
                              style: TextStyle(color: kTextColor),
                              children: [
                                TextSpan(
                                    text: '$effectedNum \n',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    )
                                ),
                                TextSpan(
                                    text: 'People',
                                    style: TextStyle(
                                        fontSize: 12,
                                        height: 2
                                    )
                                )
                              ]
                          ),
                        ),
                      ),
                      Expanded(child: LineReportChart()),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}