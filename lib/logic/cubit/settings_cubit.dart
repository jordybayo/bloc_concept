import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit()
      : super(
            SettingsState(appNotifications: false, emailNotifications: false));

  void toogleAppNotifications(bool newValue) =>
      emit(state.copyWith(appNotifications: newValue));

  void toogleEmailNotifications(bool newValue) =>
      emit(state.copyWith(emailNotifications: newValue));
}
