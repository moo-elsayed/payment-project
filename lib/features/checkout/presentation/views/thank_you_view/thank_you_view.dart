import 'package:flutter/material.dart';
import 'package:payment_project/features/checkout/presentation/views/thank_you_view/widgets/thank_you_view_card.dart';

import '../../../../../core/widgets/custom_app_bar.dart';

class ThankYouView extends StatelessWidget {
  const ThankYouView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        onTap: () => Navigator.pop(context),
      ),
      body: const ThankYouViewCard(),
    );
  }
}
