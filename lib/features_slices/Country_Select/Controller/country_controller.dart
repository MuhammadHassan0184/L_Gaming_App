import 'package:get/get.dart';

import '../Models/country_model.dart';

class CountryController extends GetxController {
  static const List<String> _screenUpdateIds = [
    'country_header',
    'country_categories',
    'country_grid',
  ];

  // ============================================================
  // CURRENT STATE
  // ============================================================

  String selectedCountry = 'Bangladesh';

  String selectedTopTab = 'Recommend';

  String selectedCategory = 'All';

  String searchQuery = '';

  // ============================================================
  // TOP TABS
  // ============================================================

  final List<String> topTabs = const ['Mine', 'Recommend', 'Hot'];

  // ============================================================
  // CATEGORY TABS
  // ============================================================

  final List<String> categories = const [
    'All',
    'Bangladesh',
    'Asia',
    'Europe',
    'America',
    'Oceania',
  ];

  // ============================================================
  // COUNTRIES
  // ============================================================

  final List<CountryModel> countries = const [
    CountryModel(name: 'Afghanistan', code: 'AF', region: 'Asia'),
    CountryModel(name: 'Albania', code: 'AL', region: 'Europe'),
    CountryModel(name: 'Algeria', code: 'DZ', region: 'Africa'),
    CountryModel(name: 'Andorra', code: 'AD', region: 'Europe'),
    CountryModel(name: 'Angola', code: 'AO', region: 'Africa'),
    CountryModel(name: 'Antigua and Barbuda', code: 'AG', region: 'America'),
    CountryModel(name: 'Argentina', code: 'AR', region: 'America', isHot: true),
    CountryModel(name: 'Armenia', code: 'AM', region: 'Asia'),
    CountryModel(name: 'Australia', code: 'AU', region: 'Oceania', isHot: true),
    CountryModel(name: 'Austria', code: 'AT', region: 'Europe'),
    CountryModel(name: 'Azerbaijan', code: 'AZ', region: 'Asia'),

    CountryModel(name: 'Bahamas', code: 'BS', region: 'America'),
    CountryModel(name: 'Bahrain', code: 'BH', region: 'Asia'),
    CountryModel(name: 'Bangladesh', code: 'BD', region: 'Asia', isHot: true),
    CountryModel(name: 'Barbados', code: 'BB', region: 'America'),
    CountryModel(name: 'Belarus', code: 'BY', region: 'Europe'),
    CountryModel(name: 'Belgium', code: 'BE', region: 'Europe'),
    CountryModel(name: 'Belize', code: 'BZ', region: 'America'),
    CountryModel(name: 'Benin', code: 'BJ', region: 'Africa'),
    CountryModel(name: 'Bhutan', code: 'BT', region: 'Asia'),
    CountryModel(name: 'Bolivia', code: 'BO', region: 'America'),
    CountryModel(name: 'Bosnia and Herzegovina', code: 'BA', region: 'Europe'),
    CountryModel(name: 'Botswana', code: 'BW', region: 'Africa'),
    CountryModel(name: 'Brazil', code: 'BR', region: 'America', isHot: true),
    CountryModel(name: 'Brunei', code: 'BN', region: 'Asia'),
    CountryModel(name: 'Bulgaria', code: 'BG', region: 'Europe'),
    CountryModel(name: 'Burkina Faso', code: 'BF', region: 'Africa'),
    CountryModel(name: 'Burundi', code: 'BI', region: 'Africa'),

    CountryModel(name: 'Cabo Verde', code: 'CV', region: 'Africa'),
    CountryModel(name: 'Cambodia', code: 'KH', region: 'Asia'),
    CountryModel(name: 'Cameroon', code: 'CM', region: 'Africa'),
    CountryModel(name: 'Canada', code: 'CA', region: 'America', isHot: true),
    CountryModel(
      name: 'Central African Republic',
      code: 'CF',
      region: 'Africa',
    ),
    CountryModel(name: 'Chad', code: 'TD', region: 'Africa'),
    CountryModel(name: 'Chile', code: 'CL', region: 'America'),
    CountryModel(name: 'China', code: 'CN', region: 'Asia', isHot: true),
    CountryModel(name: 'Colombia', code: 'CO', region: 'America'),
    CountryModel(name: 'Comoros', code: 'KM', region: 'Africa'),
    CountryModel(name: 'Congo', code: 'CG', region: 'Africa'),
    CountryModel(name: 'Costa Rica', code: 'CR', region: 'America'),
    CountryModel(name: 'Croatia', code: 'HR', region: 'Europe'),
    CountryModel(name: 'Cuba', code: 'CU', region: 'America'),
    CountryModel(name: 'Cyprus', code: 'CY', region: 'Europe'),
    CountryModel(name: 'Czechia', code: 'CZ', region: 'Europe'),

    CountryModel(
      name: 'Democratic Republic of the Congo',
      code: 'CD',
      region: 'Africa',
    ),
    CountryModel(name: 'Denmark', code: 'DK', region: 'Europe'),
    CountryModel(name: 'Djibouti', code: 'DJ', region: 'Africa'),
    CountryModel(name: 'Dominica', code: 'DM', region: 'America'),
    CountryModel(name: 'Dominican Republic', code: 'DO', region: 'America'),

    CountryModel(name: 'Ecuador', code: 'EC', region: 'America'),
    CountryModel(name: 'Egypt', code: 'EG', region: 'Africa'),
    CountryModel(name: 'El Salvador', code: 'SV', region: 'America'),
    CountryModel(name: 'Equatorial Guinea', code: 'GQ', region: 'Africa'),
    CountryModel(name: 'Eritrea', code: 'ER', region: 'Africa'),
    CountryModel(name: 'Estonia', code: 'EE', region: 'Europe'),
    CountryModel(name: 'Eswatini', code: 'SZ', region: 'Africa'),
    CountryModel(name: 'Ethiopia', code: 'ET', region: 'Africa'),

    CountryModel(name: 'Fiji', code: 'FJ', region: 'Oceania'),
    CountryModel(name: 'Finland', code: 'FI', region: 'Europe'),
    CountryModel(name: 'France', code: 'FR', region: 'Europe', isHot: true),

    CountryModel(name: 'Gabon', code: 'GA', region: 'Africa'),
    CountryModel(name: 'Gambia', code: 'GM', region: 'Africa'),
    CountryModel(name: 'Georgia', code: 'GE', region: 'Asia'),
    CountryModel(name: 'Germany', code: 'DE', region: 'Europe', isHot: true),
    CountryModel(name: 'Ghana', code: 'GH', region: 'Africa'),
    CountryModel(name: 'Greece', code: 'GR', region: 'Europe'),
    CountryModel(name: 'Grenada', code: 'GD', region: 'America'),
    CountryModel(name: 'Guatemala', code: 'GT', region: 'America'),
    CountryModel(name: 'Guinea', code: 'GN', region: 'Africa'),
    CountryModel(name: 'Guinea-Bissau', code: 'GW', region: 'Africa'),
    CountryModel(name: 'Guyana', code: 'GY', region: 'America'),

    CountryModel(name: 'Haiti', code: 'HT', region: 'America'),
    CountryModel(name: 'Honduras', code: 'HN', region: 'America'),
    CountryModel(name: 'Hungary', code: 'HU', region: 'Europe'),

    CountryModel(name: 'Iceland', code: 'IS', region: 'Europe'),
    CountryModel(name: 'India', code: 'IN', region: 'Asia', isHot: true),
    CountryModel(name: 'Indonesia', code: 'ID', region: 'Asia', isHot: true),
    CountryModel(name: 'Iran', code: 'IR', region: 'Asia'),
    CountryModel(name: 'Iraq', code: 'IQ', region: 'Asia'),
    CountryModel(name: 'Ireland', code: 'IE', region: 'Europe'),
    CountryModel(name: 'Israel', code: 'IL', region: 'Asia'),
    CountryModel(name: 'Italy', code: 'IT', region: 'Europe', isHot: true),
    CountryModel(name: 'Ivory Coast', code: 'CI', region: 'Africa'),

    CountryModel(name: 'Jamaica', code: 'JM', region: 'America'),
    CountryModel(name: 'Japan', code: 'JP', region: 'Asia', isHot: true),
    CountryModel(name: 'Jordan', code: 'JO', region: 'Asia'),

    CountryModel(name: 'Kazakhstan', code: 'KZ', region: 'Asia'),
    CountryModel(name: 'Kenya', code: 'KE', region: 'Africa'),
    CountryModel(name: 'Kiribati', code: 'KI', region: 'Oceania'),
    CountryModel(name: 'Kuwait', code: 'KW', region: 'Asia'),
    CountryModel(name: 'Kyrgyzstan', code: 'KG', region: 'Asia'),

    CountryModel(name: 'Laos', code: 'LA', region: 'Asia'),
    CountryModel(name: 'Latvia', code: 'LV', region: 'Europe'),
    CountryModel(name: 'Lebanon', code: 'LB', region: 'Asia'),
    CountryModel(name: 'Lesotho', code: 'LS', region: 'Africa'),
    CountryModel(name: 'Liberia', code: 'LR', region: 'Africa'),
    CountryModel(name: 'Libya', code: 'LY', region: 'Africa'),
    CountryModel(name: 'Liechtenstein', code: 'LI', region: 'Europe'),
    CountryModel(name: 'Lithuania', code: 'LT', region: 'Europe'),
    CountryModel(name: 'Luxembourg', code: 'LU', region: 'Europe'),

    CountryModel(name: 'Madagascar', code: 'MG', region: 'Africa'),
    CountryModel(name: 'Malawi', code: 'MW', region: 'Africa'),
    CountryModel(name: 'Malaysia', code: 'MY', region: 'Asia'),
    CountryModel(name: 'Maldives', code: 'MV', region: 'Asia'),
    CountryModel(name: 'Mali', code: 'ML', region: 'Africa'),
    CountryModel(name: 'Malta', code: 'MT', region: 'Europe'),
    CountryModel(name: 'Marshall Islands', code: 'MH', region: 'Oceania'),
    CountryModel(name: 'Mauritania', code: 'MR', region: 'Africa'),
    CountryModel(name: 'Mauritius', code: 'MU', region: 'Africa'),
    CountryModel(name: 'Mexico', code: 'MX', region: 'America', isHot: true),
    CountryModel(name: 'Micronesia', code: 'FM', region: 'Oceania'),
    CountryModel(name: 'Moldova', code: 'MD', region: 'Europe'),
    CountryModel(name: 'Monaco', code: 'MC', region: 'Europe'),
    CountryModel(name: 'Mongolia', code: 'MN', region: 'Asia'),
    CountryModel(name: 'Montenegro', code: 'ME', region: 'Europe'),
    CountryModel(name: 'Morocco', code: 'MA', region: 'Africa'),
    CountryModel(name: 'Mozambique', code: 'MZ', region: 'Africa'),
    CountryModel(name: 'Myanmar', code: 'MM', region: 'Asia'),

    CountryModel(name: 'Namibia', code: 'NA', region: 'Africa'),
    CountryModel(name: 'Nauru', code: 'NR', region: 'Oceania'),
    CountryModel(name: 'Nepal', code: 'NP', region: 'Asia'),
    CountryModel(name: 'Netherlands', code: 'NL', region: 'Europe'),
    CountryModel(name: 'New Zealand', code: 'NZ', region: 'Oceania'),
    CountryModel(name: 'Nicaragua', code: 'NI', region: 'America'),
    CountryModel(name: 'Niger', code: 'NE', region: 'Africa'),
    CountryModel(name: 'Nigeria', code: 'NG', region: 'Africa'),
    CountryModel(name: 'North Korea', code: 'KP', region: 'Asia'),
    CountryModel(name: 'North Macedonia', code: 'MK', region: 'Europe'),
    CountryModel(name: 'Norway', code: 'NO', region: 'Europe'),

    CountryModel(name: 'Oman', code: 'OM', region: 'Asia'),

    CountryModel(name: 'Pakistan', code: 'PK', region: 'Asia', isHot: true),
    CountryModel(name: 'Palau', code: 'PW', region: 'Oceania'),
    CountryModel(name: 'Palestine', code: 'PS', region: 'Asia'),
    CountryModel(name: 'Panama', code: 'PA', region: 'America'),
    CountryModel(name: 'Papua New Guinea', code: 'PG', region: 'Oceania'),
    CountryModel(name: 'Paraguay', code: 'PY', region: 'America'),
    CountryModel(name: 'Peru', code: 'PE', region: 'America'),
    CountryModel(name: 'Philippines', code: 'PH', region: 'Asia', isHot: true),
    CountryModel(name: 'Poland', code: 'PL', region: 'Europe'),
    CountryModel(name: 'Portugal', code: 'PT', region: 'Europe'),

    CountryModel(name: 'Qatar', code: 'QA', region: 'Asia'),

    CountryModel(name: 'Romania', code: 'RO', region: 'Europe'),
    CountryModel(name: 'Russia', code: 'RU', region: 'Europe', isHot: true),
    CountryModel(name: 'Rwanda', code: 'RW', region: 'Africa'),

    CountryModel(name: 'Saint Kitts and Nevis', code: 'KN', region: 'America'),
    CountryModel(name: 'Saint Lucia', code: 'LC', region: 'America'),
    CountryModel(
      name: 'Saint Vincent and the Grenadines',
      code: 'VC',
      region: 'America',
    ),
    CountryModel(name: 'Samoa', code: 'WS', region: 'Oceania'),
    CountryModel(name: 'San Marino', code: 'SM', region: 'Europe'),
    CountryModel(name: 'Sao Tome and Principe', code: 'ST', region: 'Africa'),
    CountryModel(name: 'Saudi Arabia', code: 'SA', region: 'Asia'),
    CountryModel(name: 'Senegal', code: 'SN', region: 'Africa'),
    CountryModel(name: 'Serbia', code: 'RS', region: 'Europe'),
    CountryModel(name: 'Seychelles', code: 'SC', region: 'Africa'),
    CountryModel(name: 'Sierra Leone', code: 'SL', region: 'Africa'),
    CountryModel(name: 'Singapore', code: 'SG', region: 'Asia', isHot: true),
    CountryModel(name: 'Slovakia', code: 'SK', region: 'Europe'),
    CountryModel(name: 'Slovenia', code: 'SI', region: 'Europe'),
    CountryModel(name: 'Solomon Islands', code: 'SB', region: 'Oceania'),
    CountryModel(name: 'Somalia', code: 'SO', region: 'Africa'),
    CountryModel(name: 'South Africa', code: 'ZA', region: 'Africa'),
    CountryModel(name: 'South Korea', code: 'KR', region: 'Asia', isHot: true),
    CountryModel(name: 'South Sudan', code: 'SS', region: 'Africa'),
    CountryModel(name: 'Spain', code: 'ES', region: 'Europe', isHot: true),
    CountryModel(name: 'Sri Lanka', code: 'LK', region: 'Asia'),
    CountryModel(name: 'Sudan', code: 'SD', region: 'Africa'),
    CountryModel(name: 'Suriname', code: 'SR', region: 'America'),
    CountryModel(name: 'Sweden', code: 'SE', region: 'Europe'),
    CountryModel(name: 'Switzerland', code: 'CH', region: 'Europe'),
    CountryModel(name: 'Syria', code: 'SY', region: 'Asia'),

    CountryModel(name: 'Taiwan', code: 'TW', region: 'Asia'),
    CountryModel(name: 'Tajikistan', code: 'TJ', region: 'Asia'),
    CountryModel(name: 'Tanzania', code: 'TZ', region: 'Africa'),
    CountryModel(name: 'Thailand', code: 'TH', region: 'Asia', isHot: true),
    CountryModel(name: 'Timor-Leste', code: 'TL', region: 'Asia'),
    CountryModel(name: 'Togo', code: 'TG', region: 'Africa'),
    CountryModel(name: 'Tonga', code: 'TO', region: 'Oceania'),
    CountryModel(name: 'Trinidad and Tobago', code: 'TT', region: 'America'),
    CountryModel(name: 'Tunisia', code: 'TN', region: 'Africa'),
    CountryModel(name: 'Turkey', code: 'TR', region: 'Asia'),
    CountryModel(name: 'Turkmenistan', code: 'TM', region: 'Asia'),
    CountryModel(name: 'Tuvalu', code: 'TV', region: 'Oceania'),

    CountryModel(name: 'Uganda', code: 'UG', region: 'Africa'),
    CountryModel(name: 'Ukraine', code: 'UA', region: 'Europe'),
    CountryModel(
      name: 'United Arab Emirates',
      code: 'AE',
      region: 'Asia',
      isHot: true,
    ),
    CountryModel(
      name: 'United Kingdom',
      code: 'GB',
      region: 'Europe',
      isHot: true,
    ),
    CountryModel(
      name: 'United States',
      code: 'US',
      region: 'America',
      isHot: true,
    ),
    CountryModel(name: 'Uruguay', code: 'UY', region: 'America'),
    CountryModel(name: 'Uzbekistan', code: 'UZ', region: 'Asia'),

    CountryModel(name: 'Vanuatu', code: 'VU', region: 'Oceania'),
    CountryModel(name: 'Vatican City', code: 'VA', region: 'Europe'),
    CountryModel(name: 'Venezuela', code: 'VE', region: 'America'),
    CountryModel(name: 'Vietnam', code: 'VN', region: 'Asia', isHot: true),

    CountryModel(name: 'Yemen', code: 'YE', region: 'Asia'),

    CountryModel(name: 'Zambia', code: 'ZM', region: 'Africa'),
    CountryModel(name: 'Zimbabwe', code: 'ZW', region: 'Africa'),
  ];

