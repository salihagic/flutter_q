// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Unknown error occurred`
  String get unknown_error_occurred {
    return Intl.message(
      'Unknown error occurred',
      name: 'unknown_error_occurred',
      desc: '',
      args: [],
    );
  }

  /// `Permission has been denied, please enable it in device settings`
  String get permission_denied {
    return Intl.message(
      'Permission has been denied, please enable it in device settings',
      name: 'permission_denied',
      desc: '',
      args: [],
    );
  }

  /// `Movies`
  String get movies {
    return Intl.message(
      'Movies',
      name: 'movies',
      desc: '',
      args: [],
    );
  }

  /// `Reload`
  String get reload {
    return Intl.message(
      'Reload',
      name: 'reload',
      desc: '',
      args: [],
    );
  }

  /// `Okay`
  String get okay {
    return Intl.message(
      'Okay',
      name: 'okay',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `There is no data`
  String get there_is_no_data {
    return Intl.message(
      'There is no data',
      name: 'there_is_no_data',
      desc: '',
      args: [],
    );
  }

  /// `An error occured, please try again`
  String get an_error_occured_please_try_again {
    return Intl.message(
      'An error occured, please try again',
      name: 'an_error_occured_please_try_again',
      desc: '',
      args: [],
    );
  }

  /// `There was an error, please try again`
  String get there_was_an_error_please_try_again {
    return Intl.message(
      'There was an error, please try again',
      name: 'there_was_an_error_please_try_again',
      desc: '',
      args: [],
    );
  }

  /// `Showing cached data`
  String get showing_cached_data {
    return Intl.message(
      'Showing cached data',
      name: 'showing_cached_data',
      desc: '',
      args: [],
    );
  }

  /// `There are no popular movies`
  String get there_are_no_popular_movies {
    return Intl.message(
      'There are no popular movies',
      name: 'there_are_no_popular_movies',
      desc: '',
      args: [],
    );
  }

  /// `There are no favorites yet`
  String get there_are_no_favorites_yet {
    return Intl.message(
      'There are no favorites yet',
      name: 'there_are_no_favorites_yet',
      desc: '',
      args: [],
    );
  }

  /// `Favorites`
  String get favorites {
    return Intl.message(
      'Favorites',
      name: 'favorites',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Popular`
  String get popular {
    return Intl.message(
      'Popular',
      name: 'popular',
      desc: '',
      args: [],
    );
  }

  /// `There was a network error, please try again later`
  String get there_was_a_network_error_please_try_again_later {
    return Intl.message(
      'There was a network error, please try again later',
      name: 'there_was_a_network_error_please_try_again_later',
      desc: '',
      args: [],
    );
  }

  /// `There was a server error, please try again later`
  String get there_was_a_server_error_please_try_again_later {
    return Intl.message(
      'There was a server error, please try again later',
      name: 'there_was_a_server_error_please_try_again_later',
      desc: '',
      args: [],
    );
  }

  /// `There was a validation error, please fix and try again`
  String get there_was_a_validation_error_please_fix_and_try_again {
    return Intl.message(
      'There was a validation error, please fix and try again',
      name: 'there_was_a_validation_error_please_fix_and_try_again',
      desc: '',
      args: [],
    );
  }

  /// `There was an error`
  String get there_was_an_error {
    return Intl.message(
      'There was an error',
      name: 'there_was_an_error',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
