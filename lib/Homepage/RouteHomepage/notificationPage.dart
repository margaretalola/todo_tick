import 'package:flutter/material.dart';

class Notificationpage extends StatefulWidget{
  Notificationpage({Key? key}) : super(key: key);

  @override
  State<Notificationpage> createState() => NotificationpageState();
}

class NotificationpageState extends State<Notificationpage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Not found',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      )
    );
  }
}