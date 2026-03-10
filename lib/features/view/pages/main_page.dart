import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/features/data/service/launch_service.dart';
import 'package:portfolio/features/view/pages/responsive/responsive_utils.dart';
import 'package:portfolio/features/view/widgets/bottom_web.dart';
import 'package:portfolio/features/view/widgets/flout_appbar.dart';
import 'package:portfolio/features/view/widgets/gradient_text.dart';
import 'package:portfolio/features/view/widgets/my_drawer.dart';
import 'package:portfolio/features/view/widgets/my_widget.dart';
import 'package:portfolio/features/view/widgets/project_widget.dart';

class MainPage extends StatefulWidget {
  final String? scrollTo;
  const MainPage({
    super.key,
    this.scrollTo,
  });

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final GlobalKey homeKey = GlobalKey();
  final GlobalKey aboutMeKey = GlobalKey();
  final GlobalKey projectsKey = GlobalKey();
  final GlobalKey faqKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();
  final Widgets myWidgets = Widgets();
  void scrollToKey(GlobalKey key) {
    final context = key.currentContext;
    if (context != null && mounted) {
      HapticFeedback.lightImpact();
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 700),
        curve: Curves.fastOutSlowIn,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.scrollTo != null) {
        _scrollToSection(widget.scrollTo!);
      }
    });
  }

  void _scrollToSection(
    String section,
  ) {
    switch (section) {
      case 'home':
        scrollToKey(homeKey);
        break;
      case 'about':
        scrollToKey(aboutMeKey);
        break;
      case 'projects':
        scrollToKey(projectsKey);
        break;
      case 'faq':
        scrollToKey(faqKey);
        break;
      case 'contact':
        scrollToKey(contactKey);
        break;
    }
  }

  final ScrollController _scrollController = ScrollController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final isMobile = ResponsiveUtils.isMobile(context);
    final isTablet = ResponsiveUtils.isTablet(context);
    LunchWeb lunchWeb = LunchWeb();
    FloutAppbar floutAppbar = FloutAppbar();
    return Scaffold(
      key: _scaffoldKey,
      drawer: isMobile
          ? myDrawer(
              ontapHome: () {
                scrollToKey(homeKey);
                _scaffoldKey.currentState?.closeDrawer();
              },
              ontapAbout: () {
                _scaffoldKey.currentState?.closeDrawer();
                scrollToKey(aboutMeKey);
              },
              ontapProject: () {
                _scaffoldKey.currentState?.closeDrawer();
                scrollToKey(projectsKey);
              },
              ontapFAQ: () {
                _scaffoldKey.currentState?.closeDrawer();
                scrollToKey(faqKey);
              },
              ontapContact: () {
                _scaffoldKey.currentState?.closeDrawer();
                scrollToKey(contactKey);
              },
            )
          : Container(),
      backgroundColor: Colors.black,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            elevation: 10,
            pinned: true,
            expandedHeight: 70,
            collapsedHeight: 70,
            flexibleSpace: floutAppbar.appbar(
              isMobile: isMobile,
              context: context,
              isTablet: isTablet,
              width: width,
              topHeight: 20,
              ontapHome: () => scrollToKey(homeKey),
              ontapAbout: () => scrollToKey(aboutMeKey),
              ontapProject: () => scrollToKey(projectsKey),
              ontapFAQ: () => scrollToKey(faqKey),
              ontapContact: () => scrollToKey(contactKey),
              ontapImage: () => scrollToKey(homeKey),
              ontapMenu: () => _scaffoldKey.currentState?.openDrawer(),
            ),
            leading: isMobile ? Container() : null,
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: isMobile ? height * 0.02 : height * 0.05),
                GradientText(
                  key: homeKey,
                  text: 'Tarek Khazma',
                  fontWeight: FontWeight.w500,
                  fontSize: isMobile ? 32 : (isTablet ? 48 : 62),
                ),
                GradientText(
                  text: 'Software Engineer',
                  fontWeight: FontWeight.w400,
                  fontSize: isMobile ? 24 : (isTablet ? 32 : 38),
                ),
                myWidgets.buildImageScrollSection(width, height, context),
                Padding(
                  key: aboutMeKey,
                  padding: EdgeInsets.only(
                    left: width / 20,
                    top: isMobile ? 70 : (isTablet ? 80 : 100),
                    bottom: isMobile ? 25 : (isTablet ? 30 : 35),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: GradientText(
                      text: 'About Me',
                      fontWeight: FontWeight.w500,
                      fontSize: isMobile ? 24 : (isTablet ? 30 : 38),
                    ),
                  ),
                ),
                myWidgets.buildAboutMeSection(
                    context, width, isMobile, isTablet),
                // Projects Section
                Padding(
                  padding: EdgeInsets.only(
                    left: width / 20,
                    top: isMobile ? 70 : (isTablet ? 80 : 100),
                    bottom: isMobile ? 25 : (isTablet ? 30 : 35),
                  ),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: GradientText(
                        key: projectsKey,
                        text: 'My Latest Projects',
                        fontSize: isMobile ? 24 : (isTablet ? 30 : 38),
                        fontWeight: FontWeight.w500,
                      )),
                ),
                ProjectWidget(width: width, height: height),
                // FAQ Section
                Padding(
                  padding: EdgeInsets.only(
                    left: width / 20,
                    top: isMobile ? 70 : (isTablet ? 80 : 100),
                    bottom: isMobile ? 25 : (isTablet ? 30 : 35),
                  ),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: GradientText(
                        key: faqKey,
                        text: 'Frequently asked questions',
                        fontSize: isMobile ? 24 : (isTablet ? 30 : 38),
                        fontWeight: FontWeight.w500,
                      )),
                ),
                myWidgets.buildFaqSection(height, width, isMobile),
                // Contact Section
                Padding(
                  padding: EdgeInsets.only(
                    left: width / 20,
                    top: isMobile ? 55 : (isTablet ? 70 : 100),
                    bottom: isMobile ? 20 : (isTablet ? 30 : 35),
                  ),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: GradientText(
                        key: contactKey,
                        text: 'Contact Me',
                        fontSize: isMobile ? 24 : (isTablet ? 32 : 38),
                        fontWeight: FontWeight.w500,
                      )),
                ),
                myWidgets.buildContactSection(
                    height, width, context, lunchWeb, isMobile, isTablet),
                SizedBox(height: isMobile ? height * 0.05 : height * 0.13),
                BottomWeb(
                  height: height,
                  isMobile: isMobile,
                  isTablet: isTablet,
                  onTapHome: () => scrollToKey(homeKey),
                  onTapAboutMe: () => scrollToKey(aboutMeKey),
                  onTapProjects: () => scrollToKey(projectsKey),
                  onTapFAQ: () => scrollToKey(faqKey),
                  onTapContact: () => scrollToKey(contactKey),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
