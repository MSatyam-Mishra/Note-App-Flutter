// import 'package:hive/hive.dart';
// part of 'note_tile.dart';
// part of 'note_tile.g.dart';



// @HiveType(typeId: 0)
// class NoteTileAdapter extends TypeAdapter<NoteTile> {
//   @override
//   NoteTile read(BinaryReader reader) {
//     return NoteTile(
//       noteTilte: reader.readString(),
//       noteContent: reader.readString(),
//        tileColor: reader.readString(),
//         type: reader.readString(),
//     );
//   }

//   @override
//   void write(BinaryWriter writer, NoteTile obj) {
//     writer.writeString(obj.noteTilte);
//     writer.writeString(obj.noteContent);
//     writer.writeString(obj.tileColor);
//     writer.writeString(obj.type);
//   }
// }