import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:trading_app/live_page/NSE_Stock/NSE_chart/chart_modal/chat_modal.dart';
import 'package:trading_app/live_page/controller/nse_controller.dart';

class StockChart extends StatelessWidget {
  const StockChart({
    super.key,
    required ZoomPanBehavior zoomPanBehavior,
    required List<ChartData> chartData,
  })  : _zoomPanBehavior = zoomPanBehavior,
        _chartData = chartData;

  final ZoomPanBehavior _zoomPanBehavior;
  final List<ChartData> _chartData;

  @override
  Widget build(BuildContext context) {
    
    final controller = Get.put(NSEController());
    return Expanded(
      child: Obx(
        () => SfCartesianChart(
          zoomPanBehavior: _zoomPanBehavior,
          enableAxisAnimation: true,
          axes: const <ChartAxis>[
            NumericAxis(
              majorGridLines: MajorGridLines(width: 0),
              isVisible: false,
              name: 'yAxis1',
              interval: 100,
              minimum: -10,
              maximum: 90,
            ),
            NumericAxis(
              plotOffset: 3,
              majorGridLines: MajorGridLines(width: 0),
              isVisible: false,
              name: 'yAxis3',
              interval: 1,
              minimum: -5,
              maximum: 5,
            ),
            NumericAxis(
              majorGridLines: MajorGridLines(width: 0),
              isVisible: false,
              name: 'yAxis2',
              interval: 100,
              minimum: 1300,
              maximum: 1400,
            ),
            NumericAxis(
              majorGridLines: MajorGridLines(width: 0),
              isVisible: false,
              name: 'yAxis4',
              interval: 100,
              minimum: -60,
              maximum: 140,
            )
          ],
          primaryXAxis: const DateTimeAxis(),
          legend: const Legend(isVisible: true),
          indicators: controller.indicators(),
          tooltipBehavior: TooltipBehavior(enable: true),
          series: <CartesianSeries>[
            CandleSeries<ChartData, DateTime>(
              enableTooltip: true,
              dataSource: _chartData,
              xValueMapper: (ChartData data, _) => data.x,
              lowValueMapper: (ChartData data, _) => data.low,
              highValueMapper: (ChartData data, _) => data.high,
              openValueMapper: (ChartData data, _) => data.open,
              closeValueMapper: (ChartData data, _) => data.close,
              showIndicationForSameValues: true,
              name: 'CandleSeries',
            ),
          ],
        ),
      ),
    );
  }
}
