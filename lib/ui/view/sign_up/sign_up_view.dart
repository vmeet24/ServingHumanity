import 'package:flutter/material.dart';
import 'package:serving_humanity/ui/shared/ui_helpers.dart';
import 'package:serving_humanity/ui/view/sign_up/signup_view_model.dart';
import 'package:serving_humanity/ui/widgets/busy_button.dart';
import 'package:serving_humanity/ui/widgets/expansion_list.dart';
import 'package:serving_humanity/ui/widgets/input_field_v2.dart';
import 'package:stacked/stacked.dart';

class SignUpView extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignUpView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final fullNameController = TextEditingController();
  final mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
        builder: (context, model, child) {
          return Scaffold(
            resizeToAvoidBottomPadding: false,
            body: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(0, 150, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 50.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      verticalSpace(50),
                      InputFieldV2(
                        placeholder: 'Full Name',
                        controller: fullNameController,
                      ),
                      verticalSpaceSmall,
                      InputFieldV2(
                        placeholder: 'Email',
                        controller: emailController,
                      ),
                      verticalSpaceSmall,
                      InputFieldV2(
                        textInputType: TextInputType.phone,
                        placeholder: 'Mobile',
                        controller: mobileController,
                      ),
                      verticalSpaceSmall,
                      InputFieldV2(
                        placeholder: 'Password',
                        password: true,
                        controller: passwordController,
                        additionalNote:
                            'Password has to be a minimum of 6 characters.',
                      ),
                      verticalSpaceSmall,
                      ExpansionList<String>(
                          items: ['Admin', 'User'],
                          title: model.selectedRole,
                          onItemSelected: model.setSelectedRole),
                      verticalSpaceMedium,
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          BusyButton(
                            title: 'Sign Up',
                            busy: model.isBusy,
                            onPressed: () {
                              model.signUp(
                                  email: emailController.text,
                                  password: passwordController.text,
                                  fullName: fullNameController.text,
                                  mobile: mobileController.text);
                            },
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        viewModelBuilder: () => SignUpViewModel());
  }
}
