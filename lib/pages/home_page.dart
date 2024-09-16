import 'package:flutter/material.dart';
import 'package:minimal_chat_app/services/auth/auth_service.dart';
import 'package:minimal_chat_app/components/my_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: const Center(
          child: Padding(
            padding: EdgeInsets.only(right: 45),
            child: Text('Home'),
          ),
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
