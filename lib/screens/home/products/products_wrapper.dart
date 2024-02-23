import 'package:flutter/widgets.dart';

import 'package:shop_app/router/index.dart';

@RoutePage(name: 'ProductsRouter')
class ProductsWrapper extends StatelessWidget {
  const ProductsWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }
}
