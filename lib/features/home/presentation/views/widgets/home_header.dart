import 'package:flutter/material.dart';
import 'package:taalam/core/constant/app_icons.dart';
import 'package:taalam/core/constant/app_strings.dart';
import 'package:taalam/core/theme/text_styles.dart';
import 'package:taalam/features/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:taalam/features/home/presentation/views/widgets/header_icon_bottom.dart';


class HomeHeader extends StatelessWidget {
  final String userName;

  const HomeHeader({
    super.key,
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const HeaderIconButton(icon: AppIcons.menu),
              Row(
                children: [
                  Text(
                    "Hi, $userName",
                    style: AppTextStyles.styleBold20,
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    AppIcons.wavingHand,
                    style: TextStyle(fontSize: 24),
                  ),
                ],
              ),
          
              const HeaderIconButton(icon: AppIcons.cart),
            ],
          ),
          SizedBox(height: 20),
          CustomTextField(hint: AppStrings.searchHint, icon: AppIcons.search),
        ],
      ),
    );
  }
}
