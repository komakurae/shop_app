// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shop_app/blocs/auth/auth_bloc.dart' as _i16;
import 'package:shop_app/blocs/feature_flag/feature_flag_bloc.dart' as _i5;
import 'package:shop_app/blocs/index.dart' as _i18;
import 'package:shop_app/models/cart/models.dart' as _i13;
import 'package:shop_app/repositories/auth_repository.dart' as _i15;
import 'package:shop_app/repositories/carts_repository.dart' as _i3;
import 'package:shop_app/repositories/index.dart' as _i10;
import 'package:shop_app/repositories/products_repository.dart' as _i7;
import 'package:shop_app/repositories/user_repository.dart' as _i14;
import 'package:shop_app/screens/home/carts/carts_bloc.dart' as _i8;
import 'package:shop_app/screens/home/carts/modals/cart_form_bloc.dart' as _i12;
import 'package:shop_app/screens/home/products/pages/blocs/bloc/product_bloc.dart'
    as _i9;
import 'package:shop_app/screens/home/products/products_bloc.dart' as _i11;
import 'package:shop_app/screens/login/login_form_bloc.dart' as _i17;
import 'package:shop_app/services/feature_flag/feature_flag_client.dart' as _i6;
import 'package:shop_app/services/http/http_client.dart' as _i4;

extension GetItInjectableX on _i1.GetIt {
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
    gh.factory<_i3.CartsRepository>(
        () => _i3.CartsRepository(gh<_i4.HttpClient>()));
    gh.singleton<_i5.FeatureFlagBloc>(
        _i5.FeatureFlagBloc(featureFlagClient: gh<_i6.FeatureFlagClient>()));
    gh.factory<_i7.ProductsRepository>(
        () => _i7.ProductsRepository(gh<_i4.HttpClient>()));
    gh.lazySingleton<_i8.CartsBloc>(
        () => _i8.CartsBloc(repository: gh<_i3.CartsRepository>()));
    gh.factoryParam<_i9.ProductBloc, int, dynamic>((
      id,
      _,
    ) =>
        _i9.ProductBloc(
          repository: gh<_i10.ProductsRepository>(),
          id: id,
        ));
    gh.lazySingleton<_i11.ProductsBloc>(
        () => _i11.ProductsBloc(repository: gh<_i7.ProductsRepository>()));
    gh.factoryParam<_i12.CartFormBloc, _i13.Cart?, dynamic>((
      initial,
      _,
    ) =>
        _i12.CartFormBloc(
          initial: initial,
          cartsBloc: gh<_i8.CartsBloc>(),
          cartsRepository: gh<_i3.CartsRepository>(),
          productsRepository: gh<_i10.ProductsRepository>(),
        ));
    return this;
  }

// initializes the registration of auth-scope dependencies inside of GetIt
  _i1.GetIt initAuthScope({_i1.ScopeDisposeFunc? dispose}) {
    return _i2.GetItHelper(this).initScope(
      'auth',
      dispose: dispose,
      init: (_i2.GetItHelper gh) {
        gh.singleton<_i4.HttpClient>(_i4.HttpClient());
        gh.factory<_i14.UserRepository>(
            () => _i14.UserRepository(gh<_i4.HttpClient>()));
        gh.factory<_i15.AuthRepository>(
            () => _i15.AuthRepository(gh<_i4.HttpClient>()));
        gh.singleton<_i16.AuthBloc>(_i16.AuthBloc(
          authRepository: gh<_i10.AuthRepository>(),
          userRepository: gh<_i10.UserRepository>(),
        ));
        gh.factory<_i17.LoginFormBloc>(() => _i17.LoginFormBloc(
              authBloc: gh<_i18.AuthBloc>(),
              repository: gh<_i15.AuthRepository>(),
            ));
      },
    );
  }
}
