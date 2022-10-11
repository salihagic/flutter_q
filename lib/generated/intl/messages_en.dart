// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "an_error_occured_please_try_again":
            MessageLookupByLibrary.simpleMessage(
                "An error occured, please try again"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "description": MessageLookupByLibrary.simpleMessage("Description"),
        "favorites": MessageLookupByLibrary.simpleMessage("Favorites"),
        "movies": MessageLookupByLibrary.simpleMessage("Movies"),
        "okay": MessageLookupByLibrary.simpleMessage("Okay"),
        "permission_denied": MessageLookupByLibrary.simpleMessage(
            "Permission has been denied, please enable it in device settings"),
        "popular": MessageLookupByLibrary.simpleMessage("Popular"),
        "reload": MessageLookupByLibrary.simpleMessage("Reload"),
        "showing_cached_data":
            MessageLookupByLibrary.simpleMessage("Showing cached data"),
        "there_are_no_favorites_yet":
            MessageLookupByLibrary.simpleMessage("There are no favorites yet"),
        "there_are_no_popular_movies":
            MessageLookupByLibrary.simpleMessage("There are no popular movies"),
        "there_is_no_data":
            MessageLookupByLibrary.simpleMessage("There is no data"),
        "there_was_a_network_error_please_try_again_later":
            MessageLookupByLibrary.simpleMessage(
                "There was a network error, please try again later"),
        "there_was_a_server_error_please_try_again_later":
            MessageLookupByLibrary.simpleMessage(
                "There was a server error, please try again later"),
        "there_was_a_validation_error_please_fix_and_try_again":
            MessageLookupByLibrary.simpleMessage(
                "There was a validation error, please fix and try again"),
        "there_was_an_error":
            MessageLookupByLibrary.simpleMessage("There was an error"),
        "there_was_an_error_please_try_again":
            MessageLookupByLibrary.simpleMessage(
                "There was an error, please try again"),
        "unknown_error_occurred":
            MessageLookupByLibrary.simpleMessage("Unknown error occurred")
      };
}
