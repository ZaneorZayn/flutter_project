// BlogCard.dart
import 'package:flutter/material.dart';
import 'package:new_project/models/blog_model.dart';
import 'package:new_project/screens/blogscreen/blog_detail.dart';

class BlogCard extends StatelessWidget {
  final Blog blog;

  const BlogCard({
    Key? key,
    required this.blog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isTablet = MediaQuery.of(context).size.width > 600;

    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BlogDetail(blog: blog), // Pass the Blog object here
        ),
      ),
      child: Container(
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5.0,
              spreadRadius: 2.0,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Blog image
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12.0),
                topRight: Radius.circular(12.0),
              ),
              child: Image.asset(
                blog.image,
                width: double.infinity,
                height: isTablet ? 250 : 150,
                fit: BoxFit.cover,
              ),
            ),
            // Blog title
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                blog.title,
                style: Theme.of(context).textTheme.headlineSmall,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
