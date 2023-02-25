import 'package:e_commerce_app_task/core/app_manage/extension_manager.dart';
import 'package:flutter/material.dart';


import '../../../auth/login/presentation/widgets/custom_button_lang_widget.dart';
import '../widgets/custom_nav_bar.dart';

class MainLayoutAppScreen extends StatefulWidget {
  const MainLayoutAppScreen({Key? key}) : super(key: key);

  @override
  State<MainLayoutAppScreen> createState() => _MainLayoutAppScreenState();
}

class _MainLayoutAppScreenState extends State<MainLayoutAppScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: CustomNavBar(),
    );
  }
}




///




