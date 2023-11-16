import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:employee_manager/features/settings/bloc/event.dart';
import 'package:employee_manager/features/settings/bloc/state.dart';
import 'package:employee_manager/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

final class ScreenDataModel {
  final String title;
  final String subtitle;
  final IconData icon;
  final Widget pushTo;

  ScreenDataModel({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.pushTo,
  });
}

class SettingsBloc extends Bloc<SettingEvents, SettingStates> {
  var screenData = <ScreenDataModel>[
    ScreenDataModel(
      title: 'Homepage',
      subtitle: 'path->sss',
      icon: Icons.home,
      pushTo: const HomePage(),
    ),
    ScreenDataModel(
      title: 'About',
      subtitle: 'path->aaa',
      icon: Icons.info,
      pushTo: const AboutPage(),
    ),
    ScreenDataModel(
      title: 'Chat',
      subtitle: 'path->fff',
      icon: Icons.chat,
      pushTo: const ChatPage(),
    ),
    ScreenDataModel(
      title: 'Display',
      subtitle: 'path->www',
      icon: Icons.display_settings,
      pushTo: const DisplayPage(),
    ),
  ];

  SettingsBloc() : super(InitialState()) {
    on<FilterScreensByText>(filterScreens);
  }

  FutureOr<void> filterScreens(
    FilterScreensByText event,
    Emitter<SettingStates> emit,
  ) {
    var result = screenData
        .where(
          (e) => e.title.toLowerCase().contains(event.filterText.toLowerCase()),
        )
        .toList();

    emit(FilteredState(result));
  }
}
