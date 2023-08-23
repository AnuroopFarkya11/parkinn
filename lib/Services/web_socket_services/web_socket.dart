import 'dart:developer';

import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:parkinn/Services/API/api_paths.dart';

class WebSocketService {

  static IO.Socket socket=IO.io(ApiPath.defaultUrl, <String, dynamic>{
    'transports': ['websocket'],
    'autoConnect': false,
  });

  static void connect() {
    try {
      socket.connect();
      socket.onConnect((_) {
        log(name: "SOCKET CONNECTION", "SUCCESSFUL CONNECTION $_");
      });
    } on Exception catch (e) {
      log(name: "SOCKET CONNECTION", "EXCEPTION OCCURED");
    }
  }


  static void emit({required String customerID, required String mobileNumber}){
    socket.emit('Credentials', {
      'customerId': customerID,
      'mobileNumber': mobileNumber
    });
  }

  static void disconnect(){
    socket.on(
      'disconnect',
          (data) {
        log(name: "SOCKET CONNECTION", "CONNECTION CLOSED $data");
      },
    );
  }

}
