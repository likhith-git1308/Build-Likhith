import 'package:flutter/material.dart';

class CareerSelectionScreen extends StatefulWidget {
  const CareerSelectionScreen({Key? key}) : super(key: key);

  @override
  State<CareerSelectionScreen> createState() => _CareerSelectionScreenState();
}

class _CareerSelectionScreenState extends State<CareerSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Career'),
      ),
      body: const Center(
        child: Text('Career Selection Screen'),
      ),
    );
  }
}