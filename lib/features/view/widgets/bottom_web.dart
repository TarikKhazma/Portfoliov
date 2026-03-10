// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:portfolio/core/res/app_style.dart';
import 'package:portfolio/core/res/images/app_images.dart';
import 'package:portfolio/features/data/service/launch_service.dart';
import 'package:portfolio/features/view/widgets/clip_image.dart';
import 'package:portfolio/features/view/widgets/gradient_text.dart';

class BottomWeb extends StatelessWidget {
  const BottomWeb({
    super.key,
    required this.height,
    required this.isMobile,
    required this.isTablet,
    required this.onTapHome,
    required this.onTapAboutMe,
    required this.onTapProjects,
    required this.onTapFAQ,
    required this.onTapContact,
  });

  final double height;
  final bool isMobile;
  final bool isTablet;
  final void Function()? onTapHome;
  final void Function()? onTapAboutMe;
  final void Function()? onTapProjects;
  final void Function()? onTapFAQ;
  final void Function()? onTapContact;

  @override
  Widget build(BuildContext context) {
    LunchWeb lunchWeb = LunchWeb();
    if (isMobile) {
      return myCard(lunchWeb, context, isMobile, isTablet);
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  imageClip(logo, isTablet ? 70 : 80, isTablet ? 70 : 80),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GradientText(
                      text: 'Tarek Khazma',
                      fontSize: isTablet ? 23 : 27,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: height * 0.26,
                ),
                child: Text('© 2026 – Tarek Khazma . All rights reserved.',
                    style: content2Style),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Navigation',
                  style: tag1Style.copyWith(
                      fontSize: isTablet ? 19 : null,
                      fontWeight: FontWeight.w400)),
              SizedBox(height: height * 0.02),
              TextButton(
                  onPressed: onTapHome,
                  child: Text('Home',
                      style: content2Style.copyWith(
                          fontSize: isTablet ? 15 : null))),
              TextButton(
                onPressed: onTapAboutMe,
                child: Text('About Me',
                    style:
                        content2Style.copyWith(fontSize: isTablet ? 15 : null)),
              ),
              TextButton(
                onPressed: onTapProjects,
                child: Text('Projects',
                    style:
                        content2Style.copyWith(fontSize: isTablet ? 15 : null)),
              ),
              TextButton(
                onPressed: onTapFAQ,
                child: Text('FAQ',
                    style:
                        content2Style.copyWith(fontSize: isTablet ? 15 : null)),
              ),
              TextButton(
                onPressed: onTapContact,
                child: Text('Contact me',
                    style:
                        content2Style.copyWith(fontSize: isTablet ? 15 : null)),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Social media',
                  style: tag1Style.copyWith(
                      fontSize: isTablet ? 19 : null,
                      fontWeight: FontWeight.w400)),
              SizedBox(height: height * 0.02),
              TextButton(
                onPressed: () {
                  lunchWeb.openWebsite(context, Uri.parse(''));
                },
                child: Text('facebook',
                    style:
                        content2Style.copyWith(fontSize: isTablet ? 15 : null)),
              ),
              TextButton(
                onPressed: () {
                  lunchWeb.openWebsite(
                      context,
                      Uri.parse(
                          'https://www.instagram.com/tarekhazma?igsh=MTA1N3h5aTIxM203OQ%3D%3D&utm_source=qr'));
                },
                child: Text('Instagram',
                    style:
                        content2Style.copyWith(fontSize: isTablet ? 15 : null)),
              ),
            ],
          ),
        ],
      );
    }
  }

  Widget myCard(
      LunchWeb lunchWeb, BuildContext context, bool isMobile, bool isTablet) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              imageClip(logo, 60, 60),
              const SizedBox(width: 8),
              GradientText(
                text: 'Tarek Khazma',
                fontSize: isMobile ? 19 : (isTablet ? 25 : 27),
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
          SizedBox(height: height * 0.04),
          const GradientText(
            text: 'Navigation',
            fontWeight: FontWeight.w400,
            fontSize: 21,
          ),
          SizedBox(height: height * 0.02),
          TextButton(
              onPressed: onTapHome,
              child: Text('Home',
                  style:
                      content2Style.copyWith(fontSize: isMobile ? 16 : null))),
          TextButton(
            onPressed: onTapAboutMe,
            child: Text('About Me',
                style: content2Style.copyWith(fontSize: isMobile ? 16 : null)),
          ),
          TextButton(
            onPressed: onTapProjects,
            child: Text('Projects',
                style: content2Style.copyWith(fontSize: isMobile ? 16 : null)),
          ),
          TextButton(
            onPressed: onTapFAQ,
            child: Text('FAQ',
                style: content2Style.copyWith(fontSize: isMobile ? 16 : null)),
          ),
          TextButton(
            onPressed: onTapContact,
            child: Text('Contact me',
                style: content2Style.copyWith(fontSize: isMobile ? 16 : null)),
          ),
          SizedBox(height: height * 0.04),
          const GradientText(
            text: 'Social media',
            fontWeight: FontWeight.w400,
            fontSize: 21,
          ),
          SizedBox(height: height * 0.02),
          TextButton(
            onPressed: () {
              lunchWeb.openWebsite(context, Uri.parse(''));
            },
            child: Text('facebook',
                style: content2Style.copyWith(fontSize: isMobile ? 16 : null)),
          ),
          TextButton(
            onPressed: () {
              lunchWeb.openWebsite(
                  context,
                  Uri.parse(
                      'https://www.instagram.com/tarekhazma?igsh=MTA1N3h5aTIxM203OQ%3D%3D&utm_source=qr'));
            },
            child: Text('Instagram',
                style: content2Style.copyWith(fontSize: isMobile ? 16 : null)),
          ),
          SizedBox(height: height * 0.06),
          Align(
            alignment: Alignment.center,
            child: Text(
              '© 2026 – Tarek Khazma . All rights reserved.',
              style: content2Style.copyWith(fontSize: isMobile ? 16 : null),
            ),
          ),
        ],
      ),
    );
  }
}
