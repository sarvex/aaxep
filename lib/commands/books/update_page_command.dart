import 'package:aaxep/commands/books/update_book_modified_command.dart';
import 'package:aaxep/commands/commands.dart';
import 'package:aaxep/data/book_data.dart';

class UpdatePageCommand extends BaseAppCommand {
  Future<void> run(ScrapPageData page) async {
    booksModel.replacePage(page);
    await firebase.setPage(page);
    UpdateBookModifiedCommand().run(bookId: page.bookId);
  }
}
