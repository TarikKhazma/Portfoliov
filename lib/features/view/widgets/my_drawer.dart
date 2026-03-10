import 'package:flutter/material.dart';
import 'package:portfolio/core/res/app_colors.dart';
import 'package:portfolio/core/res/app_style.dart';

Drawer myDrawer({
  required void Function()? ontapHome,
  required void Function()? ontapAbout,
  required void Function()? ontapProject,
  required void Function()? ontapFAQ,
  required void Function()? ontapContact,
}) {
  return Drawer(
    backgroundColor: Colors.black87,
    child: ListView(
      children: [
        const SizedBox(
          height: 70,
        ),
        ListTile(
          onTap: ontapHome,
          title: Text(
            'Home',
            style: content1Style,
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: primaryColor,
            size: 15,
          ),
        ),
        ListTile(
          onTap: ontapAbout,
          title: Text(
            'About Me',
            style: content1Style,
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: primaryColor,
            size: 15,
          ),
        ),
        ListTile(
          onTap: ontapProject,
          title: Text(
            'Projects',
            style: content1Style,
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: primaryColor,
            size: 15,
          ),
        ),
        ListTile(
          onTap: ontapFAQ,
          title: Text(
            'FAQ',
            style: content1Style,
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: primaryColor,
            size: 15,
          ),
        ),
        ListTile(
          onTap: ontapContact,
          title: Text(
            'Contact Me',
            style: content1Style,
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: primaryColor,
            size: 15,
          ),
        ),
      ],
    ),
  );
}
