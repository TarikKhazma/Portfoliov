import 'package:flutter/material.dart';
import 'package:portfolio/core/res/app_colors.dart';
import 'package:portfolio/core/res/app_style.dart';
import 'package:portfolio/core/res/images/app_images.dart';
import 'package:portfolio/features/view/widgets/clip_image.dart';

class FloutAppbar {
  Widget appbar({
    required double width,
    required bool isMobile,
    required bool isTablet,
    required BuildContext context,
    required double topHeight,
    void Function()? ontapHome,
    void Function()? ontapAbout,
    void Function()? ontapProject,
    void Function()? ontapFAQ,
    void Function()? ontapContact,
    void Function()? ontapMenu,
    void Function()? ontapImage,
  }) {
    if (isMobile) {
      return Container(
        height: 50,
        constraints: BoxConstraints(maxWidth: isMobile ? 300 : 500),
        decoration: BoxDecoration(
          color: const Color(0xff121212).withOpacity(0.75),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
        child: ListTile(
          leading: Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor: primaryColor.withOpacity(0.3),
              borderRadius: BorderRadius.circular(10),
              onTap: ontapMenu,
              child: Icon(Icons.menu, color: primaryColor),
            ),
          ),
          trailing: InkWell(onTap: ontapImage, child: imageClip(logo, 35, 35)),
        ),
      );
    } else {
      return Center(
        child: Container(
          height: 50,
          margin: EdgeInsets.only(top: topHeight, left: 10, right: 10),
          constraints: BoxConstraints(maxWidth: isMobile ? 300 : 500),
          decoration: BoxDecoration(
            color: const Color(0xff121212).withOpacity(0.75),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(onTap: ontapHome, child: imageClip(logo, 50, 50)),
              TextButton(
                onPressed: ontapAbout,
                child: Text('About Me', style: appbarStyle),
              ),
              SizedBox(width: width * 0.01),
              TextButton(
                onPressed: ontapProject,
                child: Text('Projects', style: appbarStyle),
              ),
              SizedBox(width: width * 0.01),
              TextButton(
                onPressed: ontapFAQ,
                child: Text('FAQ', style: appbarStyle),
              ),
              SizedBox(width: width * 0.01),
              TextButton(
                onPressed: ontapContact,
                child: Text('Contact me', style: appbarStyle),
              ),
            ],
          ),
        ),
      );
    }
  }
}

// class SlidAppbar extends StatefulWidget {
//   const SlidAppbar({super.key});

//   @override
//   State<SlidAppbar> createState() => _SlidAppbarState();
// }

// class _SlidAppbarState extends State<SlidAppbar>
//     with SingleTickerProviderStateMixin {
//   bool isExpand = false;
//   late AnimationController animationController;
//   late Animation<double> heightAnimation;
//   @override
//   void initState() {
//     animationController = AnimationController(
//         vsync: this, duration: const Duration(microseconds: 300));
//     heightAnimation = Tween<double>(
//       begin: 0,
//       end: 300,
//     ).animate(animationController);
//     super.initState();
//   }

//   @override
//   void dispose() {
//     animationController.dispose();
//     super.dispose();
//   }

//   void toggleMenu() {
//     setState(() {
//       isExpand = !isExpand;
//       if (isExpand) {
//         animationController.forward();
//       } else {
//         animationController.reverse();
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SliverAppBar(
//       backgroundColor: Colors.transparent,
//       pinned: true,
//       expandedHeight: isExpand ? 300 : 70,
//       collapsedHeight: 70,
//       floating: false,
//       flexibleSpace: Container(
//         height: 50,
//         margin: EdgeInsets.only(top: 20, left: 30, right: 30),
//         padding: EdgeInsets.only(left: 15, right: 15),
//         constraints: BoxConstraints(maxWidth: 300),
//         decoration: BoxDecoration(
//           color: const Color(0xff121212).withOpacity(0.75),
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(30),
//             topRight: Radius.circular(30),
//             bottomLeft: isExpand ? Radius.circular(0) : Radius.circular(30),
//             bottomRight: isExpand ? Radius.circular(0) : Radius.circular(30),
//           ),
//         ),
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Icon(Icons.book),
//                 IconButton(
//                   icon: Icon(isExpand ? Icons.close : Icons.menu,
//                       color: Colors.green),
//                   onPressed: toggleMenu,
//                 ),
//               ],
//             ),
//             isExpand
//                 ? Column(
//                     children: [
//                       _buildMenuItem("Home", Icons.home),
//                       _buildMenuItem("About Me", Icons.person),
//                       _buildMenuItem("Blog", Icons.article),
//                       _buildMenuItem("FAQ", Icons.help),
//                       _buildMenuItem("Connect Me", Icons.contact_mail),
//                     ],
//                   )
//                 : Container(),
//           ],
//         ),
//       ),
//       //  FlexibleSpaceBar(
//       //   background: isExpand ? _buildMenuContent() : null,
//       // ),

//       // actions: [

//       // ],
//     );
//   }

//   Widget _buildMenuContent() {
//     return Container(
//       decoration: BoxDecoration(
//         color: const Color(0xff121212).withOpacity(0.75),
//         borderRadius: BorderRadius.only(
//           bottomRight: Radius.circular(30),
//           bottomLeft: Radius.circular(30),
//           topLeft: isExpand ? Radius.circular(0) : Radius.circular(30),
//           topRight: isExpand ? Radius.circular(0) : Radius.circular(30),
//         ),
//         // border: Border(
//         //   bottom: BorderSide(color: Colors.green, width: 2),
//         //   left: BorderSide(color: Colors.green, width: 2),
//         //   right: BorderSide(color: Colors.green, width: 2),
//         // ),
//       ),
//       child: Column(
//         children: [
//           _buildMenuItem("Home", Icons.home),
//           _buildMenuItem("About Me", Icons.person),
//           _buildMenuItem("Blog", Icons.article),
//           _buildMenuItem("FAQ", Icons.help),
//           _buildMenuItem("Connect Me", Icons.contact_mail),
//         ],
//       ),
//     );
//   }

//   Widget _buildMenuItem(String title, IconData icon) {
//     return ListTile(
//       leading: Icon(icon, color: Colors.green),
//       title: Text(title, style: TextStyle(color: Colors.white)),
//       onTap: () {
//         toggleMenu();
//         // إضافة أي إجراء إضافي هنا
//       },
//     );
//   }
// }
