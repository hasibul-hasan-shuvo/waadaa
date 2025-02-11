import 'dart:developer';

import 'package:core/extensions/widget_extension.dart';
import 'package:core/widgets/buttons/ripple.dart';
import 'package:core/widgets/images/network_image_view.dart';
import 'package:flutter/material.dart';

class OfferCategoryItem extends StatelessWidget {
  const OfferCategoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Ripple(
      onTap: () {
        log("category item");
      },
      child: Column(
        children: [
          Container(
            color: Color(0xFFF7F5F2),
            padding: EdgeInsets.all(4),
            child: NetworkImageView(
              imageUrl:
                  "https://s3-alpha-sig.figma.com/img/eae2/361c/c958aaaadc2d38f86dcb170a73cf843b?Expires=1739145600&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=SD6~f34pDUqSx7kvm1hGSQZmr89iPCdTr0sw8ERFO1dStVfFXIuoxdNv2N3Z2SU9MqQV8bhZ8WZkro2qTypXq0UhP3I7FfNXe7L84YdszILHNY63a7xMheiBKHqSDlDEQBcfAmop8XI2x-8JhJPtiT8ond3prA6Ql1AReH8MAUpE9-HjdzbviuS1i7H-kSzsKXvz7qScUxmmFR8vKRgJATuOJiZuDxXmUBkz4s7d7Q-T4jk~U8~vQDXL4dTi21Yjl7uPti2qfkQI9cfjUeyiybZXOd4DEQ2yRoOKLYaafX9Rsy9eLktlrgdVbdnAxjK~GRix8iXewByMdvuKla~Euw__",
            ),
          ),
          SizedBox(height: 12),
          Text(
            "Beauty & Grooming",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ).paddingAll(1),
    );
  }
}
