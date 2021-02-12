class CategoryModel {
  int categoryId;
  String categoryName;
  String categoryDesc;
  int parent;
  ImageWp image;

  CategoryModel({
    this.categoryId,
    this.categoryName,
    this.categoryDesc,
    this.parent,
    this.image,
  });

  CategoryModel.fromJson(Map<String, dynamic> json) {
    categoryId = json['id'];
    categoryName = json['name'];
    categoryDesc = json['description'];
    parent = json['parent'];
    image = json['image'] != null ? new ImageWp.fromJson(json['image']) : null;
  }
}

class ImageWp {
  String url;

  ImageWp({this.url});

  ImageWp.fromJson(Map<String, dynamic> json) {
    url = json['src'];
  }
}
