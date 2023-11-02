import 'package:employee_manager/features/dashboard/bloc/bloc.dart';
import 'package:employee_manager/utilities/enums/employees_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/employee_list.dart';

class DashboardPage extends StatelessWidget {
  static const route = '/dashboard';

  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    var filterRow = Row(
      children: [
        Expanded(
          child: EmployeeSearchField(
            hintText: 'search employee',
            onChanged: (text) => context.read<EmployeeListingBloc>().add(
                  FilterByTextEvent(text),
                ),
          ),
        ),
        const SizedBox(width: 20.0),
        BlocConsumer<EmployeeListingBloc, EmployeeListingState>(
          listener: (c, state) {},
          builder: (c, state) => AgeGroupDropdown(state),
        ),
      ],
    );

    var employeeList = Expanded(
      child: BlocConsumer<EmployeeListingBloc, EmployeeListingState>(
        listener: (c, state) {},
        builder: (c, state) => switch (state) {
          EmployeeDataLoadedState() => EmployeeList(state.employees),
          NoDataState() => Center(child: Text(state.message)),
          ErrorState() => Center(child: Text(state.message)),
          _ => const Center(child: Text('Loading...')),
        },
      ),
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Employees Dashboard')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            filterRow,
            const SizedBox(height: 20.0),
            employeeList,
          ],
        ),
      ),
    );
  }
}

class EmployeeSearchField extends StatelessWidget {
  final void Function(String text)? onChanged;
  final String? hintText;

  const EmployeeSearchField({
    super.key,
    this.onChanged,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 16.0,
        ),
        hintText: hintText,
        border: const OutlineInputBorder(),
      ),
    );
  }
}

class AgeGroupDropdown extends StatelessWidget {
  final EmployeeListingState state;

  const AgeGroupDropdown(
    this.state, {
    super.key,
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
      onChanged: (ageGroup) => context.read<EmployeeListingBloc>().add(
            FilterByAgeEvent(ageGroup ?? AgeGroup.all),
          ),
    );
  }
}
