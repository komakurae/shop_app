import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:shop_app/blocs/index.dart';
import 'package:shop_app/models/index.dart';
import 'package:stx_flutter_form_bloc/stx_flutter_form_bloc.dart';

import 'package:shop_app/repositories/carts_repository.dart';
import 'package:shop_app/repositories/index.dart';
import 'package:shop_app/screens/home/carts/carts_bloc.dart';

@injectable
class CartFormBloc extends FormBloc<Cart, String> {
  late final DateTimeFieldBloc dateTime;
  late final ListFieldBloc<Product> products;
  late final SelectFieldBloc<UserProfile> users;

  final Cart? initial;
  final CartsBloc cartsBloc;
  final CartsRepository cartsRepository;
  final ProductsRepository productsRepository;
  final UsersRepository usersRepository;

  CartFormBloc({
    @factoryParam this.initial,
    required this.cartsBloc,
    required this.cartsRepository,
    required this.productsRepository,
    required this.usersRepository,
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
      final productsData = await productsRepository.getAllProducts();
      final usersData = await usersRepository.getAllUsers();

      final hashedProducts = {
        for (final product in productsData) product.id: product,
      };

      products.changeExtraData(hashedProducts);
      users.addOptions(usersData);

      if (isEditing) {
        final cartProductsWithDetails = initial!.products
            .map((productCart) => hashedProducts[productCart.productId]!)
            .toList();

        final cartUser =
            await usersRepository.getUserProfileById(initial!.userId);

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
        payload = await cartsRepository.updateCart(payload);
      } else {
        payload = await cartsRepository.createCart(payload);
      }

      emitSuccess(payload);
    } catch (e, stackTrace) {
      addError(e, stackTrace);

      emitFailure();
    }
  }
}
