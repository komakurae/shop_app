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
import 'package:shop_app/blocs/index.dart' as _i12;
import 'package:shop_app/models/cards/models.dart' as _i11;
import 'package:shop_app/models/product/models.dart' as _i4;
import 'package:shop_app/repositories/auth_repository.dart' as _i15;
import 'package:shop_app/repositories/cards_repository.dart' as _i5;
import 'package:shop_app/repositories/index.dart' as _i13;
import 'package:shop_app/repositories/products_repository.dart' as _i7;
import 'package:shop_app/repositories/user_repository.dart' as _i14;
import 'package:shop_app/screens/home/cards/cards_bloc.dart' as _i8;
import 'package:shop_app/screens/home/cards/modals/add_edit_form_screen/card_form_bloc.dart'
    as _i10;
import 'package:shop_app/screens/home/cards/modals/add_product_screen/add_product_form_bloc.dart'
    as _i3;
import 'package:shop_app/screens/home/products/products_bloc.dart' as _i9;
import 'package:shop_app/screens/login/login_form_bloc.dart' as _i17;
import 'package:shop_app/services/http/http_client.dart' as _i6;

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
    gh.factoryParam<_i3.AddProductFormBloc, Map<int, _i4.Product>,
        List<_i4.Product>>((
      hashedProducts,
      selectedProducts,
    ) =>
        _i3.AddProductFormBloc(
          hashedProducts: hashedProducts,
          selectedProducts: selectedProducts,
        ));
    gh.factory<_i5.CardsRepository>(
        () => _i5.CardsRepository(gh<_i6.HttpClient>()));
    gh.factory<_i7.ProductsRepository>(
        () => _i7.ProductsRepository(gh<_i6.HttpClient>()));
    gh.lazySingleton<_i8.CardsBloc>(
        () => _i8.CardsBloc(repository: gh<_i5.CardsRepository>()));
    gh.lazySingleton<_i9.ProductsBloc>(
        () => _i9.ProductsBloc(repository: gh<_i7.ProductsRepository>()));
    gh.factoryParam<_i10.CardFormBloc, _i11.Card?, dynamic>((
      initial,
      _,
    ) =>
        _i10.CardFormBloc(
          initial: initial,
          cardsBloc: gh<_i12.CardsBloc>(),
          cardsRepository: gh<_i5.CardsRepository>(),
          productsRepository: gh<_i13.ProductsRepository>(),
        ));
    return this;
  }

// initializes the registration of auth-scope dependencies inside of GetIt
  _i1.GetIt initAuthScope({_i1.ScopeDisposeFunc? dispose}) {
    return _i2.GetItHelper(this).initScope(
      'auth',
      dispose: dispose,
      init: (_i2.GetItHelper gh) {
        gh.singleton<_i6.HttpClient>(_i6.HttpClient());
        gh.factory<_i14.UserRepository>(
            () => _i14.UserRepository(gh<_i6.HttpClient>()));
        gh.factory<_i15.AuthRepository>(
            () => _i15.AuthRepository(gh<_i6.HttpClient>()));
        gh.singleton<_i16.AuthBloc>(_i16.AuthBloc(
          authRepository: gh<_i13.AuthRepository>(),
          userRepository: gh<_i13.UserRepository>(),
        ));
        gh.factory<_i17.LoginFormBloc>(() => _i17.LoginFormBloc(
              authBloc: gh<_i12.AuthBloc>(),
              repository: gh<_i15.AuthRepository>(),
            ));
      },
    );
  }
}
