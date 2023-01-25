import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../utils/colors.dart';
import '../handaler/profile_view.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(
          color: Appcolors.primaryColor,
          borderRadius: BorderRadius.circular(5)),
      child: Row(
        children: [
          //IMAGE view
          DView.spaceHeight(),

          const CircleAvatar(
            radius: 25,
            child: Icon(Icons.person),
          ),
          DView.spaceHeight(),

          Expanded(child: Consumer(
            builder: (context, ref, child) {
              final profiledata = ref.watch(profileProvider);
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    profiledata[0].toString(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ),
                  Text(
                    profiledata[1].toString(),
                    style: const TextStyle(color: Colors.white),
                  )
                ],
              );
            },
          )),

          const Padding(
              padding: EdgeInsets.only(right: 20),
              child: Icon(
                Icons.edit,
                size: 30,
                color: Colors.white,
              ))
        ],
      ),
    );
  }
}
