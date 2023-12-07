import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/localization/index.dart';
import 'package:shop_app/models/index.dart';
import 'package:shop_app/router/index.dart';
import 'package:shop_app/screens/home/products/products_bloc.dart';
import 'package:shop_app/screens/home/products/widgets/product_item.dart';

@RoutePage()
class ProductsScreen extends StatelessWidget implements AutoRouteWrapper {
  const ProductsScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    context.read<ProductsBloc>().load();

    return this;
  }

  @override
  Widget build(BuildContext context) {
    EasyLocalization.of(context);

    return RefreshIndicator(
      onRefresh: () {
        final bloc = context.read<ProductsBloc>()..load();

        return bloc.stream
            .firstWhere((state) => state.status != NetworkStatus.loading);
      },
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            title: TextField(
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white70,
                suffixIcon: Icon(Icons.search),
              ),
              onSubmitted: (value) {
                context.read<ProductsBloc>().search(value);
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
    );
  }
}
