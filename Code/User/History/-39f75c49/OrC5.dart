import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/di/di.dart';
import '../../utils/utils.dart';
import '../profile/model/user_model.dart';
import 'bloc/edit_profile_bloc.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({Key? key, required this.user}) : super(key: key);

  final UserModel user;

  static Route route(UserModel user) {
    return MaterialPageRoute(builder: (_) => EditProfileView(user: user));
  }

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // FIX: Change here
    _usernameController.text = widget.user.username;
    _bioController.text = widget.user.bio;
    _emailController.text = widget.user.email;
    return BlocProvider<EditProfileBloc>(
      create: (context) => EditProfileBloc(sessionNavCubit: locator(), userRepo: locator()),
      child: BlocBuilder<EditProfileBloc, EditProfileState>(
        builder: (context, state) {
          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(backgroundColor: Colors.transparent),
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
                        child:
                            (state.imagePath == null ? _networkImage(widget.user.image) : _fileImage(state.imagePath!)),
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
                      controller: _bioController..text = widget.user.bio,
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
                        _emailController.text = widget.user.email;
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
                        Navigator.pop(context);
                        context.read<EditProfileBloc>().add(EditProfileEvent.saveUser(widget.user.image));
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
    return Image.network(widget.user.image);
  }
}
