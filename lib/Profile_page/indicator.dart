import 'package:flutter/material.dart';
// import 'package:get/get.dart';

class Indicator extends StatelessWidget {
  const Indicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Indicators",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text.rich(
                  // children: [],
                  TextSpan(
                children: [
                  const TextSpan(text: '\n'),
                  TextSpan(
                    text: "Moving Average (MA)",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const TextSpan(text: '\n'),
                  const TextSpan(text: '\n'),
                  // TextSpan(text: ''),
                  // paddingOnly(bo)
                  TextSpan(
                    text:
                        "Moving averages can help identify trends by smoothing out price fluctuations. Traders often look for crossovers between short-term (e.g., 50-day) and long-term (e.g., 200-day) moving averages to signal potential changes in trend direction. For example, a bullish signal occurs when the short-term moving average crosses above the long-term moving average, indicating an upward trend.",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const TextSpan(text: '\n'),
                  const TextSpan(text: '\n'),
                  const TextSpan(text: '\n'),
                  TextSpan(
                    text: "Relative Strength Index (RSI)",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const TextSpan(text: '\n'),
                  const TextSpan(text: '\n'),
                  TextSpan(
                    text:
                        "RSI is used to identify overbought or oversold conditions. When RSI values exceed 70, the stock may be overbought and due for a price correction, while RSI values below 30 may indicate oversold conditions and a potential buying opportunity.",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const TextSpan(text: '\n'),
                  const TextSpan(text: '\n'),
                  const TextSpan(text: '\n'),
                  TextSpan(
                    text: "Moving Average Convergence Divergence (MACD)",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const TextSpan(text: '\n'),
                  const TextSpan(text: '\n'),
                  TextSpan(
                    text:
                        " Traders look for MACD line crossovers with the signal line as buy or sell signals. Additionally, the distance between the MACD line and the signal line (histogram) can indicate increasing or decreasing momentum, providing insights into potential trend reversals.",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const TextSpan(text: '\n'),
                  const TextSpan(text: '\n'),
                  const TextSpan(text: '\n'),
                  TextSpan(
                    text: "Bollinger Bands",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const TextSpan(text: '\n'),
                  const TextSpan(text: '\n'),
                  TextSpan(
                    text:
                        "Bollinger Bands help identify volatility and potential price reversals. When the price touches the upper band, it may indicate overbought conditions, while touching the lower band may signal oversold conditions. Traders also look for price breakouts beyond the bands, which could signal the start of a new trend.",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const TextSpan(text: '\n'),
                  const TextSpan(text: '\n'),
                  const TextSpan(text: '\n'),
                  TextSpan(
                    text: "Stochastic Oscillator:",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const TextSpan(text: '\n'),
                  const TextSpan(text: '\n'),
                  TextSpan(
                    text:
                        "Traders use the Stochastic Oscillator to identify potential trend reversals by looking for overbought or oversold conditions. A bullish signal occurs when the oscillator crosses above the oversold threshold (e.g., 20), indicating a potential buying opportunity, while a bearish signal occurs when it crosses below the overbought threshold (e.g., 80), suggesting a potential selling opportunity.",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const TextSpan(text: '\n'),
                  const TextSpan(text: '\n'),
                  const TextSpan(text: '\n'),
                  TextSpan(
                    text: "Fibonacci Retracement",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const TextSpan(text: '\n'),
                  const TextSpan(text: '\n'),
                  TextSpan(
                    text:
                        "Fibonacci Retracement levels can be used to identify potential support and resistance levels. Traders look for price retracements to key Fibonacci levels (e.g., 38.2%, 50%, 61.8%) after a significant price move, which may indicate potential reversal points.",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const TextSpan(text: '\n'),
                  const TextSpan(text: '\n'),
                  const TextSpan(text: '\n'),
                  TextSpan(
                    text: "Average True Range (ATR)",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const TextSpan(text: '\n'),
                  const TextSpan(text: '\n'),
                  TextSpan(
                    text:
                        "ATR helps traders gauge market volatility, which can be useful for setting stop-loss and take-profit levels. Higher ATR values indicate higher volatility, while lower values suggest lower volatility.",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),const TextSpan(text: '\n'),
                  const TextSpan(text: '\n'),
                  const TextSpan(text: '\n'),
                  TextSpan(
                    text: "On-Balance Volume (OBV)",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const TextSpan(text: '\n'),
                  const TextSpan(text: '\n'),
                  TextSpan(
                    text:
                        "Traders use OBV to confirm price trends. Rising OBV confirms an uptrend, while falling OBV confirms a downtrend. Divergence between OBV and price movements may signal potential trend reversals.",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const TextSpan(text: '\n')
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
