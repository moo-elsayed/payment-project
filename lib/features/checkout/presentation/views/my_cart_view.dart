import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:payment_project/features/checkout/presentation/widgets/my_cart_view_body.dart';
import '../../../../core/widgets/custom_app_bar.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return const AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.green,
      ),
      child: Scaffold(
        appBar: CustomAppBar(text: 'My Cart'),
        body: MyCartViewBody(),
      ),
    );
  }
}
