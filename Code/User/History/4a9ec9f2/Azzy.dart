import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/extension/context_extension.dart';
import '../../otp/otp_view.dart';
import '../bloc/sign_up_bloc.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Kayit Ol',
          style: context.headline2?.copyWith(color: Colors.black),
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.width / 9, vertical: context.height / 6),
        child: Column(
          children: <Widget>[
            Text(
              'Lutfen gecerli bir telefon numarasini giriniz. Bu sayede dogrulama kodunu alabilirsiniz.',
              style: context.bodyMedium,
            ),
            SizedBox(height: context.height / 37),
            TextField(
              maxLength: 11,
              onChanged: (final String value) {
                context.read<SignUpBloc>().add(SignUpEvent.phoneNumberChanged(phoneNumber: value));
              },
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                hintText: '05551234567',
                labelText: 'Telefon No',
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
              ),
            ),
            SizedBox(height: context.height / 50),
            TextField(
              obscureText: true,
              onChanged: (final String value) {
                context.read<SignUpBloc>().add(SignUpEvent.passwordChanged(password: value));
              },
              decoration: const InputDecoration(
                labelText: 'Parola',
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
              ),
            ),
            SizedBox(height: context.height / 9),
            ElevatedButton(
              onPressed: () {
                context.read<SignUpBloc>().add(const SignUpEvent.formSubmit());
                Navigator.of(context).push(MaterialPageRoute<Widget>(builder: (final _) => const OTPView()));
              },
              style: context.elevatedButtonTheme?.copyWith(
                minimumSize: MaterialStatePropertyAll<Size>(
                  Size(context.width / 1.2, context.height / 14.5),
                ),
              ),
              child: const Text('Kayit ol'),
            ),
          ],
        ),
      ),
    );
  }
}
