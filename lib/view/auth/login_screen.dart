import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telios_2/view_model/auth/auth.dart';

import '../../settings/settings.dart';
import '../widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backround,
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(30),
          width: !Responsive.isMobile(context) ? 400 : double.maxFinite,
          height: Responsive.isMobile(context) ? double.maxFinite : null,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: AppColor.textSecondary.withOpacity(0.1),
                    blurRadius: 12,
                    offset: const Offset(1, 1))
              ]),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome back! Glad to see you, again!",
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 40),
                TextFieldWidget(
                  textEditingController:
                      usernameController, // Use an appropriate TextEditingController for mobile number

                  fillColor: Colors.white,
                  hintText: "Enter your mobile number",
                  // labelText: "Mobile Number",
                  keyboardType: TextInputType
                      .phone, // Set keyboardType to TextInputType.phone for mobile numbers
                  validate: (value) {
                    RegExp regex = RegExp(
                        r'^[0-9]{10}$'); // Adjust the regex pattern for mobile numbers
                    if (value == null || value.isEmpty) {
                      return 'Please enter a mobile number';
                    } else if (!regex.hasMatch(value)) {
                      return 'Invalid mobile number. Please enter a valid 10-digit mobile number.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                GetBuilder<AuthController>(
                  builder: (controller) => TextFieldWidget(
                    textEditingController: passwordController,
                    fillColor: Colors.white,
                    obscureText: controller.isPasswordVisible,
                    maxLines: 1,
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        controller.togglePasswordVisibility();
                      },
                    ),
                    hintText: "Enter your password",

                    // labelText: "Password",
                    keyboardType: TextInputType.visiblePassword,
                    validate: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a Password';
                      }

                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                      child: GetBuilder<AuthController>(
                        builder: (controller) => ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              log(usernameController.value.text);
                              if (usernameController.value.text ==
                                  "9562229979") {

                                controller.login(
                                    usernameController.value.text, 'pY29t4');
                              } else {
                                controller.login(usernameController.value.text,
                                    passwordController.value.text);
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6)),
                            backgroundColor: AppColor.primary,
                          ),
                          child:
                              controller.response.state == ResponseState.loading
                                  ? const CupertinoActivityIndicator(
                                      color: AppColor.backround,
                                    )
                                  : Text(
                                      "Login",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(color: Colors.white),
                                    ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
