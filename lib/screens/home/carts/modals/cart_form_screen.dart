import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stx_flutter_form_bloc/stx_flutter_form_bloc.dart';

import 'package:shop_app/models/cart/models.dart' as models;
import 'package:shop_app/models/product/models.dart';
import 'package:shop_app/router/index.dart';
import 'package:shop_app/screens/home/carts/carts_bloc.dart';
import 'package:shop_app/screens/home/carts/modals/cart_form_bloc.dart';
import 'package:shop_app/screens/home/products/widgets/product_item.dart';
import 'package:shop_app/services/index.dart';
import 'package:shop_app/widgets/form_builder/date_time_form_builder.dart';
import 'package:shop_app/widgets/index.dart';

@RoutePage()
class CartsFormScreen extends StatelessWidget implements AutoRouteWrapper {
  const CartsFormScreen({
    super.key,
    this.cart,
  });

  final models.Cart? cart;

  @override
  Widget wrappedRoute(BuildContext context) {
    final formBloc = getIt<CartFormBloc>(param1: cart);

    return BlocProvider(
      create: (context) => formBloc..initialize(),
      child: CustomFormBlocListener(
        formBloc: formBloc,
        onCancel: (context, state) => context.popRoute(),
        onSuccess: (context, state) {
          final cartsBloc = context.read<CartsBloc>();

          if (state.isEditing) {
            cartsBloc.editItem(state.response! as models.Cart);
          } else {
            cartsBloc.addItem(state.response! as models.Cart);
          }
          context.popRoute();
        },
        child: this,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final formBloc = context.read<CartFormBloc>();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: formBloc.cancel,
        ),
        title: Text(formBloc.isEditing ? 'Edit Cart' : 'Create Cart'),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: formBloc.submit,
          ),
        ],
      ),
      body: Column(
        children: [
          DateTimeFormBuilder(
            fieldBloc: formBloc.dateTime,
          ),
          // later I will add some reusable widget for Products
          Expanded(
            flex: 2,
            child: BlocBuilder<ListFieldBloc<Product>,
                ListFieldBlocState<Product>>(
              bloc: formBloc.products,
              builder: (context, state) {
                if (state.value.isNotEmpty) {
                  return GridView.count(
                    crossAxisCount: 2,
                    children: state.value
                        .map((product) => ProductItem(product: product))
                        .toList(),
                  );
                }

                return const Center(
                  child: Text('No products'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
