import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stx_flutter_form_bloc/stx_flutter_form_bloc.dart';

import 'package:shop_app/blocs/index.dart';
import 'package:shop_app/models/cards/models.dart' as models;
import 'package:shop_app/models/product/models.dart';
import 'package:shop_app/router/index.dart';
import 'package:shop_app/screens/home/cards/modals/add_edit_form_screen/card_form_bloc.dart';
import 'package:shop_app/screens/home/products/widgets/product_item.dart';
import 'package:shop_app/services/index.dart';
import 'package:shop_app/widgets/form_builder/date_time_form_builder.dart';
import 'package:shop_app/widgets/index.dart';

@RoutePage()
class CardsFormScreen extends StatelessWidget implements AutoRouteWrapper {
  const CardsFormScreen({
    super.key,
    this.card,
  });

  final models.Card? card;

  @override
  Widget wrappedRoute(BuildContext context) {
    final formBloc = getIt<CardFormBloc>(param1: card);

    return BlocProvider(
      create: (context) => formBloc..initialize(),
      child: CustomFormBlocListener(
        formBloc: formBloc,
        onCancel: (context, state) => context.popRoute(),
        onSuccess: (context, state) {
          final cardsBloc = context.read<CardsBloc>();

          if (state.isEditing) {
            cardsBloc.editItem(state.response! as models.Card);
          } else {
            cardsBloc.addItem(state.response! as models.Card);
          }
          context.popRoute();
        },
        child: this,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final formBloc = context.read<CardFormBloc>();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: formBloc.cancel,
        ),
        title: Text(formBloc.isEditing ? 'Edit card' : 'Create card'),
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
          Expanded(
            flex: 2,
            child: BlocBuilder<ListFieldBloc<Product>,
                ListFieldBlocState<Product>>(
              bloc: formBloc.products,
              builder: (context, state) {
                if (state.value.isNotEmpty) {
                  return GridView.count(
                    crossAxisCount: 2,
                    children: [
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          context.pushRoute(
                            AddProductRoute(
                              hashedProducts: state.extraData,
                              selectedProducts: state.value,
                              onSubmit: (p0) => formBloc.products.addAll(p0),
                            ),
                          );
                          // why not working
                          print('after popped');
                        },
                        child: Container(
                          alignment: Alignment.center,
                          child: DecoratedBox(
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                                side:
                                    const BorderSide(color: Colors.deepPurple),
                              ),
                            ),
                            child: const Icon(
                              Icons.add,
                              size: 50,
                            ),
                          ),
                        ),
                      ),
                      ...state.value
                          .map((product) => ProductItem(product: product))
                    ],
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
