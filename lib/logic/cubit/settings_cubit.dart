import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> with HydratedMixin {
  SettingsCubit()
      : super(
            SettingsState(appNotifications: false, emailNotifications: false));

  void toogleAppNotifications(bool newValue) =>
      emit(state.copyWith(appNotifications: newValue));

  void toogleEmailNotifications(bool newValue) =>
      emit(state.copyWith(emailNotifications: newValue));

  @override
  SettingsState? fromJson(Map<String, dynamic> json) {
    return SettingsState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(SettingsState state) {
    return state.toMap();
  }
}
