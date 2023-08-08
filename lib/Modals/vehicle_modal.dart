// ignore_for_file: unnecessary_getters_setters

class Vehicle {
  //        VEHICLE PROPERTIES
  late String? vehicleType;
  late String? vehicleNumber;
  late DateTime? date;

  Vehicle({
     this.vehicleNumber,
     this.vehicleType,
     this.date
  });

  //           SETTERS
  // set etVehicleType(String value) {
  //   vehicleType = value;
  // }
  //
  // set setVehicleNumber(String value) {
  //   vehicleNumber = value;
  // }
  //
  // set setDate(DateTime value) {
  //   date = value;
  // }
  //
  // //            GETTERS
  //
  // String? get getVehicleType => vehicleType;
  //
  // String? get getVehicleNumber => vehicleNumber;
  //
  // DateTime get getDate => date;
  //
  // toJSON() {
  //   return {
  //     "vehicleType": vehicleType,
  //     "vehicleNumber": vehicleNumber,
  //     "date": date
  //   };
  // }
}
