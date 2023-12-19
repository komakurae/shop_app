import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stx_flutter_form_bloc/stx_flutter_form_bloc.dart';

import 'package:shop_app/models/product/models.dart';
import 'package:shop_app/router/index.dart';
import 'package:shop_app/screens/home/cards/modals/add_product_screen/add_product_form_bloc.dart';
import 'package:shop_app/screens/home/products/widgets/product_item.dart';
import 'package:shop_app/services/index.dart';

@RoutePage()
class AddProductScreen extends StatelessWidget implements AutoRouteWrapper {
  const AddProductScreen({
    super.key,
    required this.hashedProducts,
    required this.selectedProducts,
    required this.onSubmit,
  });

  final Map<int, Product> hashedProducts;
  final List<Product> selectedProducts;
  final void Function(List<Product>) onSubmit;

  @override
  Widget wrappedRoute(BuildContext context) {
    final formBloc = getIt<AddProductFormBloc>(
      param1: hashedProducts,
      param2: selectedProducts,
    );

    return BlocProvider(
      create: (context) => formBloc,
      child: FormBlocListener(
        formBloc: formBloc,
        onSuccess: (context, state) {
          onSubmit.call(state.response! as List<Product>);
          context.popRoute();
        },
        child: this,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final formBloc = context.read<AddProductFormBloc>();
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              formBloc.submit();
            },
            child: const Text('Confirm'),
          ),
        ],
      ),
      body: BlocBuilder<MultiSelectFieldBloc, MultiSelectFieldBlocState>(
        bloc: formBloc.products,
        builder: (context, state) {
          return GridView.count(
            crossAxisCount: 3,
            children: state.options.map((value) {
              if (state.value.contains(value)) {
                return Stack(
                  children: [
                    ProductItem(product: value),
                    Transform.rotate(
                      angle: pi / 12,
                      child: const Text(
                        'Added',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                );
              }

              return GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => formBloc.products.selectValue(value),
                child: ProductItem(product: value),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
