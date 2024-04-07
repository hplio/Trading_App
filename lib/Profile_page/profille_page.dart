import 'package:flutter/material.dart';

class ProfilePagge extends StatelessWidget {
  const ProfilePagge({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Profile',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(26.0),
          child: Column(
            children: [
              Text(
                'User Profile!!',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// echo "# Trading_App" >> README.md
// git init
// git add README.md
// git commit -m "first commit"
// git branch -M main
// git remote add origin https://github.com/hplio/Trading_App.git
// git push -u origin main