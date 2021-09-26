class Category {
  final String title;
  final int id;
  final Categories category;

  const Category(this.title, this.id, this.category);
}

const categoryList = [
  Category('All', 0, Categories.general),
  Category('General', 1, Categories.general),
  Category('Dating', 2, Categories.dating),
  Category('Friendship', 3, Categories.friendship),
  Category('Politics', 4, Categories.politics),
  Category('Sports', 5, Categories.sports),
  Category('Games', 6, Categories.games),
  Category('Location', 7, Categories.location),
];

enum Categories {
  all,
  general,
  dating,
  friendship,
  politics,
  sports,
  games,
  location,
}
