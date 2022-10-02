import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Onboard extends StatefulWidget {
  const Onboard({Key? key}) : super(key: key);

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  late PageController _pageController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                scrollBehavior: ScrollBehavior().copyWith(overscroll: false),
                controller: _pageController,
                itemBuilder: (context, index) => OnboardContent(
                    image: 'assets/onboard/onboard1.svg',
                    title: 'Culture And Art 🌹',
                    description:
                        'I am using the harvard art museums api to improve myself.'),
              ),
            ),
            SizedBox(
              height: 32.sp,
              width: 32.sp,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                onPressed: () {
                  _pageController.nextPage(
                    duration: Duration(milliseconds: 400),
                    curve: Curves.ease,
                  );
                },
                child: SvgPicture.asset(
                  height: 100.sp,
                  'assets/onboard/right_arrow.svg',
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
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
          style: GoogleFonts.roboto(
              fontWeight: FontWeight.w600,
              fontSize: 23.sp,
              color: Color.fromARGB(228, 255, 255, 255)),
        ),
        SizedBox(
          height: 8.sp,
        ),
        Text(
          description,
          textAlign: TextAlign.center,
          style: GoogleFonts.roboto(
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
              color: Colors.white54),
        ),
        const Spacer(flex: 2),
      ],
    );
  }
}
