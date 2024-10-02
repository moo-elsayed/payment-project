import 'package:flutter/material.dart';
import 'package:payment_project/features/checkout/presentation/views/my_cart_view/widgets/my_cart_view_body.dart';
import '../../../../../core/widgets/custom_app_bar.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(text: 'My Cart'),
      body: const MyCartViewBody(),
    );
  }
}
