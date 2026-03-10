// import 'package:flutter/material.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:portfolio/core/res/app_colors.dart';
// import 'package:portfolio/core/res/app_style.dart';
// import 'package:portfolio/core/res/images/image_items.dart';
// import 'package:portfolio/features/data/local/list_question.dart';
// import 'package:portfolio/features/data/service/launch_service.dart';
// import 'package:portfolio/features/view/widgets/bottom_web.dart';
// import 'package:portfolio/features/view/widgets/container_item.dart';
// import 'package:portfolio/features/view/widgets/flout_appbar.dart';
// import 'package:portfolio/features/view/widgets/gradient_text.dart';
// import 'package:portfolio/features/view/widgets/my_botton.dart';
// import 'package:portfolio/features/view/widgets/project_widget.dart';
// import 'package:portfolio/features/view/widgets/scrole_widget.dart';

// class ResponsiveUtils {
//   static bool isMobile(BuildContext context) =>
//       MediaQuery.of(context).size.width < 600;

//   static bool isTablet(BuildContext context) =>
//       MediaQuery.of(context).size.width >= 600 &&
//       MediaQuery.of(context).size.width < 1200;

//   static bool isDesktop(BuildContext context) =>
//       MediaQuery.of(context).size.width >= 1200;

//   static double getResponsiveFontSize(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//     if (isMobile(context)) return width * 0.04;
//     if (isTablet(context)) return width * 0.03;
//     return width * 0.02;
//   }
// }

// class TextPage extends StatefulWidget {
//   final String? scrollTo;
//   const TextPage({
//     super.key,
//     this.scrollTo,
//   });

//   @override
//   State<TextPage> createState() => _TextPageState();
// }

// class _TextPageState extends State<TextPage> {
//   // ... الكود الحالي حتى بداية دالة build ...
//   final GlobalKey homeKey = GlobalKey();
//   final GlobalKey aboutMeKey = GlobalKey();
//   final GlobalKey projectsKey = GlobalKey();
//   final GlobalKey faqKey = GlobalKey();
//   final GlobalKey contactKey = GlobalKey();

