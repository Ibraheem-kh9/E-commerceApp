import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:e_commerce_app/repo/connectivity_status.dart';
import 'package:flutter/material.dart';

class ConnectivityServices with ChangeNotifier{
  final Connectivity _connectivity = Connectivity();
  StreamController<ConnectivityStatus> connectionController = StreamController<ConnectivityStatus>();
  ConnectivityServices(){
    _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      connectionController.add(_getStatusFromResult(result));
    });
  }

  ConnectivityStatus _getStatusFromResult(ConnectivityResult result){
    switch(result){
      case ConnectivityResult.wifi:
        return ConnectivityStatus.wiFi;
      case ConnectivityResult.mobile:
        return ConnectivityStatus.cellular;
      case ConnectivityResult.none:
        return ConnectivityStatus.offline;
      default: return ConnectivityStatus.offline;
    }
  }

  @override
  void dispose(){
    super.dispose();
    connectionController.close();
  }

}