import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'package:shop_app/models/index.dart';
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
Future<void> configureUserDependencies(
  UserProfile user,
) async {
  final isRegistered = getIt.isRegistered<EnvironmentFilter>(
    instanceName: kEnvironmentsFilterName,
  );

  if (isRegistered) {
    getIt
      ..unregister<EnvironmentFilter>(instanceName: kEnvironmentsFilterName)
      ..unregister<Set<String>>(instanceName: kEnvironmentsName);
  }
  prints('before registration');

  getIt
    ..init(environment: 'me')
    ..registerSingleton<bool>(false)
    ..registerSingleton<int>(user.id);
}

void configureUserModeDependencies(UserProfile user) {
  final isRegistered = getIt.isRegistered<EnvironmentFilter>(
    instanceName: kEnvironmentsFilterName,
  );

  if (isRegistered) {
    getIt
      ..unregister<EnvironmentFilter>(instanceName: kEnvironmentsFilterName)
      ..unregister<Set<String>>(instanceName: kEnvironmentsName);
  }

  getIt.registerSingleton<int>(user.id, instanceName: 'userId');

  final filter = SimpleEnvironmentFilter(
    environments: {'userMode'},
    filter: (registerFor) => registerFor.contains('userMode'),
  );

  getIt.init(environmentFilter: filter);
}
