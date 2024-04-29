import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:trading_app/live_page/NSE_Stock/NSE_chart/chart_modal/chat_modal.dart';

class NSEController extends GetxController {
  static NSEController get instance => Get.find();
  final rsiVisible = false.obs;
  final adVisible = false.obs;
  final atrVisible = false.obs;
  final smaVisible = false.obs;
  final emaVisible = false.obs;
  final macdVisible = false.obs;
  final stochasticVisible = false.obs;
  final tmaVisible = false.obs;

  void changeVale(String? value) {
    adVisible.value = false;
    rsiVisible.value = false;
    atrVisible.value = false;
    emaVisible.value = false;
    macdVisible.value = false;
    smaVisible.value = false;
    stochasticVisible.value = false;
    tmaVisible.value = false;

    
    if (value == 'AD') {
      adVisible.value = !adVisible.value;
    } else if (value == 'RSI') {
      rsiVisible.value = !rsiVisible.value;
    } else if (value == 'ATR') {
      atrVisible.value = !atrVisible.value;
    } else if (value == 'EMA') {
      emaVisible.value = !emaVisible.value;
    } else if (value == 'MACD') {
      macdVisible.value = !macdVisible.value;
    } else if (value == 'SMA') {
      smaVisible.value = !smaVisible.value;
    } else if (value == 'Stochastic') {
      stochasticVisible.value = !stochasticVisible.value;
    } else if (value == 'TMA') {
      tmaVisible.value = !tmaVisible.value;
    }
  }

  List<TechnicalIndicator<dynamic, dynamic>> indicators() {
    List<TechnicalIndicator<dynamic, dynamic>> indicator = [];
    indicator.clear();

    if (adVisible.value) {
      indicator.add(
        AccumulationDistributionIndicator<ChartData, DateTime>(
          isVisible: adVisible.value,
          seriesName: 'CandleSeries',
          yAxisName: 'yAxis1',
        ),
      );
    } else if (rsiVisible.value) {
      indicator.add(
        RsiIndicator<dynamic, dynamic>(
          isVisible: rsiVisible.value,
          period: 3,
          seriesName: 'CandleSeries',
          overbought: 70,
          oversold: 30,
          yAxisName: 'yAxis1',
          // signalLineColor: Colors.transparent,
        ),
      );
    } else if (atrVisible.value) {
      indicator.add(
        AtrIndicator<dynamic, dynamic>(
          isVisible: atrVisible.value,
          period: 3,
          seriesName: 'CandleSeries',
          yAxisName: 'yAxis1',
        ),
      );
    } else if (emaVisible.value) {
      indicator.add(
        EmaIndicator<dynamic, dynamic>(
          isVisible: emaVisible.value,
          seriesName: 'CandleSeries',
        ),
      );
    } else if (macdVisible.value) {
      indicator.add(
        MacdIndicator<dynamic, dynamic>(
          isVisible: macdVisible.value,
          longPeriod: 5,
          shortPeriod: 2,
          seriesName: 'CandleSeries',
          yAxisName: 'yAxis3',
        ),
      );
    } else if (smaVisible.value) {
      indicator.add(
        SmaIndicator<dynamic, dynamic>(
          isVisible: smaVisible.value,
          seriesName: 'CandleSeries',
          yAxisName: 'yAxis2',
          valueField: 'close',
        ),
      );
    } else if (stochasticVisible.value) {
      indicator.add(
        StochasticIndicator<dynamic, dynamic>(
          isVisible: stochasticVisible.value,
          seriesName: 'CandleSeries',
          yAxisName: 'yAxis4',
          kPeriod: 2,
          dPeriod: 3,
        ),
      );
    } else if (tmaVisible.value) {
      indicator.add(
        TmaIndicator<ChartData, dynamic>(
          isVisible: tmaVisible.value,
          seriesName: 'CandleSeries',
          yAxisName: 'yAxis2',
          valueField: 'low',
        ),
      );
    } else {
      indicator.clear();
    }

    return indicator;
  }

}