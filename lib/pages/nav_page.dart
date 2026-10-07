import 'package:finman_app/pages/add_expense_page.dart';
import 'package:finman_app/pages/my_account_page.dart';
import 'package:finman_app/pages/home_page.dart';
import 'package:finman_app/pages/overview_page.dart';
import 'package:finman_app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class NavPage extends StatefulWidget {
  const NavPage({super.key});

  @override
  State<NavPage> createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  int selectedIndex = 0;
  bool showNavbar = true;
  void onScroll(bool showNav){
    if (showNav) {
      setState(() {
        showNavbar = true;
      });
      return;
      
    }
    showNavbar = false;
    return;
  }
  List<Widget> pages = [HomePage(),OverviewPage() ,MyAccountPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: IndexedStack(index: selectedIndex, children: pages),
      bottomNavigationBar: Container(
        height: 40,
        margin: EdgeInsets.symmetric(horizontal: 28, vertical: 040),
        decoration: BoxDecoration(
          border:Border.all(
            color: AppTheme.border,
            width: 0.2
          ) ,
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () => setState(() {
                selectedIndex = 0;
              }),
              child: SvgPicture.asset(
                selectedIndex == 0 ? 'assets/icons/home_filled.svg':'assets/icons/home.svg',
                color: selectedIndex == 0 ? AppTheme.brown : AppTheme.grey,
                height: selectedIndex == 0 ? 20 : 18,
              ),
            ),
            GestureDetector(
              onTap: () => setState(() {
                selectedIndex = 1;
              }),
              child: SvgPicture.asset(
                selectedIndex == 1 ? 'assets/icons/overview_filled.svg':'assets/icons/overview.svg',
                color: selectedIndex == 1 ? AppTheme.brown : AppTheme.grey,
                height: selectedIndex == 1 ? 20 : 18,
              ),
            ),
            GestureDetector(
              onTap: () => setState(() {
                selectedIndex = 2;
              }),
              child: SvgPicture.asset(
                selectedIndex == 2 ? 'assets/icons/user_filled.svg':'assets/icons/user.svg',
                color: selectedIndex == 2 ? AppTheme.brown : AppTheme.grey,
                height: selectedIndex == 2 ? 20 : 18,
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: ((context) => AddExpensePage()))),
              child: SvgPicture.asset(
                'assets/icons/add.svg',
                color: Colors.black,
                height: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
