// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shop_app/blocs/auth/auth_bloc.dart' as _i8;
import 'package:shop_app/blocs/feature_flag/feature_flag_bloc.dart' as _i3;
import 'package:shop_app/blocs/index.dart' as _i11;
import 'package:shop_app/models/index.dart' as _i20;
import 'package:shop_app/repositories/auth_repository.dart' as _i7;
import 'package:shop_app/repositories/carts_repository.dart' as _i12;
import 'package:shop_app/repositories/index.dart' as _i9;
import 'package:shop_app/repositories/products_repository.dart' as _i14;
import 'package:shop_app/repositories/users_carts_repository.dart' as _i13;
import 'package:shop_app/repositories/users_repository.dart' as _i6;
import 'package:shop_app/screens/home/carts/carts_bloc.dart' as _i16;
import 'package:shop_app/screens/home/carts/modals/cart_form_bloc.dart' as _i19;
import 'package:shop_app/screens/home/products/pages/blocs/bloc/product_bloc.dart'
    as _i17;
import 'package:shop_app/screens/home/products/products_bloc.dart' as _i18;
import 'package:shop_app/screens/home/users/users_bloc.dart' as _i15;
import 'package:shop_app/screens/login/login_form_bloc.dart' as _i10;
import 'package:shop_app/services/http/http_client.dart' as _i5;
import 'package:shop_app/services/index.dart' as _i4;

const String _me = 'me';
const String _userMode = 'userMode';

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of auth-scope dependencies inside of GetIt
  _i1.GetIt initAuthScope({_i1.ScopeDisposeFunc? dispose}) {
    return _i2.GetItHelper(this).initScope(
      'auth',
      dispose: dispose,
      init: (_i2.GetItHelper gh) {
        gh.singleton<_i3.FeatureFlagBloc>(_i3.FeatureFlagBloc(
            featureFlagClient: gh<_i4.FeatureFlagClient>()));
        gh.singleton<_i5.HttpClient>(_i5.HttpClient());
        gh.factory<_i6.UsersRepository>(
            () => _i6.UsersRepository(gh<_i5.HttpClient>()));
        gh.factory<_i7.AuthRepository>(
            () => _i7.AuthRepository(gh<_i5.HttpClient>()));
        gh.singleton<_i8.AuthBloc>(_i8.AuthBloc(
          authRepository: gh<_i9.AuthRepository>(),
          userRepository: gh<_i9.UsersRepository>(),
          featureFlagBloc: gh<_i3.FeatureFlagBloc>(),
        ));
        gh.factory<_i10.LoginFormBloc>(() => _i10.LoginFormBloc(
              authBloc: gh<_i11.AuthBloc>(),
              repository: gh<_i7.AuthRepository>(),
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
    gh.factory<_i12.CartsRepository>(
      () => _i12.CartsRepository(gh<_i5.HttpClient>()),
      registerFor: {_me},
    );
    gh.factory<_i12.CartsRepository>(
      () => _i13.UserCartRepository(
        gh<_i5.HttpClient>(),
        userId: gh<int>(instanceName: 'userId'),
      ),
      registerFor: {_userMode},
    );
    gh.factory<_i14.ProductsRepository>(
        () => _i14.ProductsRepository(gh<_i5.HttpClient>()));
    gh.singleton<_i15.UsersBloc>(_i15.UsersBloc(gh<_i9.UsersRepository>()));
    gh.singleton<_i16.CartsBloc>(
      _i16.CartsBloc(repository: gh<_i12.CartsRepository>()),
      registerFor: {
        _me,
        _userMode,
      },
    );
    gh.factoryParam<_i17.ProductBloc, int, dynamic>((
      id,
      _,
    ) =>
        _i17.ProductBloc(
          repository: gh<_i9.ProductsRepository>(),
          id: id,
        ));
    gh.lazySingleton<_i18.ProductsBloc>(
        () => _i18.ProductsBloc(repository: gh<_i14.ProductsRepository>()));
    gh.factoryParam<_i19.CartFormBloc, _i20.Cart?, dynamic>((
      initial,
      _,
    ) =>
        _i19.CartFormBloc(
          initial: initial,
          cartsBloc: gh<_i11.CartsBloc>(),
          usersBloc: gh<_i11.UsersBloc>(),
          productsBloc: gh<_i11.ProductsBloc>(),
          repository: gh<_i12.CartsRepository>(),
        ));
    return this;
  }
}
