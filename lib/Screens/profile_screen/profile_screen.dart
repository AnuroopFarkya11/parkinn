import 'package:flutter/material.dart';
import 'package:parkinn/Services/global_controller.dart';
import 'package:parkinn/Services/shared_preferences/shared_preference.dart';
import 'package:parkinn/Widgets/app_bar/app_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String?, String?>? user = SharedService.getCustomerId();
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const ParkInBar(
              bottomWidget:
                  Text("Your Profile", style: TextStyle(fontSize: 20))),
          SliverFillRemaining(
            child: Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    color: Colors.white,
                    margin: EdgeInsets.only(left: 10, right: 10),
                    borderOnForeground: true,
                    elevation: 5,
                    child: ListTile(
                      title: Text("Mobile Number"),
                      subtitle: Text(user!["mobileNumber"]!),
                    ),
                  ),
                  Card(
                    color: Colors.white,
                    margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                    borderOnForeground: true,
                    elevation: 5,
                    child: ListTile(
                      title: Text("Your ID"),
                      subtitle: Text(user["customerId"]!),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
