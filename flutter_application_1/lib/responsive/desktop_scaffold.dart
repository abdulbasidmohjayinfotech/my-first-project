
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant.dart';
import 'package:flutter_application_1/responsive/pages.dart';

class DesktopScaffold extends StatefulWidget {
  const DesktopScaffold({super.key});

  @override
  State<DesktopScaffold> createState() => _DesktopScaffoldState();
}

class _DesktopScaffoldState extends State<DesktopScaffold> {
  String selectedPage = 'dashboard';

  Widget _getPage(String key) {
    switch (key) {
      case 'messages':
        return const MessagesPage();
      case 'settings':
        return const SettingsPage();
      case 'logout':
        return const LogoutPage();
      case 'dashboard':
      default:
        return const DashboardPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myDefaultColor,
      appBar: myAppBar,
      body: Row(
        children: [
        
          SizedBox(
            width: 250,
            child: buildMyDrawer((selected) {
              setState(() {
                selectedPage = selected;
              });
            }),
          ),

        
          Expanded(child: _getPage(selectedPage)),
        ],
      ),
    );
  }
}
