import 'package:culture_art/route/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardView extends StatefulWidget {
  const OnboardView({Key? key}) : super(key: key);

  @override
  State<OnboardView> createState() => _OnboardViewState();
}

class _OnboardViewState extends State<OnboardView> {
  late PageController _pageController;
  bool isDone = false;
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildPageView(),
          _buildBottomNav(context),
        ],
      ),
    );
  }

  Container _buildBottomNav(BuildContext context) {
    return Container(
      alignment: Alignment(0, .85),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          isDone
              ? Container(
                  height: 27.sp,
                  width: 38.sp,
                  color: Colors.transparent,
                )
              : GestureDetector(
                  onTap: () {
                    _pageController.jumpToPage(2);
                  },
                  child: Container(
                    height: 27.sp,
                    width: 38.sp,
                    color: Colors.transparent,
                    alignment: Alignment.center,
                    child: Text(
                      'Skip',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ),
          SmoothPageIndicator(
            effect: WormEffect(
                paintStyle: PaintingStyle.stroke,
                activeDotColor: Theme.of(context).primaryColor),
            controller: _pageController,
            count: 3,
          ),
          isDone
              ? GestureDetector(
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, RouteNames.loginView, (route) => false);
                  },
                  child: Container(
                    height: 27.sp,
                    width: 38.sp,
                    color: Colors.transparent,
                    alignment: Alignment.center,
                    child: Text(
                      'Done',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                )
              : GestureDetector(
                  onTap: () {
                    _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.ease);
                  },
                  child: Container(
                    height: 27.sp,
                    width: 38.sp,
                    color: Colors.transparent,
                    alignment: Alignment.center,
                    child: Text(
                      'Next',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ),
        ],
      ),
    );
  }

  PageView _buildPageView() {
    return PageView(
      onPageChanged: (value) {
        setState(() {
          isDone = (value == 2);
        });
      },
      scrollBehavior: ScrollBehavior().copyWith(overscroll: false),
      controller: _pageController,
      children: const [
        OnboardContent(
            image: 'assets/onboard/onboard2.svg',
            title: 'Culture & Art 🌹',
            description:
                'I am using the harvard art museums api to improve myself.'),
        OnboardContent(
            image: 'assets/onboard/onboard1.svg',
            title: 'Historical Works Of Art 🗿',
            description:
                'I am using the harvard art museums api to improve myself.'),
        OnboardContent(
            image: 'assets/onboard/onboard3.svg',
            title: 'Color Palette 🎨',
            description:
                'I am using the harvard art museums api to improve myself.'),
      ],
    );
  }
}

class OnboardContent extends StatelessWidget {
  const OnboardContent({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String image, title, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(flex: 1),
        SvgPicture.asset(image, height: 45.h),
        const Spacer(flex: 1),
        Text(
          title,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        SizedBox(
          height: 8.sp,
        ),
        Text(
          description,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const Spacer(flex: 2),
      ],
    );
  }
}
