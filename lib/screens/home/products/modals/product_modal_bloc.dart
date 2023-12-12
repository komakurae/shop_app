import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:stx_flutter_form_bloc/stx_flutter_form_bloc.dart';

import 'package:shop_app/models/product/models.dart';
import 'package:shop_app/repositories/products_repository.dart';
import 'package:shop_app/screens/home/products/products_bloc.dart';

@injectable
class ProductModalBloc extends FormBloc<Product, String> {
  late final TextFieldBloc title;
  late final TextFieldBloc price;
  late final TextFieldBloc description;
  late final SelectFieldBloc<Category> category;
  late final TextFieldBloc rating;

  final Product? initial;
  final ProductsRepository repository;
  final ProductsBloc productsBloc;

  ProductModalBloc({
    @factoryParam this.initial,
    required this.repository,
    required this.productsBloc,
  }) : super(isEditing: initial != null) {
    title = TextFieldBloc(
      initialValue: initial?.title,
      required: true,
    );
    price = TextFieldBloc(
      initialValue: initial?.price == null ? '' : initial?.price.toString(),
      required: true,
    );
    description = TextFieldBloc(
      initialValue: initial?.description,
      required: true,
    );
    category = SelectFieldBloc(
      initialValue: initial?.category,
      required: true,
      options: productsBloc.state.extraData,
    );
    rating = TextFieldBloc(
      initialValue: initial?.rating == null ? '' : initial?.rating.toString(),
      required: true,
    );

    addFields([
      title,
      price,
      description,
      category,
    ]);

    addSubscription(
      category.valueStream.listen((value) {
        if (value == Category.jewelery) {
          addField(rating);
        } else if (rating.state.hasFormBloc) {
          removeField(rating);
        }
      }),
    );
  }

  @override
  FutureOr<void> onSubmit() async {
    emitLoading();

    var payload = (initial ?? const Product()).copyWith(
      title: title.value!,
      price: price.valueToDouble!,
    );

    try {
      if (isEditing) {
        payload = await repository.updateProduct(payload);
      } else {
        payload = await repository.createProduct(payload);
      }

      emitSuccess(payload);
    } catch (e, stackTrace) {
      addError(e, stackTrace);

      emitFailure();
    }
  }
}
