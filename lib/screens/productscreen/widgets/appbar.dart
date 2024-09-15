import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBarProduct extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBarProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      elevation: 0,
      title: Row(

        children: [
          Text("Product",style: Theme.of(context).textTheme.headlineLarge,),

        ],
      ),

      actions: [
        Container(
          height: 40, // Smaller size for the icon background
          width: 40, // Make it circular
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: SvgPicture.asset(
              'assets/icon/bell.svg',
              color: const Color(0xff64748B),
              width: 24, // Icon size
              height: 24, // Icon size
            ),
            onPressed: () {
              // Action for the bell button
            },
          ),
        ),
        const SizedBox(width: 8),
        // Message icon
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 40, // Smaller size for the icon background
            width: 40, // Make it circular
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: SvgPicture.asset(
                'assets/icon/chat.svg',
                color: const Color(0xff64748B),
                width: 24, // Icon size
                height: 24, // Icon size
              ),
              onPressed: () {
                // Action for the chat button
              },
            ),
          ),
        ),

      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
          child: Row(
            children: [
              // Search bar
              Expanded(
                child: Container(
                  height: 40,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: const TextField(
                    textAlign: TextAlign.left, // Align text to the left
                    decoration: InputDecoration(
                      hintText: "Find your suitable doctor!",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search, color: Colors.grey),
                      suffixIcon: Icon(Icons.sort, color: Colors.grey),
                      contentPadding: EdgeInsets.symmetric(vertical: 10), // Adjust vertical padding
                    ),
                  ),
                ),
              ),
            const SizedBox(width: 10),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize =>const Size.fromHeight(130); // Adjust height as needed
}
