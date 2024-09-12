class Blog {
  final int id;
  final String title;
  final String image;
  final DateTime postedDate;
  final String postedBy;
  final String posterImage;
  final String category;
  final int viewCount;

  Blog({
    required this.id,
    required this.title,
    required this.image,
    required this.postedDate,
    required this.postedBy,
    required this.posterImage,
    required this.category,
    required this.viewCount,
  });
}

List<Blog> blogData = [
  Blog(
    id: 1,
    title: "Introduction to Flutter",
    image: "assets/images/blog1.png",
    postedDate: DateTime(2024, 9, 1),
    postedBy: "John Doe",
    posterImage: "assets/images/john_doe.png",
    category: "Technology",
    viewCount: 1500,
  ),
  Blog(
    id: 2,
    title: "Mastering State Management in Flutter",
    image: "assets/images/blog2.png",
    postedDate: DateTime(2024, 8, 25),
    postedBy: "Jane Smith",
    posterImage: "assets/images/jane_smith.png",
    category: "Development",
    viewCount: 980,
  ),
  Blog(
    id: 3,
    title: "Best Practices for Responsive Design",
    image: "assets/images/blog3.png",
    postedDate: DateTime(2024, 7, 20),
    postedBy: "Alice Johnson",
    posterImage: "assets/images/alice_johnson.png",
    category: "Design",
    viewCount: 1300,
  ),
  Blog(
    id: 4,
    title: "Getting Started with Firebase",
    image: "assets/images/blog3.png",
    postedDate: DateTime(2024, 6, 15),
    postedBy: "Michael Brown",
    posterImage: "assets/images/michael_brown.png",
    category: "Backend",
    viewCount: 2100,
  ),
  
];
