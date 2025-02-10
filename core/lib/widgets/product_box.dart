import 'dart:developer';

import 'package:core/extensions/widget_extension.dart';
import 'package:core/widgets/buttons/ripple.dart';
import 'package:core/widgets/images/network_image_view.dart';
import 'package:flutter/material.dart';

class ProductBox extends StatelessWidget {
  const ProductBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Ripple(
      onTap: () {
        log("product box");
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Color(0xFFF7F5F2),
            padding: EdgeInsets.all(20),
            child: NetworkImageView(
              imageUrl:
                  "https://s3-alpha-sig.figma.com/img/add3/8874/c14a0cbb4cd437d6779e0a5a18963f63?Expires=1739145600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=EMjRlDWiDiyPGKVql35KLJTc47Dn8b9F28pM7CKF4mWeCv0y~pzzeFC50~dKlMoJExBNqhR~KM8OH~65oIIv45sH7g7AdHU1y8ye9Gd0xjSeAamjxoBwbtSI5t9l4pkU8I918uCBoBVYuwTrfWjGYc63AqRW5og9r4qto~UwcuBl3j~JjldQQUwEfgmwSdtQfpikv8NwXaE0A~KQ1DL1Dus62eWzWT58qS2x-aS3uVVPRfzZezgP6p-yoEXiH33angbh2tH9DVGby~~1vUdD4zKA4znDyItE9jblQuxAKKJvmbsYQ2Mzkx1ohSTXJnHrK-BPg-pSNsqY25B34dB6uw__",
            ),
          ),
          SizedBox(height: 12),
          Text(
            "NIKE",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            "Dunks 01, maroon red",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            "TK 12,000",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ).paddingSymmetric(horizontal: 1, vertical: 1),
    );
  }
}
