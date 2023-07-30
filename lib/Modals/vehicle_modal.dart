// ignore_for_file: unnecessary_getters_setters

class Vehicle{

  //        VEHICLE PROPERTIES
  late String _vehicleType;
  late String _vehicleNumber;
  late DateTime _date;

  Vehicle()
  {
    _vehicleNumber ="DEFAULT NUMBER";
    _vehicleType = "DEFAULT TYPE";
    _date =  DateTime.now();
  }



  //           SETTERS
  set vehicleType(String value) {
    _vehicleType = value;
  }


  set vehicleNumber(String value) {
    _vehicleNumber = value;
  }

  set date(DateTime value) {
    _date = value;
  }

  //            GETTERS

  String get vehicleType => _vehicleType;

  String get vehicleNumber => _vehicleNumber;

  DateTime get date => _date;


  toJSON(){
    return{
    "vehicleType":_vehicleType,
    "vehicleNumber":_vehicleNumber,
    "date":_date
    };
  }
}