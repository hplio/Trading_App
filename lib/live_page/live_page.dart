import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_app/Chart/chart.dart';
import 'package:trading_app/constants/colors.dart';
import 'package:trading_app/constants/text.dart';

class LivePage extends StatelessWidget {
  const LivePage({super.key});

  Widget list(BuildContext context,String file_name,String Stock_name){
    return Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: SizedBox(
                  width: double.maxFinite,
                  // height: 100,
                  child: ElevatedButton(
                    style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.transparent)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MainPage(file: file_name,)),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15,right: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(Stock_name),
                            Icon(Icons.add_circle_outlined),
                          ],
                        ),
                      ),),
                ),
              );
              
  }

  @override
  Widget build(BuildContext context) {
    final bool dark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                KtextString.homeAppBarTitle,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: dark ? TColor.grey : TColor.darkerGrey),
              ),
              Text(
                KtextString.homeAppBarSubTitle,
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .apply(color: dark ? TColor.white : TColor.black),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(26.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              list(context, "apple.html", "Apple"),
              // Padding(
              //   padding: const EdgeInsets.only(top: 8.0),
              //   child: SizedBox(
              //     width: double.maxFinite,
              //     // height: 100,
              //     child: ElevatedButton(
              //       style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.transparent)),
              //         onPressed: () {
              //           Navigator.push(
              //             context,
              //             MaterialPageRoute(builder: (context) => const MainPage(file: 'apple.html',)),
              //           );
              //         },
              //         child: const Text("Apple")),
              //   ),
              // ),
              list(context, "amazon.html", "Amazon"),
              // Padding(
              //   padding: const EdgeInsets.only(top: 8.0),
              //   child: SizedBox(
              //     width: double.maxFinite,
              //     // height: 100,
              //     child: ElevatedButton(
              //       style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.transparent)),
              //         onPressed: () {
              //           Navigator.push(
              //             context,
              //             MaterialPageRoute(builder: (context) => const MainPage(file: 'amazon.html',)),
              //           );
              //         },
              //         child: const Text("Amazon")),
              //   ),
              // ),
              list(context, "amd.html", "Amd"),
              // Padding(
              //   padding: const EdgeInsets.only(top: 8.0),
              //   child: SizedBox(
              //     width: double.maxFinite,
              //     // height: 100,
              //     child: ElevatedButton(
              //       style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.transparent)),
              //         onPressed: () {
              //           Navigator.push(
              //             context,
              //             MaterialPageRoute(builder: (context) => const MainPage(file: 'amd.html',)),
              //           );
              //         },
              //         child: const Text("Amd")),
              //   ),
              // ),
              list(context, "google.html", "Google"),
              // Padding(
              //   padding: const EdgeInsets.only(top: 8.0),
              //   child: SizedBox(
              //     width: double.maxFinite,
              //     // height: 100,
              //     child: ElevatedButton(
              //       style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.transparent)),
              //         onPressed: () {
              //           Navigator.push(
              //             context,
              //             MaterialPageRoute(builder: (context) => const MainPage(file: 'google.html',)),
              //           );
              //         },
              //         child: const Text("Google")),
              //   ),
              // ),
              list(context, "meta.html", "Meta"),
              // Padding(
              //   padding: const EdgeInsets.only(top: 8.0),
              //   child: SizedBox(
              //     width: double.maxFinite,
              //     // height: 100,
              //     child: ElevatedButton(
              //       style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.transparent)),
              //         onPressed: () {
              //           Navigator.push(
              //             context,
              //             MaterialPageRoute(builder: (context) => const MainPage(file: 'meta.html',)),
              //           );
              //         },
              //         child: const Text("Meta")),
              //   ),
              // ),
              list(context, "microsoft.html", "Microsoft"),
              // Padding(
              //   padding: const EdgeInsets.only(top: 8.0),
              //   child: SizedBox(
              //     width: double.maxFinite,
              //     // height: 100,
              //     child: ElevatedButton(
              //       style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.transparent)),
              //         onPressed: () {
              //           Navigator.push(
              //             context,
              //             MaterialPageRoute(builder: (context) => const MainPage(file: 'microsoft.html',)),
              //           );
              //         },
              //         child: const Text("Microsoft")),
              //   ),
              // ),
              list(context, "netflix.html", "Netflix"),
              // Padding(
              //   padding: const EdgeInsets.only(top: 8.0),
              //   child: SizedBox(
              //     width: double.maxFinite,
              //     // height: 100,
              //     child: ElevatedButton(
              //                           style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.transparent)),

              //         onPressed: () {
              //           Navigator.push(
              //             context,
              //             MaterialPageRoute(builder: (context) => const MainPage(file: 'netflix.html',)),
              //           );
              //         },
              //         child: const Text("Netflix")),
              //   ),
              // ),
              list(context, "nvdia.html", "Nvidia"),
              // Padding(
              //   padding: const EdgeInsets.only(top: 8.0),
              //   child: SizedBox(
              //     width: double.maxFinite,
              //     // height: 100,
              //     child: ElevatedButton(
              //       style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.transparent)),
              //         onPressed: () {
              //           Navigator.push(
              //             context,
              //             MaterialPageRoute(builder: (context) => const MainPage(file: 'nvdia.html',)),
              //           );
              //         },
              //         child: const Text("Nvdia")),
              //   ),
              // ),
              
              // Padding(
              //   padding: const EdgeInsets.only(top: 8.0),
              //   child: SizedBox(
              //     width: double.maxFinite,
              //     // height: 100,
              //     child: ElevatedButton(
              //       style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.transparent)),
              //         onPressed: () {
              //           Navigator.push(
              //             context,
              //             MaterialPageRoute(builder: (context) => const MainPage(file: 'tesla.html',)),
              //           );
              //         },
              //         child: Padding(
              //           padding: const EdgeInsets.only(left: 15,right: 8),
              //           child: const Row(
              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             children: [
              //               Text("Tesla"),
              //               Icon(Icons.add_circle_outlined),
              //             ],
              //           ),
              //         ),),
              //   ),
              // ),
              
              list(context, "tesla.html", "Tesla"),
              // Text('Live page!!',
              // style: Theme.of(context).textTheme.headlineLarge,
              // )
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: non_constant_identifier_names
// Widget list(){
  
// }