// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:food_delivery/screens/profileScreen/myprofile.dart';
import 'package:food_delivery/screens/reviewCart/review_page.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xFFd1ad17),
      child: ListView(
        children: [
          DrawerHeader(
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 43,
                  child: CircleAvatar(
                    backgroundColor: Colors.yellow,
                    radius: 40,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('welcome guest'),
                    SizedBox(
                      height: 7,
                    ),
                    Container(
                      height: 30,
                      width: 80,
                      child: OutlinedButton(
                        child: Text(
                          'login',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(
                            width: 2,
                            color: Colors.grey[300]!,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.grey[300],
            thickness: 1,
            indent: 10,
            endIndent: 10,
          ),
          DrawerIcons(
            iconData: Icons.home_outlined,
            title: 'Home',
          ),
          DrawerIcons(
            iconData: Icons.shop,
            title: 'Review Cart',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ReviewCartPage(),
                ),
              );
            },
          ),
          DrawerIcons(
            iconData: Icons.person_outline,
            title: 'Profile',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => MyProfile(),
                ),
              );
            },
          ),
          DrawerIcons(
            iconData: Icons.notifications,
            title: 'Notification',
          ),
          DrawerIcons(
            iconData: Icons.star,
            title: 'Rating and Review',
          ),
          DrawerIcons(
            iconData: Icons.favorite,
            title: 'Whistlist',
          ),
          DrawerIcons(
            iconData: Icons.copy_all_outlined,
            title: 'Raise and complaint',
          ),
          DrawerIcons(
            iconData: Icons.question_answer_outlined,
            title: 'FAQ',
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              height: 350,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Contact Support',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: const [
                      Text(
                        'Call us:',
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '+9231456788',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      Text(
                        'mail us:',
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'abc@mail.com',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class DrawerIcons extends StatelessWidget {
  final String? title;
  final IconData? iconData;
  final Function()? onTap;
  DrawerIcons({super.key, this.iconData, this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        iconData,
        size: 32,
      ),
      title: Text(
        title!,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
