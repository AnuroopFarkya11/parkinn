
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parkinn/Screens/auth_screen/auth_controller.dart';
import 'package:parkinn/Screens/auth_screen/auth_screen.dart';
import 'package:parkinn/Services/global_controller.dart';
import 'package:parkinn/Services/shared_preferences/shared_preference.dart';
import 'package:parkinn/Theme/app_theme.dart';
import 'package:parkinn/Widgets/card_layout/card_controller.dart';
import 'package:parkinn/Widgets/card_layout/history_card.dart';
import 'package:parkinn/Widgets/test_widget.dart';
import 'package:parkinn/routes/route_class.dart';

/*
* TODO
*
*
*
* ADD PACKAGE FOR INTERNET CONNECTION
*
*
*
*
* there must be 2 different tabs for vehicle type
*
*
*
*
* Create two modals for startParking object and endParking object
*
*
* on parking start , widget should update with current time and location  , also "change vehicle" button should be disabled
*
*
* on parking ended,navigate to home screen
*
*
* on history screen: global customer must get updated
*
*
* q)IN HOME SCREEN THERE MUST BE A SECTION WHERE WE CAN LIST CURRENT TRANSACTION
* if current transaction is null then navigate to mainHomeScreen else navigate to qr screen
*
*
* update Customer model with socketId
*
*
*
*
*
*
*
*
*
*
*
* */

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedService.initializeSharedPreferences();
  Get.put<GlobalController>(GlobalController());
  runApp(const ParkInn());
   Get.put(CardController());
  // Get.put(AuthController());

  // Get.put(AuthController());
}
/*
*
*       "MAIN.DART" is the main file for this application.
*
* */

class ParkInn extends StatelessWidget {
  const ParkInn({Key? key}) : super(key: key);
  
  
  ThemeData getTheme()
  {
    
    if(SharedService.getThemeStatus()==null)
      {
        return AppTheme.lightTheme;
      }

    return SharedService.getThemeStatus()!?AppTheme.lightTheme:AppTheme.darkTheme;
  }
  
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "ParkInn",
      theme: getTheme(),
      initialRoute: '/splashScreen',
      getPages: RouteClass.routes,
      // home: AuthScreen(),

    );
  }
}

/*
* TO SET-UP A NEW SCREEN
*
*1) CREATE A DIRECTORY IN LIB FOLDER
*
* CREATE A DART FILES IN THE FOLDER:
*    1 CREATE FOR SCREEN
*    2 CREATE FOR CONTROLLER
*    3 CREATE FOR BINDING
*
* OPEN CONTROLLER FILE :
*    1 CREATE A CLASS FOR SAY SCREEN_CONTROLLER
*    2 EXTEND GETXCONTROLLER TO THE CLASS
*
* OPEN SCREEN FILE:
*    1 CREATE A CLASS FOR SAY SCREEN
*    2 EXTEND GETVIEW<ADD CONTROLLER >
*    3 ADD THE REQUIRED OVER RIDE
*
*
* OPEN BINDING FILE
*    1 CREATE A CLASS FOR SAY SCREEN_BINDING
*    2 EXTEND BINDING CLASS
*    3 OVERRIDE THE REQUIRED METHOD : dependencies
*
*
*
* 2)  NOW OPEN ROUTECLASS FILE
*
*     Add a GetPage function to the list
*
*
*
* */