//   void scrollToKey(GlobalKey key) {
//     final context = key.currentContext;
//     if (context != null && mounted) {
//       HapticFeedback.lightImpact();
//       Scrollable.ensureVisible(
//         context,
//         duration: const Duration(milliseconds: 700),
//         curve: Curves.fastOutSlowIn,
//       );
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       if (widget.scrollTo != null) {
//         _scrollToSection(widget.scrollTo!);
//       }
//     });
//   }

//   void _scrollToSection(
//     String section,
//   ) {
//     switch (section) {
//       case 'home':
//         scrollToKey(homeKey);
//         break;
//       case 'about':
//         scrollToKey(aboutMeKey);
//         break;
//       case 'projects':
//         scrollToKey(projectsKey);
//         break;
//       case 'faq':
//         scrollToKey(faqKey);
//         break;
//       case 'contact':
//         scrollToKey(contactKey);
//         break;
//     }
//   }

//   final ScrollController _scrollController = ScrollController();

//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//     final height = MediaQuery.of(context).size.height;
//     final isMobile = ResponsiveUtils.isMobile(context);
//     final isTablet = ResponsiveUtils.isTablet(context);

//     LunchWeb lunchWeb = LunchWeb();
//     FloutAppbar floutAppbar = FloutAppbar();

//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: CustomScrollView(
//         controller: _scrollController,
//         slivers: [
//           floutAppbar.appbar(
//             width: width,
//             isMobile: isMobile,
//             ontapHome: () => scrollToKey(homeKey),
//             ontapAbout: () => scrollToKey(aboutMeKey),
//             ontapProject: () => scrollToKey(projectsKey),
//             ontapFAQ: () => scrollToKey(faqKey),
//             ontapContact: () => scrollToKey(contactKey),
//           ),
//           SliverToBoxAdapter(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 SizedBox(height: isMobile ? height * 0.02 : height * 0.05),

//                 GradientText(
//                   key: homeKey,
//                   text: 'Tarek Almohammad',
//                   fontWeight: FontWeight.w500,
//                   fontSize: isMobile ? 32 : (isTablet ? 48 : 62),
//                 ),
//                 GradientText(
//                   text: 'Flutter Developer',
//                   fontWeight: FontWeight.w400,
//                   fontSize: isMobile ? 24 : (isTablet ? 32 : 38),
//                 ),
//                 _buildImageScrollSection(context, width, height),

//                 // About Me Section
//                 Padding(
//                   key: aboutMeKey,
//                   padding: EdgeInsets.only(
//                     left: isMobile ? 16 : width / 20,
//                     top: isMobile ? 24 : width / 20,
//                     bottom: isMobile ? 16 : width / 30,
//                   ),
//                   child: Align(
//                     alignment: Alignment.centerLeft,
//                     child: GradientText(
//                       text: 'About Me',
//                       fontWeight: FontWeight.w500,
//                       fontSize: isMobile ? 28 : 38,
//                     ),
//                   ),
//                 ),
//                 _buildAboutMeSection(
//                     context, width, height, isMobile, isTablet),

//                 // Projects Section
//                 Padding(
//                   padding: EdgeInsets.only(
//                     left: isMobile ? 16 : width / 20,
//                     top: isMobile ? height * 0.05 : height * 0.1,
//                     bottom: isMobile ? 16 : width / 30,
//                   ),
//                   child: Align(
//                     alignment: Alignment.centerLeft,
//                     child: GradientText(
//                       key: projectsKey,
//                       text: 'My Latest Projects',
//                       fontSize: isMobile ? 28 : 38,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ),
//                 ProjectWidget(
//                   width: width,
//                   height: height,
//                 ),

//                 // FAQ Section
//                 Padding(
//                   padding: EdgeInsets.only(
//                     left: isMobile ? 16 : width / 20,
//                     top: isMobile ? 24 : width / 15,
//                     bottom: isMobile ? 16 : width * 0.02,
//                   ),
//                   child: Align(
//                     alignment: Alignment.centerLeft,
//                     child: GradientText(
//                       key: faqKey,
//                       text: 'Frequently asked questions',
//                       fontSize: isMobile ? 28 : 38,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ),
//                 _buildFaqSection(context, height, width, isMobile),

//                 // Contact Section
//                 Padding(
//                   padding: EdgeInsets.only(
//                     left: isMobile ? 16 : width / 20,
//                     top: isMobile ? 24 : width / 20,
//                     bottom: isMobile ? 16 : width / 30,
//                   ),
//                   child: Align(
//                     alignment: Alignment.centerLeft,
//                     child: GradientText(
//                       key: contactKey,
//                       text: 'Contact Me',
//                       fontSize: isMobile ? 28 : 35,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ),
//                 _buildContactSection(
//                     context, width, height, isMobile, isTablet, lunchWeb),

//                 SizedBox(height: isMobile ? height * 0.05 : height * 0.13),
//                 BottomWeb(
//                   height: height,
//                   isMobile: isMobile,
//                   onTapHome: () => scrollToKey(homeKey),
//                   onTapAboutMe: () => scrollToKey(aboutMeKey),
//                   onTapProjects: () => scrollToKey(projectsKey),
//                   onTapFAQ: () => scrollToKey(faqKey),
//                   onTapContact: () => scrollToKey(contactKey),
//                 ),
//                 SizedBox(height: isMobile ? height * 0.02 : height * 0.06),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildImageScrollSection(
//       BuildContext context, double width, double height) {
//     final isMobile = ResponsiveUtils.isMobile(context);

//     return Stack(
//       children: [
//         Container(
//           margin: EdgeInsets.only(
//               left: isMobile ? 0 : width / 10,
//               top: isMobile ? height * 0.02 : height * 0.05),
//           alignment: Alignment.center,
//           decoration: const BoxDecoration(
//             borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(15), topRight: Radius.circular(15)),
//           ),
//           child: isMobile
//               ? _buildMobileImageScroll(context)
//               : _buildDesktopImageScroll(context),
//         ),
//         Positioned.fill(
//           child: IgnorePointer(
//             child: Stack(
//               children: [
//                 Container(
//                   decoration: const BoxDecoration(
//                     gradient: RadialGradient(
//                       radius: 1.5,
//                       center: Alignment.topLeft,
//                       colors: [
//                         Colors.black,
//                         Colors.black12,
//                         Colors.transparent,
//                       ],
//                     ),
//                   ),
//                 ),
//                 Container(
//                   decoration: const BoxDecoration(
//                     gradient: RadialGradient(
//                       radius: 1.5,
//                       center: Alignment.topRight,
//                       colors: [
//                         Colors.black,
//                         Colors.black12,
//                         Colors.transparent
//                       ],
//                     ),
//                   ),
//                 ),
//                 Container(
//                   decoration: const BoxDecoration(
//                     gradient: LinearGradient(
//                       colors: [
//                         Colors.black,
//                         Colors.transparent,
//                       ],
//                       begin: Alignment.topCenter,
//                       end: Alignment.center,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   decoration: const BoxDecoration(
//                     gradient: LinearGradient(
//                       colors: [
//                         Colors.black,
//                         Colors.transparent,
//                         Colors.transparent,
//                       ],
//                       begin: Alignment.bottomCenter,
//                       end: Alignment.center,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildMobileImageScroll(BuildContext context) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Row(
//         children: [
//           _buildScrollColumn(context, oneImages),
//           _buildScrollColumn(context, twoImages),
//           _buildScrollColumn(context, threeImages),
//           _buildScrollColumn(context, fourImages),
//           _buildScrollColumn(context, fifeImages),
//         ],
//       ),
//     );
//   }

//   Widget _buildDesktopImageScroll(BuildContext context) {
//     return Row(
//       children: [
//         _buildScrollColumn(context, oneImages),
//         _buildScrollColumn(context, twoImages),
//         _buildScrollColumn(context, threeImages),
//         _buildScrollColumn(context, fourImages),
//         _buildScrollColumn(context, fifeImages),
//       ],
//     );
//   }

//   Widget _buildAboutMeSection(BuildContext context, double width, double height,
//       bool isMobile, bool isTablet) {
//     if (isMobile) {
//       return Column(
//         children: [
//           containerItem(
//             context,
//             height: 400,
//             width: width * 0.9,
//             children: [
//               GradientText(
//                 text: 'EDUCATION',
//                 fontWeight: FontWeight.w400,
//                 fontSize: isMobile ? 20 : 26,
//               ),
//               Text(
//                 'Informatics Engineering, Computers Department',
//                 style: h3Style.copyWith(fontSize: isMobile ? 14 : null),
//               ),
//               Text(
//                 'Ittihad Private University',
//                 style: h3Style.copyWith(fontSize: isMobile ? 14 : null),
//               ),
//               GradientText(
//                 text: 'Professional Summary',
//                 fontWeight: FontWeight.w400,
//                 fontSize: isMobile ? 20 : 26,
//               ),
//               Text(
//                 'A skilled Flutter developer with over 3 years of experience in building high-performance, cross-platform mobile applications. Proficient in  Firebase, Supabase, and state management with strong expertise in UI/UX design and API integration.',
//                 style: contentStyle.copyWith(fontSize: isMobile ? 12 : null),
//               ),
//             ],
//           ),
//           SizedBox(height: 16),
//           containerItem(
//             context,
//             height: 300,
//             width: width * 0.9,
//             children: [
//               Text(
//                 'Technical Skills',
//                 style: tagStyle.copyWith(fontSize: isMobile ? 14 : null),
//               ),
//               Text(
//                 '• Flutter framework, Dart, Firebase, Supabase, Hive\n• State management : Bloc, Riverpod, Get X, etc. \n• Architecture Patterns: MVC, MVP, MVVM, \n• etc. RESTful APIs, JSON, MySQL \n• Git, Version control, Clean Code, Microsoft Office',
//                 style: contentStyle.copyWith(fontSize: isMobile ? 12 : null),
//               ),
//             ],
//           ),
//         ],
//       );
//     } else {
//       return Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           containerItem(
//             context,
//             height: 400,
//             width: isTablet ? width * 0.5 : width * 0.6,
//             children: [
//               GradientText(
//                 text: 'EDUCATION',
//                 fontWeight: FontWeight.w400,
//                 fontSize: 26,
//               ),
//               Text(
//                 'Informatics Engineering, Computers Department',
//                 style: h3Style,
//               ),
//               Text(
//                 'Ittihad Private University',
//                 style: h3Style,
//               ),
//               GradientText(
//                 text: 'Professional Summary',
//                 fontWeight: FontWeight.w400,
//                 fontSize: 26,
//               ),
//               Text(
//                 'A skilled Flutter developer with over 3 years of experience in building high-performance, cross-platform mobile applications. Proficient in  Firebase, Supabase, and state management with strong expertise in UI/UX design and API integration.',
//                 style: contentStyle,
//               ),
//             ],
//           ),
//           SizedBox(width: width * 0.01),
//           containerItem(
//             context,
//             height: 400,
//             width: isTablet ? width * 0.4 : width * 0.3,
//             children: [
//               Text(
//                 'Technical Skills',
//                 style: tagStyle,
//               ),
//               Text(
//                 '• Flutter framework, Dart, Firebase, Supabase, Hive\n• State management : Bloc, Riverpod, Get X, etc. \n• Architecture Patterns: MVC, MVP, MVVM, \n• etc. RESTful APIs, JSON, MySQL \n• Git, Version control, Clean Code, Microsoft Office',
//                 style: contentStyle,
//               ),
//             ],
//           ),
//         ],
//       );
//     }
//   }

//   Widget _buildFaqSection(
//       BuildContext context, double height, double width, bool isMobile) {
//     return SizedBox(
//       height: isMobile ? height * 0.8 : height * 0.7,
//       child: ListView.separated(
//         padding: EdgeInsets.only(
//             left: isMobile ? 16 : width / 20,
//             right: isMobile ? 16 : width / 20),
//         separatorBuilder: (context, index) {
//           return Divider(
//             color: primaryColor,
//             thickness: 1,
//           );
//         },
//         itemCount: faqs.length,
//         itemBuilder: (context, index) {
//           return ExpansionTile(
//             tilePadding: EdgeInsets.all(isMobile ? 8 : 10),
//             expandedAlignment: Alignment.centerLeft,
//             shape: Border.all(width: 0.0),
//             iconColor: primaryColor,
//             collapsedIconColor: primaryColor,
//             title: Text(
//               faqs[index].question,
//               style: contentStyle.copyWith(
//                 fontSize: isMobile ? 12 : null,
//               ),
//             ),
//             children: [
//               Padding(
//                 padding: EdgeInsets.all(isMobile ? 8 : 16),
//                 child: Text(
//                   faqs[index].answer,
//                   style: content2Style.copyWith(
//                     fontSize: isMobile ? 11 : null,
//                   ),
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }

