import 'package:core/extensions/context_extension.dart';
import 'package:core/extensions/string_extensions.dart';
import 'package:flutter/material.dart';

class ProductVariantHeaderView extends StatelessWidget {
  final String variantKey;

  const ProductVariantHeaderView({
    super.key,
    required this.variantKey,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      variantKey.toCapitalized,
      style: context.textTheme.bodyMedium,
    );
  }
}
