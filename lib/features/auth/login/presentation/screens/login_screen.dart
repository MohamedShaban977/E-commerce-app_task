import 'package:e_commerce_app_task/core/locale/app_localizations.dart';
import 'package:e_commerce_app_task/core/routes/magic_router.dart';
import 'package:e_commerce_app_task/core/routes/routes_name.dart';
import 'package:e_commerce_app_task/widgets/toast_and_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app/injection_container.dart';
import '../../../../../core/app_manage/color_manager.dart';
import '../../../../../core/app_manage/strings_manager.dart';
import '../../../../../core/app_manage/values_manager.dart';
import '../../../../../core/responsive/responsive.dart';
import '../../../../../widgets/unfocused_keyboard.dart';
import '../../data/models/login_request.dart';
import '../cubit/login_cubit.dart';
import 'responsive/mobile_login_screen.dart';
import 'responsive/tablet_login_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController userName = TextEditingController();
  final TextEditingController password = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    userName.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: _listener,
      builder: (context, state) {
        return UnFocusedKeyboard(
          child: Scaffold(
            // resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p26),
              child: Form(
                key: _formKey,
                child: Responsive(
                  mobile: MobileLoginScreen(
                    userName: userName,
                    password: password,
                    onTap: _submitLoginButton,
                  ),
                  tablet: TabletLoginScreen(
                    userName: userName,
                    password: password,
                    onTap: _submitLoginButton,
                  ),
                  desktop: TabletLoginScreen(
                    userName: userName,
                    password: password,
                    onTap: _submitLoginButton,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _listener(context, state) {
    if (state is LoginSuccessState) {
      ToastAndSnackBar.toastSuccess(
          message: AppStrings.verificationCompletedSuccessfully.tr());
      MagicRouterName.navigateAndPopAll(RoutesNames.mainLayoutApp);
    }
    if (state is LoginErrorState) {
      ToastAndSnackBar.toastError(message: state.error);
    }
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: ColorManager.background,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
    );
  }

  Future<dynamic> _submitLoginButton() async {
    if (_formKey.currentState!.validate()) {
      await Future.sync(() => sl<LoginCubit>().get(context).login(LoginRequest(
            username: userName.text,
            password: password.text,
          )));
    }
  }
}

/// responsive
