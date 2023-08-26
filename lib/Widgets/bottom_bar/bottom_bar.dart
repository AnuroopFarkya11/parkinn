import 'package:flutter/material.dart';
class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(7),topLeft: Radius.circular(7))),
      tileColor: Colors.black,
      title: Text(
        "Balance",
        style: TextStyle(fontSize: 13, color: Colors.white),
      ),
      subtitle: Text(
        "Rs.400",
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
      trailing: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
        onPressed: () {},
        child: Text(
          "Recharge",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
