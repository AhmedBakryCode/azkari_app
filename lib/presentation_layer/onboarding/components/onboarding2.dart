import 'package:Islami/core/utils/assets.dart';
import 'package:Islami/generated/l10n.dart';
import 'package:Islami/presentation_layer/onboarding/components/default_bar.dart';
import 'package:Islami/presentation_layer/onboarding/components/default_text.dart';
import 'package:flutter/material.dart';

class OnboardingPage2 extends StatelessWidget {
  const OnboardingPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultBar(),
        Image.asset(ImageAssets.second_onboarding,height: MediaQuery.of(context).size.height*0.37,width: MediaQuery.of(context).size.height*0.85 ,),
        SizedBox(height: 30,),
        DefaultText(title: S.of(context).welcome, description: S.of(context).welcomeDescription),
      ],
    );
  }
}
