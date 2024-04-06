class Issue {
  final String id;
  final String category;
  final String description;
  final String imageUrl;
  final double latitude;
  final double longitude;
  final List<String> listSupportedUser;
  final String origin;
  final int reportCount;
  final int supportCount;
  final String title;
  final String userId;

  Issue({
    required this.id,
    required this.category,
    required this.description,
    required this.imageUrl,
    required this.latitude,
    required this.longitude,
    required this.listSupportedUser,
    required this.origin,
    required this.reportCount,
    required this.supportCount,
    required this.title,
    required this.userId,
  });

  factory Issue.fromJson(String id, Map<String, dynamic> json) {
    return Issue(
      id: id,
      category: json['category'] ?? '',
      description: json['description'] ?? '',
      imageUrl: json['imageUrl'] ?? '', // Changed from imageUrlList to imageUrl
      latitude: json['latitude'] ?? 0.0,
      longitude: json['longitude'] ?? 0.0,
      listSupportedUser: json['listSupportedUser'] != null
          ? List<String>.from(json['listSupportedUser'])
          : [],
      origin: json['origin'] ?? '',
      reportCount: json['report_count'] ?? 0,
      supportCount: json['support_count'] ?? 0,
      title: json['title'] ?? '',
      userId: json['user_id'] ?? '',
    );
  }
}
