import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stx_flutter_form_bloc/stx_flutter_form_bloc.dart';

class SelectInputFormBuilder<T> extends StatefulWidget {
  const SelectInputFormBuilder({
    super.key,
    required this.fieldBloc,
    required this.toLabel,
    this.hintText,
    this.nextFieldFocusNode,
  });

  final SelectFieldBloc<T> fieldBloc;

  final String? hintText;
  final FocusNode? nextFieldFocusNode;

  final String Function(T) toLabel;

  @override
  State<SelectInputFormBuilder<T>> createState() =>
      _SelectInputFormBuilderState<T>();
}

class _SelectInputFormBuilderState<T> extends State<SelectInputFormBuilder<T>> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectFieldBloc<T>, SelectFieldBlocState<T>>(
      bloc: widget.fieldBloc,
      builder: (context, state) {
        return DropdownMenu<T>(
          hintText: widget.hintText,
          initialSelection: widget.fieldBloc.value,
          onSelected: (value) {
            widget.fieldBloc.changeValue(value);
          },
          dropdownMenuEntries: widget.fieldBloc.options.map((item) {
            final label = widget.toLabel(item);

            return DropdownMenuEntry<T>(
              value: item,
              label: label,
            );
          }).toList(),
        );
      },
    );
  }
}
