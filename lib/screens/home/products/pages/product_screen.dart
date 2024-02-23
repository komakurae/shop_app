import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shop_app/router/index.dart';
import 'package:shop_app/screens/home/products/pages/blocs/bloc/product_bloc.dart';
import 'package:shop_app/services/index.dart';

@RoutePage()
class ProductScreen extends StatelessWidget implements AutoRouteWrapper {
  const ProductScreen({
    super.key,
    @PathParam('id') this.productId,
  });

  final int? productId;

  @override
  Widget wrappedRoute(BuildContext context) {
    final bloc = getIt<ProductBloc>(param1: productId);

    return BlocProvider(
      create: (context) => bloc..load(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<ProductBloc>();

    return Scaffold(
      appBar: AppBar(
        title: Text(bloc.state.data.title),
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        bloc: bloc,
        builder: (context, state) {
          if (state.status.isLoading || state.status.isInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final product = state.data;

          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Row(
                  children: [
                    SizedBox(
                      width: 200,
                      height: 200,
                      child: Image.network(product.image),
                    ),
                  ],
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 16)),
              SliverToBoxAdapter(child: Text(product.description)),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton.outlined(
                          onPressed: () {},
                          icon: const Icon(Icons.favorite_border),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.shopping_cart),
                          label: const Text('Add to cart'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
