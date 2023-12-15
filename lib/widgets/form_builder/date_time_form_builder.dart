import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stx_flutter_form_bloc/stx_flutter_form_bloc.dart';

import 'package:shop_app/core/extensions/date_time_extension.dart';

class DateTimeFormBuilder extends StatelessWidget {
  const DateTimeFormBuilder({
    super.key,
    required this.fieldBloc,
  });

  final DateTimeFieldBloc fieldBloc;

  @override
  Widget build(BuildContext context) {
    final currentDateTime = DateTime.now();

    return BlocBuilder<DateTimeFieldBloc, DateTimeFieldBlocState>(
      bloc: fieldBloc,
      builder: (context, state) {
        return ElevatedButton.icon(
          icon: const Icon(Icons.calendar_month),
          label: Text(state.value?.format() ?? 'Select date'),
          onPressed: () async {
            final selectedDateTime = await showDatePicker(
              context: context,
              initialDate: state.value ?? currentDateTime,
              firstDate: state.value ?? DateTime(currentDateTime.year - 4),
              lastDate: currentDateTime,
            );
            if (selectedDateTime != null) {
              fieldBloc.changeValue(selectedDateTime);
            }
          },
        );
      },
    );
  }
}
