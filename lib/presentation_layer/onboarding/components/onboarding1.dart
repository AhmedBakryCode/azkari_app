import 'package:Islami/core/utils/assets.dart';
import 'package:Islami/generated/l10n.dart';
import 'package:Islami/presentation_layer/onboarding/components/default_bar.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/colors.dart';

class OnboardingPage1 extends StatefulWidget {
    final Function(Locale) setLocale;

  const OnboardingPage1({Key? key, required this.setLocale}) : super(key: key);

  @override
  State<OnboardingPage1> createState() => _OnboardingPage1State();
}

class _OnboardingPage1State extends State<OnboardingPage1> {
    void _changeLanguage(String languageCode) {
    Locale newLocale;
    switch (languageCode) {
      case 'ar':
        newLocale = const Locale('ar');
        break;
      case 'en':
        newLocale = const Locale('en');
        break;
      default:
        newLocale = const Locale('en');
    }
    widget.setLocale(newLocale); // Change app locale globally
  }

  String _selectedLanguage = 'en';
  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [
DefaultBar(),
        Image.asset(ImageAssets.first_onboarding,height: MediaQuery.of(context).size.height*0.37,width: MediaQuery.of(context).size.height*0.85 ,),
      SizedBox(height: 30,),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
Text(S.of(context).chooseLanguage,style: TextStyle(fontSize: 16,color: AppColors.primary),),
SizedBox(width: 10,),
DropdownButton<String>(
              value: _selectedLanguage,
              icon: const Icon(Icons.language),
              items:  [
                DropdownMenuItem(value: 'en', child: Text(S.of(context).english,style: TextStyle(fontSize: 16,color: AppColors.primary),)),
                DropdownMenuItem(value: 'ar', child: Text(S.of(context).arabic,style: TextStyle(fontSize: 16,color: AppColors.primary),)),
              ],
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    _selectedLanguage = newValue;
                  });
                  _changeLanguage(newValue);
                }
              },
            ),
        ],
      ),
      ],
    );
  }
}
