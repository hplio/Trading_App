import 'package:flutter/material.dart';

class WishListPage extends StatelessWidget {
  const WishListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'WishList',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(26.0),
          child: Column(
            children: [
              Text('wishlist!!',
              style: Theme.of(context).textTheme.headlineLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
