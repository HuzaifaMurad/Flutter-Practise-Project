// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:food_delivery/config/config.dart';
import 'package:food_delivery/screens/Home/widgets/customDrawer.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  Widget listTitle({IconData? icon, String? title}) {
    return Column(
      children: [
        const Divider(
          height: 1,
        ),
        ListTile(
          leading: Icon(icon),
          title: Text(title!),
          trailing: Icon(Icons.arrow_forward_ios),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0.0,
        title: Text(
          'My Profile',
          style: TextStyle(
            fontSize: 18,
            color: textColor,
          ),
        ),
      ),
      drawer: CustomDrawer(),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 100,
                color: primaryColor,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.774,
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                decoration: BoxDecoration(
                  color: backgroundScaffoldColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 80,
                          width: 250,
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Huzaifa Murad',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: textColor),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('hkexapril@gmail.com'),
                                ],
                              ),
                              CircleAvatar(
                                radius: 15,
                                backgroundColor: primaryColor,
                                child: CircleAvatar(
                                  backgroundColor: backgroundScaffoldColor,
                                  radius: 12,
                                  child: Icon(
                                    Icons.edit,
                                    color: primaryColor,
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    listTitle(icon: Icons.shop_outlined, title: "My Orders"),
                    listTitle(
                        icon: Icons.location_on_outlined,
                        title: "My deliver address"),
                    listTitle(
                        icon: Icons.person_outlined, title: "Refer A friend"),
                    listTitle(
                        icon: Icons.file_copy_outlined,
                        title: "Terms and Condition"),
                    listTitle(
                        icon: Icons.policy_outlined, title: "Privacy Policy"),
                    listTitle(icon: Icons.add_chart, title: "My Orders"),
                    listTitle(icon: Icons.exit_to_app, title: "log out"),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 30),
            child: CircleAvatar(
              radius: 50,
              backgroundColor: primaryColor,
              child: CircleAvatar(
                backgroundColor: backgroundScaffoldColor,
                radius: 45,
                backgroundImage: NetworkImage(
                    'https://i.pinimg.com/736x/0a/53/c3/0a53c3bbe2f56a1ddac34ea04a26be98.jpg'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
