class Organisation {
  String id;
  String refCode;
  String name;
  String address1;
  String address2;
  String postcode;
  String town;
  String state;
  String longitude;
  String latitude;
  String queNo;
  String currentNo;
  String maxOut;
  String totalQueue;
  String cepat;

  Organisation(
      {this.id,
      this.refCode,
      this.name,
      this.address1,
      this.address2,
      this.postcode,
      this.town,
      this.state,
      this.longitude,
      this.latitude,
      this.queNo,
      this.currentNo,
      this.maxOut,
      this.totalQueue,
      this.cepat});

  Organisation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    refCode = json['ref_code'];
    name = json['name'];
    address1 = json['address_1'];
    address2 = json['address_2'];
    postcode = json['postcode'];
    town = json['town'];
    state = json['state'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    queNo = json['que_no'];
    currentNo = json['current_no'];
    maxOut = json['max_out'];
    totalQueue = json['total_queue'];
    cepat = json['cepat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ref_code'] = this.refCode;
    data['name'] = this.name;
    data['address_1'] = this.address1;
    data['address_2'] = this.address2;
    data['postcode'] = this.postcode;
    data['town'] = this.town;
    data['state'] = this.state;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['que_no'] = this.queNo;
    data['current_no'] = this.currentNo;
    data['max_out'] = this.maxOut;
    data['total_queue'] = this.totalQueue;
    data['cepat'] = this.cepat;
    return data;
  }
}
