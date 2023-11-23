import 'package:example/core/endpoint/network.dart';

import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setup() {
  locator.registerLazySingleton<ApiEndpoint>(() => ApiEndpoint());
  locator.registerLazySingleton<DioConfiguration>(() => DioConfiguration());
}
