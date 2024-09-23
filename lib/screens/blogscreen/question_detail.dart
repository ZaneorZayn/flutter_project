import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QADetailScreen extends StatelessWidget {
  final Map<String, String> qaData;

  const QADetailScreen({Key? key, required this.qaData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Q&A Details",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        backgroundColor: const Color(0xffF49EC4), // Customize app bar color
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display Question and Poster Info
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(qaData['profileImage']!),
                  radius: 24,
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      qaData['poster']!,
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Text(
                      qaData['date']!,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.grey,
                          ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Display Question Text
            Text(
              qaData['question']!,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 16),
            // Comments Section
            Divider(
              color: Colors.grey.shade400,
              thickness: 1,
            ),
            const SizedBox(height: 8),
            Text(
              "Comments & Replies",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            // Mocked Comment Tree
            buildCommentTree(),
            const SizedBox(height: 20),
            // Add Comment Input Section
            TextField(
              decoration: InputDecoration(
                hintText: "Write a comment...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.send, color: Color(0xffF49EC4)),
                  onPressed: () {
                    // Handle send comment action
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Mockup of a comment tree structure
  Widget buildCommentTree() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // First Comment
        buildComment(
          profileImage: 'https://via.placeholder.com/50',
          username: 'John Doe',
          comment: 'This is a really insightful question!',
          timeAgo: '2 hours ago',
        ),
        // Reply to First Comment
        Padding(
          padding: const EdgeInsets.only(left: 40.0, top: 8.0),
          child: buildComment(
            profileImage: 'https://via.placeholder.com/50',
            username: 'Jane Smith',
            comment: 'I totally agree with you.',
            timeAgo: '1 hour ago',
          ),
        ),
        // Another Comment
        buildComment(
          profileImage: 'https://via.placeholder.com/50',
          username: 'Alice Johnson',
          comment: 'I had the same question. Thanks for asking!',
          timeAgo: '3 hours ago',
        ),
      ],
    );
  }

  // Single comment widget
  Widget buildComment({
    required String profileImage,
    required String username,
    required String comment,
    required String timeAgo,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(profileImage),
          radius: 20,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                username,
                
              ),
              Text(
                comment,
                
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Text(
                    timeAgo,
                    
                  ),
                  const SizedBox(width: 16),
                  TextButton(
                    onPressed: () {
                      // Handle reply action
                    },
                    child: const Text(
                      'Reply',
                      style: TextStyle(color: Color(0xffF49EC4)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ],
    );
  }
}
