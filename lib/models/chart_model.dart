class ChartModel {
  String? s;
  K? k;

  ChartModel({this.s, this.k});

  ChartModel.fromJson(Map<String, dynamic> json) {
    s = json['s'];
    k = json['k'] != null ? K.fromJson(json['k']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['s'] = s;
    if (k != null) {
      data['k'] = k!.toJson();
    }
    return data;
  }
}

class K {
  String? o;
  String? c;
  String? h;
  String? l;
  String? v;
  String? V;

  K({
    this.o,
    this.c,
    this.h,
    this.l,
    this.v,
    this.V,
  });

  K.fromJson(Map<String, dynamic> json) {
    o = json['o'];
    c = json['c'];
    h = json['h'];
    l = json['l'];
    v = json['v'];
    V = json['V'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['o'] = o;
    data['c'] = c;
    data['h'] = h;
    data['l'] = l;
    data['v'] = v;
    data['V'] = V;

    return data;
  }
}

class PartialBookDepth {

  List<List<String>>? bids;
  List<List<String>>? asks;

  PartialBookDepth({
   
    this.bids,
    this.asks,
  });

  PartialBookDepth.fromJson(Map<String, dynamic> json) {
    if (json['bids'] != null) {
      bids = <List<String>>[];
      json['bids'].forEach((v) {
        bids!.add(List<String>.from(v));
      });
    }
    if (json['asks'] != null) {
      asks = <List<String>>[];
      json['asks'].forEach((v) {
        asks!.add(List<String>.from(v));
      });
    }
  }


  @override
  String toString() {
    return """
    bids: $bids,
    asks: $asks,
          """;
  }
}
