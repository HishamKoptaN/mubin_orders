// // GENERATED CODE - DO NOT MODIFY BY HAND
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'intl/messages_all.dart';

// // **************************************************************************
// // Generator: Flutter Intl IDE plugin
// // Made by Localizely
// // **************************************************************************

// // ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// // ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// // ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

// class S {
//   S();

//   static S? _current;

//   static S get current {
//     assert(_current != null,
//         'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
//     return _current!;
//   }

//   static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

//   static Future<S> load(Locale locale) {
//     final name = (locale.countryCode?.isEmpty ?? false)
//         ? locale.languageCode
//         : locale.toString();
//     final localeName = Intl.canonicalizedLocale(name);
//     return initializeMessages(localeName).then((_) {
//       Intl.defaultLocale = localeName;
//       final instance = S();
//       S._current = instance;

//       return instance;
//     });
//   }

//   static S of(BuildContext context) {
//     final instance = S.maybeOf(context);
//     assert(instance != null,
//         'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
//     return instance!;
//   }

//   static S? maybeOf(BuildContext context) {
//     return Localizations.of<S>(context, S);
//   }

// <<<<<<< HEAD
//   /// `The manager`
//   String get home_title {
//     return Intl.message(
//       'The manager',
// =======
//   /// `Home`
//   String get home_title {
//     return Intl.message(
//       'Home',
// >>>>>>> 2ce4355013ab2d5962ea1a6602f942dba833831a
//       name: 'home_title',
//       desc: '',
//       args: [],
//     );
//   }

// <<<<<<< HEAD
// =======
//   /// `Add order`
//   String get add_order {
//     return Intl.message(
//       'Add order',
//       name: 'add_order',
//       desc: '',
//       args: [],
//     );
//   }

// >>>>>>> 2ce4355013ab2d5962ea1a6602f942dba833831a
//   /// `Place`
//   String get order_place {
//     return Intl.message(
//       'Place',
//       name: 'order_place',
//       desc: '',
//       args: [],
//     );
//   }

//   /// `Order Id`
//   String get order_id {
//     return Intl.message(
//       'Order Id',
//       name: 'order_id',
//       desc: '',
//       args: [],
//     );
//   }

// <<<<<<< HEAD
//   /// `Kenya`
//   String get kinia_name {
//     return Intl.message(
//       'Kenya',
//       name: 'kinia_name',
// =======
//   /// `Add order ID`
//   String get enter_order_id {
//     return Intl.message(
//       'Add order ID',
//       name: 'enter_order_id',
// >>>>>>> 2ce4355013ab2d5962ea1a6602f942dba833831a
//       desc: '',
//       args: [],
//     );
//   }

// <<<<<<< HEAD
//   /// `Somal`
//   String get smoal_name {
//     return Intl.message(
//       'Somal',
//       name: 'smoal_name',
// =======
//   /// `Village/mosque/school`
//   String get place_hint {
//     return Intl.message(
//       'Village/mosque/school',
//       name: 'place_hint',
// >>>>>>> 2ce4355013ab2d5962ea1a6602f942dba833831a
//       desc: '',
//       args: [],
//     );
//   }

// <<<<<<< HEAD
//   /// `Tanzania`
//   String get tanzania {
//     return Intl.message(
//       'Tanzania',
//       name: 'tanzania',
// =======
//   /// `Add video`
//   String get add_video {
//     return Intl.message(
//       'Add video',
//       name: 'add_video',
//       desc: '',
//       args: [],
//     );
//   }

//   /// `Add picure`
//   String get add_picure {
//     return Intl.message(
//       'Add picure',
//       name: 'add_picure',
//       desc: '',
//       args: [],
//     );
//   }

//   /// `Add`
//   String get add {
//     return Intl.message(
//       'Add',
//       name: 'add',
//       desc: '',
//       args: [],
//     );
//   }

//   /// `loading.....`
//   String get loading {
//     return Intl.message(
//       'loading.....',
//       name: 'loading',
// >>>>>>> 2ce4355013ab2d5962ea1a6602f942dba833831a
//       desc: '',
//       args: [],
//     );
//   }

//   /// `Login`
//   String get login_text {
//     return Intl.message(
//       'Login',
//       name: 'login_text',
//       desc: '',
//       args: [],
//     );
//   }

//   /// `Login`
//   String get login {
//     return Intl.message(
//       'Login',
//       name: 'login',
//       desc: '',
//       args: [],
//     );
//   }

//   /// `Email`
//   String get email_hint {
//     return Intl.message(
//       'Email',
//       name: 'email_hint',
//       desc: '',
//       args: [],
//     );
//   }

//   /// `Password`
//   String get password_hint {
//     return Intl.message(
//       'Password',
//       name: 'password_hint',
//       desc: '',
//       args: [],
//     );
//   }

//   /// `Client Id`
//   String get client_id {
//     return Intl.message(
//       'Client Id',
//       name: 'client_id',
//       desc: '',
//       args: [],
//     );
//   }

//   /// `Remember me`
//   String get remember_me {
//     return Intl.message(
//       'Remember me',
//       name: 'remember_me',
//       desc: '',
//       args: [],
//     );
//   }

//   /// `Change`
//   String get change {
//     return Intl.message(
//       'Change',
//       name: 'change',
//       desc: '',
//       args: [],
//     );
//   }

//   /// `LogOut`
//   String get log_out {
//     return Intl.message(
//       'LogOut',
//       name: 'log_out',
//       desc: '',
//       args: [],
//     );
//   }
// <<<<<<< HEAD
// =======

