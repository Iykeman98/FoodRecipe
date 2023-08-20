class RecipeModel{

  final String? label;
  final String? image;
  final String? source;
  // final List<String?> ingredients;
  final String? url;

  RecipeModel({
    this.label, this.image,  this.source,  this.url,});
  factory RecipeModel.fromJson(Map<String, dynamic> json) {

    return RecipeModel(
      label: json['label'],
      image: json['image'],
      source: json['source'],
      url: "url",
      // ingredients: List<String>.from(json['ingredients']),

    );
  }

// factory RecipeModel.fromMap()

}