import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stx_flutter_form_bloc/stx_flutter_form_bloc.dart';

import 'package:shop_app/models/product/models.dart';
import 'package:shop_app/router/index.dart';
import 'package:shop_app/screens/home/products/modals/product_modal_bloc.dart';
import 'package:shop_app/screens/home/products/products_bloc.dart';
import 'package:shop_app/services/index.dart';
import 'package:shop_app/widgets/form_builder/index.dart';
import 'package:shop_app/widgets/form_builder/select_input_form_builder.dart';

@RoutePage()
class ProductsModalScreen extends StatelessWidget implements AutoRouteWrapper {
  const ProductsModalScreen({
    super.key,
    required this.item,
  });

  final Product? item;

  @override
  Widget wrappedRoute(BuildContext context) {
    final formBloc = getIt<ProductModalBloc>(param1: item);

    return BlocProvider(
      create: (context) => formBloc,
      child: CustomFormBlocListener(
        formBloc: formBloc,
        onCancel: (context, state) => context.popRoute(),
        onSuccess: (context, state) {
          final productsBloc = context.read<ProductsBloc>();

          if (state.isEditing) {
            productsBloc.editItem(state.response! as Product);
          } else {
            productsBloc.addItem(state.response! as Product);
          }
          context.popRoute();
        },
        child: this,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final formBloc = context.read<ProductModalBloc>();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              children: [
                Text(formBloc.isEditing ? 'Edit product' : 'Create product'),
                const Spacer(),
                TextButton(
                  onPressed: formBloc.cancel,
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: formBloc.submit,
                  child: Text(formBloc.isEditing ? 'Save' : 'Create'),
                ),
              ],
            ),
            TextInputFormBuilder(
              fieldBloc: formBloc.title,
              label: 'Title',
              hintText: 'Enter title',
            ),
            TextInputFormBuilder(
              fieldBloc: formBloc.price,
              label: 'Price',
              hintText: 'Enter price',
            ),
            TextInputFormBuilder(
              fieldBloc: formBloc.description,
              label: 'Description',
              hintText: 'Enter description',
            ),
            SelectInputFormBuilder<Category>(
              fieldBloc: formBloc.category,
              toLabel: (category) => category.label,
              hintText: 'Select category',
            ),
            BlocBuilder<TextFieldBloc, InputFieldBlocState>(
              bloc: formBloc.rating,
              builder: (context, state) {
                if (state.hasFormBloc) {
                  return TextInputFormBuilder(
                    fieldBloc: formBloc.rating,
                    label: 'Rating',
                    hintText: 'Enter rating',
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
