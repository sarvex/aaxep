import 'package:aaxep/_utils/time_utils.dart';
import 'package:aaxep/commands/commands.dart';
import 'package:aaxep/data/book_data.dart';

class UpdateBookCommand extends BaseAppCommand {
  Future<void> run(ScrapBookData book) async {
    booksModel.replaceBook(book);
    await firebase.setBook(book.copyWith(
      lastModifiedTime: TimeUtils.nowMillis,
    ));
  }
}
