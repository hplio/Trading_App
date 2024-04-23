import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:trading_app/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:trading_app/authenticatin_repository/auth_repo.dart';
import 'firebase_options.dart';

void main() async {
//  final WidgetsBinding widgetsBinding =
//       WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((FirebaseApp value) => Get.put(AuthRepo()));
  runApp(const MyApp());
}


// await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   ).then((FirebaseApp value) => Get.put(AuthenticationRepo()));
//   runApp(const App());
