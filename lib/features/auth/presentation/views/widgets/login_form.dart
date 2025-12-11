import 'package:flutter/material.dart';
import 'package:mantiq_app/core/components/widgets/main_button.dart';
import 'package:mantiq_app/core/extensions/app_extentions.dart';
import 'package:mantiq_app/core/extensions/app_regex.dart';
import '../../../../../core/components/widgets/app_text_field.dart';
import '../../../../../core/routes/routes.dart';
import 'navigate_text_widget.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTextField(
            controller: emailController,
            hintText: "Email",
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return "Email cannot be empty";
              }
              if (!AppRegex.isEmailValid(value.trim())) {
                return "Please enter a valid email address";
              }
              return null;
            },
          ),
          8.verticalSizedBox,
          AppTextField(
            controller: passwordController,
            hintText: "Password",
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.done,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Password cannot be empty";
              }
              if (!AppRegex.hasMinLength(value)) {
                return "Password must be at least 8 characters";
              }
              if (!AppRegex.hasUpperCase(value)) {
                return "Password must contain an uppercase letter";
              }
              if (!AppRegex.hasLowerCase(value)) {
                return "Password must contain a lowercase letter";
              }
              if (!AppRegex.hasNumber(value)) {
                return "Password must include a number";
              }
              if (!AppRegex.hasSpecialCharacter(value)) {
                return "Password must include a special character";
              }
              return null;
            },
          ),
          16.verticalSizedBox,
          NavigateTextWidget(
            title: "Forgot your password?",
            onTap: () {
              context.pushNamed(Routes.forgotPassword);
            },
          ),
          32.verticalSizedBox,
          MainButton(
            title: "LOGIN",
            onTap: () {
              if (_formKey.currentState!.validate()) {
                context.pushNamed(Routes.bottomNav);
              }
              print("LOGIN SUCCESS");
            },
          ),
        ],
      ),
    );
  }
}
