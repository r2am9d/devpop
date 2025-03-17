import 'package:devpop/core/widgets/bottom_navbar/bottom_navbar.dart';
import 'package:devpop/features/home/home.dart';
import 'package:flutter/material.dart';

class ShellWidget extends StatelessWidget {
  const ShellWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Devpop'),
        centerTitle: true,
      ),
      body: const HomePage(),
      bottomNavigationBar: const BottomNavbarWidget(),
    );
  }
}
