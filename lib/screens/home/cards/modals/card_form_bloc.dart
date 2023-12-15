import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:stx_flutter_form_bloc/stx_flutter_form_bloc.dart';

import 'package:shop_app/blocs/index.dart';
import 'package:shop_app/models/cards/models.dart';
import 'package:shop_app/models/product/models.dart';
import 'package:shop_app/repositories/cards_repository.dart';
import 'package:shop_app/repositories/index.dart';

@injectable
class CardFormBloc extends FormBloc<Card, String> {
  late final DateTimeFieldBloc dateTime;
  late final ListFieldBloc<Product> products;

  final Card? initial;
  final CardsBloc cardsBloc;
  final CardsRepository cardsRepository;
  final ProductsRepository productsRepository;

  CardFormBloc({
    @factoryParam this.initial,
    required this.cardsBloc,
    required this.cardsRepository,
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
        final cardProductsWithDetails = initial!.products
            .map((productCard) => hashedProducts[productCard.productId]!)
            .toList();

        products.value = cardProductsWithDetails;
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

    var payload = (initial ?? const Card()).copyWith(
      date: dateTime.value,
    );

    try {
      if (isEditing) {
        payload = await cardsRepository.updateCard(payload);
      } else {
        payload = await cardsRepository.createCard(payload);
      }

      emitSuccess(payload);
    } catch (e, stackTrace) {
      addError(e, stackTrace);

      emitFailure();
    }
  }
}
