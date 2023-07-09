import 'package:flutter/material.dart';
import 'package:order_tracker/order_tracker.dart';

class order_tracking extends StatefulWidget {
  const order_tracking({Key? key}) : super(key: key);

  @override
  State<order_tracking> createState() => _order_trackingState();
}

class _order_trackingState extends State<order_tracking> {
  ///this TextDto present in a package add data in this dto and set in a list.

  List<TextDto> orderList = [
    TextDto("Your order has been placed", "Fri, 25th Mar '22 - 10:47pm"),
    TextDto("Seller ha processed your order", "Sun, 27th Mar '22 - 10:19am"),
    TextDto("Your item has been picked up by courier partner.",
        "Tue, 29th Mar '22 - 5:00pm"),
  ];

  List<TextDto> shippedList = [
    TextDto("Your order has been shipped", "Tue, 29th Mar '22 - 5:04pm"),
    TextDto("Your item has been received in the nearest hub to you.", null),
  ];

  List<TextDto> outOfDeliveryList = [
    TextDto("Your order is out for delivery", "Thu, 31th Mar '22 - 2:27pm"),
  ];

  List<TextDto> deliveredList = [
    TextDto("Your order has been delivered", "Thu, 31th Mar '22 - 3:58pm"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 219, 7, 7),
        title: const Text("Delivery & Tracking"),
      ),
      body: Container(
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: OrderTracker(
            status: Status.delivered,
            activeColor: Colors.green,
            inActiveColor: Colors.black,
            orderTitleAndDateList: orderList,
            headingDateTextStyle:
                const TextStyle(color: Color.fromARGB(255, 219, 7, 7)),
            shippedTitleAndDateList: shippedList,
            subDateTextStyle: const TextStyle(color: Colors.black, fontStyle: FontStyle.italic),
            outOfDeliveryTitleAndDateList: outOfDeliveryList,
            headingTitleStyle: const TextStyle(color: Colors.black),
            deliveredTitleAndDateList: deliveredList,
            subTitleTextStyle:const TextStyle(color: Colors.black) ,
          ),
        ),
      ),
    );
  }
}
