part of 'internet_cubit.dart';

abstract class InternetState extends Equatable {
  const InternetState();

  @override
  List<Object> get props => [];
}

class InternetLoading extends InternetState {}

class InternetConnected extends InternetState {
  final ConnectionsType connectionsType;

  InternetConnected({required this.connectionsType});
}

class InternetDisconnected extends InternetState {}
