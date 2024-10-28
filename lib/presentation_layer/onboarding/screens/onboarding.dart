import 'package:Islami/core/utils/colors.dart';
import 'package:Islami/generated/l10n.dart';
import 'package:Islami/presentation_layer/onboarding/components/onboarding1.dart';
import 'package:Islami/presentation_layer/onboarding/components/onboarding2.dart';
import 'package:Islami/presentation_layer/onboarding/components/onboarding3.dart';
import 'package:Islami/presentation_layer/onboarding/components/onboarding4.dart';
import 'package:Islami/presentation_layer/onboarding/components/onboarding5.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
    final Function(Locale) setLocale;

  const OnboardingScreen({required this.setLocale, Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  Widget _buildDotsIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          height: _currentPage == index ? 12 : 8,
          width: _currentPage == index ? 12 : 8,
          decoration: BoxDecoration(
            color: _currentPage == index ?AppColors.primary : AppColors.grey,
            shape: BoxShape.circle,
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            children: [
              OnboardingPage1(setLocale: widget.setLocale, ),
              OnboardingPage2(),
              OnboardingPage3(),
              OnboardingPage4(),
              OnboardingPage5(),
            ],
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: _currentPage != 0
                      ? () {
                          _pageController.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          );
                        }
                      : null,
                  child: Text(
                    S.of(context).previous,
                    style: TextStyle(
                      color: _currentPage != 0 ? AppColors.primary : AppColors.grey,
                    ),
                  ),
                ),
                          _buildDotsIndicator(),

                _currentPage != 4
                    ? TextButton(
                        onPressed: () {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          );
                        },
                        child:  Text(S.of(context).next , style: TextStyle(color: AppColors.primary),),
                      )
                    : TextButton(
                        onPressed: () {
                          // Navigate to the next screen (e.g., HomePage)
                          Navigator.pushReplacementNamed(context, '/home');
                        },
                        child:  Text(S.of(context).getStarted, style: TextStyle(color: AppColors.primary),),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
