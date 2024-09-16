import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Padding(
            padding: EdgeInsets.only(right: 50),
            child: Text('Settings'),
          ),
        ),
        //automaticallyImplyLeading: false,
      ),
    );
  }
}
