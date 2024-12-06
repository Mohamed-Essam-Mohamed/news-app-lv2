// ignore_for_file: public_member_api_docs, sort_constructors_first
class CategoryModel {
  final String? id;
  final String? title;
  final String? imageAssets;
  final int? codeColor;
  CategoryModel({
    this.id,
    this.title,
    this.imageAssets,
    this.codeColor,
  });
  // business entertainment general health science sports technology
  List<CategoryModel> getCategory() {
    return [
      CategoryModel(
        id: "business",
        title: "Business",
        imageAssets: "assets/icon-bussines.png",
        codeColor: 0xffC91C22,
      ),
      CategoryModel(
        id: "entertainment",
        title: "Entertainment",
        imageAssets: "assets/icon-environment.png",
        codeColor: 0xff003E90,
      ),
      CategoryModel(
        id: "general",
        title: "General",
        imageAssets: "assets/icon-politics.png",
        codeColor: 0xff4882CF,
      ),
      CategoryModel(
        id: "health",
        title: "Health",
        imageAssets: "assets/icon-health.png",
        codeColor: 0xffCF7E48,
      ),
      CategoryModel(
        id: "science",
        title: "Science",
        imageAssets: "assets/icon-science.png",
        codeColor: 0xffF2D352,
      ),
      CategoryModel(
        id: "sports",
        title: "Sports",
        imageAssets: "assets/icon-sports.png",
        codeColor: 0xff4882CF,
      ),
      CategoryModel(
        id: "technology",
        title: "Technology",
        imageAssets: "assets/icon-science.png",
        codeColor: 0xffC91C22,
      ),
    ];
  }
}
