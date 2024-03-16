import 'dart:ui';

import 'package:news_app/Models/Home/user_List_model.dart';
import 'package:news_app/data/Network/Network_Api.dart';
import 'package:news_app/res/Api_url/app_url.dart';

class HomeRepository {
  final _apiService = NetworkApiServices();

  Future<UserListModel> userListApi() async {
    dynamic response = await _apiService.getApi(AppUrl.userListApi);
    return UserListModel.fromJson(response);
  }
}
