import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:shop_app/blocs/index.dart';
import 'package:shop_app/localization/index.dart';
import 'package:shop_app/services/index.dart';
import 'package:shop_app/styles/index.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.75,
      height: MediaQuery.of(context).size.height,
      color: AppColors.white,
      child: Drawer(
        elevation: 3,
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundColor: AppColors.black,
                      backgroundImage: AssetImage(Assets.images.logoShort.path),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      final userFullName = state.userProfile.name;

                      return Text(
                        '${userFullName.firstname} ${userFullName.lastname}',
                        style: Theme.of(context).textTheme.labelLarge,
                      );
                    },
                  ),
                ),
                const Divider(height: 20),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      buildMenuItem(
                        text: LocaleKeys.changePassword.tr(),
                        iconData: FontAwesomeIcons.lock,
                      ),
                      GestureDetector(
                        child: buildMenuItem(
                          text: LocaleKeys.languageName.tr(),
                          iconData: FontAwesomeIcons.globe,
                        ),
                        onTap: () async {
                          final newLocale =
                              context.locale == context.supportedLocales[0]
                                  ? context.supportedLocales[1]
                                  : context.supportedLocales[0];

                          await context.setLocale(newLocale);
                        },
                      ),
                      GestureDetector(
                        child: buildMenuItem(
                          text: LocaleKeys.signOut.tr(),
                          iconData: FontAwesomeIcons.rightFromBracket,
                        ),
                        onTap: () {
                          getIt<AuthBloc>().add(const AuthEvent.signOut());
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData iconData,
  }) {
    return ListTile(
      leading: Icon(
        iconData,
        color: AppColors.grey,
      ),
      title: Text(
        text,
        style: const TextStyle(
          color: AppColors.grey,
        ),
      ),
    );
  }
}
