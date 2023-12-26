import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['ar', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? arText = '',
    String? enText = '',
  }) =>
      [arText, enText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // SplashPage
  {
    'kbecabcu': {
      'ar': 'semicolon',
      'en': 'semicolon',
    },
    'nob3b87s': {
      'ar': 'ابدا',
      'en': 'start',
    },
    'l5q7y1li': {
      'ar': 'Home',
      'en': '',
    },
  },
  // chooseLangPage
  {
    'fo0bdo2r': {
      'ar': 'اختر اللغة المستخدمة  ',
      'en': '',
    },
    '95ibfu9p': {
      'ar': 'العربية',
      'en': 'العربية',
    },
    'y198687e': {
      'ar': 'English',
      'en': 'English',
    },
    'f78xqnso': {
      'ar': 'Home',
      'en': '',
    },
  },
  // fristPage
  {
    'zji8bcjn': {
      'ar': 'Semicolon ',
      'en': 'Semicolon ',
    },
    'ajgwma2t': {
      'ar': 'مرحبا بك في ',
      'en': 'Welcome in ',
    },
    'uexdi1bo': {
      'ar': 'تسجيل دخول',
      'en': 'sign in',
    },
    'y63xrr5l': {
      'ar': 'انشاء حساب',
      'en': 'sign up',
    },
    'v8yu0goc': {
      'ar': 'Home',
      'en': '',
    },
  },
  // settingPage
  {
    '619kmvp7': {
      'ar': 'Button',
      'en': '',
    },
    'hj9mivxn': {
      'ar': 'المعلومات الشخصية ',
      'en': 'Personal Information ',
    },
    'a3gewaxk': {
      'ar': 'Button',
      'en': '',
    },
    'uwzjga2t': {
      'ar': 'تغير كلمة المرور',
      'en': 'Change Password ',
    },
    'vbf3s7b8': {
      'ar': 'English ',
      'en': 'English ',
    },
    '5ki4k8o9': {
      'ar': 'العربية',
      'en': 'العربية',
    },
    '1h03da8z': {
      'ar': 'لغة التطبيق',
      'en': 'App Language ',
    },
    'fkv9jpuk': {
      'ar': 'غامق',
      'en': 'dark',
    },
    'ro1mz6ue': {
      'ar': 'فاتح',
      'en': 'Light ',
    },
    'qcr3scbf': {
      'ar': 'مظهر التطبيق',
      'en': 'App Appearance ',
    },
    'lrhsdwrb': {
      'ar': 'Button',
      'en': '',
    },
    '6fwpqxvb': {
      'ar': 'حذف الحساب ',
      'en': 'Delete Account',
    },
    'xv7n3c6x': {
      'ar': 'تسجيل الخروج ',
      'en': 'Sign out',
    },
    '8569bhhn': {
      'ar': 'الاعدادات',
      'en': 'Settings',
    },
    'xt0xpxgd': {
      'ar': 'Home',
      'en': '',
    },
  },
  // changePasswordArabicPage
  {
    'lsa9pjvg': {
      'ar': ':كلمة المرور الحالية',
      'en': 'current password:',
    },
    '194r3870': {
      'ar': 'ادخل كلمة المرور الحالية...',
      'en': 'Enter your current password...',
    },
    'w5yh7u20': {
      'ar': ':كلمة المرور الجديدة',
      'en': 'new password:',
    },
    'te3jbqwh': {
      'ar': 'ادخل كلمة المرور الجديدة...',
      'en': 'Enter your new password...',
    },
    'jg6hg55a': {
      'ar':
          'يجب أن تحتوي على 8 أحروف باللغة الإنجليزية-\nيجب أن تحتوي على حرف واحد كبير على الأقل-\nيجب أن تحتوي على حرف واحد صغير على الأقل-\nيجب أن تحتوي على رقم واحد على الأقل-',
      'en':
          'It must be at least 8 English letters\n* It must contain at least one capital letter\n* It must contain at least one lowercase letter\n* It must contain at least one number',
    },
    'y12u6ib1': {
      'ar': ':تأكيد كلمة المرور الجديدة',
      'en': 'confirm the new password:',
    },
    '2lpdauqq': {
      'ar': 'اعِد كتابة كلمة المرور الجديدة... ',
      'en': 'Enter your password again...',
    },
    '15zsga66': {
      'ar': 'حفظ التغييرات',
      'en': 'Save Changes',
    },
    '2mgbehhn': {
      'ar': 'هذا الحقل مطلوب',
      'en': 'Field is required',
    },
    'nhddplj3': {
      'ar': 'يجب أن لا يقل عن 8 أحرف',
      'en': 'Should be at least 8 characters',
    },
    'jk7jjq2u': {
      'ar': 'كلمة المرور غير صحيحة ',
      'en': 'your password is not correct',
    },
    'i89yq1k8': {
      'ar': 'Please choose an option from the dropdown',
      'en': '',
    },
    'e19m62r7': {
      'ar': 'هذا الحقل مطلوب',
      'en': 'Field is required',
    },
    'e9w38yq9': {
      'ar': 'يجب أن لا يقل عن 8 أحرف',
      'en': 'Should be at least 8 characters',
    },
    'yfqpy1d2': {
      'ar': 'Please choose an option from the dropdown',
      'en': '',
    },
    'qluzcr4i': {
      'ar': 'هذا الحقل مطلوب ',
      'en': 'Field is required',
    },
    'nl2qhsel': {
      'ar': 'يجب أن لا يقل عن 8 أحرف',
      'en': 'Should be at least 8 characters',
    },
    'tc0y2a8a': {
      'ar': 'كلمة المرور غير متطابقة ',
      'en': 'your password don\'t match',
    },
    'xuf7wbc9': {
      'ar': 'Please choose an option from the dropdown',
      'en': '',
    },
    'ak4bn3d8': {
      'ar': 'الرجوع',
      'en': 'Back',
    },
    '4ldhzjlw': {
      'ar': 'تغير كلمة المرور',
      'en': 'Change password ',
    },
    'ulse5grl': {
      'ar': 'Home',
      'en': '',
    },
  },
  // changePasswordEnglishPage
  {
    'qgjy463v': {
      'ar': 'current password:',
      'en': '',
    },
    'ea1pl9cm': {
      'ar': 'Enter your current password...',
      'en': '',
    },
    'tl5rtnrn': {
      'ar': 'new password:',
      'en': '',
    },
    'ufm19xz0': {
      'ar': 'Enter your new password...',
      'en': '',
    },
    '5jgoinpf': {
      'ar':
          '* It must be at least 8 English letters\n* It must contain at least one capital letter\n* It must contain at least one lowercase letter\n* It must contain at least one number',
      'en': '',
    },
    'j73yqrfc': {
      'ar': 'confirm the new password:',
      'en': '',
    },
    'ydr6e0x1': {
      'ar': 'Enter your password again...',
      'en': '',
    },
    '5ots6kcp': {
      'ar': 'Save Changes',
      'en': '',
    },
    'habxesz6': {
      'ar': 'Field is required',
      'en': '',
    },
    '4saoapl6': {
      'ar': 'Should be at least 8 characters',
      'en': '',
    },
    'izxnkhs2': {
      'ar': 'your password is not correct',
      'en': '',
    },
    'l4gs8ph8': {
      'ar': 'Please choose an option from the dropdown',
      'en': '',
    },
    'q56gzqjq': {
      'ar': 'Field is required',
      'en': '',
    },
    'uy6ae594': {
      'ar': 'Should be at least 8 characters',
      'en': '',
    },
    '4y8duhe8': {
      'ar': 'Please choose an option from the dropdown',
      'en': '',
    },
    'jphqgkyb': {
      'ar': 'Field is required',
      'en': '',
    },
    'dzo6o0yg': {
      'ar': 'Should be at least 8 characters',
      'en': '',
    },
    '9w9klmrq': {
      'ar': 'your password don\'t match',
      'en': '',
    },
    'c3v3lofn': {
      'ar': 'Please choose an option from the dropdown',
      'en': '',
    },
    'njw9f76l': {
      'ar': 'Back',
      'en': '',
    },
    '5rermth1': {
      'ar': 'Change password ',
      'en': '',
    },
    'y3v3jvov': {
      'ar': 'Home',
      'en': '',
    },
  },
  // Assignments_interface_english
  {
    '0hxq3xta': {
      'ar': 'Back',
      'en': '',
    },
    'b0auu89y': {
      'ar': 'Assignments',
      'en': '',
    },
    '1qeg47tc': {
      'ar': 'To do',
      'en': '',
    },
    'qseie8r5': {
      'ar': 'Done',
      'en': '',
    },
    'wrrinrsa': {
      'ar': 'Grades',
      'en': '',
    },
    'wrwstu11': {
      'ar': 'Home',
      'en': '',
    },
  },
  // Assignments_interface_arabic
  {
    'u4hhooh7': {
      'ar': 'رجوع',
      'en': 'Back',
    },
    'dy4ixyar': {
      'ar': 'الواجبات',
      'en': 'Assignments',
    },
    '1xluwnij': {
      'ar': 'Button',
      'en': '',
    },
    'bacnc049': {
      'ar': 'للتنفيذ',
      'en': 'To do',
    },
    'g15tjio8': {
      'ar': 'Button',
      'en': '',
    },
    'rt87rgb6': {
      'ar': 'تم التنفيذ',
      'en': 'Done',
    },
    'sgk09m3x': {
      'ar': 'Button',
      'en': '',
    },
    'ppcwgdv9': {
      'ar': 'درجات',
      'en': 'Grades',
    },
    '7ofg8th8': {
      'ar': 'Home',
      'en': '',
    },
  },
  // SignInPage
  {
    'weq1ppyv': {
      'ar': 'اسم المستخدم او البريد الالكتروني',
      'en': 'Username or Email',
    },
    '6sljzkjb': {
      'ar': 'كلمة المرور',
      'en': 'Password',
    },
    'tmm56bqx': {
      'ar': 'هل نسيت كلمه المرور؟',
      'en': 'Forgot password?',
    },
    '2u65b9uz': {
      'ar': 'تسجيل الدخول',
      'en': 'sign in',
    },
    'k5z1c2xc': {
      'ar': 'انشئ حساب الان',
      'en': 'Sign up now',
    },
    'ffoeemde': {
      'ar': 'Semicolon  جديد في ',
      'en': 'New in Semicolon',
    },
    'c4hlc42f': {
      'ar': 'ادخل المطلوب',
      'en': 'Field is required',
    },
    'o7v4ky63': {
      'ar': 'Please choose an option from the dropdown',
      'en': '',
    },
    'spfdqkd8': {
      'ar': 'ادخل المطلوب',
      'en': 'Field is required',
    },
    'bbadievp': {
      'ar': 'Please choose an option from the dropdown',
      'en': '',
    },
    'nv3ccl0u': {
      'ar': 'الرجوع',
      'en': 'Back',
    },
    'peefvusk': {
      'ar': 'تسجيل الدخول ',
      'en': 'Sign in',
    },
    '3o7qmsoq': {
      'ar': 'Home',
      'en': '',
    },
  },
  // SignUpPage
  {
    'ga0bjgus': {
      'ar': 'الرجوع',
      'en': 'Back',
    },
    '4kt6ma33': {
      'ar': 'انشاء الحساب ',
      'en': 'Sign Up',
    },
    '2xx6kjav': {
      'ar': 'الاسم الكامل',
      'en': 'Full name',
    },
    'fn06ki1a': {
      'ar': 'اسم المستخدم ',
      'en': 'User name',
    },
    'om4cy8v1': {
      'ar': 'رقم الهاتف',
      'en': 'Mobile Number',
    },
    'aeiru621': {
      'ar': ' البريد الالكتروني',
      'en': 'Email ',
    },
    'piq5lb84': {
      'ar': 'كلمة المرور',
      'en': 'Password ',
    },
    'qloxfu8i': {
      'ar': 'كلمة المرور مرة اخرى',
      'en': 'Password Again',
    },
    'h4gxivo5': {
      'ar': 'انشاء الحساب',
      'en': 'SignUp',
    },
    'zirpufo7': {
      'ar': 'سجل دخولك ',
      'en': 'Sign in',
    },
    'lvg9bpte': {
      'ar': '؟ Semicolon لديك حساب في',
      'en': 'Have an account Semicolon ? ',
    },
    'fu3vfgv5': {
      'ar': 'ادخل المطلوب',
      'en': 'Field is required',
    },
    '2al5v5l2': {
      'ar': 'Please choose an option from the dropdown',
      'en': '',
    },
    'qp0e12gs': {
      'ar': 'ادخل المطلوب',
      'en': 'Field is required',
    },
    '0lemgwvr': {
      'ar':
          'يجب ان يحتوى على حروف انجليزيه كبيره  اوصغيره او ارقام او رمز- او_ فقط ',
      'en':
          'It must contain upper or lowercase English letters, numbers, or symbols - or _ only',
    },
    'kg86vlzt': {
      'ar': 'Please choose an option from the dropdown',
      'en': '',
    },
    'fber4q01': {
      'ar': 'ادخل المطلوب',
      'en': 'Field is required',
    },
    '5uo87fje': {
      'ar': 'يحتوى على عشر ارقام فقط',
      'en': 'It contains only ten digits ',
    },
    'zlimmtje': {
      'ar': 'Please choose an option from the dropdown',
      'en': '',
    },
    '82qer6yp': {
      'ar': 'ادخل المطلوب',
      'en': 'Field is required',
    },
    'jh7a9gm4': {
      'ar': 'ادخل الايميل بشكل صحيح ',
      'en': 'Enter your email correctly',
    },
    '4ycsbsks': {
      'ar': 'Please choose an option from the dropdown',
      'en': '',
    },
    'fhxqesl8': {
      'ar': 'ادخل المطلوب',
      'en': 'Field is required',
    },
    'zvdsmtix': {
      'ar': 'اقل طول هو ٨',
      'en': 'The minimum length is 8',
    },
    '1p2418q9': {
      'ar':
          'يحتوى على على الاقل على رقم و حرف واحد كبير وحرف واحد صغير ولا يحتوى على رموز',
      'en':
          'It contains at least one number, one uppercase letter, and one lowercase letter, and does not contain symbols',
    },
    'v053gk68': {
      'ar': 'Please choose an option from the dropdown',
      'en': '',
    },
    'ovm3bh2x': {
      'ar': 'ادخل المطلوب',
      'en': 'Field is required',
    },
    'aiga045e': {
      'ar': 'اقل طول هو ٨',
      'en': 'The minimum length is 8',
    },
    '86ug0rq7': {
      'ar': 'كلمة المرور غير متطابقة',
      'en': 'password does not match',
    },
    '4xz1zwjk': {
      'ar': 'Please choose an option from the dropdown',
      'en': '',
    },
    '28xmmbvg': {
      'ar': 'Home',
      'en': '',
    },
  },
  // ChangePassword
  {
    't77c89e2': {
      'ar': 'كلمة المرور الحالية:',
      'en': 'Current Password:',
    },
    'fmohem1l': {
      'ar': 'ادخل كلمة المرور الحالية...',
      'en': 'please enter your current password...',
    },
    '3l2c3yz3': {
      'ar': 'كلمة المرور الجديدة:',
      'en': 'New Password:',
    },
    'ibi630ju': {
      'ar': 'ادخل كلمة المرور الجديدة...',
      'en': 'please enter your new password...',
    },
    'zxi4wxl8': {
      'ar':
          '* أن لا يقل عن 8 احرف انجليزية\n* أن يحتوي على حرف كبير واحد على الاقل \n* أن يحتوي على حرف صغير واحد على الاقل\n* أن يحتوي على رقم واحد على الاقل',
      'en':
          '* It must be at least 8 English letters\n* It must contain at least one capital letter\n* It must contain at least one lowercase letter\n* It must contain at least one number',
    },
    'cbsrhudr': {
      'ar': 'تأكيد كلمة المرور الجديدة:',
      'en': 'Confirm The New Password:',
    },
    'ppylcnhp': {
      'ar': 'اعِد كتابة كلمة المرور الجديدة...',
      'en': 'please rewrite your new password...',
    },
    'snvm8xld': {
      'ar': 'حفظ التغييرات',
      'en': 'Save Changes',
    },
    '9pzqtu07': {
      'ar': 'هذا الحقل مطلوب',
      'en': 'Field is required',
    },
    '31hqff6m': {
      'ar': 'يجب أن لا يقل عن 8 احرف',
      'en': 'It must be at least 8 characters',
    },
    '2b6wx60g': {
      'ar': 'كلمة المرور غير صحيحة',
      'en': 'Your Password Is Wrong',
    },
    'wp9p0rr4': {
      'ar': 'Please choose an option from the dropdown',
      'en': '',
    },
    'as8xpxqg': {
      'ar': 'هذا الحقل مطلوب',
      'en': 'Field is required',
    },
    'av2bed3g': {
      'ar': 'يجب أن لا يقل عن 8 احرف',
      'en': 'It must be at least 8 characters ',
    },
    'fn7ujgxo': {
      'ar': 'Please choose an option from the dropdown',
      'en': '',
    },
    'mo3ysy22': {
      'ar': 'هذا الحقل مطلوب',
      'en': 'Field is required',
    },
    'xyu0toj8': {
      'ar': 'يجب أن لا يقل عن 8 احرف',
      'en': 'It must be at least 8 characters',
    },
    'n2avthxh': {
      'ar': 'كلمة المرور غير متطابقة ',
      'en': 'Your Password Does Not Match correctly',
    },
    'twka546v': {
      'ar': 'Please choose an option from the dropdown',
      'en': '',
    },
    '6esl5w3x': {
      'ar': 'الرجوع',
      'en': 'Back',
    },
    'kd3gy16r': {
      'ar': 'تغيير كلمة المرور',
      'en': 'Change Password',
    },
    'qs6dmfe3': {
      'ar': 'Home',
      'en': '',
    },
  },
  // forgotPassword
  {
    '9ur8nsv3': {
      'ar': ' البريد الالكتروني',
      'en': 'Email ',
    },
    'rrtg10ha': {
      'ar': 'ارسال',
      'en': 'send',
    },
    'jnv6jbmd': {
      'ar': 'ادخل المطلوب',
      'en': 'Field is required',
    },
    'nikglamv': {
      'ar': 'ادخل الايميل بشكل صحيح',
      'en': 'enter email correctly',
    },
    '3lqfe0yx': {
      'ar': 'Please choose an option from the dropdown',
      'en': '',
    },
    '8d0qye9i': {
      'ar': 'الرجوع ',
      'en': 'Back',
    },
    'pycyotvt': {
      'ar': 'نسيت كلمة السر ؟',
      'en': 'forget password ?',
    },
    '2mn2xsnz': {
      'ar': 'Home',
      'en': '',
    },
  },
  // Ass_page
  {
    '4rthf2v2': {
      'ar': 'السؤال:اكتب برنامج لإيجاد مربع العدد 3.9',
      'en': 'Question:Write a program to find the\n square of the number 3.9',
    },
    'ue68gwge': {
      'ar': 'الجواب:',
      'en': 'The answer',
    },
    'csd6kqpj': {
      'ar': 'الاجابة هنا...',
      'en': 'Enter your answer here....',
    },
    '1bs5p3ed': {
      'ar': 'هنا',
      'en': 'Here',
    },
    'dzs7qmqd': {
      'ar': 'تسليم',
      'en': 'Submission',
    },
    'ejhuij7u': {
      'ar': 'رجوع',
      'en': 'Back',
    },
    '55x5ogp2': {
      'ar': 'الواجب',
      'en': 'The assignment',
    },
    'd7fuuc1z': {
      'ar': 'Home',
      'en': 'Home',
    },
  },
  // ChangePasswordPage
  {
    '49spnykm': {
      'ar': 'كلمة المرور الحالية:',
      'en': 'Current Password:',
    },
    'vl540f0s': {
      'ar': 'ادخل كلمة المرور الحالية...',
      'en': 'please enter your current password...',
    },
    'r2os09nt': {
      'ar': 'كلمة المرور الجديدة:',
      'en': 'New Password:',
    },
    'd8vpo5qx': {
      'ar': 'ادخل كلمة المرور الجديدة...',
      'en': 'please enter your new password...',
    },
    'px2wep7i': {
      'ar': '* أن لا يقل عن 8 احرف انجليزية',
      'en': '* It must be at least 8 English letters',
    },
    '22mkvd96': {
      'ar': '* أن يحتوي على حرف كبير واحد على الاقل ',
      'en': '* It must contain at least one capital letter',
    },
    '2x655sw1': {
      'ar': '* أن يحتوي على حرف صغير واحد على الاقل',
      'en': '* It must contain at least one lowercase letter',
    },
    '83t8ddh5': {
      'ar': '* أن يحتوي على رقم واحد على الاقل',
      'en': '* It must contain at least one number',
    },
    'ytp0umub': {
      'ar': 'تأكيد كلمة المرور الجديدة:',
      'en': 'Confirm The New Password:',
    },
    '6w307sth': {
      'ar': 'اعِد كتابة كلمة المرور الجديدة...',
      'en': 'please rewrite your new password...',
    },
    'c7v7ua3j': {
      'ar': 'حفظ التغييرات',
      'en': 'Save Changes',
    },
    'sxvuqkj4': {
      'ar': 'هذا الحقل مطلوب',
      'en': 'Field is required...',
    },
    's3dgjyjb': {
      'ar': 'يجب ان لا يقل عن 8 احرف',
      'en': 'It must be at least 8 characters',
    },
    'zzhde7tj': {
      'ar': 'كلمة المرور غير صحيحة',
      'en': 'Password is NOT correct',
    },
    'm27y2cj9': {
      'ar': 'Please choose an option from the dropdown',
      'en': '',
    },
    'clh3k4oh': {
      'ar': 'هذا الحقل مطلوب',
      'en': 'Field required...',
    },
    'a27vzool': {
      'ar': 'يجب ان لايقل عن 8 احرف ',
      'en': 'It must be at least 8 characters',
    },
    'p51uhlcr': {
      'ar': 'Please choose an option from the dropdown',
      'en': '',
    },
    '5lwmtbd5': {
      'ar': 'هذا الحقل مطلوب',
      'en': 'field required...',
    },
    'ra2qerih': {
      'ar': 'يجب ان لا يقل عن 8 احرف ',
      'en': 'It must be at least 8 characters',
    },
    'euakkc4o': {
      'ar': 'كلمة المرور غير متطابقة',
      'en': 'Password does NOT match',
    },
    'ba68gwqx': {
      'ar': 'Please choose an option from the dropdown',
      'en': '',
    },
    '3tgayejf': {
      'ar': 'الرجوع',
      'en': 'Back',
    },
    '3o8sdf8c': {
      'ar': 'تغيير كلمة المرور',
      'en': 'Change Password',
    },
    'uptchsaw': {
      'ar': 'الصفحة الرئيسية',
      'en': 'Home',
    },
  },
  // Introductiontojavaquizes
  {
    'czpr1pqa': {
      'ar': 'الرجوع',
      'en': 'Back',
    },
    'fxymmtoj': {
      'ar': 'Introduction to java quizes',
      'en': 'Introduction to java quizes',
    },
    't35mq2x5': {
      'ar': 'Home',
      'en': '',
    },
  },
  // DataTypequizes
  {
    'ifcyyrbb': {
      'ar': 'الرجوع',
      'en': 'Back',
    },
    'ehtbm5tk': {
      'ar': 'Data type quizes',
      'en': 'Data type quizes',
    },
    'zeasfwjw': {
      'ar': 'Home',
      'en': '',
    },
  },
  // Stringquizes
  {
    'hoxuecmd': {
      'ar': 'الرجوع',
      'en': 'Back',
    },
    'oj105v45': {
      'ar': 'String quizes',
      'en': 'String quizes',
    },
    'pwcvj8u6': {
      'ar': 'Home',
      'en': '',
    },
  },
  // Arrayquizes
  {
    'iclz0h22': {
      'ar': 'الرجوع',
      'en': 'Back',
    },
    'usyvgu6d': {
      'ar': 'Array quizes',
      'en': 'Array quizes',
    },
    'oiq5814n': {
      'ar': 'Home',
      'en': '',
    },
  },
  // ifElseStatmentquizes
  {
    '3ydr3wus': {
      'ar': 'الرجوع',
      'en': 'Back',
    },
    'co9vx4ys': {
      'ar': 'if else statment quize',
      'en': 'if else statment quize',
    },
    'hom8zlf7': {
      'ar': 'Home',
      'en': '',
    },
  },
  // InformationPage
  {
    '57ywvp3d': {
      'ar': 'الاسم الكامل',
      'en': 'Full name',
    },
    'wrbtw8y3': {
      'ar': 'اسم المستخدم ',
      'en': 'User name',
    },
    'eskaeytp': {
      'ar': 'رقم الهاتف',
      'en': 'Mobile Number',
    },
    'pmk8jt2k': {
      'ar': ' البريد الالكتروني',
      'en': 'Email ',
    },
    '3b6v7mrj': {
      'ar': 'تغيير ',
      'en': 'Change',
    },
    '3frb7crd': {
      'ar': 'Button',
      'en': '',
    },
    'ktsbnenk': {
      'ar': 'المعلومات الشخصية ',
      'en': 'Personal Information ',
    },
    'z5mtyyo5': {
      'ar': 'Home',
      'en': '',
    },
  },
  // ContentPage
  {
    'h2v7grm8': {
      'ar': 'مقالات',
      'en': 'article',
    },
    'aezcfwi1': {
      'ar': 'تم',
      'en': 'Done',
    },
    '5gibkwup': {
      'ar': 'مقاطع مرئية ',
      'en': 'video ',
    },
    'c1y02kc1': {
      'ar': 'واجبات',
      'en': 'Assignmemnts',
    },
    'ubflgnxd': {
      'ar': 'الجواب:',
      'en': 'The answer:',
    },
    'iogsptci': {
      'ar': 'الاجابة هنا...',
      'en': 'Enter your answer here....',
    },
    '7hj9hjmy': {
      'ar': 'تسليم',
      'en': 'Submission',
    },
    'xy5h3lpy': {
      'ar': 'الاختبارات',
      'en': 'quizzes ',
    },
    'w55u4q2d': {
      'ar': 'تسليم ',
      'en': '',
    },
    'i2mffsp2': {
      'ar': 'Back',
      'en': '',
    },
    'o6mu4dmk': {
      'ar': 'Home',
      'en': '',
    },
  },
  // CoursesPage
  {
    't2ahw1wu': {
      'ar': 'إختر الدورة لبدء التعلم',
      'en': 'Choose the course to Start learning ',
    },
    'lju5v8sy': {
      'ar': '',
      'en': '',
    },
    'st6ghdul': {
      'ar': 'Home',
      'en': '',
    },
  },
  // LessonPage
  {
    '5p0r0ph3': {
      'ar': 'الرجوع',
      'en': 'Back',
    },
    'i3m881xb': {
      'ar': '',
      'en': '',
    },
    'zndzlk74': {
      'ar': 'Home',
      'en': '',
    },
  },
  // DeleteAccount
  {
    'dpt1czy9': {
      'ar':
          'سيؤدي حذف حسابك إلى إزالة جميع \n       معلوماتك من قاعدة بياناتنا',
      'en':
          'Deleting your account will remove all\n       Your information from our database',
    },
    'af5b6oup': {
      'ar': 'حذف الحساب',
      'en': 'delete account',
    },
    '5aahe6nk': {
      'ar': 'حذف الحساب',
      'en': 'delete account',
    },
    'wz6z4eya': {
      'ar': 'Home',
      'en': '',
    },
  },
  // changePasswordPageSecsses
  {
    'gr2nx0ts': {
      'ar': 'كلمة المرور الحالية:',
      'en': 'current  password:',
    },
    'kvtr1u5w': {
      'ar': 'ادخل كلمة المرور الحالية...',
      'en': 'please enter your current password...',
    },
    'usm10yl1': {
      'ar': 'كلمة المرور الجديدة:',
      'en': 'New Password:',
    },
    '40eyxvip': {
      'ar': 'ادخل كلمة المرور الجديدة...',
      'en': 'please enter your new password...',
    },
    '2zidawm2': {
      'ar':
          '* أن لا يقل عن 8 احرف انجليزية\n* أن يحتوي على حرف كبير واحد على الاقل\n* أن يحتوي على حرف صغير واحد على الاقل\n* أن يحتوي على رقم واحد على الاقل',
      'en':
          '* It must be at least 8 English letters\n* It must contain at least one capital letter\n* It must contain at least one lowercase letter\n* It must contain at least one number',
    },
    'qokrla20': {
      'ar': 'تأكيد كلمة المرور الجديدة:',
      'en': 'Confirm The New Password:',
    },
    'g2fqjhhg': {
      'ar': 'اعِد كتابة كلمة المرور الجديدة...',
      'en': 'please rewrite your new password...',
    },
    'lmfv7bvx': {
      'ar': 'حفظ التغييرات',
      'en': 'Save Changes',
    },
    'jjw11twx': {
      'ar': 'ادخل المطلوب',
      'en': '',
    },
    '4hgc8kwr': {
      'ar': 'Please choose an option from the dropdown',
      'en': '',
    },
    'gu1uuh69': {
      'ar': 'ادخل المطلوب',
      'en': '',
    },
    'ub0d2iar': {
      'ar': 'اقل طول هو ٨',
      'en': '',
    },
    '8m5p7eni': {
      'ar':
          'يحتوى على على الاقل على رقم و حرف واحد كبير وحرف واحد صغير ولا يحتوى على رموز',
      'en': '',
    },
    'zylixgmt': {
      'ar': 'Please choose an option from the dropdown',
      'en': '',
    },
    'nk7p5avx': {
      'ar': 'ادخل المطلوب',
      'en': '',
    },
    '81bhr5vu': {
      'ar': 'اقل طول هو ٨',
      'en': '',
    },
    'rsdi8hjm': {
      'ar': 'كلمة المرور غير مطابقة',
      'en': '',
    },
    'rm3o1ln0': {
      'ar': 'Please choose an option from the dropdown',
      'en': '',
    },
    'z5n5e7s6': {
      'ar': 'الرجوع',
      'en': 'back:',
    },
    'p1qxdlh7': {
      'ar': 'تغيير كلمة المرور',
      'en': 'Change password',
    },
    'x1s2no6j': {
      'ar': 'Home',
      'en': '',
    },
  },
  // Topics
  {
    'tz7piqgk': {
      'ar': 'Back',
      'en': '',
    },
    'gyx0quij': {
      'ar': 'Community',
      'en': '',
    },
    '48ijw0a0': {
      'ar': 'Home',
      'en': '',
    },
  },
  // posts
  {
    'yqidng2b': {
      'ar': 'Type something here...',
      'en': '',
    },
    'w0r7s52y': {
      'ar': 'SUBMIT',
      'en': '',
    },
    '2gzviond': {
      'ar': 'Back',
      'en': '',
    },
    'c8e0ztna': {
      'ar': '      posts',
      'en': '',
    },
    'gp7nxpfm': {
      'ar': 'Home',
      'en': '',
    },
  },
  // addTopic
  {
    'b5rmhg2g': {
      'ar': 'اسم الموضوع ',
      'en': 'name of topic ',
    },
    'oayo3o3a': {
      'ar': 'اسم التصنيف',
      'en': 'name of category ',
    },
    '9ak9tclb': {
      'ar': 'ارسال ',
      'en': 'send',
    },
    'w66bij2i': {
      'ar': 'Back',
      'en': '',
    },
    's5vbafly': {
      'ar': 'اضف موضوع ',
      'en': 'add topic',
    },
    '7xkgwrfo': {
      'ar': 'Home',
      'en': '',
    },
  },
  // searchpageTopic
  {
    'it9tc9ur': {
      'ar': 'Hello World',
      'en': '',
    },
    'o47knt7g': {
      'ar': 'Label here...',
      'en': '',
    },
    'rrjw9pq7': {
      'ar': '',
      'en': '',
    },
    'drvvcz96': {
      'ar': 'Back',
      'en': '',
    },
    '47us2nuw': {
      'ar': 'Page Title',
      'en': 'search ',
    },
    'p1tyg8dw': {
      'ar': 'Home',
      'en': '',
    },
  },
  // searchpage
  {
    '4ypsk41q': {
      'ar': 'Hello World',
      'en': '',
    },
    'w9x2z34a': {
      'ar': '',
      'en': '',
    },
    'bkblqdum': {
      'ar': 'مقالات ',
      'en': 'articles',
    },
    'ffg9bamj': {
      'ar': 'مقاطع مرئية',
      'en': 'videos',
    },
    '7b1wh8oa': {
      'ar': 'واجبات',
      'en': 'assignments ',
    },
    'mforgm7c': {
      'ar': 'Back',
      'en': '',
    },
    '47us2nuw': {
      'ar': 'البحث',
      'en': 'search ',
    },
    'z6qb45q0': {
      'ar': 'Home',
      'en': '',
    },
  },
  // QuizeWidget
  {
    '6kize9v4': {
      'ar': 'Option 1',
      'en': '',
    },
  },
  // Miscellaneous
  {
    'coz8lr9l': {
      'ar': '',
      'en': '',
    },
    'nllbygg6': {
      'ar': '',
      'en': '',
    },
    'ojksdf67': {
      'ar': '',
      'en': '',
    },
    'hi7tkelg': {
      'ar': '',
      'en': '',
    },
    'hjf7ejey': {
      'ar': '',
      'en': '',
    },
    'b0wan8qv': {
      'ar': '',
      'en': '',
    },
    '9aublljy': {
      'ar': '',
      'en': '',
    },
    'kc4r02vc': {
      'ar': '',
      'en': '',
    },
    'yo11ifv5': {
      'ar': '',
      'en': '',
    },
    '1jhdf7nz': {
      'ar': '',
      'en': '',
    },
    '2g0xldpf': {
      'ar': '',
      'en': '',
    },
    'we14hnj1': {
      'ar': '',
      'en': '',
    },
    'ghoig5f0': {
      'ar': '',
      'en': '',
    },
    'lxt9ljtq': {
      'ar': '',
      'en': '',
    },
    't9y5ms6p': {
      'ar': '',
      'en': '',
    },
    '40dckirh': {
      'ar': '',
      'en': '',
    },
    'ncrp75fk': {
      'ar': '',
      'en': '',
    },
    's2upbywe': {
      'ar': '',
      'en': '',
    },
    '381bsu83': {
      'ar': '',
      'en': '',
    },
    's09bafx6': {
      'ar': '',
      'en': '',
    },
    'xh70z2m4': {
      'ar': '',
      'en': '',
    },
    '7pmkotzg': {
      'ar': '',
      'en': '',
    },
    'eh53z3ub': {
      'ar': '',
      'en': '',
    },
    'jqfhgk5n': {
      'ar': '',
      'en': '',
    },
    'u8pzgohb': {
      'ar': '',
      'en': '',
    },
    '0non7uvn': {
      'ar': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
