import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الأشعارات'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text(
          'لاتوجد أشعارات',
          style: TextStyle(fontSize: 20, color: Colors.grey),
        ),
      ),
    );
  }
}