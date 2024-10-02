import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payment_project/core/widgets/custom_button.dart';
import 'package:payment_project/features/checkout/presentation/views/payment_details/widgets/payment_item_listView.dart';
import 'package:payment_project/features/checkout/presentation/views/thank_you_view/thank_you_view.dart';

import 'custom_credit_card.dart';

class PaymentDetailsBody extends StatefulWidget {
  const PaymentDetailsBody({super.key});

  @override
  State<PaymentDetailsBody> createState() => _PaymentDetailsBodyState();
}

class _PaymentDetailsBodyState extends State<PaymentDetailsBody> {
  final GlobalKey<FormState> globalKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: CustomScrollView(slivers: [
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 24,
          ),
        ),
        const SliverToBoxAdapter(child: PaymentItemListView()),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 24,
          ),
        ),
        SliverToBoxAdapter(
          child: CustomCreditCard(
            autoValidateMode: autoValidateMode,
            formKey: globalKey,
          ),
        ),
        SliverFillRemaining(
            hasScrollBody: false,
            child: Align(
                child: CustomButton(
                    label: 'Pay',
                    on: () {
                      if (globalKey.currentState!.validate()) {
                        globalKey.currentState!.save();
                      } else {
                        autoValidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ThankYouView(),
                      ));
                    }))),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 12,
          ),
        ),
      ]),
    );
  }
}
