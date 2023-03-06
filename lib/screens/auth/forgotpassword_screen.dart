import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:virtualbuild/screens/auth/otp_screen.dart';
import 'package:virtualbuild/widgets/customscreen.dart';
import 'package:virtualbuild/widgets/header.dart';
import '../../widgets/auth/custombuttontonext.dart';
import '../../widgets/auth/customdecorationforinput.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});
  static const routeName = '/forgot_password';

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailTextController = TextEditingController();

  Future<void> sendOtp(String userEmail) async{
    var url = Uri.http("10.0.2.2:5000", "/generate_otp/$userEmail");
    var response = await http.get(url);
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () {
          FocusNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: MyCustomScreen(
          // customColor: Colors.greenAccent,
          screenContent: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Header(heading: "Forgot Password?"),
              SizedBox(
                height: size.height * 0.05,
              ),
              // const CustomTextField(),
              TextFormField(
                controller: _emailTextController,
                decoration: customDecorationForInput(
                  context,
                  "Enter Email",
                  Icons.email,
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.titleSmall,
                  children: [
                    TextSpan(
                      text: "*",
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    const TextSpan(
                      text:
                          " We will send you a message to set or reset your new password",
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.07,
              ),
              NextButtonClass(
                  text: "Send Code",
                  onPressed: () async {
                    await sendOtp("virtualbuild01@gmail.com");
                    print("for got password pressed");
                    Navigator.of(context).pushNamed(OTPScreen.routeName);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