//   Widget _buildContactSection(BuildContext context, double width, double height,
//       bool isMobile, bool isTablet, LunchWeb lunchWeb) {
//     if (isMobile) {
//       return Column(
//         children: [
//           containerItem(
//             context,
//             height: height * 0.5,
//             width: width * 0.9,
//             children: [
//               GradientText(
//                 text: 'Let’s Build Something Great Together',
//                 fontWeight: FontWeight.w400,
//                 fontSize: isMobile ? 20 : 26,
//               ),
//               Text(
//                 'Have a project idea, a collaboration in mind, or just want to say hello? I’d love to hear from you. Feel free to reach out using the form below or through any of my social platforms.',
//                 style: contentStyle.copyWith(fontSize: isMobile ? 12 : null),
//               ),
//               SizedBox(height: 16),
//               myBotton(
//                 lunchWeb,
//                 context,
//                 text: 'Email',
//                 url: 'tareqsarheed@gmail.com',
//                 height: 40,
//                 width: width * 0.7,
//               ),
//               SizedBox(height: 16),
//               myBotton(
//                 lunchWeb,
//                 context,
//                 text: 'github',
//                 url: 'https://github.com/TarekSrheed',
//                 height: 40,
//                 width: width * 0.7,
//               ),
//               SizedBox(height: 16),
//               myBotton(
//                 lunchWeb,
//                 context,
//                 text: 'LinkedIn',
//                 url:
//                     'https://www.linkedin.com/in/tarek-almohamad-7b850a228?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app',
//                 height: 40,
//                 width: width * 0.7,
//               ),
//             ],
//           ),
//         ],
//       );
//     } else {
//       return Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           containerItem(
//             context,
//             height: height * 0.5,
//             width: isTablet ? width * 0.55 : width * 0.6,
//             children: [
//               GradientText(
//                 text: 'Let’s Build Something Great Together',
//                 fontWeight: FontWeight.w400,
//                 fontSize: 26,
//               ),
//               Text(
//                 'Have a project idea, a collaboration in mind, or just want to say hello? I’d love to hear from you. Feel free to reach out using the form below or through any of my social platforms.',
//                 style: contentStyle,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   myBotton(
//                     lunchWeb,
//                     context,
//                     text: 'Email',
//                     url: 'tareqsarheed@gmail.com',
//                     height: 40,
//                     width: isTablet ? width * 0.25 : width * 0.25,
//                   ),
//                   myBotton(
//                     lunchWeb,
//                     context,
//                     text: 'github',
//                     url: 'https://github.com/TarekSrheed',
//                     height: 40,
//                     width: isTablet ? width * 0.25 : width * 0.25,
//                   ),
//                 ],
//               )
//             ],
//           ),
//           SizedBox(width: width * 0.01),
//           containerItem(
//             context,
//             height: height * 0.5,
//             width: isTablet ? width * 0.35 : width * 0.3,
//             children: [
//               Align(
//                 alignment: Alignment.center,
//                 child: Text(
//                   '🚀🚀🚀🚀',
//                   style: tagStyle,
//                 ),
//               ),
//               Text(
//                 'Let’s turn your ideas into powerful mobile experiences.',
//                 style: contentStyle,
//               ),
//               myBotton(
//                 lunchWeb,
//                 context,
//                 text: 'LinkedIn',
//                 url:
//                     'https://www.linkedin.com/in/tarek-almohamad-7b850a228?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app',
//                 height: 40,
//                 width: double.maxFinite,
//               ),
//             ],
//           ),
//         ],
//       );
//     }
//   }

