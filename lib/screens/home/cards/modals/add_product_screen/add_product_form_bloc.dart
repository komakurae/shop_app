import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:shop_app/models/product/models.dart';
import 'package:stx_flutter_form_bloc/stx_flutter_form_bloc.dart';

@injectable
class AddProductFormBloc extends FormBloc<List<Product>, String> {
  late final MultiSelectFieldBloc<Product> products;
  late final TextFieldBloc title;

  final Map<int, Product> hashedProducts;
  final List<Product> selectedProducts;

  AddProductFormBloc({
    @factoryParam required this.hashedProducts,
    @factoryParam required this.selectedProducts,
  }) : super() {
    title = TextFieldBloc();

    products = MultiSelectFieldBloc(
      initialValue: selectedProducts,
      extraData: hashedProducts,
      options: hashedProducts.values.toList(),
    );

    addFields([
      title,
      products,
    ]);
  }

  @override
  FutureOr<void> onSubmit() {
    if (products.value.isEmpty) {
      emitFailure();
    } else {
      emitSuccess(products.value);
    }
  }
}
