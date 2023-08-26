import 'dart:developer';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:parkinn/Modals/customer_modal.dart';
import 'package:parkinn/Modals/transaction_modal.dart';
import 'package:parkinn/Services/API/api_decoding_methods.dart';
import 'package:parkinn/Services/global_controller.dart';
import 'package:parkinn/Services/web_socket_services/web_socket.dart';
import 'package:parkinn/Widgets/drawer/app_drawer.dart';

import '../../Services/API/api_services.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:parkinn/Services/API/api_paths.dart';

import '../../routes/route_name.dart';


enum ParkingStatus{
  initial,
  started,
  ended
}
class TransactionQrController extends GetxController {

  late Customer? customer;
  late Transaction currentTransaction;
  late RxBool change;
  late Rx<ParkingStatus> status;
  RxString? startTime;
  late String location;
  late  String endTime;
  late String qrUrl;



  @override
  void onInit() {
    super.onInit();
    GlobalController.to.currentRoute = ParkYnRoute.transactionScreen;
    customer = GlobalController.to.customer;
    currentTransaction = customer!.currentTransaction!;
    status = ParkingStatus.initial.obs;
    startTime = "".obs;
    // startTime="".obs;
    endTime="";
    location="";
    qrUrl = GlobalController.to.customer!.currentTransaction!.parkingQr!;

    if(currentTransaction.startTime!=null)
      {
        startTime?.value = DateFormat('hh:mm a').format(currentTransaction.startTime!);
        log(name:"TRANSACTION DATA","START TIME: $startTime");
        status.value = ParkingStatus.started;
      }
    else{
      log(name:"TRANSACTION DATA","START TIME :NULL ");
    }
    if(currentTransaction.locationId!=null)
      {
        location = currentTransaction.locationId!;
        log(name:"TRANSACTION DATA","LOCATION: $location");

      }
    else{
      log(name:"TRANSACTION DATA","LOCATION: null");
    }


    if(currentTransaction.endTime!=null)
      {
        endTime = DateFormat('hh:mm a').format(currentTransaction.endTime!);
        log(name:"TRANSACTION DATA","END TIME: $endTime");
        status.value = ParkingStatus.ended;
      }
    else{
      log(name:"TRANSACTION DATA","END TIME :NULL ");

    }



    try {
      log(name: "Socket connection ", "Hitting socket");

      //'http://54.66.147.216:80'
      //'https://aquamarine-turkey-gear.cyclic.cloud/api'

      IO.Socket socket=IO.io(ApiPath.defaultUrl, <String, dynamic>{
        'transports': ['websocket'],
        'autoConnect': true,
      });

      socket.connect();
      socket.onConnect((_) {
        log(name: "SOCKET CONNECTION", "SUCCESSFUL CONNECTION $_");
      });


    socket.emit('Credentials', {
      'customerId': customer!.customerId!,
      'mobileNumber': customer!.mobileNumber!
    });



      // WebSocketService.connect();

      // WebSocketService.emit(customerID: customer!.customerId!, mobileNumber: customer!.mobileNumber!);

      socket.on('ParkingStatus', (data) async {
        //{parking: started, startTime: 2023-08-19T20:36:08.000Z, locationId: 123's Location}
        // should i update this to customer object

        if (data != null) {
          if (data['parking'].toString() == "started") {

            status.value=ParkingStatus.started;
            DateTime? istTime = ApiDecoding.decodeTime(time: data["startTime"]);
            startTime?.value = DateFormat('hh:mm a').format(istTime!);
            location = data["locationId"];
            log(name:"WEB SOCKET DATA","START TIME: $startTime");
            Get.snackbar("Parking Status", "Parking started successfully",snackPosition: SnackPosition.BOTTOM);



          } else if (data['parking'].toString() == "ended") {
            status.value = ParkingStatus.ended;
            DateTime? istTime = ApiDecoding.decodeTime(time: data["endTime"]);
            endTime = DateFormat('hh:mm a').format(istTime!);
            log(name:"WEB SOCKET DATA","END TIME: $endTime");
            GlobalController.to.customer = await API.updateCustomer();
            // GlobalController.to.customer!.currentTransaction=null;
            Get.snackbar("Parking Status", "Parking ended",snackPosition: SnackPosition.BOTTOM);




          }
        } else {
          Get.snackbar("Parking Status", "Unable to fetch data",snackPosition: SnackPosition.BOTTOM);
          log(name:"SOCKET DATA","No data");
        }
        // todo catch the dynamic data and convert it to proper datatype

        // this data is dynamic, coinsist of 3 feilds startTime , locationId , endtIME

        //todo rebuild of widget parking time

        log(name: "SOCKET DATA", "$data");
      });

      socket.on(
        'disconnect',
            (data) {
          log(name: "SOCKET CONNECTION", "CONNECTION CLOSED $data");
        },
      );
      // WebSocketService.disconnect();

    } catch (e) {
      log(name: "SOCKET CONNECTION", "CONNECTION FAILED $e");
    }

    change = false.obs;
  }

  Future onChangePressed() async {
    change.value = true;
    try {
      GlobalController.to.customer = await API.deleteTransaction();
      Get.snackbar("Transaction", "Current Transaction Deleted",snackPosition: SnackPosition.BOTTOM);
      Get.offAllNamed('homeScreen');
    } catch (e) {
      Get.snackbar("Transaction", "Failed to delete transaction",snackPosition: SnackPosition.BOTTOM);
    }
  }
}
