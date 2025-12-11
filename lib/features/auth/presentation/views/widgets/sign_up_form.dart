import 'package:flutter/material.dart';
import 'package:mantiq_app/core/extensions/app_extentions.dart';
import 'package:mantiq_app/core/extensions/app_regex.dart';

import '../../../../../core/components/widgets/app_text_field.dart';
import '../../../../../core/components/widgets/main_button.dart';
import '../../../../../core/routes/routes.dart';
import 'navigate_text_widget.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final TextEditingController nameController = TextEditingController();
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
            hintText: "Name",
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return "Name cannot be empty";
              }
              if (value.length < 3) {
                return "Name must be at least 3 characters";
              }
              return null;
            },
            controller: nameController,
          ),
          8.verticalSizedBox,
          AppTextField(
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
            controller: emailController,
          ),
          8.verticalSizedBox,
          AppTextField(
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
            controller: passwordController,
          ),
          16.verticalSizedBox,
          NavigateTextWidget(
            title: "Already have an account?",
            onTap: () {
              context.pushNamed(Routes.login);
            },
          ),
          32.verticalSizedBox,
          MainButton(
            title: "SIGN UP",
            onTap: () {
              if (_formKey.currentState!.validate()) {
                context.pushNamed(Routes.login);
              }
              print("SIGN UP SUCCESS");
            },
          ),
        ],
      ),
    );
  }
}
