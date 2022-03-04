import 'package:bloc_example_list/core/constans/extension/network_path.dart';
import 'package:dio/dio.dart';

import '../model/home_model.dart';

abstract class IHomeService {
  final Dio dio;

  IHomeService(this.dio);

  final String homePath = IHomeServicePath.homePath.rawValue;

  Future<HomeModel?> fetchHomeDatas();
}

class HomeService extends IHomeService {
  HomeService(Dio dio) : super(dio);

  @override
  Future<HomeModel?> fetchHomeDatas() async {
    final response = await dio.get(homePath);

    if (response.statusCode == 200) {
      return HomeModel.fromJson(response.data);
    } else {
      return null;
    }
  }
}
