import 'package:flutter/material.dart';

import '../../../../data/models/employee_model.dart';

class EmployeeList extends StatelessWidget {
  final List<Employee> details;
  const EmployeeList(this.details, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: details.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(details[index].name),
          subtitle: Text('Age: ${details[index].age}'),
        );
      },
    );
  }
}
