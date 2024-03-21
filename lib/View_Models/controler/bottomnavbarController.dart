import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:news_app/view/home_View/ArticalPage.dart';

import '../../view/home_View/ProfilePage.dart';
import '../../view/home_View/homeview.dart';

class bottomnavbarcontroller extends GetxController {
  RxInt index = 0.obs;
  var pages = [
    const HomeView(),
    const ArticalPage(),
    const Profilepage(),
  ];
}
