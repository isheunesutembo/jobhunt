
import 'package:jobhunt/domain/models/categorymodel.dart';

abstract class CategoryRepository{

  Future<List<CategoryModel>>getJobCategories();
}