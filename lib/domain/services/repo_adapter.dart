import 'package:hive/hive.dart';
import 'package:search_repo/api/export.dart';

class FavoriteRepoAdapter extends TypeAdapter<ResponseRepo> {
  @override
  final typeId = 0;

  @override
  ResponseRepo read(BinaryReader reader) {
    return ResponseRepo(name: reader.readString(), htmlUrl: reader.readString());
  }

  @override
  void write(BinaryWriter writer, ResponseRepo obj) {
    writer.writeString(obj.name);
    writer.writeString(obj.htmlUrl);
  }
}