//   /// `The request is being saved`
//   String get request_saving {
//     return Intl.message(
//       'The request is being saved',
//       name: 'request_saving',
//       desc: '',
//       args: [],
//     );
//   }

//   /// `Sharing the request`
//   String get request_sharing {
//     return Intl.message(
//       'Sharing the request',
//       name: 'request_sharing',
//       desc: '',
//       args: [],
//     );
//   }

//   /// `Failed`
//   String get failed {
//     return Intl.message(
//       'Failed',
//       name: 'failed',
//       desc: '',
//       args: [],
//     );
//   }

//   /// `mubin`
//   String get mubin {
//     return Intl.message(
//       'mubin',
//       name: 'mubin',
//       desc: '',
//       args: [],
//     );
//   }

//   /// `or`
//   String get or {
//     return Intl.message(
//       'or',
//       name: 'or',
//       desc: '',
//       args: [],
//     );
//   }

//   /// `Change Language`
//   String get change_language {
//     return Intl.message(
//       'Change Language',
//       name: 'change_language',
//       desc: '',
//       args: [],
//     );
//   }

//   /// `Arabic`
//   String get arabic {
//     return Intl.message(
//       'Arabic',
//       name: 'arabic',
//       desc: '',
//       args: [],
//     );
//   }

//   /// `English`
//   String get english {
//     return Intl.message(
//       'English',
//       name: 'english',
//       desc: '',
//       args: [],
//     );
//   }

//   /// `Order Added Successfully`
//   String get order_added_successfully {
//     return Intl.message(
//       'Order Added Successfully',
//       name: 'order_added_successfully',
//       desc: '',
//       args: [],
//     );
//   }

//   /// ` Order Addition Failed`
//   String get order_addition_failed {
//     return Intl.message(
//       ' Order Addition Failed',
//       name: 'order_addition_failed',
//       desc: '',
//       args: [],
//     );
//   }

//   /// `Successfully`
//   String get successfully {
//     return Intl.message(
//       'Successfully',
//       name: 'successfully',
//       desc: '',
//       args: [],
//     );
//   }

//   /// `'Data was not uploaded, please try again'`
//   String get data_dont_saved {
//     return Intl.message(
//       '\'Data was not uploaded, please try again\'',
//       name: 'data_dont_saved',
//       desc: '',
//       args: [],
//     );
//   }

//   /// `'The data has been saved successfully'`
//   String get data_saved {
//     return Intl.message(
//       '\'The data has been saved successfully\'',
//       name: 'data_saved',
//       desc: '',
//       args: [],
//     );
//   }

//   /// `'The order ID exists, enter another ID'`
//   String get order_id_exists {
//     return Intl.message(
//       '\'The order ID exists, enter another ID\'',
//       name: 'order_id_exists',
//       desc: '',
//       args: [],
//     );
//   }

//   /// `'Select where you prefer to add files from'`
//   String get select_files {
//     return Intl.message(
//       '\'Select where you prefer to add files from\'',
//       name: 'select_files',
//       desc: '',
//       args: [],
//     );
//   }

//   /// `camera`
//   String get camera {
//     return Intl.message(
//       'camera',
//       name: 'camera',
//       desc: '',
//       args: [],
//     );
//   }

//   /// `Gallery`
//   String get gallery {
//     return Intl.message(
//       'Gallery',
//       name: 'gallery',
//       desc: '',
//       args: [],
//     );
//   }

//   /// `Are you sure?`
//   String get are_you_sure {
//     return Intl.message(
//       'Are you sure?',
//       name: 'are_you_sure',
//       desc: '',
//       args: [],
//     );
//   }

//   /// `Can not be empty`
//   String get cant_be_embty {
//     return Intl.message(
//       'Can not be empty',
//       name: 'cant_be_embty',
//       desc: '',
//       args: [],
//     );
//   }

//   /// `Close`
//   String get close {
//     return Intl.message(
//       'Close',
//       name: 'close',
//       desc: '',
//       args: [],
//     );
//   }

//   /// `Required`
//   String get required {
//     return Intl.message(
//       'Required',
//       name: 'required',
//       desc: '',
//       args: [],
//     );
//   }

//   /// `Please enter all data`
//   String get please_enter_all_data {
//     return Intl.message(
//       'Please enter all data',
//       name: 'please_enter_all_data',
//       desc: '',
//       args: [],
//     );
//   }

//   /// `Ok`
//   String get ok {
//     return Intl.message(
//       'Ok',
//       name: 'ok',
//       desc: '',
//       args: [],
//     );
//   }
// >>>>>>> 2ce4355013ab2d5962ea1a6602f942dba833831a
// }

// class AppLocalizationDelegate extends LocalizationsDelegate<S> {
//   const AppLocalizationDelegate();

//   List<Locale> get supportedLocales {
//     return const <Locale>[
//       Locale.fromSubtags(languageCode: 'en'),
//       Locale.fromSubtags(languageCode: 'ar'),
//     ];
//   }

//   @override
//   bool isSupported(Locale locale) => _isSupported(locale);
//   @override
//   Future<S> load(Locale locale) => S.load(locale);
//   @override
//   bool shouldReload(AppLocalizationDelegate old) => false;

//   bool _isSupported(Locale locale) {
//     for (var supportedLocale in supportedLocales) {
//       if (supportedLocale.languageCode == locale.languageCode) {
//         return true;
//       }
//     }
//     return false;
//   }
// }
