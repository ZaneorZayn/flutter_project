import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBarProduct extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBarProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xff4379F2),
      
      title: Row(
        children: [
          Text("Product", style: Theme.of(context).textTheme.headlineLarge),
        ],
      ),
      actions: [
        // Bell Icon with Border
        Container(
          height: 40, // Smaller size for the icon background
          width: 40, // Make it circular
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.grey, // Border color
              width: 1.5, // Border width
            ),
          ),
          child: IconButton(
            icon: SvgPicture.asset(
              'assets/icon/Heart.svg',
              color: const Color(0xff64748B),
              width: 30, // Icon size
              height: 30, // Icon size
            ),
            onPressed: () {
              // Action for the bell button
            },
          ),
        ),
        const SizedBox(width: 8),
        // Message icon with Border
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 40, // Smaller size for the icon background
            width: 40, // Make it circular
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.grey, // Border color
                width: 1.5, // Border width
              ),
            ),
            child: IconButton(
              icon: SvgPicture.asset(
                'assets/icon/cart.svg',
                color: const Color(0xff64748B),
                width: 26, // Icon size
                height: 26, // Icon size
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
                    color: const Color(0xffECFAFF),
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: const Color(0xff74D1F6), // Border color
                      width: 1.5, // Border width
                    ),
                  ),
                  child: const TextField(
                    textAlign: TextAlign.left, // Align text to the left
                    decoration: InputDecoration(
                      hintText: "Find your suitable doctor!",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search, color: Colors.grey),
                      contentPadding: EdgeInsets.symmetric(vertical: 10), // Adjust vertical padding
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              // Chat icon with border
              Container(
                height: 40, // Smaller size for the icon background
                width: 40, // Make it circular
                decoration: BoxDecoration(
                  color: const Color(0xff74D1F6),
                  shape: BoxShape.circle,
                  
                ),
                child: IconButton(
                  icon: SvgPicture.asset(
                    'assets/icon/chat.svg',
                    color: Colors.white,
                    width: 24, // Icon size
                    height: 24, // Icon size
                  ),
                  onPressed: () {
                    // Action for the chat button
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(130); // Adjust height as needed
}
