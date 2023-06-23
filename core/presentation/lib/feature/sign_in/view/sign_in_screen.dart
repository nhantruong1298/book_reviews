import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:presentation/app/route_builder.dart';
import 'package:presentation/resources/app_colors.dart';
import 'package:presentation/resources/app_dimensions.dart';
import 'package:presentation/widgets/commons/Spacing.dart';
import 'package:presentation/widgets/commons/inputs/password_input.dart';
import 'package:presentation/widgets/commons/layouts/basic_layout.dart';
import 'package:presentation/widgets/commons/typography/body_text.dart';
import 'package:presentation/widgets/commons/typography/button_text.dart';
import 'package:presentation/widgets/commons/typography/heading_text.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({
    Key? key,
  }) : super(key: key);

  @override
  State createState() {
    return _SignInScreenState();
  }
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  String PHONE_FIELD = 'phone';
  String PASSWORD_FIELD = 'password';
  bool? _isChecked = false;
  @override
  void initState() {
    super.initState();
    // _loadUserphonePassword();
  }

  @override
  Widget build(BuildContext context) {
    return BasicLayout(
      key: _formKey,
      automaticallyImplyLeading: true,
      child: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Container(
              //   height: 1 / 3,
              //   child: Image.asset(
              //     'images/Untitled_Artwork.png',
              //     width: 300,
              //     height: 1 / 3,
              //     fit: BoxFit.fill,
              //   ),
              // ),
              Heading1Text(
                "Login",
                color: AppColors.primaryColor500,
                style:
                    TextStyle(fontSize: 32, color: AppColors.primaryColor500),
              ),
              const Spacing(2.5),
              _buildTextPhoneField(),
              const Spacing(1.5),
              _buildTextPasswordField(),
              const Spacing(1.5),
              _buildCheckRBPW(),
              const Spacing(3),
              const _SignInButton(),
              const Spacing(3),
              Row(children: <Widget>[
                const Expanded(child: Divider()),
                Center(
                  child: BodyText(
                    " Or, login with... ",
                    style: TextStyle(
                        color: const Color(0xff9A9B9C),
                        fontWeight: FontWeight.w400,
                        fontSize: 18),
                  ),
                ),
                const Expanded(child: Divider()),
              ]),
              const Spacing(3),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BodyMText(
                    'Don’t have an account?',
                    color: Colors.black,
                  ),
                  TextButton(
                      onPressed: () {
                        SignUpRoute().go(context);
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => const SignUpScreen()));
                      },
                      child: BodyXLText(
                        'Register',
                        color: const Color.fromARGB(255, 0, 1, 1),
                      ))
                ],
              ),
            ]),
      ),
    );
  }

  Widget _buildCheckRBPW() {
    return Container(
      height: 30,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              height: 25,
              child: Theme(
                data: ThemeData(unselectedWidgetColor: Colors.grey // Your color
                    ),
                child: SizedBox(
                  height: 25,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Transform.scale(
                        scale: 0.9,
                        child: Checkbox(
                            splashRadius: 2,
                            checkColor: Colors.white,
                            activeColor: AppColors.primaryColor500,
                            hoverColor: Colors.white,
                            value: _isChecked,
                            onChanged: (value) {}),
                      ),
                      Text(
                        'Remember me',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 18),
                      ),
                    ],
                  ),
                ),
              )),
          Container(
            padding: EdgeInsets.only(top: 4),
            height: 25,
            child: ButtonText(
              "Forgot password?",
              style: TextStyle(
                color: const Color(0xff457B9D),
                fontWeight: FontWeight.w400,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }

  PasswordInput _buildTextPasswordField() {
    return PasswordInput(
      decoration: InputDecoration(
        prefixIconConstraints: BoxConstraints.expand(
          width: 32,
          height: 32,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        contentPadding: const EdgeInsets.all(2.5),
        labelStyle: TextStyle(
            fontFamily: 'Nunito',
            color: const Color(0xff9A9B9C),
            fontSize: 18,
            fontWeight: FontWeight.w400),
      ),
      labelText: 'Password*',
    );
  }

  Widget _buildTextPhoneField() {
    return FormBuilderTextField(
      name: PHONE_FIELD,
      decoration: InputDecoration(
        prefixIconConstraints: BoxConstraints.expand(
          width: 32,
          height: 32,
        ),

        floatingLabelBehavior: FloatingLabelBehavior.never,
        contentPadding:
            const EdgeInsets.all(2.5), //prefixIconColor: Color(0xff9A9B9C),

        fillColor: const Color(0xff9A9B9C),
        labelText: 'Phone number*',
        labelStyle: TextStyle(
            color: const Color(0xff9A9B9C),
            fontSize: 18,
            fontWeight: FontWeight.w400),
      ),
    );
  }

  // void _loadUserphonePassword() async {
  //   try {
  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     var password = prefs.getString("password") ?? "";

  //     var remeberMe = prefs.getBool("remember_me") ?? false;

  //     if (remeberMe) {
  //       setState(() {
  //         _isChecked = true;
  //       });
  //       // PASSWORD_FIELD = password;
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // Future<void> _handleRemeberme(bool? value) async {
  //   print("Handle Rember Me");
  //   _isChecked = value!;

  //   SharedPreferences.getInstance().then(
  //     (prefs) {
  //       prefs.setBool("remember_me", value);
  //       prefs.setString('password', PASSWORD_FIELD);
  //     },
  //   );
  //   setState(() {
  //     _isChecked = value;
  //   });
  // }
}

class _SignInButton extends StatelessWidget {
  const _SignInButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(AppDimensions.roundedRadius),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppDimensions.roundedRadius),
        onTap: () {
          DashboardRoute().go(context);
          // Navigator.push(context,
          //     MaterialPageRoute(builder: (context) => const BottomTabbar()));
        },
        child: Container(
          width: double.infinity,
          height: AppDimensions.buttonHeight,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppDimensions.roundedRadius),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
              color: AppColors.primaryColor500),
          child: BodyLText("Login",
              color: AppColors.textLightColor,
              style: BodyLText.defaultStyle.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              )),
        ),
      ),
    );
  }
}
