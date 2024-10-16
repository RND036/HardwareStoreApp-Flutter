import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hardware_store/widgets/appbar_widget.dart';
import 'package:hardware_store/widgets/button_widget.dart';
import 'package:hardware_store/widgets/circularimage.dart';
import 'package:hardware_store/widgets/networkconnection.dart';
import 'package:hardware_store/widgets/sectionheading_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        showBackArrow: true,
        title: Text('Profile'),
      ),

      //body

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const NetworkConnection(),
              // profile picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const CircularImage(
                        image: 'assets/images/man.png',
                        width: 80,
                        height: 80,
                        padding: 0,applyimageradius: false, borderradius: 0,),
                    TextButton(
                        onPressed: () {}, child: const Text('Change Profile Picture'))
                  ],
                ),
              ),
              // details
              const SizedBox(
                height: 8,
              ),
              const Divider(),
              const SizedBox(
                height: 16,
              ),
              const SectionHeadingWidget(
                  title: 'Profile Information', showActionButton: false),
              const SizedBox(
                height: 16,
              ),

              ProfileMenu(
                  onPressed: () {},
                  title: 'Name',
                  value: 'Ravishka Dissanayaka'),
              ProfileMenu(
                  onPressed: () {}, title: 'UserName', value: 'Ravishka@2001'),
              const SizedBox(
                height: 16,
              ),
              const Divider(),
              const SizedBox(
                height: 16,
              ),
              const SectionHeadingWidget(
                  title: 'Personal Information', showActionButton: false),
                  const SizedBox(
                height: 16,
              ),
              ProfileMenu(
                  onPressed: () {},
                  title: 'User ID',
                  value: 'Tech5678',
                  icon: FontAwesomeIcons.copy,),
              
                  ProfileMenu(
                  onPressed: () {},
                  title: 'Email',
                  value: 'ravishkanimsara20@gmail.com'),
                  ProfileMenu(
                  onPressed: () {},
                  title: 'Phone Number',
                  value: '+94 78 182 7743'),
                  ProfileMenu(
                  onPressed: () {},
                  title: 'Gender',
                  value: 'Male'),
                  ProfileMenu(
                  onPressed: () {},
                  title: 'Date Of Birth',
                  value: '2001-10-23'),
                  const SizedBox(
                height: 16,
              ),
                   const Divider(),
              const SizedBox(
                height: 16,
              ),
              Center(
                child: buttonMain(text: 'Delete Account',boxcolor: Colors.red,color: Colors.white,onPressed: (){}),
              )

            ],
          ),
        ),
      ),
    );
  }
}

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    super.key,
    this.icon = FontAwesomeIcons.angleRight,
    required this.onPressed,
    required this.title,
    required this.value,
  });
  final IconData? icon;
  final VoidCallback onPressed;
  final String title, value;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.bodySmall,
                  overflow: TextOverflow.ellipsis,
                )),
            Expanded(
                flex: 5,
                child: Text(
                  value,
                  style: Theme.of(context).textTheme.bodySmall,
                  overflow: TextOverflow.ellipsis,
                )),
            Expanded(
              
              child: Icon(
                icon,
                size: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
