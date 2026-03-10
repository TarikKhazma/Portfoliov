import 'package:flutter/material.dart';
import 'package:portfolio/core/res/app_style.dart';
import 'package:portfolio/features/data/service/launch_service.dart';
import 'package:portfolio/features/view/pages/main_page.dart';
import 'package:portfolio/features/view/pages/page_view.dart';
import 'package:portfolio/features/view/pages/responsive/responsive_utils.dart';
import 'package:portfolio/features/view/widgets/bottom_web.dart';
import 'package:portfolio/features/view/widgets/flout_appbar.dart';
import 'package:portfolio/features/view/widgets/gradient_text.dart';
import 'package:portfolio/features/view/widgets/my_drawer.dart';
import 'package:portfolio/features/view/widgets/project_widget.dart';

class ProjectsPage extends StatelessWidget {
  final String image;
  final String name;
  final String url;
  final String contant;
  final List images;

  ProjectsPage({
    super.key,
    required this.image,
    required this.images,
    required this.name,
    required this.url,
    required this.contant,
  });
  final LunchWeb lunchWeb = LunchWeb();
  Map<String, String> parseSections(String content) {
    final sections = <String, String>{};
    final lines = content.split('\n');
    String? currentKey;
    String currentValue = '';
    for (var line in lines) {
      if (line.trim().endsWith(':')) {
        if (currentKey != null) {
          sections[currentKey] = currentValue.trim();
        }
        currentKey = line.trim();
        currentValue = '';
      } else {
        currentValue += '$line\n';
      }
    }

    if (currentKey != null) {
      sections[currentKey] = currentValue.trim();
    }

    return sections;
  }

  void navigator(BuildContext context, String section) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => MainPage(
          scrollTo: section,
        ),
      ),
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveUtils.isMobile(context);
    final isTablet = ResponsiveUtils.isTablet(context);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final sections = parseSections(contant);
    FloutAppbar floutAppbar = FloutAppbar();

    return Scaffold(
      backgroundColor: Colors.black,
      key: _scaffoldKey,
      drawer: isMobile
          ? myDrawer(
              ontapHome: () {
                navigator(context, 'home');
                _scaffoldKey.currentState?.closeDrawer();
              },
              ontapAbout: () {
                _scaffoldKey.currentState?.closeDrawer();
                navigator(context, 'about');
              },
              ontapProject: () {
                _scaffoldKey.currentState?.closeDrawer();
                navigator(context, 'projects');
              },
              ontapFAQ: () {
                _scaffoldKey.currentState?.closeDrawer();
                navigator(context, 'faq');
              },
              ontapContact: () {
                _scaffoldKey.currentState?.closeDrawer();
                navigator(context, 'contact');
              },
            )
          : Container(),
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              // image
              SliverToBoxAdapter(
                child: Image.asset(
                  image,
                  width: double.infinity,
                  height: height * 0.5,
                  fit: BoxFit.cover,
                ),
              ),
              // name of project
              SliverToBoxAdapter(
                child: Padding(
                    padding: EdgeInsets.only(
                        top: isMobile ? 30 : (isTablet ? 40 : 50),
                        bottom: isMobile ? 25 : (isTablet ? 30 : 35),
                        left: isMobile ? 20 : 50,
                        right: isMobile ? 20 : 50),
                    child: GradientText(
                      text: name,
                      fontSize: isMobile ? 30 : (isTablet ? 48 : 55),
                      fontWeight: FontWeight.w500,
                    )),
              ),
              // content
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: isMobile ? 20 : 50,
                    right: isMobile ? 20 : 50,
                    bottom: isMobile ? 25 : (isTablet ? 30 : 35),
                  ),
                  child: isMobile
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: sections.entries.map((entry) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 30),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        entry.key,
                                        style: nameParagraphStyle,
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        entry.value,
                                        style: paragraphStyle,
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                            ),
                            Center(
                              child: SizedBox(
                                width: isMobile ? 170 : (isTablet ? 200 : 230),
                                height: isMobile ? 350 : (isTablet ? 400 : 470),
                                child: AutoScrollSlider(
                                  images: images,
                                  isMobile: isMobile,
                                  isTablet: isTablet,
                                ),
                              ),
                            ),
                          ],
                        )
                      : Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: sections.entries.map((entry) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 30),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          entry.key,
                                          style: nameParagraphStyle,
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          entry.value,
                                          style: paragraphStyle,
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                            Flexible(
                              flex: isTablet ? 2 : 1,
                              child: SizedBox(
                                width: isMobile ? 150 : (isTablet ? 200 : 230),
                                height: isMobile ? 300 : (isTablet ? 400 : 470),
                                child: AutoScrollSlider(
                                  images: images,
                                  isMobile: isMobile,
                                  isTablet: isTablet,
                                ),
                              ),
                            ),
                          ],
                        ),
                ),
              ),
              SliverToBoxAdapter(
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: isMobile ? 15 : 40,
                      right: isMobile ? 20 : 50,
                      bottom: isMobile ? 30 : (isTablet ? 35 : 40),
                    ),
                    child: TextButton(
                        onPressed: () {
                          lunchWeb.openWebsite(context, Uri.parse(url));
                        },
                        child: GradientText(
                          text: 'Link To Project',
                          fontWeight: FontWeight.w500,
                          fontSize: isMobile ? 17 : 18,
                        )),
                  ),
                ),
              ),

              // other projects
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: isMobile ? 25 : 50,
                        right: isMobile ? 25 : 50,
                        bottom: isMobile ? 25 : (isTablet ? 30 : 35),
                      ),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: GradientText(
                            text: 'My Latest Stories',
                            fontSize: isMobile ? 26 : (isTablet ? 30 : 38),
                            fontWeight: FontWeight.w500,
                          )),
                    ),
                    ProjectWidget(width: width, height: height),
                  ],
                ),
              ),
              // bottom web
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: isMobile ? 25 : (isTablet ? 30 : 35),
                    top: isMobile ? 45 : (isTablet ? 70 : 110),
                  ),
                  child: BottomWeb(
                    isMobile: isMobile,
                    isTablet: isTablet,
                    height: height,
                    onTapHome: () {
                      navigator(context, 'home');
                    },
                    onTapAboutMe: () {
                      navigator(context, 'about');
                    },
                    onTapProjects: () {
                      navigator(context, 'projects');
                    },
                    onTapFAQ: () {
                      navigator(context, 'faq');
                    },
                    onTapContact: () {
                      navigator(context, 'contact');
                    },
                  ),
                ),
              ),
            ],
          ),
          // appbar
          Positioned(
            top: isMobile ? 0 : 20,
            left: 0,
            right: 0,
            child: floutAppbar.appbar(
              isMobile: isMobile,
              isTablet: isTablet,
              context: context,
              width: width,
              topHeight: 0,
              ontapHome: () => navigator(context, 'home'),
              ontapAbout: () => navigator(context, 'about'),
              ontapProject: () => navigator(context, 'projects'),
              ontapFAQ: () => navigator(context, 'faq'),
              ontapContact: () => navigator(context, 'contact'),
              ontapImage: () => navigator(context, 'home'),
              ontapMenu: () => _scaffoldKey.currentState?.openDrawer(),
            ),
          ),
        ],
      ),
    );
  }
}
