// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shop_app/blocs/auth/auth_bloc.dart' as _i6;
import 'package:shop_app/blocs/index.dart' as _i9;
import 'package:shop_app/repositories/auth_repository.dart' as _i5;
import 'package:shop_app/repositories/cards_repository.dart' as _i10;
import 'package:shop_app/repositories/index.dart' as _i7;
import 'package:shop_app/repositories/products_repository.dart' as _i11;
import 'package:shop_app/repositories/user_repository.dart' as _i4;
import 'package:shop_app/screens/home/cards/cards_bloc.dart' as _i12;
import 'package:shop_app/screens/home/products/products_bloc.dart' as _i13;
import 'package:shop_app/screens/login/login_form_bloc.dart' as _i8;
import 'package:shop_app/services/http/http_client.dart' as _i3;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of auth-scope dependencies inside of GetIt
  _i1.GetIt initAuthScope({_i1.ScopeDisposeFunc? dispose}) {
    return _i2.GetItHelper(this).initScope(
      'auth',
      dispose: dispose,
      init: (_i2.GetItHelper gh) {
        gh.singleton<_i3.HttpClient>(_i3.HttpClient());
        gh.factory<_i4.UserRepository>(
            () => _i4.UserRepository(gh<_i3.HttpClient>()));
        gh.factory<_i5.AuthRepository>(
            () => _i5.AuthRepository(gh<_i3.HttpClient>()));
        gh.singleton<_i6.AuthBloc>(_i6.AuthBloc(
          authRepository: gh<_i7.AuthRepository>(),
          userRepository: gh<_i7.UserRepository>(),
        ));
        gh.factory<_i8.LoginFormBloc>(() => _i8.LoginFormBloc(
              authBloc: gh<_i9.AuthBloc>(),
              repository: gh<_i5.AuthRepository>(),
            ));
      },
    );
  }

// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i10.CardsRepository>(
        () => _i10.CardsRepository(gh<_i3.HttpClient>()));
    gh.factory<_i11.ProductsRepository>(
        () => _i11.ProductsRepository(gh<_i3.HttpClient>()));
    gh.lazySingleton<_i12.CardsBloc>(
        () => _i12.CardsBloc(repository: gh<_i10.CardsRepository>()));
    gh.lazySingleton<_i13.ProductsBloc>(
        () => _i13.ProductsBloc(repository: gh<_i11.ProductsRepository>()));
    return this;
  }
}
