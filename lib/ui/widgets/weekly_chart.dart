import 'package:covid_19/constains.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class WeeklyChart extends StatelessWidget {
  const WeeklyChart({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 1.7,
      child: BarChart(
          BarChartData(
            barGroups: getBarGroups(),
            borderData: FlBorderData(show: false),
            titlesData: FlTitlesData(
              rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                bottomTitles: AxisTitles(
                  sideTitles: _bottomTitles,
                ),
            ),
            gridData: FlGridData(show: false),
      )
      ),
    );
  }

  SideTitles get _bottomTitles => SideTitles(
    showTitles: true,
    getTitlesWidget: (value, meta) {
      String text = '';
      switch (value.toInt()) {
        case 0:
          text = 'MON';
          break;
        case 1:
          text = 'TUE';
          break;
        case 2:
          text = 'WED';
          break;
        case 3:
          text = 'THU';
          break;
        case 4:
          text = 'FRI';
          break;
        case 5:
          text = 'SAT';
          break;
        case 6:
          text = 'SUN';
          break;
      }
      return Text(text,style: TextStyle(
        color: Color(0xFF7589A2),
        fontSize: 10,
        fontWeight: FontWeight.w200,
      ),);
    },

  );
}

getBarGroups() {
  List<double> barChartDatas = [6, 10, 8, 7, 10, 15, 9];
  List<BarChartGroupData> barChartGroups = [];
  barChartDatas.asMap().forEach(
        (i, value) => barChartGroups.add(
      BarChartGroupData(
        x: i,
        barRods: [
          BarChartRodData(
            toY: value,
            //This is not the proper way, this is just for demo
            color: i == 4 ? kPrimaryColor : kInactiveChartColor,
            width: 16,
          )
        ],
      ),
    ),
  );
  return barChartGroups;
}

