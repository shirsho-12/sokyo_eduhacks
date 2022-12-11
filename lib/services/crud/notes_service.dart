// import 'dart:async';

// import 'package:mynotes/extensions/list/filter.dart';
// import 'package:mynotes/services/crud/database_note.dart';
// import 'package:mynotes/services/crud/database_user.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path_provider/path_provider.dart'
//     show getApplicationDocumentsDirectory, MissingPlatformDirectoryException;
// import 'package:path/path.dart' show join;
// import 'dart:developer' as devtools show log;

// import 'crud_constants.dart';
// import 'crud_exceptions.dart';

// class NotesService {
//   Database? _db;

//   List<DatabaseNote> _notes = [];

//   DatabaseUser? _user;

//   late final StreamController<List<DatabaseNote>> _notesStreamController;

//   NotesService._sharedInstance() {
//     _notesStreamController =
//         StreamController<List<DatabaseNote>>.broadcast(onListen: () {
//       _notesStreamController.sink.add(_notes);
//     });
//   }

//   static final NotesService _shared = NotesService._sharedInstance();

//   factory NotesService() => _shared;

//   Stream<List<DatabaseNote>> get allNotes =>
//       _notesStreamController.stream.filter((note) {
//         final currentUser = _user;
//         if (currentUser != null) {
//           return note.userID == currentUser.id;
//         } else {
//           throw UserShouldBeSetBeforeReadingAllNotes();
//         }
//       });

//   Future<DatabaseUser> getOrCreateUser({
//     required String email,
//     bool setAsCurrentUser = true,
//   }) async {
//     try {
//       final user = await getUser(email: email);
//       if (setAsCurrentUser) {
//         _user = user;
//       }
//       return user;
//     } on CouldNotFindUser {
//       final createdUser = await createUser(email: email);
//       if (setAsCurrentUser) {
//         _user = createdUser;
//       }
//       return createdUser;
//     } catch (e) {
//       devtools.log(e.toString());
//       rethrow;
//     }
//   }

//   Future<void> _cacheNotes() async {
//     final allNotes = await getAllNotes();
//     _notes = allNotes.toList();
//     _notesStreamController.add(_notes);
//   }

//   Future<DatabaseNote> updateNote(
//       {required DatabaseNote note, required String text}) async {
//     _ensureDbIsOpen();
//     // devtools.log("updateNote $text");
//     final db = _getDatabaseOrThrow();
//     await getNote(id: note.id);
//     final updatesCount = await db.update(
//       noteTable,
//       {
//         textColumn: text,
//         isSyncedWithCloudColumn: 0,
//       },
//       where: 'id = ?',
//       whereArgs: [note.id],
//     );

//     if (updatesCount == 0) {
//       throw CouldNotUpdateNote();
//     } else {
//       final updatedNote = await getNote(id: note.id);

//       /// Not sure if this is needed
//       _notes.removeWhere((element) => element.id == updatedNote.id);
//       _notes.add(updatedNote);
//       _notesStreamController.add(_notes);
//       return updatedNote;
//     }
//   }

//   Future<Iterable<DatabaseNote>> getAllNotes() async {
//     final db = _getDatabaseOrThrow();
//     final notes = await db.query(
//       noteTable,
//     );

//     return notes.map((noteRow) => DatabaseNote.fromRow(noteRow));
//   }

//   Future<DatabaseNote> getNote({required int id}) async {
//     await _ensureDbIsOpen();
//     final db = _getDatabaseOrThrow();
//     final notes = await db.query(
//       noteTable,
//       limit: 1,
//       where: 'id = ?',
//       whereArgs: [id],
//     );

//     if (notes.isEmpty) {
//       throw CouldNotFindNote();
//     } else {
//       final note = DatabaseNote.fromRow(notes.first);
//       _notes.removeWhere((element) => element.id == note.id);
//       _notes.add(note);
//       _notesStreamController.add(_notes);
//       return note;
//     }
//   }

//   Future<DatabaseNote> createNote({required DatabaseUser owner}) async {
//     await _ensureDbIsOpen();
//     final db = _getDatabaseOrThrow();

