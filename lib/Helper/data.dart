import 'package:truth/Helper/cateogery.dart';

List<CategoryModel> getCaterogries() {
  List<CategoryModel> cateList = [];
  CategoryModel categoryModel = new CategoryModel();

  categoryModel.title = "Business";
  categoryModel.imageUrl =
      "https://images.pexels.com/photos/936137/pexels-photo-936137.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  cateList.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.title = "Sports";
  categoryModel.imageUrl =
      "https://images.pexels.com/photos/4747325/pexels-photo-4747325.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  cateList.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.title = "Science";
  categoryModel.imageUrl =
      "https://images.pexels.com/photos/356040/pexels-photo-356040.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  cateList.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.title = "Health";
  categoryModel.imageUrl =
      "https://images.pexels.com/photos/2324837/pexels-photo-2324837.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  cateList.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.title = "General";
  categoryModel.imageUrl =
      "https://images.pexels.com/photos/3837472/pexels-photo-3837472.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  cateList.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.title = "Technology";
  categoryModel.imageUrl =
      "https://images.pexels.com/photos/1714208/pexels-photo-1714208.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  cateList.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.title = "Entertainment";
  categoryModel.imageUrl =
      "https://images.pexels.com/photos/1763075/pexels-photo-1763075.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  cateList.add(categoryModel);

  return cateList;
}
