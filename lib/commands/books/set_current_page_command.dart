import 'package:aaxep/_utils/input_utils.dart';
import 'package:aaxep/commands/books/refresh_current_page_command.dart';
import 'package:aaxep/commands/commands.dart';
import 'package:aaxep/data/book_data.dart';

class SetCurrentPageCommand extends BaseAppCommand {
  Future<ScrapPageData?> run(ScrapPageData? page) async {
    // Because TextEditing relies on FocusOut for saving, we have to make sure we focus out before changing pages
    InputUtils.unFocus();
    booksModel.currentPage = page;
    if (page != null) {
      RefreshCurrentPageCommand().run();
    }
    return booksModel.currentPage;
  }
}
