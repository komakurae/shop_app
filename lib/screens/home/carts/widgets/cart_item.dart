import 'package:flutter/material.dart';

import 'package:shop_app/core/extensions/date_time_extension.dart';
import 'package:shop_app/models/cart/models.dart' as models;

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.cart,
  });

  final models.Cart cart;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          cart.date!.format('yyyy.MM.dd'),
        ),
        ...cart.products.map(
          (cartProduct) => Text(
            '${cartProduct.quantity}',
          ),
        ),
      ],
    );
  }
}
