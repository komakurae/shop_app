import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'package:shop_app/router/index.dart';
import 'package:shop_app/services/index.dart';
import 'injector.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  asExtension: true,
  initializerName: 'init',
)
//register only auth dependencies
Future<void> configureAuthDependencies() async {
  final client = await FeatureFlagClient.init();

  getIt
    ..registerSingleton(AppRouter())
    ..registerSingleton(client)
    ..initAuthScope();
}

//register other dependencies (except auth ones)
void configureUserDependencies(GetIt getIt) {
  getIt.init();
}
