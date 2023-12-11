import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shop_app/localization/index.dart';
import 'package:shop_app/models/index.dart';
import 'package:shop_app/router/index.dart';
import 'package:shop_app/screens/home/products/products_bloc.dart';
import 'package:shop_app/screens/home/products/widgets/category_filter_dropdown_menu.dart';
import 'package:shop_app/screens/home/products/widgets/product_item.dart';

@RoutePage()
class ProductsScreen extends StatelessWidget implements AutoRouteWrapper {
  const ProductsScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    context.read<ProductsBloc>().loadWithExtra();

    return this;
  }

  @override
  Widget build(BuildContext context) {
    EasyLocalization.of(context);

    final productsBloc = context.read<ProductsBloc>();

    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () {
          return productsBloc.loadWithExtraAsyncFuture();
        },
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              bottom: const PreferredSize(
                preferredSize: Size.fromHeight(50),
                child: Row(
                  children: [
                    CategoryFilterDropDownMenu(),
                  ],
                ),
              ),
              title: TextField(
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white70,
                  suffixIcon: Icon(Icons.search),
                ),
                onSubmitted: (value) {
                  productsBloc.search(value);
                },
              ),
            ),
            BlocBuilder<ProductsBloc, ProductsState>(
              builder: (context, state) {
                switch (state.status) {
                  case NetworkStatus.initial:
                  case NetworkStatus.loading:
                    return const SliverFillRemaining(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  case NetworkStatus.success:
                    final products = state.visibleData;

                    return SliverPadding(
                      padding: const EdgeInsets.all(10),
                      sliver: SliverGrid.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 15,
                        crossAxisSpacing: 15,
                        childAspectRatio: 1 / 1.3,
                        children: products
                            .map((product) => ProductItem(product: product))
                            .toList(),
                      ),
                    );
                  case NetworkStatus.failure:
                    return SliverFillRemaining(
                      child: ColoredBox(
                        color: Colors.red,
                        child: Center(
                          child: Text(state.errorMsg),
                        ),
                      ),
                    );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
