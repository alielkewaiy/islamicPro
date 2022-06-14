class Zeker {
  List<ZekerData> data = [];
  Zeker.fromJason(Map<String, dynamic> jason) {
    jason['data'].forEach((element) {
      data.add(ZekerData.fromJason(element));
    });
  }
}

class ZekerData {
  String? category;
  String? count;
  String? description;
  String? reference;
  String? zeker;

  ZekerData.fromJason(Map<String, dynamic> jason) {
    category = jason['category'];
    count = jason['count'];
    description = jason['description'];
    reference = jason['reference'];
    zeker = jason['zekr'];
  }
}
