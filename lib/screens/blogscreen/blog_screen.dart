import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BlogScreen extends StatefulWidget {
  const BlogScreen({super.key});

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  final List<String> contentTypes = ["All", "Blog", "Q&A", "Video", "My Post"];
  final List<String> categories = [
    "Sort",
    "Sexual Health",
    "Menstrual Health",
    "Pregnancy",
    "Contraception"
  ];

  int selectedContentTypeIndex = 0;
  int selectedCategoryIndex = 0;

  // Function to update the selected content type index
  void _onContentTypeSelected(int index) {
    setState(() {
      selectedContentTypeIndex = index;
    });
  }

  // Function to update the selected category index
  void _onCategorySelected(int index) {
    setState(() {
      selectedCategoryIndex = index;
    });
  }

  // Mocked YouTube video data
  List<Map<String, String>> getFilteredVideos() {
    return [
      {
        "title": "Pregnancy Tips for a Healthy Baby",
        "videoUrl": "https://www.youtube.com/watch?v=dQw4w9WgXcQ", // Placeholder YouTube link
        "category": "Pregnancy",
      },
    ].where((video) => video['category'] == categories[selectedCategoryIndex]).toList();
  }

  // Mocked blog data
  List<Map<String, String>> getFilteredBlogs() {
    return [
      {
        "title": "ONCE INSERTED, DOES THE IMPLANT MOVE AROUND MY BODY?",
        "poster": "VIYA",
        "date": "2 days ago",
        "image": "https://via.placeholder.com/300", // Placeholder image
      },
    ];
  }

  // Mocked Q&A data
  List<Map<String, String>> getFilteredQA() {
    return [
      {
        "question": "What Is Sexual Health, And Why Is It Important?",
        "poster": "Chanda Hit",
        "date": "2 days ago",
        "answers": "0 doctor answered",
        "comments": "2",
        "profileImage": "https://via.placeholder.com/50", // Placeholder profile image
      },
    ];
  }

  // Widget to display YouTube videos
  Widget buildVideoWidget() {
    List<Map<String, String>> videos = getFilteredVideos();
    return ListView.builder(
      itemCount: videos.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(), // Prevent scrolling inside ListView
      itemBuilder: (context, index) {
        String videoId = YoutubePlayer.convertUrlToId(videos[index]['videoUrl']!)!;
        YoutubePlayerController _controller = YoutubePlayerController(
          initialVideoId: videoId,
          flags: const YoutubePlayerFlags(
            autoPlay: false,
            mute: false,
          ),
        );

        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  videos[index]['title']!,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Sample widget for Blogs
  Widget buildBlogWidget() {
    return ListView.builder(
      itemCount: getFilteredBlogs().length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(), // Prevent scrolling inside ListView
      itemBuilder: (context, index) {
        final blog = getFilteredBlogs()[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(blog['image']!),
                ),
                title: Text(blog['poster']!),
                subtitle: Text(blog['date']!),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  blog['title']!,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              const SizedBox(height: 8),
              Image.network(blog['image']!),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: TextButton(
                  onPressed: () {
                    // See more action
                  },
                  child: const Text('See more detail'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Sample widget for Q&A
  Widget buildQandAWidget() {
    return ListView.builder(
      itemCount: getFilteredQA().length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(), // Prevent scrolling inside ListView
      itemBuilder: (context, index) {
        final qa = getFilteredQA()[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(qa['profileImage']!),
                ),
                title: Text(qa['poster']!),
                subtitle: Text(qa['date']!),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  qa['question']!,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    const Icon(Icons.comment, size: 16),
                    const SizedBox(width: 4),
                    Text(qa['comments']!),
                    const SizedBox(width: 16),
                    const Icon(Icons.person, size: 16),
                    const SizedBox(width: 4),
                    Text(qa['answers']!),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: TextButton(
                  onPressed: () {
                    // See more action
                  },
                  child: const Text('See more detail'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Widget to display both Blog, Q&A, and Video mixed (for All content)
  Widget buildAllContentWidget() {
    return ListView(
      children: [

        buildVideoWidget(),  // Shows YouTube videos

        buildBlogWidget(),  // Shows blogs

        buildQandAWidget(),  // Shows Q&A
      ],
    );
  }

  // Widget to display content based on content type
  Widget getContentWidget() {
    switch (selectedContentTypeIndex) {
      case 1:
        return buildBlogWidget();
      case 2:
        return buildQandAWidget();
      case 3:
        return buildVideoWidget();
      default:
        return buildAllContentWidget();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F5FF),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80), // Adjusted height for AppBar
        child: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0, // Remove the black shadow line (elevation)
          flexibleSpace: Container(
            padding: const EdgeInsets.only(left: 16, right: 16),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xffF49EC4), Color(0xffF9C0C7)], // Gradient colors
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'All Content',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(color: Colors.black),
                    ),
                    Text(
                      'Explore good blog and Q&A',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(color: Colors.white),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: SvgPicture.asset(
                          "assets/icon/Search1.svg",
                          color: Colors.grey,
                          width: 24,
                          height: 24,
                        ),
                        onPressed: () {
                          // Search action
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: SvgPicture.asset(
                          "assets/icon/bookmark.svg",
                          color: Colors.grey,
                          height: 24,
                          width: 24,
                        ),
                        onPressed: () {
                          // Bookmark action
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          // Full-width content type buttons
          Container(
            height: 40,
            decoration: const BoxDecoration(
              color: Colors.white, // Set background color for the container
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16), // Rounded bottom-left corner
                bottomRight: Radius.circular(16), // Rounded bottom-right corner
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey, // Shadow color
                  blurRadius: 6.0, // Blur radius for the shadow
                  offset: Offset(0, 2), // Offset for the shadow
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0), // Padding inside the container
            child: Row(
              children: contentTypes.map((contentType) {
                int index = contentTypes.indexOf(contentType);
                return Expanded(
                  child: GestureDetector(
                    onTap: () => _onContentTypeSelected(index),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 6),
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      decoration: BoxDecoration(
                        color: selectedContentTypeIndex == index
                            ? Colors.pinkAccent
                            : Colors.grey[300],
                        borderRadius: BorderRadius.circular(16),
                        border: selectedContentTypeIndex == index
                            ? Border.all(color: Colors.pinkAccent, width: 1.5)
                            : Border.all(color: Colors.transparent),
                      ),
                      child: Center(
                        child: Text(
                          contentType,
                          style: TextStyle(
                            color: selectedContentTypeIndex == index
                                ? Colors.white
                                : Colors.black,
                            fontWeight: selectedContentTypeIndex == index
                                ? FontWeight.bold
                                : FontWeight.normal,
                            fontSize: 12, // Smaller font size
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),


          // Full-width category buttons with icons
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 30, // Reduced height for the container
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal, // Enable horizontal scrolling
                child: Row(
                  children: categories.map((category) {
                    int index = categories.indexOf(category);
                    return GestureDetector(
                      onTap: () => _onCategorySelected(index),
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 6),
                        padding: const EdgeInsets.symmetric(
                            vertical: 6, horizontal: 12), // Added horizontal padding
                        decoration: BoxDecoration(
                          color: selectedCategoryIndex == index
                              ? Colors.pinkAccent
                              : Colors.grey[300],
                          borderRadius: BorderRadius.circular(16),
                          border: selectedCategoryIndex == index
                              ? Border.all(color: Colors.pinkAccent, width: 1.5)
                              : Border.all(color: Colors.transparent),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (index == 0) // Add an icon for "Sort" category
                              const Icon(Icons.sort,
                                  size: 16, color: Colors.black),
                            const SizedBox(width: 4),
                            Text(
                              category,
                              style: TextStyle(
                                color: selectedCategoryIndex == index
                                    ? Colors.white
                                    : Colors.black,
                                fontWeight: selectedCategoryIndex == index
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                                fontSize: 12, // Smaller font size
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Display different content based on selected content type
          Expanded(child: getContentWidget()),
        ],
      ),
    );
  }
}
