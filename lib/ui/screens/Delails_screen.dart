import 'package:covid_19/constains.dart';
import 'package:covid_19/ui/widgets/weekly_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailScreen extends StatelessWidget {

  const DetailScreen({super.key, });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BuildDetailAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 25),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 25),
                      blurRadius: 53,
                      color: Colors.black.withOpacity(0.05),
                    )
                  ],
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BuildTitleWithMoreIcon(),
                    SizedBox(height: 15,),
                    BuildCaseNumber(),
                    SizedBox(height: 15,),
                    Text('From Health Center',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: kTextLightColor,
                      fontWeight: FontWeight.w200,
                    ),
                    ),
                    SizedBox(height: 10,),
                    WeeklyChart(),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildInfoWithPercentage(title: 'From Last Week', percentage: '6.43'),
                        buildInfoWithPercentage(title: 'Recovery Rate', percentage: '9.43')
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 21),
                      blurRadius: 54,
                      color: Colors.black.withOpacity(0.03),
                    ),
                  ]
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Global Map',
                            style: TextStyle(
                              color: kTextMediumColor,
                            )),
                        SvgPicture.asset('assets/icons/more.svg'),
                      ],
                    ),
                    SvgPicture.asset('assets/icons/map.svg'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  RichText buildInfoWithPercentage({required String title, required String percentage}) {
    return RichText(
                        text: TextSpan(
                      children: [
                        TextSpan(text: '$percentage% \n',style: TextStyle(
                          fontSize: 20,
                          color: kPrimaryColor,
                        )),
                        TextSpan(text: title,
                        style: TextStyle(
                          color: kTextMediumColor,
                        )),
                      ]
                    ));
  }

  Row BuildCaseNumber() {
    return Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('547',style: TextStyle(
                      color: kPrimaryColor,
                      //fontWeight: FontWeight.bold,
                      fontSize: 70,
                    ),
                    ),
                    SizedBox(width: 15,),
                    Text('5,9%',style: TextStyle(
                      color: kPrimaryColor,
                    ),
                    ),
                    SvgPicture.asset('assets/icons/increase.svg'),
                  ],
                );
  }

  Row BuildTitleWithMoreIcon() {
    return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('NewCases',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: kTextMediumColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SvgPicture.asset('assets/icons/more.svg'),
                  ],
                );
  }

  AppBar BuildDetailAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: kBackgroundColor,
      elevation: 0,
      leading: IconButton(
        color: kPrimaryColor,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new),
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('assets/icons/search.svg')
        )
      ],
    );
  }
}
