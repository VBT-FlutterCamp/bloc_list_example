class StirngConstants {
  static StirngConstants? _instace;
  static StirngConstants get instance {
    _instace ??= StirngConstants._init();
    return _instace!;
  }

  StirngConstants._init();

  static const baseUrl = 'https://reqres.in/';
}