//   Widget _buildScrollColumn(BuildContext context, List images) {
//     final isMobile = ResponsiveUtils.isMobile(context);
//     return SizedBox(
//       width: isMobile
//           ? MediaQuery.of(context).size.width * 0.4
//           : MediaQuery.of(context).size.width * 0.16,
//       height: isMobile ? 400 : 600,
//       child: InfiniteScrollColumn(items: images),
//     );
//   }
// }

// // class FloutAppbar {
// //   Widget appbar({
// //     required double width,
// //     required bool isMobile,
// //     required VoidCallback ontapHome,
// //     required VoidCallback ontapAbout,
// //     required VoidCallback ontapProject,
// //     required VoidCallback ontapFAQ,
// //     required VoidCallback ontapContact,
// //   }) {
// //     return SliverAppBar(
// //       backgroundColor: Colors.black,
// //       expandedHeight: isMobile ? 80 : 100,
// //       floating: true,
// //       pinned: true,
// //       flexibleSpace: FlexibleSpaceBar(
// //         background: Container(
// //           color: Colors.black,
// //         ),
// //         title: isMobile
// //             ? Row(
// //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
// //                 children: [
// //                   _buildAppBarButton('Home', ontapHome),
// //                   _buildAppBarButton('About', ontapAbout),
// //                   _buildAppBarButton('Projects', ontapProject),
// //                 ],
// //               )
// //             : Row(
// //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
// //                 children: [
// //                   _buildAppBarButton('Home', ontapHome),
// //                   _buildAppBarButton('About Me', ontapAbout),
// //                   _buildAppBarButton('My Projects', ontapProject),
// //                   _buildAppBarButton('FAQ', ontapFAQ),
// //                   _buildAppBarButton('Contact Me', ontapContact),
// //                 ],
// //               ),
// //         titlePadding: const EdgeInsets.only(bottom: 10),
// //         centerTitle: true,
// //       ),
// //     );
// //   }

