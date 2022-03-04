import 'package:bloc_example_list/home/model/home_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vexana/vexana.dart';

void main() {
  INetworkManager? manager;
  setUp(() {
    const String baseUrl = 'https://reqres.in/api/users?page=2';
    manager = NetworkManager(isEnableLogger: true, options: BaseOptions(baseUrl: 'https://reqres.in/'));
  });
  test('Home  Service Test', () async {
    final response =
        await manager?.send<HomeModel, HomeModel>('api/users?page=2', parseModel: HomeModel(), method: RequestType.GET);

    expect(response, isNotNull);
  });
}
