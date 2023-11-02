import 'package:employee_manager/features/dashboard/bloc/bloc.dart';
import 'package:employee_manager/utilities/enums/employees_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/age_group_dropdown.dart';
import 'widgets/employee_list.dart';
import 'widgets/employee_search_field.dart';

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
          builder: (c, state) => AgeGroupDropdown(
            state,
            onChanged: (ageGroup) => context.read<EmployeeListingBloc>().add(
                  FilterByAgeEvent(ageGroup ?? AgeGroup.all),
                ),
          ),
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
