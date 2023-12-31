import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../routes/router.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset("assets/images/logo_web_att.png"),
          ),
          DrawerListTile(
            title: "Dashboard",
            svgSrc: "assets/icons/menu_dashboard.svg",
            press: () {
              context.goNamed(Routes.dashboardPage);
            },
          ),
          const SizedBox(
            height: 10,
          ),
          DrawerListTile(
            title: "Attedances",
            svgSrc: "assets/icons/menu_tran.svg",
            press: () {
              context.goNamed(Routes.attedancePage);
            },
          ),
          const SizedBox(
            height: 10,
          ),
          DrawerListTile(
            title: "Leaves",
            svgSrc: "assets/icons/menu_task.svg",
            press: () {
              context.goNamed(Routes.leavePage);
            },
          ),
          const SizedBox(
            height: 10,
          ),
          DrawerListTile(
            title: "Users",
            svgSrc: "assets/icons/menu_profile.svg",
            press: () {
              context.goNamed(Routes.usersPage);
            },
          ),
          const SizedBox(
            height: 10,
          ),
          DrawerListTile(
            title: "Settings",
            svgSrc: "assets/icons/menu_setting.svg",
            press: () {
              context.goNamed(Routes.settingPage);
            },
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        colorFilter: ColorFilter.mode(Colors.white54, BlendMode.srcIn),
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white54),
      ),
    );
  }
}