//     // make sure owner exists in the database with the correct id
//     final dbUser = await getUser(email: owner.email);
//     if (dbUser != owner) {
//       throw CouldNotFindUser();
//     }

//     const text = '';
//     // create the note
//     final noteId = await db.insert(noteTable,
//         {userIDColumn: owner.id, textColumn: text, isSyncedWithCloudColumn: 1});

//     final note = DatabaseNote(
//         id: noteId, userID: owner.id, text: text, isSyncWithCloud: true);
//     _notes.add(note);
//     _notesStreamController.add(_notes);
//     return note;
//   }

//   Future<int> deleteAllNotes() async {
//     await _ensureDbIsOpen();
//     final db = _getDatabaseOrThrow();
//     final numDeletes = await db.delete(noteTable);
//     _notes = [];
//     _notesStreamController.add([]);
//     return numDeletes;
//   }

//   Future<void> deleteNote({required int id}) async {
//     await _ensureDbIsOpen();
//     final db = _getDatabaseOrThrow();
//     final deletedCount = await db.delete(
//       noteTable,
//       where: 'id = ?',
//       whereArgs: [id],
//     );
//     if (deletedCount == 0) {
//       throw CouldNotDeleteNote();
//     } else {
//       // final countBefore = _notes.length;
//       _notes.removeWhere((element) => element.id == id);
//       // if (_notes.length != countBefore)
//       _notesStreamController.add(_notes);
//     }
//   }

//   Future<DatabaseUser> getUser({required String email}) async {
//     await _ensureDbIsOpen();
//     final db = _getDatabaseOrThrow();

//     final results = await db.query(
//       userTable,
//       limit: 1,
//       where: 'email = ?',
//       whereArgs: [email.toLowerCase()],
//     );

//     if (results.isEmpty) {
//       throw CouldNotFindUser();
//     } else {
//       return DatabaseUser.fromRow(results.first);
//     }
//   }

//   Future<DatabaseUser> createUser({required String email}) async {
//     await _ensureDbIsOpen();
//     final db = _getDatabaseOrThrow();
//     final results = await db.query(
//       userTable,
//       limit: 1,
//       where: "email = ?",
//       whereArgs: [email.toLowerCase()],
//     );

//     if (results.isNotEmpty) {
//       throw UserAlreadyExists();
//     }

//     final userID = await db.insert(userTable, {
//       'email': email.toLowerCase(),
//     });

//     return DatabaseUser(
//       id: userID,
//       email: email,
//     );
//   }

//   Future<void> deleteUser({required String email}) async {
//     await _ensureDbIsOpen();
//     final db = _getDatabaseOrThrow();
//     final deletedCount = await db.delete(
//       userTable,
//       where: 'email = ?',
//       whereArgs: [email.toLowerCase()],
//     );
//     if (deletedCount != 1) {
//       throw CouldNotDeleteUser();
//     }
//   }

//   Database _getDatabaseOrThrow() {
//     final db = _db;
//     if (db == null) {
//       throw DatabaseIsNotOpenException();
//     } else {
//       return db;
//     }
//   }

//   Future<void> _ensureDbIsOpen() async {
//     try {
//       await open();
//     } on DatabaseAlreadyOpenException {
//       // empty
//     }
//   }

//   Future<void> open() async {
//     if (_db != null) {
//       throw DatabaseAlreadyOpenException();
//     }
//     try {
//       final docsPath = await getApplicationDocumentsDirectory();
//       final dbPath = join(docsPath.path, dbName);
//       final db = await openDatabase(dbPath);
//       _db = db;
//       // create user table
//       await db.execute(createUserTable);
//       // create note table
//       await db.execute(createNoteTable);
//       await _cacheNotes();
//     } on MissingPlatformDirectoryException {
//       throw UnableToGetDocumentsException();
//     }
//   }

//   Future<void> close() async {
//     final db = _getDatabaseOrThrow();
//     await db.close();
//     _db = db;
//   }
// }
