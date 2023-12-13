import 'package:flutter/material.dart';
import 'package:shop_app/models/cards/models.dart' as models;

class CardItem extends StatelessWidget {
  const CardItem({
    super.key,
    required this.card,
  });

  final models.Card card;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          card.date.toString(),
        ),
        ...card.products.map(
          (e) => Text(
            e.toString(),
          ),
        ),
      ],
    );
  }
}
