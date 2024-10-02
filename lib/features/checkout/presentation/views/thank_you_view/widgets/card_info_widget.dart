import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/utils/styles.dart';

class CardInfoWidget extends StatelessWidget {
  const CardInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: Colors.white,
      ),
      child: Expanded(
        child: ListTile(
          leading: SvgPicture.asset('assets/images/logo.svg'),
          title: Text(
            'Credit Card',
            style: Styles.styleRegular18(),
          ),
          subtitle: Text(
            'Mastercard **78',
            style: Styles.styleRegular18()
                .copyWith(color: const Color(0xff000000).withOpacity(.7)),
          ),
        ),
      ),
    );
  }
}
