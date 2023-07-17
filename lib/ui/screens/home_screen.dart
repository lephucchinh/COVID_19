import 'package:covid_19/constains.dart';
import 'package:covid_19/ui/screens/Delails_screen.dart';
import 'package:covid_19/ui/widgets/info_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: buildAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
            width: double.infinity,
            decoration: BoxDecoration(
              color: kPrimaryColor.withOpacity(.03),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Wrap(
              runSpacing: 20,
              spacing: 10,
              children: [
                InfoCard(
                  title: 'Confirmed Cases',
                  effectedNum: 1062,
                  iconColor: Colors.orange, press: () { },
                ),
                InfoCard(
                  title: 'Tolal Death',
                  effectedNum: 75,
                  iconColor: Colors.pink, press: () { },
                ),
                InfoCard(
                  title: 'Total Recovered',
                  effectedNum: 689,
                  iconColor: Colors.greenAccent, press: () { },
                ),
                InfoCard(
                  title: 'New Cases',
                  effectedNum: 52,
                  iconColor: Colors.indigoAccent, press: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen()));
                },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Preventions',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    BuildPreventions(),
                    SizedBox(
                      height: 10,
                    ),
                    BuildHelpCard(size),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Row BuildPreventions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        PreventitonCard(
          image: 'assets/icons/hand_wash.svg',
          subtitle: 'Wash Hands',
        ),
        PreventitonCard(
          image: 'assets/icons/use_mask.svg',
          subtitle: 'Use Masks',
        ),
        PreventitonCard(
          image: 'assets/icons/Clean_Disinfect.svg',
          subtitle: 'Clean Disinfects',
        ),
      ],
    );
  }

  Container BuildHelpCard(Size size) {
    return Container(
      height: 150,
      width: double.infinity,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Container(
              padding: EdgeInsets.only(left: size.width * 0.4, top: 20),
              height: 130,
              width: size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(colors: [
                    Color(0xFF60BE93),
                    kPrimaryColor,
                  ])),
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: 'Dial 999 for \nMedical Help!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: kInactiveChartColor,
                    )),
                TextSpan(
                    text: '\nIf any symptoms appear',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                    )),
              ])),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: SvgPicture.asset('assets/icons/nurse.svg'),
          ),
          Positioned(
              top: 25,
              right: 10,
              child: SvgPicture.asset('assets/icons/virus.svg')),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: kPrimaryColor.withOpacity(.03),
      elevation: 0,
      leading: IconButton(
        onPressed: () {},
        icon: SvgPicture.asset('assets/icons/menu.svg'),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset('assets/icons/search.svg'),
        ),
      ],
    );
  }
}

class PreventitonCard extends StatelessWidget {
  final String image;
  final String subtitle;

  const PreventitonCard({
    super.key,
    required this.image,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(image),
        SizedBox(
          height: 10,
        ),
        Text(
          subtitle,
          style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
