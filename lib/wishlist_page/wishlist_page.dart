import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_app/live_page/controller/fav_controller.dart';
import 'package:trading_app/live_page/widget/nse_stock.dart';

class WishListPage extends StatelessWidget {
  const WishListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavIcon());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'WishList',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: controller.stockId.length,
                  itemBuilder: (_, int count) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: NSEStock(
                        stock: controller.stockId[count],
                        stockName: controller.stockName[count],
                      
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
