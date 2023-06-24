import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:toolpor_expense/presentation/resources/app_colors.dart';

class WLineChart extends StatelessWidget {
  final LineChartBarData lineChartBarData ;
  final bool change;

  const WLineChart({required this.lineChartBarData,required this.change,super.key});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        lineTouchData: LineTouchData(
          touchTooltipData: LineTouchTooltipData(
            tooltipBgColor: change ? const Color(0xFF3FDECE):const Color(0xFFFE9A7B) ,
            getTooltipItems: (List<LineBarSpot> lineBarsSpot) {
              return lineBarsSpot.map((lineBarSpot) {
                return LineTooltipItem(
                  change ? "${lineBarSpot.y.toStringAsFixed(0)} so'm":"-${lineBarSpot.y.toStringAsFixed(0)} so'm",
                  const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                );
              }).toList();
            },
            tooltipRoundedRadius: 10,
          ),
        ),
        borderData: FlBorderData(show: false),
        minX: 0,
        maxX: 8,
        minY: 0,
        maxY: 1000000,
        titlesData: FlTitlesData(
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          leftTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                const style = TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.grey);
                Widget text;
                switch (value.toInt()) {
                  case 0:
                    text = GestureDetector(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 4, left: 24),
                        child: SvgPicture.asset(
                          'assets/icons/arrow_back.svg',
                          width: 15,
                          height: 15,
                        ),
                      ),
                    );
                    break;
                  case 1:
                    text = const Text('1', style: style);
                    break;
                  case 2:
                    text = const Text('2', style: style);
                    break;
                  case 3:
                    text = const Text('3', style: style);
                    break;
                  case 4:
                    text = const Text('4', style: style);
                    break;
                  case 5:
                    text = const Text('5', style: style);
                    break;
                  case 6:
                    text = const Text('6', style: style);
                    break;
                  case 7:
                    text = const Text('7', style: style);
                    break;
                  case 8:
                    text = Padding(
                      padding: const EdgeInsets.only(top: 4, right: 24),
                      child: SvgPicture.asset(
                        'assets/icons/next.svg',
                        width: 15,
                        height: 15,
                      ),
                    );
                    break;
                  default:
                    text = const Text('', style: style);
                    break;
                }
                return SideTitleWidget(
                  axisSide: meta.axisSide,
                  child: text,
                );
              },
            ),
          ),
        ),
        //Y o'qiga yondash chiziq
        gridData: FlGridData(
            show: false,
            getDrawingHorizontalLine: (value) {
              return const FlLine(color: Colors.yellow, strokeWidth: 1);
            },
            //bu ham y o'qidagi chiziqni ko'rsatish
            drawVerticalLine: false),
        lineBarsData: [
          lineChartBarData
        ],
      ),
    );
  }
}
