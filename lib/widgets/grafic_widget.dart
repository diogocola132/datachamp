// ignore: depend_on_referenced_packages
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datachamp/models/cotacaoo.dart';
import 'package:flutter_datachamp/models/indicadorr.dart';

class LineChartSample7 extends StatefulWidget {
  const LineChartSample7({
    Key? key,
    required this.cotacoes,
    required this.groupedCotacoes,
  }) : super(key: key);

  final List<Cotacao> cotacoes;
  final Map<Indicador, List<Cotacao>> groupedCotacoes;

  @override
  State<LineChartSample7> createState() => _LineChartSample7State();
}

class _LineChartSample7State extends State<LineChartSample7> {
  Map<int, Color> indicatorColors = {
    1: Colors.blue,
    2: Colors.yellow,
    3: Colors.greenAccent.shade400,
    4: Colors.purpleAccent.shade400,
    5: Colors.pinkAccent.shade400,
    6: Colors.orangeAccent.shade400,
    7: Colors.tealAccent.shade400,
  };

  Widget buildIndicadorLegend(Indicador indicador, Color color) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.rectangle,
          ),
        ),
        const SizedBox(width: 8),
        Text(indicador.descricao, style: const TextStyle(fontSize: 16)),
      ],
    );
  }

  Widget buildIndicadorLegends() {
    List<Widget> legendWidgets = [];
    widget.groupedCotacoes
        .forEach((Indicador indicador, List<Cotacao> cotacoes) {
      int indicadorID = indicador.id;
      Color lineColor = indicatorColors[indicadorID] ?? Colors.black;
      legendWidgets.add(buildIndicadorLegend(indicador, lineColor));
      legendWidgets.add(const SizedBox(width: 16));
    });
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: legendWidgets,
          ),
        ),
      ],
    );
  }

  Widget bottomTitlesWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.bold,
    );

    int dia = value.toInt() + 1;
    if (dia >= 1 && dia <= 30) {
      String text = dia == 1 ? "Dia $dia" : "$dia";
      return Text(text, style: style);
    } else {
      return const SizedBox();
    }
  }

  Widget leftTitlesWidget(double value, TitleMeta meta) {
    const style = TextStyle(fontSize: 10);
    return Text("R\$ ${value.toStringAsFixed(2)}", style: style);
  }

  List<LineChartBarData> generateLinesForIndicadores() {
    List<LineChartBarData> lineBarsData = [];
    widget.groupedCotacoes
        .forEach((Indicador indicador, List<Cotacao> cotacoes) {
      int indicadorID = indicador.id;
      Color lineColor = indicatorColors[indicadorID] ?? Colors.black;

      List<FlSpot> spots = [];
      for (int i = 0; i < cotacoes.length; i++) {
        spots.add(FlSpot(i.toDouble(), cotacoes[i].valor));
      }

      LineChartBarData lineChartData = LineChartBarData(
        spots: spots,
        isCurved: false,
        color: lineColor,
        barWidth: 6,
      );
      lineBarsData.add(lineChartData);
    });

    return lineBarsData;
  }

  @override
  Widget build(BuildContext context) {
    double maxY = widget.cotacoes.isNotEmpty
        ? widget.cotacoes.map((e) => e.valor).reduce((a, b) => a > b ? a : b)
        : 0;

    List<LineChartBarData> lineBarsData = generateLinesForIndicadores();

    return AspectRatio(
      aspectRatio: 1.2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: Column(
          children: [
            Expanded(
              child: LineChart(
                LineChartData(
                  lineBarsData: lineBarsData,
                  minX: 0,
                  maxX: 30,
                  minY: 0,
                  maxY: maxY,
                  lineTouchData: LineTouchData(
                    touchTooltipData: LineTouchTooltipData(
                      tooltipBgColor: Colors.blueGrey.shade200,
                      getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
                        return touchedBarSpots.map((barSpot) {
                          final flSpot = barSpot.bar.spots[barSpot.spotIndex];
                          final indicadorID = barSpot.barIndex;
                          final selectedIndicador = widget.groupedCotacoes.keys
                              .elementAt(indicadorID);
                          final lineColor =
                              indicatorColors[selectedIndicador.id] ??
                                  Colors.black;
                          return LineTooltipItem(
                            "R\$ ${flSpot.y.toStringAsFixed(2)}"
                                .replaceAll(".", ","),
                            TextStyle(color: lineColor),
                          );
                        }).toList();
                      },
                    ),
                  ),
                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                          showTitles: true,
                          interval: 1.4,
                          getTitlesWidget: bottomTitlesWidgets),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: 1,
                        getTitlesWidget: leftTitlesWidget,
                        reservedSize: 40,
                      ),
                    ),
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: false,
                      ),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 64),
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: buildIndicadorLegends(),
            ),
          ],
        ),
      ),
    );
  }
}
