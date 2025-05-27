import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @kinia_name.
  ///
  /// In en, this message translates to:
  /// **'Kenya'**
  String get kinia_name;

  /// No description provided for @smoal_name.
  ///
  /// In en, this message translates to:
  /// **'Somal'**
  String get smoal_name;

  /// No description provided for @tanzania.
  ///
  /// In en, this message translates to:
  /// **'Tanzania'**
  String get tanzania;

  /// No description provided for @home_title.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home_title;

  /// No description provided for @add_order.
  ///
  /// In en, this message translates to:
  /// **'Add order'**
  String get add_order;

  /// No description provided for @order_place.
  ///
  /// In en, this message translates to:
  /// **'Place'**
  String get order_place;

  /// No description provided for @order_id.
  ///
  /// In en, this message translates to:
  /// **'Order Id'**
  String get order_id;

  /// No description provided for @client_id.
  ///
  /// In en, this message translates to:
  /// **'Client id'**
  String get client_id;

  /// No description provided for @enter_order_id.
  ///
  /// In en, this message translates to:
  /// **'Add order ID'**
  String get enter_order_id;

  /// No description provided for @place_hint.
  ///
  /// In en, this message translates to:
  /// **'Village/mosque/school'**
  String get place_hint;

  /// No description provided for @add_video.
  ///
  /// In en, this message translates to:
  /// **'Add video'**
  String get add_video;

  /// No description provided for @add_picure.
  ///
  /// In en, this message translates to:
  /// **'Add picure'**
  String get add_picure;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'loading.....'**
  String get loading;

  /// No description provided for @changeLanguage.
  ///
  /// In en, this message translates to:
  /// **'Change Language'**
  String get changeLanguage;

  /// No description provided for @login_text.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login_text;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @email_hint.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email_hint;

  /// No description provided for @password_hint.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password_hint;

  /// No description provided for @remember_me.
  ///
  /// In en, this message translates to:
  /// **'Remember me'**
  String get remember_me;

  /// No description provided for @log_out.
  ///
  /// In en, this message translates to:
  /// **'LogOut'**
  String get log_out;

  /// No description provided for @file_pick_failed.
  ///
  /// In en, this message translates to:
  /// **'File capture failed'**
  String get file_pick_failed;

  /// No description provided for @order_saving.
  ///
  /// In en, this message translates to:
  /// **'The order is being saved'**
  String get order_saving;

  /// No description provided for @order__is_sharing.
  ///
  /// In en, this message translates to:
  /// **'Sharing the order'**
  String get order__is_sharing;

  /// No description provided for @failed.
  ///
  /// In en, this message translates to:
  /// **'Failed'**
  String get failed;

  /// No description provided for @mubin.
  ///
  /// In en, this message translates to:
  /// **'mubin'**
  String get mubin;

  /// No description provided for @or.
  ///
  /// In en, this message translates to:
  /// **'or'**
  String get or;

  /// No description provided for @request_time_out.
  ///
  /// In en, this message translates to:
  /// **'request time out'**
  String get request_time_out;

  /// No description provided for @change_language.
  ///
  /// In en, this message translates to:
  /// **'Change Language'**
  String get change_language;

  /// No description provided for @arabic.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get arabic;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @order_added_successfully.
  ///
  /// In en, this message translates to:
  /// **'Order Added Successfully'**
  String get order_added_successfully;

  /// No description provided for @order_addition_failed.
  ///
  /// In en, this message translates to:
  /// **' Order Addition Failed'**
  String get order_addition_failed;

  /// No description provided for @successfully.
  ///
  /// In en, this message translates to:
  /// **'Successfully'**
  String get successfully;

  /// No description provided for @data_dont_saved.
  ///
  /// In en, this message translates to:
  /// **'\'Data was not uploaded, please try again\''**
  String get data_dont_saved;

  /// No description provided for @data_saved.
  ///
  /// In en, this message translates to:
  /// **'\'The data has been saved successfully\''**
  String get data_saved;

  /// No description provided for @order_id_exists.
  ///
  /// In en, this message translates to:
  /// **'\'The order ID exists, enter another ID\''**
  String get order_id_exists;

  /// No description provided for @select_files.
  ///
  /// In en, this message translates to:
  /// **'\'Select where you prefer to add files from\''**
  String get select_files;

  /// No description provided for @camera.
  ///
  /// In en, this message translates to:
  /// **'camera'**
  String get camera;

  /// No description provided for @gallery.
  ///
  /// In en, this message translates to:
  /// **'Gallery'**
  String get gallery;

  /// No description provided for @are_you_sure.
  ///
  /// In en, this message translates to:
  /// **'Are you sure?'**
  String get are_you_sure;

  /// No description provided for @cant_be_embty.
  ///
  /// In en, this message translates to:
  /// **'Can not be empty'**
  String get cant_be_embty;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @required.
  ///
  /// In en, this message translates to:
  /// **'Required'**
  String get required;

  /// No description provided for @please_enter_all_data.
  ///
  /// In en, this message translates to:
  /// **'Please enter all data'**
  String get please_enter_all_data;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'Ok'**
  String get ok;

  /// No description provided for @change.
  ///
  /// In en, this message translates to:
  /// **'Change'**
  String get change;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
