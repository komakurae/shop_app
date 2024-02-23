import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:stx_flutter_form_bloc/stx_flutter_form_bloc.dart';

import 'package:shop_app/models/cart/models.dart';
import 'package:shop_app/models/product/models.dart';
import 'package:shop_app/repositories/carts_repository.dart';
import 'package:shop_app/repositories/index.dart';
import 'package:shop_app/screens/home/carts/carts_bloc.dart';

@injectable
class CartFormBloc extends FormBloc<Cart, String> {
  late final DateTimeFieldBloc dateTime;
  late final ListFieldBloc<Product> products;

  final Cart? initial;
  final CartsBloc cartsBloc;
  final CartsRepository cartsRepository;
  final ProductsRepository productsRepository;

  CartFormBloc({
    @factoryParam this.initial,
    required this.cartsBloc,
    required this.cartsRepository,
    required this.productsRepository,
  }) : super(isEditing: initial != null) {
    dateTime = DateTimeFieldBloc(
      initialValue: initial?.date,
      required: true,
    );
    products = ListFieldBloc();

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

      final hashedProducts = {
        for (final product in productsData) product.id: product,
      };

      products.extraData = hashedProducts;

      if (initial != null) {
        final cartProductsWithDetails = initial!.products
            .map((productCart) => hashedProducts[productCart.productId]!)
            .toList();

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
