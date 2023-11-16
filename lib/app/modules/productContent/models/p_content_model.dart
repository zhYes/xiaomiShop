class PContentModel {
  PContentItemModel? result;

  PContentModel({this.result});

  PContentModel.fromJson(Map<String, dynamic> json) {
    result = json['result'] != null
        ? new PContentItemModel.fromJson(json['result'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    return data;
  }
}

class PContentItemModel {
  String? sId;
  String? title;
  String? cid;
  int? price;
  int? oldPrice;
  int? isBest;
  int? isHot;
  int? isNew;
  int? status;
  String? pic;
  String? content;
  String? cname;
  List<PContentAttrModel>? attr;
  String? subTitle;
  int? salecount;
  String? specs;

  PContentItemModel(
      {this.sId,
      this.title,
      this.cid,
      this.price,
      this.oldPrice,
      this.isBest,
      this.isHot,
      this.isNew,
      this.status,
      this.pic,
      this.content,
      this.cname,
      this.attr,
      this.subTitle,
      this.salecount,
      this.specs});

  PContentItemModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    cid = json['cid'];
    price = json['price'];
    oldPrice = json['old_price'];
    isBest = json['is_best'];
    isHot = json['is_hot'];
    isNew = json['is_new'];
    status = json['status'];
    pic = json['pic'];
    content = json['content'];
    cname = json['cname'];
    if (json['attr'] != null) {
      attr = <PContentAttrModel>[];
      json['attr'].forEach((v) {
        attr!.add(new PContentAttrModel.fromJson(v));
      });
    }
    subTitle = json['sub_title'];
    salecount = json['salecount'];
    specs = json['specs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['cid'] = this.cid;
    data['price'] = this.price;
    data['old_price'] = this.oldPrice;
    data['is_best'] = this.isBest;
    data['is_hot'] = this.isHot;
    data['is_new'] = this.isNew;
    data['status'] = this.status;
    data['pic'] = this.pic;
    data['content'] = this.content;
    data['cname'] = this.cname;
    if (this.attr != null) {
      data['attr'] = this.attr!.map((v) => v.toJson()).toList();
    }
    data['sub_title'] = this.subTitle;
    data['salecount'] = this.salecount;
    data['specs'] = this.specs;
    return data;
  }
}

class PContentAttrModel {
  String? cate;
  List<String>? list;
  List<Map<String, dynamic>>? attrList;

  PContentAttrModel({this.cate, this.list});

  PContentAttrModel.fromJson(Map<String, dynamic> json) {
    cate = json['cate'];
    list = json['list'].cast<String>();
    attrList = [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cate'] = this.cate;
    data['list'] = this.list;

    return data;
  }
}
