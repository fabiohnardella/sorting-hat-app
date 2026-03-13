import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sorting_app/components/sorting_button.dart';

void main() {
  runApp(SortingHatApp());
}

class SortingHatApp extends StatelessWidget {
  const SortingHatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Chapios seletios",
      debugShowCheckedModeBanner: false,
      home: SortingHatScreen(),
    );
  }
}

class SortingHatScreen extends StatefulWidget {
  const SortingHatScreen({super.key});

  @override
  State<SortingHatScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SortingHatScreen> {
  SortingState state = SortingState.idle;
  List<String> houses = ["Grifnoira", "Sonserina", "Lufa-Lufa", "Corvinal"];

  String houseSelected = "";

  Future<void> sortHouse() async {
    final random = Random();

    setState(() {
      houseSelected = "";
      state = SortingState.sorting;
    });

    await Future.delayed(const Duration(seconds: 3));
    setState(() {
      houseSelected = houses[random.nextInt(houses.length)];
      state = SortingState.result;
    });

    await Future.delayed(const Duration(seconds: 3));

    setState(() {
      houseSelected = "";
      state = SortingState.idle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(houseSelected),
        SortingButton(state: state, onPressed: sortHouse),
      ],
    );
  }
}
