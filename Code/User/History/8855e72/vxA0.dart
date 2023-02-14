import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/enum/form_status_enum.dart';
import '../../../core/extension/context_extension.dart';
import '../../flow/auth_flow_cubit.dart';
import '../../sign_up/view/sign_up_view.dart';
import '../bloc/login_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocListener<LoginBloc, LoginState>(
        listener: (final BuildContext context, final LoginState state) {
          final FormSubmissionStatus formStatus = state.formStatus;
          if (formStatus == FormSubmissionStatus.failure) {
            ScaffoldMessenger.of(context)
              ..clearSnackBars()
              ..showSnackBar(SnackBar(content: Text(state.errorMessage!)));
          }
        },
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.width / 9,
            vertical: context.height / 6,
          ),
          child: Column(
            children: <Widget>[
              Text(
                'Giris Yap',
                style: context.headline2?.copyWith(color: Colors.black),
              ),
              SizedBox(height: context.height / 37),
              TextField(
                maxLength: 11,
                onChanged: (final String value) {
                  context.read<LoginBloc>().add(LoginEvent.phoneNumberChanged(phoneNumber: value));
                },
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  hintText: '05551234567',
                  labelText: 'Telefon No',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                ),
              ),
              SizedBox(height: context.height / 50),
              TextField(
                obscureText: true,
                onChanged: (final String value) {
                  context.read<LoginBloc>().add(LoginEvent.passwordChanged(password: value));
                },
                decoration: const InputDecoration(
                  labelText: 'Parola',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                ),
              ),
              SizedBox(height: context.height / 9),
              ElevatedButton(
                onPressed: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  context.read<LoginBloc>().add(const LoginEvent.formSubmit());
                },
                style: context.elevatedButtonTheme?.copyWith(
                  minimumSize: MaterialStatePropertyAll<Size>(
                    Size(context.width / 1.2, context.height / 14.5),
                  ),
                ),
                child: const Text('Giris Yap'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<SignUpView>(
                      builder: (final BuildContext context) => const SignUpView(),
                    ),
                  );
                },
                child: const Text('Kayit ol'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
