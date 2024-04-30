// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:trading_app/Chart/chart.dart';
// import 'package:trading_app/NSE_Stock/nse.dart';
// import 'package:trading_app/constants/colors.dart';
// import 'package:trading_app/constants/text.dart';

// // ignore: must_be_immutable
// class LivePage extends StatefulWidget {
//   const LivePage({super.key});

//   @override
//   State<LivePage> createState() => _LivePageState();
// }

// class _LivePageState extends State<LivePage> {
//   // ignore: non_constant_identifier_names
//   bool NASDAQ = true;
//   bool kNSE = false;

//   @override
//   Widget build(BuildContext context) {
//     final bool dark = Theme.of(context).brightness == Brightness.dark;
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         automaticallyImplyLeading: false,
//         title: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 KtextString.homeAppBarTitle,
//                 style: Theme.of(context)
//                     .textTheme
//                     .labelMedium!
//                     .apply(color: dark ? TColor.grey : TColor.darkerGrey),
//               ),
//               Text(
//                 KtextString.homeAppBarSubTitle,
//                 style: Theme.of(context)
//                     .textTheme
//                     .headlineMedium!
//                     .apply(color: dark ? TColor.white : TColor.black),
//               ),
//             ],
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Container(
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(8),
//                     border: Border.all(
//                         color: dark ? TColor.grey : TColor.darkerGrey)),
//                 child: const Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
//                   child: TextField(
//                     decoration: InputDecoration(
//                         errorBorder: InputBorder.none,
//                         enabledBorder: InputBorder.none,
//                         focusedBorder: InputBorder.none,
//                         disabledBorder: InputBorder.none,
//                         focusedErrorBorder: InputBorder.none,
//                         hintText: 'Search Here!'),
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 24,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Expanded(
//                     child: TextButton(
//                       onPressed: () {
//                         // Navigator.push(context, MaterialPageRoute(builder: (c) => NASDAQ()));
//                         // return const ;
//                         setState(() {
//                           NASDAQ = true;
//                           kNSE = false;
//                         });
//                       },
//                       style: const ButtonStyle(
//                         backgroundColor:
//                             MaterialStatePropertyAll(Colors.transparent),
                            
//                       ),
//                       child: const Text("NASDAQ",style: TextStyle(fontSize: 20,color: Colors.white),),
//                     ),
//                   ),
//                   Expanded(
//                     child: TextButton(
//                       onPressed: () {
//                         setState(() {
//                           kNSE = true;
//                           NASDAQ = false;
//                         });
//                       },
//                       style: const ButtonStyle(
//                           backgroundColor:
//                               MaterialStatePropertyAll(Colors.transparent)),
//                       child: const Text("kNSE",style: TextStyle(fontSize: 20,color: Colors.white),),
//                     ),
//                   )
//                 ],
//               ),
//               const SizedBox(
//                 height: 24,
//               ),
//               if (NASDAQ)
//                 SingleChildScrollView(
//                   scrollDirection: Axis.vertical,
//                   child: Column(
//                     children: [
//                       list(context, "apple.html", "Apple"),
//                       list(context, "amazon.html", "Amazon"),
//                       list(context, "amd.html", "Amd"),
//                       list(context, "google.html", "Google"),
//                       list(context, "meta.html", "Meta"),
//                       list(context, "microsoft.html", "Microsoft"),
//                       list(context, "netflix.html", "Netflix"),
//                       list(context, "nvdia.html", "Nvidia"),
//                       list(context, "tesla.html", "Tesla"),
//                     ],
//                   ),
//                 ),
//               if (kNSE)
//                 SingleChildScrollView(
//                   scrollDirection: Axis.vertical,
//                   child: Column(
//                     children: [
//                       nse(context, "adaniport.csv", "Adani Port"),
//                       nse(context, "axisbank.csv", "Axis Bank"),
//                       nse(context, "coalindia.csv", "Coal India"),
//                       nse(context, "icicibank.csv", "ICICI Bank"),
//                       nse(context, "itc.csv", "Itc"),
//                       nse(context, "power_grid.csv", "Power Grid"),
//                       nse(context, "tatamotors.csv", "Tata Motors"),
//                       nse(context, "tatasteel.csv", "Tata Steel"),
//                       nse(context, "TCS-2.csv", "TCS"),
//                       nse(context, "wipro.csv", "Wipro"),
//                     ],
//                   ),
//                 )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// Widget nse(BuildContext context, String fileName, String stockName) {
//   final bool dark = Theme.of(context).brightness == Brightness.dark;
//   return Padding(
//     padding: const EdgeInsets.only(top: 9.0),
//     child: SizedBox(
//       width: double.maxFinite,
//       child: Container(
//         decoration: BoxDecoration(
//             color: Colors.transparent,
//             borderRadius: BorderRadius.circular(8),
//             border: Border.all(
//               color: TColor.primary,
//             )),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               GestureDetector(
//                 onTap: () => Get.to(
//                   () => CandlestickChart(csvfile: fileName),
//                 ),
//                 child: SizedBox(
//                   child: Text(
//                     stockName,
//                     style: Theme.of(context).textTheme.bodyLarge!.apply(
//                           fontWeightDelta: 3,
//                         ),
//                   ),
//                 ),
//               ),
//               IconButton(
//                 onPressed: () {},
//                 icon: Icon(
//                   Icons.add,
//                   color: dark ? TColor.white : TColor.darkerGrey,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     ),
//   );
// }

// Widget list(BuildContext context, String fileName, String stockName) {
//   final bool dark = Theme.of(context).brightness == Brightness.dark;
//   return Padding(
//     padding: const EdgeInsets.only(top: 9.0),
//     child: SizedBox(
//       width: double.maxFinite,
//       child: Container(
//         decoration: BoxDecoration(
//             color: Colors.transparent,
//             borderRadius: BorderRadius.circular(8),
//             border: Border.all(
//               color: TColor.primary,
//             )),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               GestureDetector(
//                 onTap: () => Get.to(
//                   () => MainPage(
//                     file: fileName,
//                     stockName: stockName,
//                   ),
//                 ),
//                 child: SizedBox(
//                   child: Text(
//                     stockName,
//                     style: Theme.of(context).textTheme.bodyLarge!.apply(
//                           fontWeightDelta: 3,
//                         ),
//                   ),
//                 ),
//               ),
//               IconButton(
//                 onPressed: () {},
//                 icon: Icon(
//                   Icons.add,
//                   color: dark ? TColor.white : TColor.darkerGrey,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     ),
//   );
// }
