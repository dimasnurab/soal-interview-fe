import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared/utils/colors_app.dart';
import 'package:shared/utils/image_assets.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final Color? titleColor;

  const CustomAppBar({
    super.key,
    this.title,
    this.actions,
    this.backgroundColor,
    this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          title ??
              SvgPicture.asset(
                ImageAssetsApp.logoAppWhite,
                height: 40,
                width: 40,
              ),
          Image.asset(ImageAssetsApp.logoText, height: 80, width: 100),
        ],
      ),
      actions: actions,
      elevation: 0,
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
