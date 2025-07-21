import 'package:flutter/material.dart';
import '../widgets/thank_you_view_card.dart';

class ThankYouView extends StatelessWidget {
  const ThankYouView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ThankYouViewCard(),
    );
  }
}
