import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:payment_project/core/utils/styles.dart';
import 'package:payment_project/core/widgets/total_price.dart';
import 'package:payment_project/features/checkout/presentation/views/thank_you_view/widgets/payment_info_list.dart';

import 'card_info_widget.dart';

class ThankYouViewBody extends StatelessWidget {
  const ThankYouViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      decoration: ShapeDecoration(
          color: const Color(0xffEDEDED),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 66),
            child: Text(
              'Thank you!',
              style: Styles.styleMedium25(),
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            'Your transaction was successful',
            style: Styles.styleRegular20(),
          ),
          const SizedBox(
            height: 42 - 20,
          ),
          const PaymentInfoList(),
          const SizedBox(
            height: 6,
          ),
          const Divider(
            color: Color(0xffC7C7C7),
            height: 24 * 2,
            thickness: 2,
          ),
          const TotalPrice(price: 50.97),
          const SizedBox(
            height: 30,
          ),
          const CardInfoWidget(),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(FontAwesomeIcons.barcode,size: 70),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 29,vertical: 14),
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: const BorderSide(
                      width: 1.5,
                      color: Color(0xff34A853),
                    ),
                  ),
                ),
                child: Text(
                  'PAID',
                  style: Styles.styleSemiBold24()
                      .copyWith(color: const Color(0xff34A853)),
                ),
              ),
            ],
          ),
          SizedBox(height: ((MediaQuery.of(context).size.height * .2 + 35 / 2) / 2) - 35 ,),
        ],
      ),
    );
  }
}
