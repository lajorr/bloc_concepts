import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_concepts/constants/enums.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  InternetCubit({
    required this.connectivity,
  }) : super(InternetLoading()) {
    monitorInternetCubit();
  }

  StreamSubscription<ConnectivityResult> monitorInternetCubit() {
    return connectivityStreamSubscription =
        connectivity.onConnectivityChanged.listen(
      (connectivityResult) {
        if (connectivityResult == ConnectivityResult.wifi) {
          emit(
            const InternetConnected(connectionType: ConnectionType.wifi),
          );
        } else if (connectivityResult == ConnectivityResult.mobile) {
          emit(
            const InternetConnected(connectionType: ConnectionType.mobile),
          );
        } else if (connectivityResult == ConnectivityResult.none) {
          emit(
            InternetDisconnected(),
          );
        }
      },
    );
  }

  final Connectivity connectivity;
  StreamSubscription? connectivityStreamSubscription;

  void emitInternetConnected(ConnectionType connectionType) => emit(
        InternetConnected(
          connectionType: connectionType,
        ),
      );

  void emitInternetDisconnected() => emit(InternetDisconnected());

  @override
  Future<void> close() {
    connectivityStreamSubscription!.cancel();
    return super.close();
  }
}
