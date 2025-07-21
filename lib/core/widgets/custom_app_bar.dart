import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../utils/styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, this.onTap, this.text});

  final void Function()? onTap;
  final String? text;

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: Center(
        child: GestureDetector(
          onTap: onTap,
          child: SvgPicture.asset('assets/images/arrow_back.svg'),
        ),
      ),
      centerTitle: true,
      title: Text(
        text ?? '',
        style: Styles.styleMedium25(),
      ),
    );
  }
}
