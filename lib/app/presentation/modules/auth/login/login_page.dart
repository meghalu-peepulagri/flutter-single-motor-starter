import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:starter/app/core/utils/app_text_field.dart';
import 'package:starter/app/presentation/modules/auth/login/login_controller.dart';

import '../../../../core/flutter_flow/flutter_flow_theme.dart';
import '../../../../core/flutter_flow/flutter_flow_util.dart';
import '../../../../core/flutter_flow/flutter_flow_widgets.dart';

class LoginwithmobileWidget extends StatefulWidget {
  const LoginwithmobileWidget({super.key});

  @override
  State<LoginwithmobileWidget> createState() => _LoginwithmobileWidgetState();
}

class _LoginwithmobileWidgetState extends State<LoginwithmobileWidget> {
  late LoginwithmobileModel _model;
  bool showVerifyButton = false;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController controller1 = TextEditingController();
  StreamSubscription<List<ConnectivityResult>>? _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginwithmobileModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    _loadSavedPhoneNumber();

    controller1.addListener(() {
      if (_model.errorInstance != null && controller1.text.isNotEmpty) {
        setState(() {
          _model.errorInstance = null; // Clear error when user starts typing
        });
      }
    });

    _connectivitySubscription = Connectivity()
        .onConnectivityChanged
        .listen((List<ConnectivityResult> results) {
      bool isConnected = results.any((result) =>
          result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile ||
          result == ConnectivityResult.ethernet);
      if (!isConnected) {
        // errorSnackBar(context, 'No Internet Please Check Your Connectivity');
      } else {}
    });
  }

  Future<void> _loadSavedPhoneNumber() async {
    // String? phoneNumber = await SharedPreferenceHelper.getPhone();
    // if (phoneNumber != null && phoneNumber.isNotEmpty) {
    //   setState(() {
    //     controller1.text = phoneNumber;
    //   });
    // }
  }

  @override
  void dispose() {
    _model.dispose();
    controller1.dispose();
    super.dispose();
    _connectivitySubscription?.cancel();
  }

  Future<bool> _checkConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.none)) {
      return false;
    }
    try {
      final result = await InternetAddress.lookup('google.com')
          .timeout(Duration(seconds: 5));
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (e) {
      return false;
    } on TimeoutException catch (e) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          body: SafeArea(
            top: true,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 16, 8, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: SvgPicture.asset(
                              'assets/images/Peepul_Agri_logo.svg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Verify Your Phone Number',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Lexend',
                                      color: const Color(0xFF35353D),
                                      fontSize: 18,
                                      letterSpacing: 0,
                                    ),
                              ),
                              Text(
                                'Enter Phone Number to Access Your Account',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Lexend',
                                      color: const Color(0xFF6A7185),
                                      letterSpacing: 0,
                                    ),
                              ),
                            ].divide(const SizedBox(height: 8)),
                          ),
                          TextFieldComponent(
                            readOnly: false,
                            controller: controller1,
                            errors: _model.errorInstance,
                            hintText: 'Enter Your Phone Number',
                            errorKey: 'phone',
                            // maxlength: 10,
                            keyboardType: TextInputType.phone,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(10),
                            ],
                          ),
                          const SizedBox(height: 10),
                          showVerifyButton
                              ? FFButtonWidget(
                                  onPressed: () async {
                                    // String phone = controller1.text.trim();
                                    // if (phone.isEmpty || phone.length != 10) {
                                    //   errorSnackBar(context,
                                    //       'Please enter a valid 10-digit phone number');
                                    //   return;
                                    // }

                                    // await _model.fetchverify(phone: phone);
                                    // if (_model.error &&
                                    //     _model.message.isNotEmpty &&
                                    //     !_model.isValidation) {
                                    //   errorSnackBar(context, _model.message);
                                    // } else if (!_model.error &&
                                    //     _model.message.isNotEmpty) {
                                    //   SharedPreference.setPhone(phone);
                                    //   SharedPreference.setPhone2(phone);

                                    //   // successSnackBar(context, _model.message);
                                    //   Get.toNamed(Routes.otp);
                                    // }
                                  },
                                  text: 'Verify Now',
                                  options: FFButtonOptions(
                                    width: double.infinity,
                                    height: 40,
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            16, 0, 16, 0),
                                    iconPadding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 0),
                                    color: const Color(0xFF45A845),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Lexend',
                                          color: Colors.white,
                                        ),
                                    elevation: 0,
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                )
                              : FFButtonWidget(
                                  onPressed: () async {
                                    // String id = '';
                                    // if (!kIsWeb) {
                                    //   await SmsAutoFill().unregisterListener();
                                    //   id = await SmsAutoFill().getAppSignature;
                                    //   bool isConnected =
                                    //       await _checkConnectivity();
                                    //   if (!isConnected) {
                                    //     errorSnackBar(context,
                                    //         'No internet connection. Please check your network.');
                                    //     return;
                                    //   }
                                    // }

                                    // bool isConnected = await _checkConnectivity();
                                    // if (!isConnected) {
                                    //   errorSnackBar(context, 'No internet connection. Please check your network.');
                                    //   return;
                                    // }
                                    // await _model.fetchMobiel(
                                    //     sid: id,
                                    //     phone: controller1.text.trim());
                                    // setState(() {
                                    //   showVerifyButton =
                                    //       _model.message == "User not verified";
                                    // });
                                    // if (_model.error &&
                                    //     _model.message.isNotEmpty &&
                                    //     !_model.isValidation) {
                                    //   errorSnackBar(context, _model.message);
                                    // } else if (!_model.error &&
                                    //     _model.message.isNotEmpty) {
                                    //   Get.offNamed(Routes.otp);

                                    //   // successSnackBar(context, _model.message);
                                    //   SharedPreference.setPhone(
                                    //       controller1.text);
                                    //   SharedPreference.setPhone2(
                                    //       controller1.text);
                                    // }
                                  },
                                  text: 'Send OTP',
                                  options: FFButtonOptions(
                                    width: double.infinity,
                                    height: 40,
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            16, 0, 16, 0),
                                    iconPadding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 0),
                                    color: const Color(0xFF45A845),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Lexend',
                                          color: Colors.white,
                                          letterSpacing: 0,
                                        ),
                                    elevation: 0,
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                ),
                          // Text('or',textAlign: TextAlign.center,)
                          if (!showVerifyButton)
                            Column(
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      width: 100,
                                      child: Divider(
                                        color: Color(0xFFE0E0E0),
                                        thickness: 0.5,
                                        indent: 8,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: Text(
                                        'or',
                                        style: TextStyle(
                                            color: Color(0xFF6A7185),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ),
                                    Container(
                                      width: 100,
                                      child: Divider(
                                        color: Color(0xFFE0E0E0),
                                        thickness: 0.5,
                                        endIndent: 8,
                                      ),
                                    ),
                                  ],
                                ),
                                FFButtonWidget(
                                  onPressed: () {
                                    Get.toNamed(Routes.dashboard);
                                  },
                                  text: 'Create an Account',
                                  options: FFButtonOptions(
                                    width: double.infinity,
                                    height: 40,
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            16, 0, 16, 0),
                                    iconPadding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 0),
                                    color: Color(0XFFFFFFFF),
                                    borderSide: BorderSide(
                                        color: const Color(0xFF45A845),
                                        width: 1),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Lexend',
                                          color: const Color(0xFF05A155),
                                        ),
                                    elevation: 0,
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                ),
                              ].divide(const SizedBox(height: 20)),
                            ),
                        ].divide(const SizedBox(height: 20)),
                      ),
                    ].divide(const SizedBox(height: 20)),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: SvgPicture.asset(
                        'assets/images/Login_vector.svg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
