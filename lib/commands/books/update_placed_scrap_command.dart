import 'package:aaxep/_utils/time_utils.dart';
import 'package:aaxep/commands/books/update_book_modified_command.dart';
import 'package:aaxep/commands/commands.dart';
import 'package:aaxep/data/book_data.dart';

class UpdatePageScrapCommand extends BaseAppCommand {
  Future<void> run(PlacedScrapItem scrapItem, {bool localOnly = false}) async {
    PlacedScrapItem newScrap = scrapItem.copyWith(lastModifiedTime: TimeUtils.nowMillis);
    booksModel.replaceCurrentPageScrap(newScrap);
    if (localOnly == false) {
      firebase.setPlacedScrap(newScrap);
      UpdateBookModifiedCommand().run(bookId: scrapItem.bookId);
    }
  }
}
