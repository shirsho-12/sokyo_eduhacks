
import 'crud_constants.dart';

class DatabaseNote {
  final int id;
  final int userID;
  final String text;
  final bool isSyncWithCloud;

  DatabaseNote({
    required this.id,
    required this.userID,
    required this.text,
    required this.isSyncWithCloud,
  });
  DatabaseNote.fromRow(Map<String, Object?> map) :
        id = map[idColumn] as int,
        userID = map[userIDColumn] as int,
        text = map[textColumn] as String,
        isSyncWithCloud = (map[isSyncedWithCloudColumn] as int) == 1 ?
        true : false;

  @override
  String toString() =>
      'Note, ID = $id, userID = $userID, isSyncedWithCloud = $isSyncWithCloud, '
          'Text = $text';

  @override bool operator == (covariant DatabaseNote other) => id == other.id;

  @override
  int get hashCode => id.hashCode;

}