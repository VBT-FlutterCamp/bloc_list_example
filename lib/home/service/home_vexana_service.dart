import 'package:vexana/vexana.dart';

import '../model/home_model.dart';

abstract class IHomeService {
  final INetworkManager manager;

  IHomeService(this.manager);

  Future<HomeModel?> fetchHomeDatas();
}

class HomeService extends IHomeService {
  HomeService(INetworkManager manager) : super(manager);

  @override
  Future<HomeModel?> fetchHomeDatas() async {
    final response =
        await manager.send('https://reqres.in/api/users?page=2', parseModel: HomeModel(), method: RequestType.GET);

    return response.data;
  }
}
