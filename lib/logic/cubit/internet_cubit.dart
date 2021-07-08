import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concept/constants/enums.dart';
import 'package:connectivity/connectivity.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState>  {
  final Connectivity connectivity;

  late StreamSubscription connectivityStreamSubscription;

  InternetCubit({required this.connectivity}) : super(InternetLoading()) {
    monitorInternetConnection();
  }

  StreamSubscription<ConnectivityResult> monitorInternetConnection() {
    return connectivityStreamSubscription =
        connectivity.onConnectivityChanged.listen((connectivityResult) {
      if (connectivityResult == ConnectivityResult.mobile) {
        emitInternetConnected(ConnectionsType.mobile);
      } else if (connectivityResult == ConnectivityResult.wifi) {
        emitInternetConnected(ConnectionsType.wifi);
      } else if (connectivityResult == ConnectivityResult.none) {
        emitInternetDisconnected();
      }
    });
  }

  void emitInternetConnected(ConnectionsType _connectionType) =>
      emit(InternetConnected(connectionsType: _connectionType));

  void emitInternetDisconnected() => emit(InternetDisconnected());

  @override
  Future<void> close() {
    connectivityStreamSubscription.cancel();
    return super.close();
  }

}
