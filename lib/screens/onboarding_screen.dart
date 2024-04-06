import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  String selectedCategory = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: const Color(0xFF4255FF),
        body: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //  TODO: some icon maybe
          // some title
          DropdownMenu(
              // style the dropdown menu
              dropdownMenuEntries: const [
                // dropdown menu items
                DropdownMenuEntry(value: '1', label: 'category 1'),
              ],
              onSelected: (value) {}
              // onSelected callback
              ),
          ElevatedButton(
            // style the button
            onPressed: () {
              // navigate to the quiz screen
            },
            child: const Text(
              'Start Quiz',
            ),
          ),
        ],
      ),
    ));
  }
}
