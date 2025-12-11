import 'package:flutter/material.dart';
import 'package:mantiq_app/core/extensions/app_extentions.dart';
import 'package:mantiq_app/core/extensions/app_regex.dart';
import 'package:mantiq_app/core/routes/routes.dart';
import '../../../../../core/components/widgets/app_text_field.dart';
import '../../../../../core/components/widgets/main_button.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({super.key});

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          AppTextField(
            hintText: "Email",
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.done,
            controller: emailController,
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
          70.verticalSizedBox,
          MainButton(title: "SEND", onTap: () {
            if (_formKey.currentState!.validate()) {
                context.pushNamed(Routes.login);
              }
              print("Forgot password success");
          }),
        ],
      ),
    );
  }
}
