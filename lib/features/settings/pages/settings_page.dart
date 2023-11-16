import 'package:employee_manager/features/settings/bloc/bloc.dart';
import 'package:employee_manager/features/settings/bloc/event.dart';
import 'package:employee_manager/features/settings/bloc/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatelessWidget {
  static const route = '/settings';

  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextFormField(
              onChanged: (v) => context.read<SettingsBloc>().add(
                    FilterScreensByText(v),
                  ),
              decoration: const InputDecoration(
                hintText: 'hint...',
                border: OutlineInputBorder(),
              ),
            ),
            Expanded(
              child: BlocConsumer<SettingsBloc, SettingStates>(
                listener: (c, state) {},
                builder: (c, state) {
                  if (state is FilteredState) {
                    return ListView.builder(
                      itemCount: state.data.length,
                      itemBuilder: (context, index) {
                        final element = state.data[index];
                        return ListTile(
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (c) => element.pushTo,
                            ),
                          ),
                          leading: Icon(element.icon),
                          title: Text(element.title),
                          subtitle: Text(element.subtitle),
                        );
                      },
                    );
                  } else {
                    return const Text('nothing to show');
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
