import 'package:avataaars/avataaars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/extension/context_extension.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  Map<String, bool> hobbies = <String, bool>{
    'oyun': true,
    'muzik': false,
    'gezi': false,
    'kitap': false,
    'dans': false,
    'kodlama': false
  };

  List<String> selected = <String>[];

  @override
  Widget build(final BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const BackButton(),
          _userAvatar(context),
          SizedBox(height: context.height / 18),
          _userInfo(context),
        ],
      ),
    );
  }

  Widget _userAvatar(final BuildContext context) {
    return Center(
      child: SvgPicture.string(Avataaar.random().toSvg(), height: context.height / 4),
    );
  }

  Widget _userInfo(final BuildContext context) {
    return Expanded(
      child: Container(
        width: context.width,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
        ),
        child: Column(
          children: <Widget>[
            const Text('Name and Surname'),
            const Divider(),
            const Text('Hobiler'),
            Wrap(
              spacing: 10,
              children: hobbies.entries.map((final MapEntry<String, bool> e) {
                final String key = e.key;
                final bool val = e.value;
                return Theme(
                  data: Theme.of(context).copyWith(canvasColor: Colors.white),
                  child: ChoiceChip(
                    label: Text(key),
                    selected: val,
                    side: BorderSide(color: val ? const Color(0xffE94057) : const Color(0xFFE8E6EA), width: 2),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    disabledColor: Colors.white,
                    labelStyle: TextStyle(
                      color: val ? const Color(0xffF80022) : const Color(0xff000000),
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                    onSelected: (final bool value) {
                      // TODO: Change here ASAP
                      setState(() {
                        hobbies.update(key, (final _) => value);
                      });
                    },
                    selectedColor: Colors.white,
                    backgroundColor: Colors.white,
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
