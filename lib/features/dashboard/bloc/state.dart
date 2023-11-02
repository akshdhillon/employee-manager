part of 'bloc.dart';

abstract class EmployeeListingState {
  final AgeGroup ageGroup;
  final String filterText;

  const EmployeeListingState({
    this.ageGroup = AgeGroup.all,
    this.filterText = '',
  });
}

class InitialState extends EmployeeListingState {}

class LoadingState extends EmployeeListingState {}

class NoDataState extends EmployeeListingState {
  final String _errorMsg = 'no data to show for %';

  const NoDataState({super.filterText, super.ageGroup});

  String get message => _errorMsg.replaceFirst('%', super.filterText);
}

class EmployeeDataLoadedState extends EmployeeListingState {
  final List<Employee> employees;

  const EmployeeDataLoadedState(
    this.employees, {
    super.ageGroup,
    super.filterText,
  });
}

class ErrorState extends EmployeeListingState {
  final Object error;
  final String message = 'Something went wrong!';

  const ErrorState(this.error);
}
