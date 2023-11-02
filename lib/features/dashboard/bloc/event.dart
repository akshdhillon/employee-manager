part of 'bloc.dart';

abstract class EmployeeListingEvent {
  const EmployeeListingEvent();
}

class FetchEmployeesEvent extends EmployeeListingEvent {}

class FilterByTextEvent extends EmployeeListingEvent {
  final String inputText;

  const FilterByTextEvent(this.inputText);

  String get filterText => inputText.toLowerCase();
}

class FilterByAgeEvent extends EmployeeListingEvent {
  final AgeGroup ageGroup;

  const FilterByAgeEvent(this.ageGroup);
}
