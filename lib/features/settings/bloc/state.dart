import 'package:employee_manager/features/settings/bloc/bloc.dart';
import 'package:flutter/widgets.dart';

sealed class SettingStates {}

final class InitialState extends SettingStates {}

final class FilteredState extends SettingStates {
  final List<ScreenDataModel> data;

  FilteredState(this.data);
}
