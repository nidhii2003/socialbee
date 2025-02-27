import 'package:flutter/material.dart';
import 'package:socialbee/app_colors.dart';

// Import the newly created screens
import 'chat_screen.dart';
import 'create_blog_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> posts = [
    {
      "title": "How to Build a Flutter App",
      "likes": 0,
      "isLiked": false,
      "image": "assets/images/post_1.jpg"
    },
    {
      "title": "Top 10 Flutter Tips and Tricks",
      "likes": 0,
      "isLiked": false,
      "image": "assets/images/post_2.jpg"
    },
    {
      "title": "Understanding Flutter Widgets",
      "likes": 0,
      "isLiked": false,
      "image": "assets/images/post_3.jpg"
    },
    {
      "title": "State Management in Flutter",
      "likes": 0,
      "isLiked": false,
      "image": "assets/images/post_4.jpg"
    },
    {
      "title": "Building a Responsive Flutter UI",
      "likes": 0,
      "isLiked": false,
      "image": "assets/images/post_5.jpg"
    },
  ];

  void _toggleLike(int index) {
    setState(() {
      if (posts[index]["isLiked"]) {
        posts[index]["likes"]--;
      } else {
        posts[index]["likes"]++;
      }
      posts[index]["isLiked"] = !posts[index]["isLiked"];
    });
  }

  void _sharePost(int index) {
    print("Shared post: ${posts[index]["title"]}");
  }

  // Navigation Methods
  void _navigateToProfile() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProfileScreen()), // Navigate to ProfileScreen
    );
  }

  void _navigateToChat() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ChatScreen()), // Navigate to ChatScreen
    );
  }

  void _navigateToCreatePost() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CreateBlogScreen()), // Navigate to CreateBlogScreen
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Post Home Screen'),
        backgroundColor: AppColors.secondaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to the Post Screen!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Recent Posts:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryColor,
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: Column(
                      children: [
                        Image.asset(
                          posts[index]["image"],
                          height: 150,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        ListTile(
                          title: Text(posts[index]["title"]),
                          subtitle: Row(
                            children: [
                              IconButton(
                                icon: Icon(
                                  posts[index]["isLiked"] ? Icons.favorite : Icons.favorite_border,
                                  color: posts[index]["isLiked"] ? Colors.red : Colors.grey,
                                ),
                                onPressed: () => _toggleLike(index),
                              ),
                              Text("${posts[index]["likes"]} Likes"),
                              Spacer(),
                              IconButton(
                                icon: Icon(Icons.share, color: Colors.green),
                                onPressed: () => _sharePost(index),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.secondaryColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: Icon(Icons.person, color: Colors.white),
                    onPressed: _navigateToProfile,
                  ),
                  IconButton(
                    icon: Icon(Icons.chat, color: Colors.white),
                    onPressed: _navigateToChat,
                  ),
                  IconButton(
                    icon: Icon(Icons.add_circle, color: Colors.white),
                    onPressed: _navigateToCreatePost,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
