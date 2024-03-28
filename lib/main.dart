import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/res/colors/theme.dart';
import 'package:news_app/res/getx_localization/languages.dart';
import 'package:news_app/res/routes/routes_name.dart';

import 'View_Models/controler/Traindingnewscontroller.dart';
import 'View_Models/controler/home/homebottomController.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(GetMaterialApp(
    title: 'News App',
    translations: Languages(),
    locale: const Locale('en', 'US'),
    fallbackLocale: const Locale('en', 'US'),
    theme: darkTheme,
    themeMode: ThemeMode.system,
    darkTheme: darkTheme,
    home: homebottomController(),
  ));
}

// class Apitest extends StatefulWidget {
//   const Apitest({super.key});

//   @override
//   State<Apitest> createState() => _ApitestState();
// }

// class _ApitestState extends State<Apitest> {
//   apicontroller controller = Get.put(apicontroller());
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Api Test"),
//       ),
//       body: Column(
//         children: [
//           InkWell(
//             onTap: () {
//               print("clicl");
//               controller.getTranding();
//             },
//             child: Text("clicl this"),
//           )
//         ],
//       ),
//     );
//   }
// }
