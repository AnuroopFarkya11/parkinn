import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parkinn/Utils/brand_color.dart';

class HistoryCard extends StatefulWidget {
  final String vehicleNumber;
  final String vehicleType;
  final String location;
  final String closingBalance;
  final String amount;


  const HistoryCard( { required this.vehicleNumber, required this.vehicleType, required this.location,
      required this.closingBalance, required this.amount ,super.key});

  @override
  State<HistoryCard> createState() => _HistoryCardState();
}

class _HistoryCardState extends State<HistoryCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(side: BorderSide(color: Colors.black26), borderRadius: BorderRadius.circular(8)),
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        tileColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.vehicleNumber,
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
            ),
            Text(
              "- ${widget.amount}",
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        subtitle: Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("${widget.vehicleType} | ${widget.location}", style: TextStyle(fontSize: 12),overflow: TextOverflow.ellipsis,),
            Text("Closing balance - Rs ${widget.closingBalance}", style: TextStyle(fontSize: 12),overflow: TextOverflow.ellipsis)
          ],
        ),

      ),
    );
  }
}
