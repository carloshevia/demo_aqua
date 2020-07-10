import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:demoaqua/logic/score.dart';

class CustomChart extends StatelessWidget {
  final List<Score> data;
  int chartType;
  CustomChart({@required this.data, this.chartType});
  List<charts.Series<Score, int>> seriesLiner;
  List<charts.Series<Score, String>> seriesBar;

  getSerie() {}

  charts.BaseChart getChart(List<charts.Series<Score, String>> series) {
    if (chartType == 1)
      return charts.BarChart(
        series,
        animate: true,
      );
    else if (chartType == 2)
      return charts.LineChart(
        series,
        animate: true,
      );
    else
      return charts.PieChart(
        series,
        animate: true,
      );
  }

  @override
  Widget build(BuildContext context) {
    List<charts.Series<Score, String>> series = [
      charts.Series(
        id: "Consumo de Agua",
        data: data,
        domainFn: (Score series, _) => series.label,
        measureFn: (Score series, _) => series.value,
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
//        labelAccessorFn: (Score series, _) => series.consume.toString(),
      ),
    ];
    return Container(
      height: 400,
      padding: EdgeInsets.all(20),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Expanded(
                child: getChart(series),

//                charts.PieChart(
//                        series,
//                        animate: true,
//                        animationDuration: Duration(seconds: 1),
//                        defaultRenderer: charts.ArcRendererConfig(
//                          arcWidth: 100,
//                          arcRendererDecorators: [
//                            charts.ArcLabelDecorator(
//                              labelPosition: charts.ArcLabelPosition.inside,
//                            ),
//                          ],
//                        ),
//                        behaviors: [
//                          charts.DatumLegend(
//                            outsideJustification:
//                                charts.OutsideJustification.endDrawArea,
//                            horizontalFirst: false,
//                            desiredMaxRows: 2,
//                            cellPadding:
//                                EdgeInsets.only(right: 4.0, bottom: 4.0),
//                            entryTextStyle: charts.TextStyleSpec(
//                              fontSize: 12,
//                            ),
//                          )
//                        ],
//                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
