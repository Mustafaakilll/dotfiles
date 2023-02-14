import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/di/di.dart';
import '../../utils/utils.dart';
import '../profile/model/user_model.dart';
import 'bloc/edit_profile_bloc.dart';

class EditProfileView extends StatelessWidget {
  EditProfileView({Key? key, required this.user}) : super(key: key);

  final UserModel user;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  static Route route(UserModel user) {
    return MaterialPageRoute(builder: (_) => EditProfileView(user: user));
  }

  @override
  Widget build(BuildContext context) {
    // FIX: Change here
    _usernameController.text = user.username;
    _bioController.text = user.bio;
    _emailController.text = user.email;
    return BlocProvider<EditProfileBloc>(
      create: (context) => EditProfileBloc(sessionNavCubit: locator(), userRepo: locator()),
      child: BlocBuilder<EditProfileBloc, EditProfileState>(
        builder: (context, state) {
          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(title: Text(user.bio), backgroundColor: Colors.transparent),
            body: Padding(
              padding: EdgeInsets.all(context.dynamicWidth(0.2)),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      child: GestureDetector(
                        child: (state.imagePath == null ? _networkImage(user.image) : _fileImage(state.imagePath!)),
                        onTap: () => context.read<EditProfileBloc>().add(const EditProfileEvent.openImagePicker()),
                      ),
                    ),
                    context.emptySizedHeightBoxLow3x,
                    TextField(
                      controller: _usernameController,
                      onChanged: (username) {
                        _usernameController.text = username;
                        context.read<EditProfileBloc>().add(EditProfileEvent.usernameChanged(_usernameController.text));
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)), labelText: 'Username'),
                    ),
                    context.emptySizedHeightBoxLow,
                    TextField(
                      controller: _bioController,
                      onChanged: (bio) {
                        _bioController.text = bio;
                        context.read<EditProfileBloc>().add(EditProfileEvent.bioChanged(bio));
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        labelText: 'Bio',
                      ),
                    ),
                    context.emptySizedHeightBoxLow,
                    TextField(
                      controller: _emailController,
                      onChanged: (email) {
                        _emailController.text = email;
                        context.read<EditProfileBloc>().add(EditProfileEvent.emailChanged(email));
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        labelText: 'Email',
                      ),
                    ),
                    context.emptySizedHeightBoxLow,
                    TextButton(
                      onPressed: () {
                        debugPrint('Save');
                        context.read<EditProfileBloc>().add(EditProfileEvent.saveUser(user.image));
                      },
                      child: const Text('Save'),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _fileImage(String imagePath) {
    return BlocBuilder<EditProfileBloc, EditProfileState>(
      builder: (context, state) {
        return CircleAvatar(
          radius: 50,
          foregroundImage: FileImage(File(imagePath)),
          // foregroundImage: Image.file(File(imagePath)),
        );
      },
    );
  }

  Widget _networkImage(String image) {
    return Image.network(user.image);
  }
}
