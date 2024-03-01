import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:shop_app/models/product/models.dart';
import 'package:shop_app/router/index.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Stack(
      children: [
        Positioned.fill(
          child: GestureDetector(
            onTap: () {
              context.pushRoute(
                ProductRoute(productId: product.id),
              );
            },
            child: Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: DecoratedBox(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: CachedNetworkImage(
                          fit: BoxFit.contain,
                          imageUrl: product.image,
                          placeholder: (context, url) => const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      product.title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '${product.price} US\$',
                      style: theme.textTheme.labelLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: const Alignment(0.95, -0.95),
          child: IconButton.filledTonal(
            icon: const Icon(Icons.favorite_outline),
            selectedIcon: const Icon(Icons.favorite),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
