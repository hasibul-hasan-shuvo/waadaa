import 'package:core/widgets/buttons/banner_button.dart';
import 'package:flutter/material.dart';

class BannerTopContents extends StatelessWidget {
  final String title;
  final String subTitle;
  final String actionTitle;
  final Function()? actionPressed;

  const BannerTopContents({
    super.key,
    required this.title,
    required this.subTitle,
    required this.actionTitle,
    this.actionPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 32,
      left: 16,
      child: SizedBox(
        width: 170,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              subTitle,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 20),
            BannerButton(
              onPressed: actionPressed,
              title: actionTitle,
            ),
          ],
        ),
      ),
    );
  }
}
