class UserModel {
  String? sId;
  String? username;
  String? tel;
  String? password;
  String? salt;
  int? gold;
  int? coupon;
  int? redPacket;
  int? quota;
  int? collect;
  int? footmark;
  int? follow;

  UserModel(
      {this.sId,
      this.username,
      this.tel,
      this.password,
      this.salt,
      this.gold,
      this.coupon,
      this.redPacket,
      this.quota,
      this.collect,
      this.footmark,
      this.follow});

  UserModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    username = json['username'];
    tel = json['tel'];
    password = json['password'];
    salt = json['salt'];
    gold = json['gold'];
    coupon = json['coupon'];
    redPacket = json['redPacket'];
    quota = json['quota'];
    collect = json['collect'];
    footmark = json['footmark'];
    follow = json['follow'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['username'] = this.username;
    data['tel'] = this.tel;
    data['password'] = this.password;
    data['salt'] = this.salt;
    data['gold'] = this.gold;
    data['coupon'] = this.coupon;
    data['redPacket'] = this.redPacket;
    data['quota'] = this.quota;
    data['collect'] = this.collect;
    data['footmark'] = this.footmark;
    data['follow'] = this.follow;
    return data;
  }
}
