class CategoryModel {
  List<CategroyItem>? result;

  CategoryModel({this.result});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <CategroyItem>[];
      json['result'].forEach((v) {
        result!.add(CategroyItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CategroyItem {
  String? sId;
  String? title;
  int? status;
  String? pic;
  String? pid;
  int? sort;
  int? isBest;
  int? goProduct;
  String? productId;

  CategroyItem(
      {this.sId,
      this.title,
      this.status,
      this.pic,
      this.pid,
      this.sort,
      this.isBest,
      this.goProduct,
      this.productId});

  CategroyItem.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    status = json['status'];
    pic = json['pic'];
    pid = json['pid'];
    sort = json['sort'];
    isBest = json['is_best'];
    goProduct = json['go_product'];
    productId = json['product_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['status'] = status;
    data['pic'] = pic;
    data['pid'] = pid;
    data['sort'] = sort;
    data['is_best'] = isBest;
    data['go_product'] = goProduct;
    data['product_id'] = productId;
    return data;
  }
}
