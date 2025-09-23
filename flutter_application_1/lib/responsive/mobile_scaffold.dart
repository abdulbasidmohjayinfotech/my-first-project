
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant.dart';
import 'package:flutter_application_1/responsive/pages.dart';

class MobileScaffold extends StatefulWidget {
  const MobileScaffold({super.key});

  @override
  State<MobileScaffold> createState() => _MobileScaffoldState();
}

class _MobileScaffoldState extends State<MobileScaffold> {
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
      drawer: buildMyDrawer((selected) {
        Navigator.pop(context); 
        setState(() {
          selectedPage = selected;
        });
      }),
      body: SafeArea(child: _getPage(selectedPage)),

    );
  }
}
