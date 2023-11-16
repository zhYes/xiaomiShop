class SellingSubModel {
  List<SellingSubItemModel>? result;

  SellingSubModel({this.result});

  SellingSubModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <SellingSubItemModel>[];
      json['result'].forEach((v) {
        result!.add(new SellingSubItemModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SellingSubItemModel {
  String? sId;
  String? title;
  String? cid;
  int? price;
  String? pic;
  String? subTitle;
  String? sPic;

  SellingSubItemModel(
      {this.sId,
      this.title,
      this.cid,
      this.price,
      this.pic,
      this.subTitle,
      this.sPic});

  SellingSubItemModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    cid = json['cid'];
    price = json['price'];
    pic = json['pic'];
    subTitle = json['sub_title'];
    sPic = json['s_pic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['cid'] = this.cid;
    data['price'] = this.price;
    data['pic'] = this.pic;
    data['sub_title'] = this.subTitle;
    data['s_pic'] = this.sPic;
    return data;
  }
}
