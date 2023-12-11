import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shop_app/models/product/models.dart';
import 'package:shop_app/screens/home/products/products_bloc.dart';

class CategoryFilterDropDownMenu extends StatelessWidget {
  const CategoryFilterDropDownMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(
      buildWhen: (previous, current) {
        final isFilterSame = previous.filter == current.filter;
        final isExtraSame =
            foundation.listEquals(previous.extraData, current.extraData);

        return !isFilterSame || !isExtraSame;
      },
      builder: (context, state) {
        return DropdownMenu<Category>(
          width: 300,
          hintText: 'Sort by categories',
          initialSelection: state.filter,
          leadingIcon: const Icon(Icons.filter_alt),
          dropdownMenuEntries: state.extraData
              .map(
                (category) => DropdownMenuEntry<Category>(
                  value: category,
                  label: category.label,
                ),
              )
              .toList(),
          onSelected: (category) =>
              context.read<ProductsBloc>().filter(category ?? Category.none),
          inputDecorationTheme: Theme.of(context)
              .inputDecorationTheme
              .copyWith(border: InputBorder.none),
        );
      },
    );
  }
}
