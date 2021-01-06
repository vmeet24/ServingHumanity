import 'package:serving_humanity/ui/shared/ui_helpers.dart';
import 'package:serving_humanity/ui/widgets/busy_button.dart';
import 'package:serving_humanity/ui/widgets/input_field_v2.dart';
import 'package:serving_humanity/ui/widgets/text_link.dart';

import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'login_view_model.dart';

class LoginView extends StatelessWidget {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
        builder: (context, model, child) {
          print("Login rebuilt");
          return Scaffold(
              body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  verticalSpaceMassive,
                  Container(
                    // height: 200,
                    alignment: AlignmentDirectional.center,
                    child: Text(
                      "SERVING HUMANITY",
                      style: TextStyle(letterSpacing: 2, fontSize: 25.0),
                    ),
                  ),
                  verticalSpaceMassive,
                  InputFieldV2(
                    placeholder: 'Email',
                    controller: emailController,
                  ),
                  verticalSpaceSmall,
                  InputFieldV2(
                    placeholder: 'Password',
                    password: true,
                    controller: passwordController,
                  ),
                  verticalSpaceMedium,
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BusyButton(
                        title: 'Login',
                        busy: model.isBusy,
                        onPressed: () {
                          model.login(
                            email: emailController.text,
                            password: passwordController.text,
                          );
                        },
                      )
                    ],
                  ),
                  verticalSpaceMedium,
                  TextLink(
                    'Create an Account if you\'re new.',
                    onPressed: () {
                      model.navigateToRegister();
                    },
                  )
                ],
              ),
            ),
          ));
        },
        viewModelBuilder: () => LoginViewModel());
  }
}
