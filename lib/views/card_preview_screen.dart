import 'package:flutter/material.dart';
import 'package:image_app/config/app_images.dart';
import 'package:image_app/config/constants.dart';
import 'package:image_app/config/routes.dart';
import 'package:image_app/utils/context_ext.dart';
import 'package:image_app/utils/string_ext.dart';
import 'package:image_app/view_models/card_preview_provider.dart';
import 'package:image_app/widgets/custom_app_bar.dart';
import 'package:image_app/widgets/custom_spacer.dart';
import 'package:provider/provider.dart';

class CardPreviewScreen extends StatefulWidget {
  const CardPreviewScreen({super.key});

  @override
  State<CardPreviewScreen> createState() => _CardPreviewScreenState();
}

class _CardPreviewScreenState extends State<CardPreviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Artist",
      ),
      body: _bodyWidget(),
    );
  }

  Widget _bodyWidget() {
    return Consumer<CardPreviewProvider>(
      builder: (ctx, provider, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
              child: Container(
                width: context.screenWidth,
                height: context.screenHeight / 1.4,
                margin:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: provider.bannerImage == null
                      ? hexPrimaryColor.hexToColor
                      : Colors.transparent,
                  image: provider.bannerImage != null
                      ? DecorationImage(
                          image: NetworkImage(
                            provider.bannerImage!,
                          ),
                          fit: BoxFit.fill)
                      : null,
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomSpacer.verticalSpacer(30),
                        // avatar
                        ClipOval(
                          child: Image.asset(
                            AppImages.ironMan,
                            width: 130,
                            height: 130,
                            fit: BoxFit.cover,
                          ),
                        ),
                        CustomSpacer.verticalSpacer(3),
                        const Text(
                          "Iron Man",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        CustomSpacer.verticalSpacer(3),
                        const Text(
                          "New York",
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        CustomSpacer.verticalSpacer(8),
                        const Text(
                          "Superhero | Industrialist | Philanthropist",
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      bottom: 40,
                      left: 0,
                      right: 0,
                      child: SizedBox(
                        width: context.screenWidth,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildIcon(Icons.mail),
                            _buildIcon(Icons.call_outlined),
                            _buildIcon(Icons.pin_drop),
                            _buildIcon(Icons.facebook),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 4,
                      left: context.screenWidth - 120,
                      right: 0,
                      child: SizedBox(
                        width: context.screenWidth,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildIcon(Icons.person, size: 14),
                            CustomSpacer.horizontalSpacer(2),
                            const Text(
                              "Profile",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // edit card
            _editCard(),
          ],
        );
      },
    );
  }

  Widget _buildIcon(IconData icon, {double? size}) => Container(
        margin: const EdgeInsets.all(3),
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
            color: Colors.black12, borderRadius: BorderRadius.circular(6)),
        child: Icon(
          icon,
          color: Colors.white,
          size: size,
        ),
      );

  Widget _editCard() => Container(
        width: context.screenWidth,
        margin: const EdgeInsets.symmetric(horizontal: 18),
        child: TextButton(
          onPressed: () => context.pushNamed(Routes.customize),
          style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(
                  color: hexRedColor.hexToColor,
                ))),
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              "Edit Card",
              style: TextStyle(
                color: hexRedColor.hexToColor,
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      );
}
