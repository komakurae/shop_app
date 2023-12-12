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
import 'package:shop_app/models/product/models.dart' as _i17;
import 'package:shop_app/repositories/auth_repository.dart' as _i5;
import 'package:shop_app/repositories/chats_repository.dart' as _i10;
import 'package:shop_app/repositories/index.dart' as _i7;
import 'package:shop_app/repositories/posts_repository.dart' as _i11;
import 'package:shop_app/repositories/products_repository.dart' as _i12;
import 'package:shop_app/repositories/user_repository.dart' as _i4;
import 'package:shop_app/screens/home/messages/chats/bloc/chats_bloc.dart'
    as _i13;
import 'package:shop_app/screens/home/messages/posts/posts_bloc.dart' as _i14;
import 'package:shop_app/screens/home/products/modals/product_modal_bloc.dart'
    as _i16;
import 'package:shop_app/screens/home/products/products_bloc.dart' as _i15;
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
    gh.factory<_i10.ChatsRepository>(
        () => _i10.ChatsRepository(gh<_i3.HttpClient>()));
    gh.factory<_i11.PostsRepository>(
        () => _i11.PostsRepository(gh<_i3.HttpClient>()));
    gh.factory<_i12.ProductsRepository>(
        () => _i12.ProductsRepository(gh<_i3.HttpClient>()));
    gh.lazySingleton<_i13.ChatsBloc>(
        () => _i13.ChatsBloc(repository: gh<_i7.ChatsRepository>()));
    gh.lazySingleton<_i14.PostsBloc>(
        () => _i14.PostsBloc(gh<_i7.PostsRepository>()));
    gh.lazySingleton<_i15.ProductsBloc>(
        () => _i15.ProductsBloc(repository: gh<_i12.ProductsRepository>()));
    gh.factoryParam<_i16.ProductModalBloc, _i17.Product?, dynamic>((
      initial,
      _,
    ) =>
        _i16.ProductModalBloc(
          initial: initial,
          repository: gh<_i12.ProductsRepository>(),
          productsBloc: gh<_i15.ProductsBloc>(),
        ));
    return this;
  }
}
