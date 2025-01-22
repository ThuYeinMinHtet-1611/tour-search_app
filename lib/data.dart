class Article {
  final String title;
  final String image;
  final String location;
  final String author;
  final int likes;
  final int comments;
  final int shares;
  final double rating;
  bool isLiked = false;

  Article(this.title, this.image, this.comments, this.likes, this.isLiked,
      this.location, this.shares, this.author, this.rating);
}

List<Article> articles = [
  Article(
      'Mandalay\'s Mandalay Hill',
      'https://th.bing.com/th/id/OIP.YlaL0gYucClgBSbXbnBrpwHaE8?rs=1&pid=ImgDetMain',
      100,
      32000,
      true,
      'Mandalay, Myanmar',
      50,
      'Thu Yein',
      4.0),
  Article(
      'Mandalay Royal Palace',
      'https://tourisminmyanmar.com.mm/vn/wp-content/uploads/2019/07/Mandalay-Royal-Palace.jpg',
      300,
      50000,
      true,
      'Mandalay, Myanmar',
      1250,
      'Thu Yein',
      5.0),
  Article(
      'Mandalay\'s U Bein Bridge',
      'https://th.bing.com/th/id/R.9f521a3ea0b197f975b2f099b4c145a0?rik=Ls48o2RoUnBbew&pid=ImgRaw&r=0',
      200,
      10000,
      true,
      'Mandalay, Myanmar',
      1000,
      'Thu Yein',
      3.5),
];
