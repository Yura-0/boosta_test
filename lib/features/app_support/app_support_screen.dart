import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'widgets/custome_text_field.dart';
import 'widgets/success_widget.dart';

class AppSupportScreen extends StatefulWidget {
  const AppSupportScreen({super.key});

  @override
  _AppSupportScreenState createState() => _AppSupportScreenState();
}

class _AppSupportScreenState extends State<AppSupportScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  bool _isLoading = false;
  bool _showSuccessScreen = false;

  bool get _isFormValid {
    return _nameController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _messageController.text.isNotEmpty;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _isLoading = true;
      });

      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          _isLoading = false;
          _showSuccessScreen = true;
        });
      });
    }
  }

  void _closeSuccessScreen() {
    setState(() {
      _showSuccessScreen = false;
      _nameController.clear();
      _emailController.clear();
      _messageController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _showSuccessScreen
            ? SuccessWidget(closeSuccessScreen: _closeSuccessScreen)
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: Adaptive.h(3)),
                        Text(
                          "Our support team is available 24 hours a day, 7 days a week.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 19.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "We have your back, day or night.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(height: Adaptive.h(3)),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            "Name",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 5.0),
                        CustomeTextField(
                          controller: _nameController,
                          hintText: 'Your name',
                          maxLines: 1,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                          onChanged: (value) => setState(() {}),
                        ),
                        SizedBox(height: Adaptive.h(3)),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            "Email",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 5.0),
                        CustomeTextField(
                          controller: _emailController,
                          hintText: 'Your email',
                          maxLines: 1,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                .hasMatch(value)) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                          onChanged: (value) => setState(() {}),
                        ),
                        SizedBox(height: Adaptive.h(3)),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            "Write your message here",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 5.0),
                        CustomeTextField(
                          controller: _messageController,
                          hintText: 'Type your feedback',
                          maxLines: 5,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your message';
                            }
                            return null;
                          },
                          onChanged: (value) => setState(() {}),
                        ),
                        SizedBox(height: Adaptive.h(3)),
                        SizedBox(
                          height: Adaptive.h(6),
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 32, 78, 246),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                            onPressed: _isFormValid ? _submitForm : null,
                            child: _isLoading
                                ? const SpinKitCircle(
                                    color: Colors.white,
                                    size: 24.0,
                                  )
                                : Text(
                                    'Submit',
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ],
    );
  }
}
