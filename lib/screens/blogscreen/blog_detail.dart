import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_project/models/blog_model.dart'; // Ensure the Blog model is correctly imported

class BlogDetail extends StatelessWidget {
  final Blog blog;

  // Constructor accepting a Blog object
  const BlogDetail({Key? key, required this.blog}) : super(key: key);

  // Method to fetch related blogs based on category, excluding the current blog
  List<Blog> getRelatedBlogs() {
    // Print the current blog's category to debug
    print("Current blog category: ${blog.category}");

    // Print all blog data for debugging
    print("Available blog data:");
    for (var b in blogData) {
      print("Blog: ${b.title}, Category: ${b.category}, ID: ${b.id}");
    }

    // Filter blogs based on category and exclude the current blog by ID
    List<Blog> relatedBlogs = blogData
        .where((b) =>
            b.category.trim().toLowerCase() ==
                blog.category.trim().toLowerCase() &&
            b.id != blog.id)
        .toList();

    // Print related blogs to see what is being filtered
    print("Related blogs found:");
    for (var b in relatedBlogs) {
      print("Blog: ${b.title}, Category: ${b.category}, ID: ${b.id}");
    }

    return relatedBlogs;
  }

  @override
  Widget build(BuildContext context) {
    List<Blog> relatedBlogs = getRelatedBlogs(); // Fetch related blogs

    return Scaffold(
      // Custom gradient AppBar
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
               colors: [Color(0xffF49EC4), Color(0xffF9C0C7)], // Gradient colors
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          title: Text(
            blog.title,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Colors.white,
                ),
          ),
          
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [
            Container(
          height: 45, // Smaller size for the icon background
          width: 45, // Make it circular
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            
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
        const SizedBox(width: 4,),
        Container(
          height: 45, // Smaller size for the icon background
          width: 45, // Make it circular
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
           
          ),
          child: IconButton(
            icon: SvgPicture.asset(
              'assets/icon/bookmark.svg',
              color: const Color(0xff64748B),
              width: 25, // Icon size
              height: 25, // Icon size
            ),
            onPressed: () {
              // Action for the bell button
            },
          ),
        ),
        const SizedBox(width: 8,)
          ], // Set to transparent
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Blog Image
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  blog.image,
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),
              // Blog Title
              Text(
                blog.title,
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8),
              // Poster Information and Category
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(blog.posterImage),
                        radius: 20,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        blog.postedBy,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                  Text(
                    blog.category,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey,
                        ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              // Posted Date and View Count
              Row(
                children: [
                  Text(
                    ' ${blog.postedDate.toLocal().toString().split(' ')[0]}',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey,
                        ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    '${blog.viewCount} Views',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey,
                        ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Blog Content Placeholder
              Text(
                "This is where the blog content goes. Displaying full content will provide users with valuable insights based on the blog title and summary.",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 20),
              // Related Blogs Section
              if (relatedBlogs.isNotEmpty) ...[
                Text(
                  'Related Blogs',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 175, // Adjust the height as needed
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: relatedBlogs.length,
                    itemBuilder: (context, index) {
                      final relatedBlog = relatedBlogs[index];
                      return GestureDetector(
                        onTap: () {
                          // Navigate to the detail screen of the selected related blog
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  BlogDetail(blog: relatedBlog),
                            ),
                          );
                        },
                        child: Container(
                          width: 200, // Adjust the width as needed
                          margin: const EdgeInsets.symmetric(horizontal: 8.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow:const  [
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
                              ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(10)),
                                child: Image.asset(
                                  relatedBlog.image,
                                  width: double.infinity,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  relatedBlog.title,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  'By ${relatedBlog.postedBy}',
                                  style: Theme.of(context).textTheme.bodySmall,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ] else
                const Text(
                  'No related blogs found.',
                  style: TextStyle(color: Colors.grey),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