//   Widget _buildAppBarButton(String text, VoidCallback onTap) {
//     return TextButton(
//       onPressed: onTap,
//       child: Text(
//         text,
//         style: const TextStyle(color: Colors.white),
//       ),
//     );
//   }
// }

// class BottomWeb extends StatelessWidget {
//   final double height;
//   final bool isMobile;
//   final VoidCallback onTapHome;
//   final VoidCallback onTapAboutMe;
//   final VoidCallback onTapProjects;
//   final VoidCallback onTapFAQ;
//   final VoidCallback onTapContact;

//   const BottomWeb({
//     super.key,
//     required this.height,
//     required this.isMobile,
//     required this.onTapHome,
//     required this.onTapAboutMe,
//     required this.onTapProjects,
//     required this.onTapFAQ,
//     required this.onTapContact,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: isMobile ? height * 0.15 : height * 0.2,
//       color: Colors.black,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           isMobile
//               ? Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     _buildFooterButton('Home', onTapHome),
//                     _buildFooterButton('About', onTapAboutMe),
//                     _buildFooterButton('Projects', onTapProjects),
//                   ],
//                 )
//               : Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     _buildFooterButton('Home', onTapHome),
//                     _buildFooterButton('About Me', onTapAboutMe),
//                     _buildFooterButton('My Projects', onTapProjects),
//                     _buildFooterButton('FAQ', onTapFAQ),
//                     _buildFooterButton('Contact Me', onTapContact),
//                   ],
//                 ),
//           SizedBox(height: isMobile ? 10 : 20),
//           Text(
//             '© 2023 Tarek Almohammad. All rights reserved',
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: isMobile ? 12 : 16,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildFooterButton(String text, VoidCallback onTap) {
//     return TextButton(
//       onPressed: onTap,
//       child: Text(
//         text,
//         style: const TextStyle(color: Colors.white),
//       ),
//     );
//   }
// }
