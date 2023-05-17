import 'package:flutter/material.dart';
import 'package:presentation/base/base_screen.dart';
import 'package:presentation/widgets/commons/layouts/basic_layout.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends BaseScreenState<ProfileScreen> {
  @override
  Widget builder(BuildContext context) {
    return BasicLayout(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, children: const []),
    );
  }
}
