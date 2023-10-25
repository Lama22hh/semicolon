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
      'en': '',
    },
    'y198687e': {
      'ar': 'English',
      'en': '',
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
    'hj9mivxn': {
      'ar': 'المعلومات الشخصية ',
      'en': 'Personal Information ',
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
  // tryit
  {
    'ifd71gsw': {
      'ar': 'مرحباً',
      'en': '',
    },
    '6kebprfw': {
      'ar': 'Back',
      'en': '',
    },
    'iusvv9p2': {
      'ar': 'Page Title',
      'en': '',
    },
    'aa3ssf3b': {
      'ar': 'Home',
      'en': '',
    },
  },
  // Quizzes_interface_english
  {
    'cgwnj0f0': {
      'ar': 'Back',
      'en': '',
    },
    'u68tvdwx': {
      'ar': 'Quizzes',
      'en': '',
    },
    'tgylnwiw': {
      'ar': 'To do',
      'en': '',
    },
    'wgmx60tl': {
      'ar': 'Done',
      'en': '',
    },
    'xg6d4zqd': {
      'ar': 'Grades',
      'en': '',
    },
    'peomlytx': {
      'ar': 'Home',
      'en': '',
    },
  },
  // Quizzes_interface_arabic
  {
    'pchzl3z6': {
      'ar': 'رجوع',
      'en': '',
    },
    'a5r91x3f': {
      'ar': 'الإختبارات',
      'en': '',
    },
    'g3t0bs21': {
      'ar': 'للتنفيذ',
      'en': '',
    },
    'kdyx7pm0': {
      'ar': 'تم التنفيذ',
      'en': '',
    },
    '04dwwrr1': {
      'ar': 'درجات',
      'en': '',
    },
    'cyh5wdb4': {
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
      'en': '',
    },
    'dy4ixyar': {
      'ar': 'الواجبات',
      'en': '',
    },
    'bacnc049': {
      'ar': 'للتنفيذ',
      'en': '',
    },
    'rt87rgb6': {
      'ar': 'تم التنفيذ',
      'en': '',
    },
    'ppcwgdv9': {
      'ar': 'درجات',
      'en': '',
    },
    '7ofg8th8': {
      'ar': 'Home',
      'en': '',
    },
  },
  // Java1Topics_english
  {
    'jb8r7mlg': {
      'ar': '1-Introduction to java',
      'en': '',
    },
    'pochaash': {
      'ar': '2-Data type',
      'en': '',
    },
    '6yzhassg': {
      'ar': '3-String',
      'en': '',
    },
    'h1bl6unl': {
      'ar': '4-Arrays',
      'en': '',
    },
    'uuvzig4j': {
      'ar': '5-If/else statement',
      'en': '',
    },
    'x2rts3zw': {
      'ar': '6-Loops',
      'en': '',
    },
    'kw9r6zp2': {
      'ar': 'Back',
      'en': '',
    },
    'coxrqwxn': {
      'ar': 'The topics',
      'en': '',
    },
    '7z6rgjih': {
      'ar': 'Home',
      'en': '',
    },
  },
  // Java1Topics_arabic
  {
    'il6b1i7o': {
      'ar': '1-Introduction to java',
      'en': '',
    },
    '43fdyt7h': {
      'ar': '2-Data type',
      'en': '',
    },
    'd5d3xhkw': {
      'ar': '3-String',
      'en': '',
    },
    'g254t4fn': {
      'ar': '4-Arrays',
      'en': '',
    },
    'd30tuysc': {
      'ar': '5-If/else statement',
      'en': '',
    },
    'o6dy2gqk': {
      'ar': '6-Loops',
      'en': '',
    },
    'edexu5s3': {
      'ar': 'رجوع',
      'en': 'Back',
    },
    '0f7uoqp1': {
      'ar': 'المواضيع',
      'en': '',
    },
    'ure7ny3u': {
      'ar': 'Home',
      'en': '',
    },
  },
  // subjectsSelection_english
  {
    'oo64v9kb': {
      'ar': 'Choose the course to Start learning ',
      'en': '',
    },
    '0ubvi3s4': {
      'ar': 'Course in Java 1',
      'en': '',
    },
    'gsl1qcvp': {
      'ar': 'Course in Java2',
      'en': '',
    },
    'kiyr6ges': {
      'ar': 'Course in data structures',
      'en': '',
    },
    'zxtmid9i': {
      'ar': 'Home',
      'en': '',
    },
  },
  // subjectsSelection_arabic
  {
    'a6785tu4': {
      'ar': 'إختر الدورة لبدء التعلم',
      'en': '',
    },
    'z5vvdztg': {
      'ar': 'دورة لتعلم جافا 1',
      'en': '',
    },
    'ti97c5db': {
      'ar': 'دورة لتعلم جافا 2',
      'en': '',
    },
    'u10p2025': {
      'ar': 'دورة لتعلم تراكيب بيانات',
      'en': '',
    },
    'on11emf2': {
      'ar': 'Home',
      'en': '',
    },
  },
  // VideoPage_english
  {
    'mncsql1e': {
      'ar': 'Videos',
      'en': '',
    },
    'qdszg5uo': {
      'ar': 'Continue watching',
      'en': '',
    },
    '6td20tiy': {
      'ar': 'back',
      'en': '',
    },
    '8mxt6q0f': {
      'ar': 'Videos',
      'en': '',
    },
    '1dp4uljt': {
      'ar': 'Home',
      'en': '',
    },
  },
  // VideoPage_arabic
  {
    'dxku2t7u': {
      'ar': 'المقاطع',
      'en': '',
    },
    'l9ktzby6': {
      'ar': 'متابعة المشاهدة',
      'en': '',
    },
    'btlasojv': {
      'ar': 'رجوع',
      'en': '',
    },
    'xn6m5snr': {
      'ar': 'المقاطع المرئية',
      'en': '',
    },
    'lg1u527i': {
      'ar': 'Home',
      'en': '',
    },
  },
  // articlePage_arabic
  {
    'lmpdm6yy': {
      'ar': 'رجوع',
      'en': '',
    },
    'annii5hd': {
      'ar': 'المقالات',
      'en': '',
    },
    'xt0s5vyc': {
      'ar': 'Home',
      'en': '',
    },
  },
  // articlePage_english
  {
    '3i0lv1hz': {
      'ar': 'back',
      'en': '',
    },
    'ta30l7j2': {
      'ar': 'Articles',
      'en': '',
    },
    'geh2j677': {
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
    'kg86vlzt': {
      'ar': 'Please choose an option from the dropdown',
      'en': '',
    },
    'fber4q01': {
      'ar': 'ادخل المطلوب',
      'en': 'Field is required',
    },
    'zlimmtje': {
      'ar': 'Please choose an option from the dropdown',
      'en': '',
    },
    '82qer6yp': {
      'ar': 'ادخل المطلوب',
      'en': 'Field is required',
    },
    '4ycsbsks': {
      'ar': 'Please choose an option from the dropdown',
      'en': '',
    },
    'fhxqesl8': {
      'ar': 'ادخل المطلوب',
      'en': 'Field is required',
    },
    'v053gk68': {
      'ar': 'Please choose an option from the dropdown',
      'en': '',
    },
    'ovm3bh2x': {
      'ar': 'ادخل المطلوب',
      'en': 'Field is required',
    },
    '86ug0rq7': {
      'ar': 'كلمة المرور غير متطابقة',
      'en': '',
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
    '6esl5w3x': {
      'ar': 'Back',
      'en': '',
    },
    'kd3gy16r': {
      'ar': 'Page Title',
      'en': '',
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
    'j6asps99': {
      'ar': 'ارسال',
      'en': '',
    },
    'kmt2074c': {
      'ar': 'Field is required',
      'en': '',
    },
    '30u3a4r7': {
      'ar': 'Please choose an option from the dropdown',
      'en': '',
    },
    'lbq4olyl': {
      'ar': 'Back',
      'en': '',
    },
    'akacogw6': {
      'ar': 'نسيت كلمة السر ؟',
      'en': '',
    },
    'scg98a1y': {
      'ar': 'Home',
      'en': '',
    },
  },
  // Miscellaneous
  {
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
