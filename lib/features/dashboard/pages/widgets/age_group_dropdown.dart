import 'package:employee_manager/features/dashboard/bloc/bloc.dart';
import 'package:employee_manager/utilities/enums/employees_enum.dart';
import 'package:flutter/material.dart';

class AgeGroupDropdown extends StatelessWidget {
  final EmployeeListingState state;
  final void Function(AgeGroup? ageGroup)? onChanged;

  const AgeGroupDropdown(
    this.state, {
    super.key,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<AgeGroup>(
      value: state.ageGroup,
      underline: const Offstage(),
      items: AgeGroup.values.map((AgeGroup ageGroup) {
        return DropdownMenuItem<AgeGroup>(
          value: ageGroup,
          child: Text(ageGroup.value),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}
