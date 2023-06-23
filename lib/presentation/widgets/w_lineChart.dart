import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class WLineChart extends StatelessWidget {
  const WLineChart({super.key});

  @override
  Widget build(BuildContext context) {
    return LineChart(
        duration: const Duration(milliseconds: 250),
        sampleData
    );
  }
}

LineChartData get sampleData => LineChartData(
    gridData: gridData,
    titlesData: titlesData,
    borderData: borderData,
    lineBarsData: lineBarsData,
    minX: 0,
    maxX: 8,
    minY: 0,
    maxY: 8
);

List<LineChartBarData> get lineBarsData => [
  lineCharBarData
];

FlTitlesData get titlesData => FlTitlesData(
    bottomTitles: AxisTitles(
      sideTitles: bottomTitles,
    ),
    rightTitles: const AxisTitles(
      sideTitles: SideTitles(showTitles: false),
    ),
    topTitles: const AxisTitles(
      sideTitles: SideTitles(showTitles: false),
    ),
    leftTitles: AxisTitles(
      sideTitles: leftTitles(),
    )
);

Widget leftTitlesWidget(double value, TitleMeta meta){
  const style = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: Colors.grey,
  );
  String text;
  switch (value.toInt()){
    case 1:
      text = "";
      break;
    case 2:
      text = "";
      break;
    case 3:
      text = "";
      break;
    case 4:
      text = "";
      break;
    case 5:
      text = "";
      break;
    case 6:
      text = "";
      break;
    case 7:
      text = "";
      break;
    case 8:
      text = "";
      break;
    default:
      return Container();
  }
  return Text(text,style: style,textAlign: TextAlign.center,);
}

SideTitles leftTitles() => const SideTitles(
    getTitlesWidget: leftTitlesWidget,
    showTitles: true,
    interval: 1,
);

Widget bottomTitlesWidgets(double value, TitleMeta meta){
  const style = TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.bold,
      color: Colors.grey
  );
  Widget text;
  switch(value.toInt()){
    case 1 :
      text = const Text('1',style: style);
      break;
    case 2 :
      text = const Text('2',style: style);
      break;
    case 3 :
      text = const Text('3',style: style);
      break;
    case 4 :
      text = const Text('4',style: style);
      break;
    case 5 :
      text = const Text('5',style: style);
      break;
    case 6 :
      text = const Text('6',style: style);
      break;
    case 7 :
      text = const Text('7',style: style);
      break;
    case 8 :
      text = const Text('8',style: style);
      break;
    default:
      text = const Text('');
      break;
  }
  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 0,
    child: text,
  );
}

SideTitles get bottomTitles => const SideTitles(
  showTitles: true,
  reservedSize: 32,
  interval: 1,
  getTitlesWidget: bottomTitlesWidgets,
);

FlGridData get gridData => const FlGridData(show: false);

FlBorderData get borderData => FlBorderData(
  show: true,
  border: const Border(
    bottom: BorderSide(color: Colors.transparent, width: 4,),
    left: BorderSide(color: Colors.transparent),
    right: BorderSide(color: Colors.transparent),
    top: BorderSide(color: Colors.transparent),
  ),
);

LineChartBarData get lineCharBarData => LineChartBarData(
    isCurved: true,
    color: const Color(0xFF93EDC7),
    barWidth: 2,
    isStrokeCapRound: true,
    dotData: const FlDotData(show: false),
    belowBarData: BarAreaData(show: false),
    spots: const [
      FlSpot(1, 1),
      FlSpot(2, 2),
      FlSpot(3, 3),
      FlSpot(4, 3),
      FlSpot(5, 2),
      FlSpot(6, 2),
      FlSpot(7, 1),

    ]
);