import 'package:flutter/material.dart';
import 'package:image_app/config/app_images.dart';
import 'package:image_app/config/constants.dart';
import 'package:image_app/utils/context_ext.dart';
import 'package:image_app/utils/string_ext.dart';
import 'package:image_app/view_models/card_preview_provider.dart';
import 'package:image_app/widgets/custom_app_bar.dart';
import 'package:image_app/widgets/custom_spacer.dart';
import 'package:provider/provider.dart';

import '../config/routes.dart';

class CustomCardScreen extends StatefulWidget {
  const CustomCardScreen({super.key});

  @override
  State<CustomCardScreen> createState() => _CustomCardScreenState();
}

class _CustomCardScreenState extends State<CustomCardScreen> {
  late CardPreviewProvider previewProvider;

  @override
  Widget build(BuildContext context) {
    previewProvider = Provider.of<CardPreviewProvider>(context);
    return Scaffold(
      appBar: CustomAppBar(
        title: "Custom Image Card",
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
                        InkWell(
                          onTap: () {},
                          child: Stack(
                            children: [
                              Container(
                                width: 110,
                                height: 110,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white60,
                                  border: Border.all(color: Colors.white, width: 3),
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.person,
                                    color: Colors.white,
                                    size: 100,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 5,
                                right: 5,
                                child: Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: const BoxDecoration(
                                    color: Colors.black,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                    size: 14,
                                  ),
                                ),
                              ),
                            ],
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
                      top: 4,
                      left: context.screenWidth - 140,
                      right: 8,
                      child: InkWell(
                        onTap: () => context.pushNamed(Routes.imgPanning),
                        child: Container(
                          width: context.screenWidth,
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _buildIcon(Icons.edit, size: 14),
                              CustomSpacer.horizontalSpacer(2),
                              Text(
                                "Customize",
                                style: TextStyle(color: hexRedColor.hexToColor),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // edit card
            _saveCard(),
          ],
        );
      },
    );
  }

  Widget _buildIcon(IconData icon, {double? size}) => Icon(
    icon,
    color: hexRedColor.hexToColor,
    size: size,
  );

  Widget _saveCard() => Container(
        width: context.screenWidth,
        margin: const EdgeInsets.symmetric(horizontal: 18),
        child: TextButton(
          onPressed: () {
            context.pop();
            previewProvider.getImage();
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(hexRedColor.hexToColor),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.all(4.0),
            child: Text(
              "Save",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      );
}
