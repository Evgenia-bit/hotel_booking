class Room {
  final String name;
  final String price;
  final String pricePer;
  final List<String> peculiarities;
  final List<String> imageUrls;

  const Room({
    required this.name,
    required this.price,
    required this.pricePer,
    required this.peculiarities,
    required this.imageUrls,
  });
}
