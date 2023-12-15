import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:shop_app/models/product/models.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
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
              placeholder: (context, url) => const CircularProgressIndicator(),
            ),
          ),
        ),
        Text(
          product.title,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
        Text(
          '${product.price} US\$',
          style: theme.textTheme.labelLarge!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
