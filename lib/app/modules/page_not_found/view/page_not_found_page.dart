import 'package:core/assets/app_images.dart';
import 'package:core/widgets/images/asset_image_view.dart';
import 'package:flutter/material.dart';
import 'package:waadaa/app/base/base_page.dart';
import 'package:waadaa/app/modules/page_not_found/viewmodel/page_not_found_state.dart';
import 'package:waadaa/app/modules/page_not_found/viewmodel/page_not_found_view_model.dart';

class PageNotFoundPage
    extends BasePage<PageNotFoundViewModel, PageNotFoundState> {
  const PageNotFoundPage({super.key});

  @override
  Widget body(BuildContext context) {
    return Center(
      child: AssetImageView(
        fileName: AppImages.pageNotFound,
        fit: BoxFit.cover,
      ),
    );
  }
}
