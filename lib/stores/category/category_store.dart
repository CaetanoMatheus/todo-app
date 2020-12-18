import 'package:mobx/mobx.dart';
import 'package:todo_app/helpers/category_helper.dart';

import 'package:todo_app/models/category.dart';

part 'category_store.g.dart';

class CategoryStore = _CategoryStore with _$CategoryStore;

abstract class _CategoryStore with Store {
  CategoryHelper _categoryHelper = CategoryHelper();

  @observable
  List<Category> categories = ObservableList();

  @action
  Future<void> getAll() async {
    this.categories = await this._categoryHelper.all();
  }
}
