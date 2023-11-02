import 'package:employee_manager/utilities/enums/employees_enum.dart';

extension AgeGroupExtentsion on AgeGroup? {
  String get _ageGroupHandled {
    final ageGroup = this;

    return ageGroup == null || ageGroup == AgeGroup.all
        ? '0-100'
        : ageGroup.value;
  }

  int get lowerBound => int.parse(_ageGroupHandled.split('-').first);
  int get upperBound => int.parse(_ageGroupHandled.split('-').last);
}
