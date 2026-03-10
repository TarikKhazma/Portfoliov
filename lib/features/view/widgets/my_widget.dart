import 'package:flutter/material.dart';
import 'package:portfolio/core/res/app_colors.dart';
import 'package:portfolio/core/res/app_style.dart';
import 'package:portfolio/core/res/images/image_items.dart';
import 'package:portfolio/features/data/local/list_question.dart';
import 'package:portfolio/features/data/service/launch_service.dart';
import 'package:portfolio/features/view/pages/responsive/responsive_utils.dart';
import 'package:portfolio/features/view/widgets/container_item.dart';
import 'package:portfolio/features/view/widgets/gradient_text.dart';
import 'package:portfolio/features/view/widgets/scrole_widget.dart';

class Widgets {
  Widget buildContactSection(double height, double width, BuildContext context,
      LunchWeb lunchWeb, bool isMobile, bool isTablet) {
    if (isMobile) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          containerItem(height: 325, width: width * 0.9, context, children: [
            GradientText(
              text: 'Let’s Build Something Great Together',
              fontWeight: FontWeight.w400,
              fontSize: isMobile ? 20 : 26,
            ),
            Text(
              'Have a project idea, a collaboration in mind, or just want to say hello? I’d love to hear from you. Feel free to reach out using the form below or through any of my social platforms.',
              style: contentStyle.copyWith(fontSize: isMobile ? 14.5 : null),
            ),
            const GradientText(
              text: 'Email: ite.tarek.khazma@gmail.com',
              fontWeight: FontWeight.w400,
              fontSize: 17,
            ),
            Center(
              child: myBotton(
                lunchWeb,
                context,
                text: 'github',
                url: 'https://github.com/TarikKhazma',
                height: 30,
                width: width * 0.32,
              ),
            ),
          ]),
          const SizedBox(height: 15),
          containerItem(
            context,
            height: 300,
            width: width * 0.9,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  '🚀🚀🚀🚀',
                  style: tagStyle.copyWith(fontSize: isMobile ? 23 : null),
                ),
              ),
              Text(
                'Let’s turn your ideas into powerful mobile experiences.',
                style: contentStyle.copyWith(fontSize: isMobile ? 17 : null),
              ),
              myBotton(
                lunchWeb,
                context,
                text: 'LinkedIn',
                url: 'https://www.LinkedIn.com/in/tarek-khazma-432099122',
                height: 35,
                width: double.maxFinite,
              ),
            ],
          ),
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          containerItem(
            context,
            height: height * 0.5,
            width: isTablet ? width * 0.55 : width * 0.6,
            children: [
              GradientText(
                text: 'Let’s Build Something Great Together',
                fontWeight: FontWeight.w400,
                fontSize: isMobile ? 20 : 26,
              ),
              Text(
                'Have a project idea, a collaboration in mind, or just want to say hello? I’d love to hear from you. Feel free to reach out using the form below or through any of my social platforms.',
                style: contentStyle.copyWith(fontSize: isTablet ? 17 : null),
              ),
              const GradientText(
                text: 'Email: ite.tarek.khazma@gmail.com',
                fontWeight: FontWeight.w400,
                fontSize: 18,
              ),
              Center(
                child: myBotton(
                  lunchWeb,
                  context,
                  text: 'github',
                  url: 'https://github.com/TarikKhazma',
                  height: 40,
                  width: isTablet ? width * 0.35 : width * 0.45,
                ),
              )
            ],
          ),
          SizedBox(width: width * 0.01),
          containerItem(
            context,
            height: height * 0.5,
            width: isTablet ? width * 0.35 : width * 0.3,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  '🚀🚀🚀🚀',
                  style: tagStyle.copyWith(fontSize: isMobile ? 23 : null),
                ),
              ),
              Text(
                'Let’s turn your ideas into powerful mobile experiences.',
                style: contentStyle.copyWith(fontSize: isTablet ? 18 : null),
              ),
              myBotton(
                lunchWeb,
                context,
                text: 'LinkedIn',
                url: 'https://www.LinkedIn.com/in/tarek-khazma-432099122',
                height: 40,
                width: double.maxFinite,
              ),
            ],
          ),
        ],
      );
    }
  }

  Widget buildFaqSection(double height, double width, bool isMobile) {
    return SizedBox(
      height: height * 0.65,
      child: ListView.separated(
        padding: EdgeInsets.only(left: width / 20, right: width / 20),
        separatorBuilder: (context, index) {
          return Divider(
            color: primaryColor,
            thickness: 1,
          );
        },
        itemCount: faqs.length,
        itemBuilder: (context, index) {
          return ExpansionTile(
            tilePadding: EdgeInsets.all(isMobile ? 5 : 10),
            expandedAlignment: Alignment.centerLeft,
            shape: Border.all(width: 0.0),
            iconColor: primaryColor,
            collapsedIconColor: primaryColor,
            title: Text(
              faqs[index].question,
              style: contentStyle.copyWith(fontSize: isMobile ? 15 : null),
            ),
            children: [
              Padding(
                padding: EdgeInsets.all(isMobile ? 5 : 16),
                child: Text(
                  faqs[index].answer,
                  style: content2Style.copyWith(
                    fontSize: isMobile ? 14 : null,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget buildAboutMeSection(
      BuildContext context, double width, bool isMobile, bool isTablet) {
    if (isMobile) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          containerItem(
            context,
            height: 350,
            width: width * 0.9,
            children: [
              GradientText(
                text: 'EDUCATION',
                fontWeight: FontWeight.w400,
                fontSize: isMobile ? 20 : (isTablet ? 22 : 26),
              ),
              Text(
                'Bachelor of Science (Hons) in Software Engineering with Multimedia',
                style: h3Style.copyWith(fontSize: isMobile ? 15 : null),
              ),
              Text(
                'Limkokwing University of Creative Technology',
                style: h3Style.copyWith(
                    fontSize: isMobile ? 15 : null,
                    fontWeight: FontWeight.w400),
              ),
              GradientText(
                text: 'Professional Summary',
                fontWeight: FontWeight.w400,
                fontSize: isMobile ? 20 : (isTablet ? 22 : 26),
              ),
              Text(
                'A skilled Flutter developer with over 3 years of experience in building high-performance, cross-platform mobile applications. Proficient in  Firebase, Supabase, and state management with strong expertise in UI/UX design and API integration.',
                style: contentStyle.copyWith(fontSize: isMobile ? 13 : null),
              ),
            ],
          ),
          const SizedBox(height: 15),
          containerItem(
            context,
            height: 250,
            width: width * 0.9,
            children: [
              Text(
                'Technical Skills',
                style: tagStyle.copyWith(fontSize: isMobile ? 20 : null),
              ),
              Text(
                '• Flutter framework, Dart, Firebase, Supabase, Hive\n• State management : Bloc, Riverpod, Get X, etc. \n• Architecture Patterns: MVC, MVP, MVVM, \n• etc. RESTful APIs, JSON, MySQL \n• Git, Version control, Clean Code, Microsoft Office',
                style: contentStyle.copyWith(fontSize: isMobile ? 13 : null),
              ),
            ],
          ),
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          containerItem(
            context,
            height: isTablet ? 350 : 400,
            width: isTablet ? width * 0.55 : width * 0.6,
            children: [
              GradientText(
                text: 'EDUCATION',
                fontWeight: FontWeight.w400,
                fontSize: isTablet ? 22 : 26,
              ),
              Text(
                'Bachelor of Science (Hons) in Software Engineering with Multimedia',
                style: h3Style.copyWith(fontSize: isTablet ? 17 : null),
              ),
              Text(
                'Limkokwing University of Creative Technology',
                style: h3Style.copyWith(fontSize: isTablet ? 17 : null),
              ),
              GradientText(
                text: 'Professional Summary',
                fontWeight: FontWeight.w400,
                fontSize: isTablet ? 22 : 26,
              ),
              Text(
                'A skilled Flutter developer with over 3 years of experience in building high-performance, cross-platform mobile applications. Proficient in  Firebase, Supabase, and state management with strong expertise in UI/UX design and API integration.',
                style: contentStyle.copyWith(fontSize: isTablet ? 15 : null),
              ),
            ],
          ),
          SizedBox(width: width * 0.01),
          containerItem(
            context,
            height: isTablet ? 350 : 400,
            width: isTablet ? width * 0.35 : width * 0.3,
            children: [
              GradientText(
                text: 'Technical Skills',
                fontWeight: FontWeight.w400,
                fontSize: isTablet ? 24 : 26,
              ),
              Text(
                '• Flutter framework, Dart, Firebase, Supabase, Hive\n• State management : Bloc, Riverpod, etc. \n• Architecture Patterns: MVC, MVP, MVVM, \n• etc. RESTful APIs, JSON, MySQL \n• Git, Version control, Clean Code, Microsoft Office',
                style: contentStyle.copyWith(fontSize: isTablet ? 15 : null),
              ),
            ],
          ),
        ],
      );
    }
  }

  Stack buildImageScrollSection(
      double width, double height, BuildContext context) {
    final isMobile = ResponsiveUtils.isMobile(context);

    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(
              left: isMobile ? 10 : width / 13,
              right: isMobile ? 10 : width / 15,
              top: isMobile ? height * 0.02 : height * 0.05),
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15)),
          ),
          child: buildImageScroll(context),
        ),
        Positioned.fill(
          child: IgnorePointer(
            child: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    gradient: RadialGradient(
                      radius: 1.5,
                      center: Alignment.topLeft,
                      colors: [
                        Colors.black,
                        Colors.black12,
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    gradient: RadialGradient(
                      radius: 1.5,
                      center: Alignment.topRight,
                      colors: [
                        Colors.black,
                        Colors.black12,
                        Colors.transparent
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black,
                        Colors.transparent,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.center,
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black,
                        Colors.transparent,
                        Colors.transparent,
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildImageScroll(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          buildScrollColumn(context, oneImages),
          buildScrollColumn(context, twoImages),
          buildScrollColumn(context, threeImages),
          buildScrollColumn(context, fourImages),
          buildScrollColumn(context, fifeImages),
        ],
      ),
    );
  }

  Widget buildScrollColumn(BuildContext context, List images) {
    final isMobile = ResponsiveUtils.isMobile(context);
    final isTablet = ResponsiveUtils.isTablet(context);
    return SizedBox(
      width: isMobile
          ? MediaQuery.of(context).size.width * 0.4
          : (isTablet
              ? MediaQuery.of(context).size.width * 0.22
              : MediaQuery.of(context).size.width * 0.17),
      height: isMobile ? 400 : 600,
      child: InfiniteScrollColumn(items: images),
    );
  }

  InkWell myBotton(
    LunchWeb lunchWeb,
    BuildContext context, {
    required String url,
    required String text,
    required double height,
    required double width,
    Color color = const Color(0xffC0FF73),
  }) {
    return InkWell(
      onTap: () {
        lunchWeb.openWebsite(context, Uri.parse(url));
      },
      child: Container(
        height: height,
        width: width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: color,
        ),
        child: Text(
          text,
          style: buttonTextStyle,
        ),
      ),
    );
  }
}
