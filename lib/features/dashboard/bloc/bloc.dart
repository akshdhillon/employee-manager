import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:employee_manager/utilities/enums/employees_enum.dart';
import 'package:employee_manager/utilities/extensions/employee_extension.dart';

import '../../../data/models/employee_model.dart';
import '../../../data/repositories/employee_repository.dart';

part 'event.dart';
part 'state.dart';

typedef EmployeeBloc = Bloc<EmployeeListingEvent, EmployeeListingState>;

class EmployeeListingBloc extends EmployeeBloc {
  final _employeeRepo = EmployeeRepository();

  var employees = <Employee>[];

  EmployeeListingBloc() : super(InitialState()) {
    on<FetchEmployeesEvent>(fetchEmployees);
    on<FilterByTextEvent>(filterEmployeesByText);
    on<FilterByAgeEvent>(filterEmployeesByAge);
  }


  FutureOr<void> filterEmployeesByAge(
    FilterByAgeEvent event,
    Emitter<EmployeeListingState> emit,
  ) async {
    final result = employees.where(
      (employee) =>
          employee.nameFormatted.contains(state.filterText) &&
          employee.age >= event.ageGroup.lowerBound &&
          employee.age <= event.ageGroup.upperBound,
    );

    if (result.isEmpty) {
      emit(NoDataState(filterText: state.filterText, ageGroup: event.ageGroup));
    } else {
      emit(EmployeeDataLoadedState(
        result.toList(),
        ageGroup: event.ageGroup,
        filterText: state.filterText,
      ));
    }
  }

  FutureOr<void> filterEmployeesByText(
    FilterByTextEvent event,
    Emitter<EmployeeListingState> emit,
  ) async {
    final result = employees.where(
      (employee) =>
          employee.nameFormatted.contains(event.filterText) &&
          employee.age >= state.ageGroup.lowerBound &&
          employee.age <= state.ageGroup.upperBound,
    );

    if (result.isEmpty) {
      emit(NoDataState(filterText: event.filterText, ageGroup: state.ageGroup));
    } else {
      emit(EmployeeDataLoadedState(
        result.toList(),
        ageGroup: state.ageGroup,
        filterText: event.filterText,
      ));
    }
  }

  FutureOr<void> fetchEmployees(
    FetchEmployeesEvent event,
    Emitter<EmployeeListingState> emit,
  ) async {
    try {
      emit(LoadingState());

      employees = await _employeeRepo.fetchEmployeeData();

      emit(EmployeeDataLoadedState(employees));
    } catch (error) {
      emit(ErrorState(error));
    }
  }
}
