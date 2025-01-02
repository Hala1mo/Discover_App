class Article {
  final String title;
  final String image;
  final String location;
  final String author;
  final int likes;
  final int comments;
  final int shares;
  bool isLiked = false;
  final double ratings;
  Article(this.title, this.image, this.comments, this.likes, this.isLiked,
      this.location, this.shares, this.author, this.ratings);
}

List<Article> articles = [
  Article(
      'Japan\'s second largest metropolitan area',
      'https://images.pexels.com/photos/15663295/pexels-photo-15663295/free-photo-of-traditional-shinto-pagoda.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1.jpg',
      100,
      32000,
      true,
      'Osaka Japan',
      50,
      'Hussain Mustafa',
  3),
  Article(
      'Known as the sleepless town for obvious reasons',
      'https://c.wallhere.com/photos/56/03/ueno_park_tokyo_japan_skyscraper_roof_chilling_relaxing-966315.jpg!s1',
      300,
      50000,
      true,
      'Kabuikicho Japan',
      1250,
      'Tim Salvatore',
      3.5),
  Article(
      'Japan\'s second largest metropolitan area',
      'https://images.wallpaperscraft.com/image/single/street_neon_night_city_139596_1920x1080.jpg',
      200,
      10000,
      true,
      'Tokyo Japan',
      1000,
      'Ely Marya',
      5),
];
