class GameModel {
  int? id;
  String? name;
  int? color;
  String? xPlayer;
  String? oPlayer;
  String? createPlayerUid;
  bool? isComplete;
  int? row;
  int? column;

  GameModel(
      {this.id,
      this.name,
      this.color,
      this.xPlayer,
      this.oPlayer,
      this.createPlayerUid,
      this.isComplete,
      this.row,
      this.column});

  GameModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    color = json['color'];
    xPlayer = json['x_player'];
    oPlayer = json['o_player'];
    createPlayerUid = json['create_player_uid'];
    isComplete = json['is_complete'];
    row = json['row'];
    column = json['column'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['color'] = color;
    data['x_player'] = xPlayer;
    data['o_player'] = oPlayer;
    data['create_player_uid'] = createPlayerUid;
    data['is_complete'] = isComplete;
    data['row'] = row;
    data['column'] = column;
    return data;
  }
}
