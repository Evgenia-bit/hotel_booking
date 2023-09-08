class Hotel {
  final String name;
  final String address;
  final String price;
  final String priceForIt;
  final int rating;
  final String ratingName;
  final List<String> imageUrls;
  final String description;
  final List<String> peculiarities;

  const Hotel({
    required this.name,
    required this.address,
    required this.price,
    required this.priceForIt,
    required this.rating,
    required this.ratingName,
    required this.imageUrls,
    required this.description,
    required this.peculiarities,
  });
}