  // ============================================================
  // FILTERED COUNTRIES
  // ============================================================

  List<CountryModel> get filteredCountries {
    Iterable<CountryModel> result = countries;

    // ----------------------------------------------------------
    // TOP TAB
    // ----------------------------------------------------------

    if (selectedTopTab == 'Mine') {
      result = result.where((country) => country.name == selectedCountry);
    }

    if (selectedTopTab == 'Hot') {
      result = result.where((country) => country.isHot);
    }

    // ----------------------------------------------------------
    // CATEGORY
    // ----------------------------------------------------------

    if (selectedCategory == 'Bangladesh') {
      result = result.where((country) => country.name == 'Bangladesh');
    } else if (selectedCategory != 'All') {
      result = result.where((country) => country.region == selectedCategory);
    }

    // ----------------------------------------------------------
    // SEARCH
    // ----------------------------------------------------------

    if (searchQuery.trim().isNotEmpty) {
      final query = searchQuery.trim().toLowerCase();

      result = result.where(
        (country) => country.name.toLowerCase().contains(query),
      );
    }

    return result.toList();
  }

  // ============================================================
  // ACTIONS
  // ============================================================

  void changeTopTab(String tab) {
    selectedTopTab = tab;
    _updateCountryScreen();
  }

  void changeCategory(String category) {
    selectedCategory = category;
    _updateCountryScreen();
  }

  void searchCountries(String query) {
    searchQuery = query;
    _updateCountryScreen();
  }

  void clearSearch() {
    searchQuery = '';
    _updateCountryScreen();
  }

  void selectCountry(CountryModel country) {
    selectedCountry = country.name;

    // Return to the normal country list after selection.
    selectedTopTab = 'Recommend';
    selectedCategory = 'All';
    searchQuery = '';

    _updateCountryScreen();
  }

  void _updateCountryScreen() {
    update(_screenUpdateIds);
  }

  bool isSelected(CountryModel country) {
    return selectedCountry == country.name;
  }
}
