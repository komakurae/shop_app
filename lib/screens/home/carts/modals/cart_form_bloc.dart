import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:stx_flutter_form_bloc/stx_flutter_form_bloc.dart';

import 'package:shop_app/blocs/index.dart';
import 'package:shop_app/models/index.dart';
import 'package:shop_app/repositories/carts_repository.dart';

@injectable
class CartFormBloc extends FormBloc<Cart, String> {
  late final DateTimeFieldBloc dateTime;
  late final ListFieldBloc<Product> products;
  late final SelectFieldBloc<UserProfile> users;

  final Cart? initial;
  final CartsBloc cartsBloc;
  final UsersBloc usersBloc;
  final ProductsBloc productsBloc;

  final CartsRepository repository;

  CartFormBloc({
    @factoryParam this.initial,
    required this.cartsBloc,
    required this.usersBloc,
    required this.productsBloc,
    required this.repository,
  }) : super(isEditing: initial != null) {
    dateTime = DateTimeFieldBloc(
      initialValue: initial?.date,
      required: true,
    );
    products = ListFieldBloc();

    users = SelectFieldBloc(
      required: true,
    );

    addFields([
      dateTime,
      products,
    ]);
  }

  @override
  FutureOr<void> onInitialize(Map<String, dynamic> params) async {
    emitLoading();

    try {
      await Future.wait(
        [
          usersBloc.initLoadAsyncFuture(),
          productsBloc.initLoadAsyncFuture(),
        ],
      );

      final usersList = usersBloc.state.data;
      final productsList = productsBloc.state.data;

      final hashedProducts = {
        for (final product in productsList) product.id: product,
      };

      products.changeExtraData(hashedProducts);
      users.addOptions(usersList);

      if (isEditing) {
        final cartProductsWithDetails = initial!.products
            .map((productCart) => hashedProducts[productCart.productId]!)
            .toList();

        final cartUser =
            usersList.firstWhere((user) => user.id == initial!.userId);

        users.updateInitial(cartUser);

        products.value = cartProductsWithDetails;
      }

      emitInitial();
    } catch (e, stackTrace) {
      addError(e, stackTrace);

      emitFailure();
    }
  }

  @override
  FutureOr<void> onSubmit() async {
    emitLoading();

    var payload = (initial ?? const Cart()).copyWith(
      date: dateTime.value,
      userId: users.value!.id,
    );

    try {
      if (isEditing) {
        payload = await repository.updateCart(payload);
        cartsBloc.editItemAsync(payload);
      } else {
        payload = await repository.createCart(payload);
        cartsBloc.addItemAsync(payload);
      }

      emitSuccess(payload);
    } catch (e, stackTrace) {
      addError(e, stackTrace);

      emitFailure();
    }
  }
}
