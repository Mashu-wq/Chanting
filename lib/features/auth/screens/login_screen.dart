import 'package:chanting/colors.dart';
import 'package:chanting/common/utils/utils.dart';
import 'package:chanting/common/widgets/custom_button.dart';
import 'package:chanting/features/auth/controller/auth_controller.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerStatefulWidget {
  static const routeName = '/login-screen';
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final phoneNumberController = TextEditingController();
  Country? country;
  @override
  void dispose() {
    phoneNumberController.dispose();
    super.dispose();
  }

  void pickCountry() {
    showCountryPicker(
      context: context,
      onSelect: (Country _country) {
        setState(() {
          country = _country;
        });
      },
    );
  }

  void sendPhoneNumber() {
    String phoneNumber = phoneNumberController.text.trim();
    if (country != null && phoneNumber.isNotEmpty) {
      ref.read(authControllerProvider).signInWithPhone(
            context,
            '+${country!.phoneCode}$phoneNumber',
          );
    } else {
      showSnackBar(context: context, content: 'Fill all the fields');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Enter Your Phone Number'),
          elevation: 0,
          backgroundColor: backgroundColor,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              const Text(
                'We will send you a verification code on your phone',
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: pickCountry,
                child: const Text('Pick Country'),
              ),
              const SizedBox(
                height: 5,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    if (country != null) Text('+${country!.phoneCode}'),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: size.width * 7,
                      child: TextField(
                        controller: phoneNumberController,
                        decoration: const InputDecoration(
                          hintText: 'phone number',
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.6,
              ),
              SizedBox(
                width: 150,
                child: CustomButton(text: 'NEXT', onPressed: sendPhoneNumber),
              ),
            ],
          ),
        ));
  }
}
