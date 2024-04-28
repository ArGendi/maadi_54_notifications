import 'package:flutter/material.dart';
import 'package:maadi_54_notifications/services/notification_services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        foregroundColor: Colors.white,
        title: Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: (){
                NotificationServices.showNotification(0, "Ali", "Tarsh el tarsh");
              }, 
              child: Text("Show notification"),
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: (){
                NotificationServices.showPerodicNotification(100, "Kareem", "Sa7btk mish htnf3k");
              }, 
              child: Text("Show Perodic notification"),
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: (){
                NotificationServices.deleteNotification(100);
              }, 
              child: Text("Delete kareem"),
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: (){
                NotificationServices.scheduleNotification(51, "Subscription", "will end tomorrow, re-subscripe now", Duration(days: 28));
              }, 
              child: Text("Pay now"),
            )
          ],
        ),
      ),
    );
  }
}