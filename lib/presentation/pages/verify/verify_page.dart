import 'package:fl_my_awesome/config/extensions.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/services/toast_service.dart';
import '../../../../../../core/utils/app_assets.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_styles.dart';
import 'widgets/num_button.dart';
import 'widgets/otp_num.dart';

class VerifyPage extends StatefulWidget {
  static const String id = "/verify_page";

  const VerifyPage({super.key});

  @override
  State<VerifyPage> createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  String otp = '';
  String digit1 = '';
  String digit2 = '';
  String digit3 = '';
  String digit4 = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Expanded(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              color: AppColor.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Image.asset(
                  //   AppAssets.images.otp,
                  //   height: 90,
                  // ),
                  Icon(
                    Icons.lock,
                    size: 40,
                    color: AppColor.blue2,
                  ),
                  30.ph,
                  Text(
                    'Enter verification code',
                    style: AppStyles.text20sp700black,
                  ),
                  Text(
                    'Enter OTP',
                    style: AppStyles.text14sp400black1,
                  ),
                  28.ph,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OtpNum(text: digit1),
                      12.pw,
                      OtpNum(text: digit2),
                      12.pw,
                      OtpNum(text: digit3),
                      12.pw,
                      OtpNum(text: digit4),
                    ],
                  ),
                  28.ph,
                  RichText(
                    text: TextSpan(
                      style: AppStyles.text14sp400black1,
                      children: <TextSpan>[
                        TextSpan(text: 'Did not receive OTP?  '),
                        TextSpan(
                            text: 'Resent OTP',
                            style: AppStyles.text14sp600blue2,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                ToastService.showNotifMessage('Resend');
                              }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            color: AppColor.grey3,
            padding: const EdgeInsets.all(6),
            child: Column(
              children: [
                Row(
                  children: [
                    NumButton(
                      text: '1',
                      onPress: (text) {
                        otpAdd(text);
                      },
                    ),
                    6.pw,
                    NumButton(
                      text: '2',
                      onPress: (text) {
                        otpAdd(text);
                      },
                    ),
                    6.pw,
                    NumButton(
                      text: '3',
                      onPress: (text) {
                        otpAdd(text);
                      },
                    ),
                  ],
                ),
                6.ph,
                Row(
                  children: [
                    NumButton(
                      text: '4',
                      onPress: (text) {
                        otpAdd(text);
                      },
                    ),
                    6.pw,
                    NumButton(
                      text: '5',
                      onPress: (text) {
                        otpAdd(text);
                      },
                    ),
                    6.pw,
                    NumButton(
                      text: '6',
                      onPress: (text) {
                        otpAdd(text);
                      },
                    ),
                  ],
                ),
                6.ph,
                Row(
                  children: [
                    NumButton(
                      text: '7',
                      onPress: (text) {
                        otpAdd(text);
                      },
                    ),
                    6.pw,
                    NumButton(
                      text: '8',
                      onPress: (text) {
                        otpAdd(text);
                      },
                    ),
                    6.pw,
                    NumButton(
                      text: '9',
                      onPress: (text) {
                        otpAdd(text);
                      },
                    ),
                  ],
                ),
                6.ph,
                Row(
                  children: [
                    Expanded(
                      child: Container(),
                    ),
                    6.pw,
                    NumButton(
                      text: '0',
                      onPress: (text) {
                        otpAdd(text);
                      },
                    ),
                    6.pw,
                    Expanded(
                      child: Center(
                        child: IconButton(
                          icon: SvgPicture.asset(AppAssets.icons.delete),
                          onPressed: () {
                            otpDelete();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                20.ph,
              ],
            ),
          ),
        ],
      ),
    );
  }

  void otpAdd(String text) {
    if (isDigitsFull) return;
    setState(() {
      if (digit1.isEmpty) {
        digit1 = text;
      } else if (digit2.isEmpty) {
        digit2 = text;
      } else if (digit3.isEmpty) {
        digit3 = text;
      } else if (digit4.isEmpty) {
        digit4 = text;
      }
      if (isDigitsFull) {
        otp = digit1 + digit2 + digit3 + digit4;
        ToastService.showNotifMessage(otp);
        Future.delayed(const Duration(milliseconds: 1000), () {
          setState(() {
            otp = '';
            digit1 = '';
            digit2 = '';
            digit3 = '';
            digit4 = '';
            Navigator.pop(context);
          });
        });
      }
    });
  }

  bool get isDigitsFull =>
      digit1.isNotEmpty &&
      digit2.isNotEmpty &&
      digit3.isNotEmpty &&
      digit4.isNotEmpty;

  void otpDelete() {
    setState(() {
      if (digit4.isNotEmpty) {
        digit4 = '';
      } else if (digit3.isNotEmpty) {
        digit3 = '';
      } else if (digit2.isNotEmpty) {
        digit2 = '';
      } else if (digit1.isNotEmpty) {
        digit1 = '';
      }
    });
  }
}
