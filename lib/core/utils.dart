import 'package:easy_four_diy/core/constants.dart';
import 'package:easy_four_diy/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
  static const kOrange = Color(0xFFFF6600);
  static const kDarkBlue = Color(0xFF003366);
  static const kLightGrey = Color(0xFFEEEEEE);

  static final GlobalKey<ScaffoldMessengerState> key =
      GlobalKey<ScaffoldMessengerState>();
  static final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

  static bool isEnglih(BuildContext context) {
    return Localizations.localeOf(context).languageCode ==
        Constants.DEFAULT_LANGUAGE_CODE;
  }

  static Future<void> sendMail() async {
    Uri mail = Uri.parse("mailto:info@easy4diy.com");
    await launchUrl(mail);
  }

  static Future<void> openPrivacyPolicy() async {
    final Uri url = Uri.parse(Constants.PRIVACY_POLICY_URL);

    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  /// Formats a decimal number according to the active locale (Dutch `,` vs English `.`).
  static String formatDecimal(
    double value,
    BuildContext context, {
    int fractionDigits = 2,
  }) {
    final locale = Localizations.localeOf(context).languageCode;
    final formatter = NumberFormat.decimalPatternDigits(
      locale: locale,
      decimalDigits: fractionDigits,
    );
    return formatter.format(value);
  }

  /// Safely parses a decimal string, replacing comma with dot if present.
  static double parseDecimal(String? input) {
    if (input == null || input.trim().isEmpty) return 0.0;
    final normalized = input.replaceAll(',', '.').trim();
    return double.tryParse(normalized) ?? 0.0;
  }

  static TextStyle getTextStyle({
    required double baseSize,
    required bool isBold,
    required Color color,
  }) {
    return TextStyle(
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      color: color,
      fontSize: baseSize + 3,
      fontFamily: "D-FONT-R",
    );
  }

  static void iapSnackBar({required String message, required bool success}) {
    key.currentState?.showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: success ? Colors.green : Colors.red,
      ),
    );
  }

  static String formatDate({dynamic date}) {
    if (date == null) {
      return "--";
    }
    return DateFormat("dd MMM yyyy").format(date);
  }

  static String formatArchiveDate({dynamic date}) {
    if (date == null) {
      return "--";
    }
    return DateFormat("MMM d, yyyy").format(date);
  }

  static String formatTime({dynamic date}) {
    if (date == null) {
      return "--";
    }
    return DateFormat("h:mm a").format(date);
  }

  static void showSnackBar({
    required BuildContext context,
    required String message,
    required bool success,
  }) {
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: getTextStyle(baseSize: 14, isBold: false, color: Colors.white),
        ),
        backgroundColor: success ? Colors.green : Colors.red,
      ),
    );
  }

  static void showDeleteDialog({
    required BuildContext context,
    required String title,
    required String subTitle,
    required VoidCallback onDelete,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          title,
          style: Utils.getTextStyle(
            baseSize: 16,
            isBold: true,
            color: colorScheme.onSurface,
          ),
        ),
        content: Text(
          subTitle,
          style: Utils.getTextStyle(
            baseSize: 14,
            isBold: false,
            color: colorScheme.onSurface,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Cancel',
              style: Utils.getTextStyle(
                baseSize: 14,
                isBold: false,
                color: colorScheme.onSurface.withValues(alpha: 0.7),
              ),
            ),
          ),
          TextButton(
            onPressed: () => onDelete(),
            child: Text(
              'Delete',
              style: Utils.getTextStyle(
                baseSize: 14,
                isBold: false,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }

  static String getInitials(String name) {
    if (name.isEmpty) return '?';
    final parts = name.trim().split(' ');
    if (parts.length == 1) {
      return parts[0][0].toUpperCase();
    }
    return '${parts[0][0]}${parts[parts.length - 1][0]}'.toUpperCase();
  }

  static void configLoading() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..loadingStyle = EasyLoadingStyle.dark
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..progressColor = Colors.white
      ..backgroundColor = Colors.black87
      ..indicatorColor = Colors.white
      ..textColor = Colors.white
      ..maskColor = Colors.blue.withValues(alpha: 0.5)
      ..userInteractions = false
      ..dismissOnTap = false;
  }

  static String formatHours(double? hours) {
    if (hours == null) return "0";
    if (hours == hours.truncateToDouble()) {
      return hours.toInt().toString();
    }
    return hours.toStringAsFixed(1).replaceAll('.', ',');
  }

  static IconData resolveElectricianIcon(String? iconName) {
    switch (iconName) {
      case 'power':
        return Icons.power;
      case 'electric_bolt':
        return Icons.electric_bolt;
      case 'developer_board':
        return Icons.developer_board;
      case 'hardware':
        return Icons.hardware;
      case 'layers':
        return Icons.layers;
      case 'wrap_text':
        return Icons.wrap_text;
      case 'lightbulb':
        return Icons.lightbulb;
      case 'construction':
        return Icons.construction;
      case 'electrical_services':
        return Icons.electrical_services;
      case 'settings_input_component':
        return Icons.settings_input_component;
      case 'devices':
        return Icons.devices;
      case 'settings_ethernet':
        return Icons.settings_ethernet;
      case 'toggle_on':
        return Icons.toggle_on;
      case 'thermostat':
        return Icons.thermostat;
      case 'sensors':
        return Icons.sensors;
      case 'notifications_active':
        return Icons.notifications_active;
      case 'doorbell':
        return Icons.doorbell;
      case 'solar_power':
        return Icons.solar_power;
      case 'settings_input_composite':
        return Icons.settings_input_composite;
      case 'horizontal_rule':
        return Icons.horizontal_rule;
      case 'extension':
        return Icons.extension;
      default:
        return Icons.electric_bolt;
    }
  }

  static IconData resolveCarpenterIcon(String? iconName) {
    switch (iconName) {
      case 'layers':
        return Icons.layers;
      case 'table_rows':
        return Icons.table_rows;
      case 'border_bottom':
        return Icons.border_bottom;
      case 'cleaning_services':
        return Icons.cleaning_services;
      case 'hardware':
        return Icons.hardware;
      case 'water_drop':
        return Icons.water_drop;
      case 'compress':
        return Icons.compress;
      case 'horizontal_rule':
        return Icons.horizontal_rule;
      case 'build':
        return Icons.build;
      case 'stairs':
        return Icons.stairs;
      case 'border_all':
        return Icons.border_all;
      case 'format_paint':
        return Icons.format_paint;
      case 'texture':
        return Icons.texture;
      case 'door_back_door':
        return Icons.door_back_door;
      case 'door_front_door':
        return Icons.door_front_door;
      case 'crop_square':
        return Icons.crop_square;
      case 'view_headline':
        return Icons.view_headline;
      case 'settings':
        return Icons.settings;
      case 'construction':
        return Icons.construction;
      case 'linear_scale':
        return Icons.linear_scale;
      case 'lock':
        return Icons.lock;
      case 'anchor':
        return Icons.anchor;
      case 'cloud':
        return Icons.cloud;
      case 'crop_free':
        return Icons.crop_free;
      case 'table_bar':
        return Icons.table_bar;
      case 'roofing':
        return Icons.roofing;
      case 'window':
        return Icons.window;
      case 'foundation':
        return Icons.foundation;
      case 'tv':
        return Icons.tv;
      case 'bathtub':
        return Icons.bathtub;
      case 'home':
        return Icons.home;
      case 'fence':
        return Icons.fence;
      case 'wrap_text':
        return Icons.wrap_text;
      case 'kitchen':
        return Icons.kitchen;
      case 'deck':
        return Icons.deck;
      case 'grid_on':
        return Icons.grid_on;
      case 'park':
        return Icons.park;
      default:
        return Icons.handyman;
    }
  }

  static IconData resolveGardenerIcon(String? iconName) {
    switch (iconName) {
      case 'grid_on':
        return Icons.grid_on;
      case 'layers':
        return Icons.layers;
      case 'terrain':
        return Icons.terrain;
      case 'grain':
        return Icons.grain;
      case 'border_all':
        return Icons.border_all;
      case 'foundation':
        return Icons.foundation;
      case 'delete_outline':
        return Icons.delete_outline;
      case 'water_drop':
        return Icons.water_drop;
      case 'grass':
        return Icons.grass;
      case 'spa':
        return Icons.spa;
      case 'table_rows':
        return Icons.table_rows;
      case 'horizontal_rule':
        return Icons.horizontal_rule;
      case 'hardware':
        return Icons.hardware;
      case 'water':
        return Icons.water;
      case 'settings':
        return Icons.settings;
      case 'fence':
        return Icons.fence;
      case 'safety_check':
        return Icons.safety_check;
      case 'recycling':
        return Icons.recycling;
      case 'local_florist':
        return Icons.local_florist;
      case 'circle':
        return Icons.circle;
      case 'wrap_text':
        return Icons.wrap_text;
      case 'eco':
        return Icons.eco;
      case 'deck':
        return Icons.deck;
      case 'flutter_dash':
        return Icons.flutter_dash;
      case 'healing':
        return Icons.healing;
      default:
        return Icons.yard;
    }
  }

  static IconData resolveTilerIcon(String? iconName) {
    switch (iconName) {
      case 'grid_on':
        return Icons.grid_on;
      case 'layers':
        return Icons.layers;
      case 'grid_view':
        return Icons.grid_view;
      case 'add':
        return Icons.add;
      case 'format_paint':
        return Icons.format_paint;
      case 'horizontal_rule':
        return Icons.horizontal_rule;
      case 'border_all':
        return Icons.border_all;
      case 'compress':
        return Icons.compress;
      case 'dry_cleaning':
        return Icons.dry_cleaning;
      case 'water_drop':
        return Icons.water_drop;
      case 'wrap_text':
        return Icons.wrap_text;
      case 'circle':
        return Icons.circle;
      case 'terrain':
        return Icons.terrain;
      case 'hardware':
        return Icons.hardware;
      case 'build':
        return Icons.build;
      case 'cleaning_services':
        return Icons.cleaning_services;
      case 'border_bottom':
        return Icons.border_bottom;
      case 'construction':
        return Icons.construction;
      case 'delete':
        return Icons.delete;
      case 'safety_check':
        return Icons.safety_check;
      default:
        return Icons.grid_on;
    }
  }

  static IconData resolvePainterIcon(String? iconName) {
    switch (iconName) {
      case 'format_paint':
        return Icons.format_paint;
      case 'layers':
        return Icons.layers;
      case 'water_drop':
        return Icons.water_drop;
      case 'wrap_text':
        return Icons.wrap_text;
      case 'table_rows':
        return Icons.table_rows;
      case 'texture':
        return Icons.texture;
      case 'cleaning_services':
        return Icons.cleaning_services;
      case 'opacity':
        return Icons.opacity;
      case 'dry_cleaning':
        return Icons.dry_cleaning;
      case 'square':
        return Icons.square;
      case 'hardware':
        return Icons.hardware;
      case 'masks':
        return Icons.masks;
      case 'brush':
        return Icons.brush;
      default:
        return Icons.format_paint;
    }
  }

  static IconData resolvePlumberIcon(String? iconName) {
    switch (iconName) {
      case 'horizontal_rule':
        return Icons.horizontal_rule;
      case 'hardware':
        return Icons.hardware;
      case 'cleaning_services':
        return Icons.cleaning_services;
      case 'water':
        return Icons.water;
      case 'settings_input_component':
        return Icons.settings_input_component;
      case 'wrap_text':
        return Icons.wrap_text;
      case 'plumbing':
        return Icons.plumbing;
      case 'thermostat':
        return Icons.thermostat;
      case 'bathtub':
        return Icons.bathtub;
      case 'wash':
        return Icons.wash;
      case 'water_drop':
        return Icons.water_drop;
      case 'settings':
        return Icons.settings;
      case 'construction':
        return Icons.construction;
      case 'local_fire_department':
        return Icons.local_fire_department;
      case 'security':
        return Icons.security;
      case 'compress':
        return Icons.compress;
      case 'shower':
        return Icons.shower;
      case 'heat_pump':
        return Icons.heat_pump;
      case 'wc':
        return Icons.wc;
      case 'speed':
        return Icons.speed;
      case 'opacity':
        return Icons.opacity;
      case 'build_circle':
        return Icons.build_circle;
      case 'back_hand':
        return Icons.back_hand;
      case 'layers':
        return Icons.layers;
      case 'wb_sunny':
        return Icons.wb_sunny;
      case 'air':
        return Icons.air;
      default:
        return Icons.plumbing;
    }
  }

  static String resolveChecklistLabel(String key, AppLocalizations l10n) {
    switch (key) {
      case 'checklistBehangtafel':
        return l10n.checklistBehangtafel;
      case 'checklistBehangborstel':
        return l10n.checklistBehangborstel;
      case 'checklistBehanglijmRoller':
        return l10n.checklistBehanglijmRoller;
      case 'checklistMeetlint':
        return l10n.checklistMeetlint;
      case 'checklistWaterpas':
        return l10n.checklistWaterpas;
      case 'checklistPotlood':
        return l10n.checklistPotlood;
      case 'checklistSchaarBehangmes':
        return l10n.checklistSchaarBehangmes;
      case 'checklistSponzen':
        return l10n.checklistSponzen;
      case 'checklistVerfroller':
        return l10n.checklistVerfroller;
      case 'checklistKwast':
        return l10n.checklistKwast;
      case 'checklistVerfbak':
        return l10n.checklistVerfbak;
      case 'checklistAfplaktape':
        return l10n.checklistAfplaktape;
      case 'checklistSchuurpapier':
        return l10n.checklistSchuurpapier;
      case 'checklistStofzuigerStofdoek':
        return l10n.checklistStofzuigerStofdoek;
      case 'checklistLadderTrap':
        return l10n.checklistLadderTrap;
      case 'checklistDekkleed':
        return l10n.localeName.startsWith('en')
            ? 'Floor protection blanket / dust sheet'
            : 'Dekkleed / vloerbescherming';
      case 'checklistDecoupeerzaag':
        return l10n.checklistDecoupeerzaag;
      case 'checklistRolmaat':
        return l10n.checklistRolmaat;
      case 'checklistPlintenknipper':
        return l10n.checklistPlintenknipper;
      case 'checklistHamer':
        return l10n.checklistHamer;
      case 'checklistAccuboormachine':
        return l10n.checklistAccuboormachine;
      case 'checklistAccuBoormachineBitset':
        return l10n.localeName.startsWith('en')
            ? 'Cordless drill/driver + bits'
            : 'Accuboormachine + bitset';
      case 'checklistKlopboormachine':
        return l10n.localeName.startsWith('en')
            ? 'Impact drill / Hammer drill'
            : 'Klopboormachine';
      case 'checklistBoortjes':
        return l10n.localeName.startsWith('en') ? 'Drill bits' : 'Boortjes';
      case 'checklistSchroevendraaier':
        return l10n.checklistSchroevendraaier;
      case 'checklistKitpistool':
        return l10n.checklistKitpistool;
      case 'checklistWaterpomptang':
        return l10n.localeName.startsWith('en')
            ? 'Water pump pliers (Bahco / Channel-lock)'
            : 'Bahco / waterpomptang';
      case 'checklistTeflonTape':
        return l10n.checklistTeflonTape;
      case 'checklistSleutelset':
        return l10n.checklistSleutelset;
      case 'checklistPijpsnijder':
        return l10n.checklistPijpsnijder;
      case 'checklistIJzerzaag':
        return l10n.checklistIJzerzaag;
      case 'checklistOntluchtingssleutel':
        return l10n.checklistOntluchtingssleutel;
      case 'checklistSoldeerbrander':
        return l10n.checklistSoldeerbrander;
      case 'checklistAfsluiters':
        return l10n.checklistAfsluiters;
      case 'checklistEmmer':
        return l10n.checklistEmmer;
      case 'checklistDweil':
        return l10n.localeName.startsWith('en')
            ? 'Floor cloth / Mop'
            : 'Dweil / doek';
      case 'checklistSchroevendraaierSet':
        return l10n.checklistSchroevendraaierSet;
      case 'checklistTrekkerDraadtrekker':
        return l10n.checklistTrekkerDraadtrekker;
      case 'checklistKrimpkous':
        return l10n.checklistKrimpkous;
      case 'checklistMultimeter':
        return l10n.checklistMultimeter;
      case 'checklistKnijtang':
        return l10n.checklistKnijtang;
      case 'checklistBoorhamer':
      case 'checklistBoorhamers':
        return l10n.checklistBoorhamer;
      case 'checklistIsolatietape':
        return l10n.checklistIsolatietape;
      case 'checklistNulschakelaar':
        return l10n.checklistNulschakelaar;
      case 'checklistTegelsnijder':
        return l10n.checklistTegelsnijder;
      case 'checklistTandspaan':
        return l10n.checklistTandspaan;
      case 'checklistVoegspuit':
        return l10n.checklistVoegspuit;
      case 'checklistSpons':
        return l10n.checklistSpons;
      case 'checklistRubbereHamer':
      case 'checklistRubberHamer':
        return l10n.checklistRubbereHamer;
      case 'checklistSchep':
        return l10n.localeName.startsWith('en') ? 'Shovel' : 'Schep';
      case 'checklistSchop':
        return l10n.checklistSchop;
      case 'checklistHark':
        return l10n.checklistHark;
      case 'checklistSnoeischaar':
        return l10n.checklistSnoeischaar;
      case 'checklistKruiwagen':
        return l10n.checklistKruiwagen;
      case 'checklistTuinhandschoenen':
        return l10n.checklistTuinhandschoenen;
      case 'checklistGraafmachine':
        return l10n.checklistGraafmachine;
      case 'checklistGieter':
        return l10n.checklistGieter;
      case 'checklistEmmerVoorLijm':
        return l10n.checklistEmmerVoorLijm;
      case 'checklistTrapLadder':
        return l10n.checklistTrapLadder;
      case 'checklistStucloperAfdekfolie':
        return l10n.checklistStucloperAfdekfolie;
      case 'checklistSponsDoek':
        return l10n.checklistSponsDoek;
      case 'checklistLoodlijn':
        return l10n.checklistLoodlijn;
      case 'checklistPlamuurmes':
        return l10n.checklistPlamuurmes;
      case 'checklistBehangnaadroller':
        return l10n.checklistBehangnaadroller;
      case 'checklistBeitel':
        return l10n.checklistBeitel;
      case 'checklistMontageschuimpistool':
        return l10n.checklistMontageschuimpistool;
      case 'checklistBlokhaak':
        return l10n.checklistBlokhaak;
      case 'checklistBreekijzer':
        return l10n.checklistBreekijzer;
      case 'checklistLijmtang':
        return l10n.checklistLijmtang;
      case 'checklistStofmasker':
        return l10n.checklistStofmasker;
      case 'checklistVeiligheidsbril':
        return l10n.checklistVeiligheidsbril;
      case 'checklistVerlengkabel':
        return l10n.checklistVerlengkabel;
      case 'checklistTrapje':
        return l10n.checklistTrapje;
      case 'checklistFreesmachine':
        return l10n.localeName.startsWith('en')
            ? 'Router / Groove cutter (rental)'
            : 'Freesmachine (huur)';

      case 'checklistDeurwig':
        return l10n.localeName.startsWith('en')
            ? 'Door wedge or door installation jack'
            : 'Deurwig of deurhefboom';
      case 'checklistSpeedboor':
        return l10n.localeName.startsWith('en')
            ? 'Spade bit (small tool / attachment)'
            : 'Speedboor (klein gereedschap / opzetstuk)';
      case 'checklistSchuurmachine':
        return l10n.checklistSchuurmachine;
      case 'checklistSchaafmachine':
        return l10n.checklistSchaafmachine;
      case 'checklistAfkortzaag':
        return l10n.checklistAfkortzaag;
      case 'checklistStofdoek':
        return l10n.checklistStofdoek;
      case 'checklistKniebeschermers':
        return l10n.checklistKniebeschermers;
      case 'checklistStanleymes':
        return l10n.localeName.startsWith('en')
            ? 'Utility knife / wallpaper knife'
            : 'Stanleymes / behangmes';
      case 'checklistSnapoffMes':
        return l10n.localeName.startsWith('en')
            ? 'Snap-off knife 18 mm + spare blades'
            : 'Breekmes 18 mm + reservemesjes';
      case 'checklistGatenzaag':
        return l10n.checklistGatenzaag;
      case 'checklistLijmklemmen':
        return l10n.checklistLijmklemmen;
      case 'checklistWerkhandschoenen':
        return l10n.checklistWerkhandschoenen;
      case 'checklistCirkelzaag':
        return l10n.checklistCirkelzaag;
      case 'checklistGipsschaar':
        return l10n.checklistGipsschaar;
      case 'checklistSteiger':
        return l10n.checklistSteiger;
      case 'checklistBehangafstomer':
        return l10n.checklistBehangafstomer;
      case 'checklistGrondboor':
        return l10n.checklistGrondboor;
      case 'checklistVerstekbak':
        return l10n.checklistVerstekbak;
      case 'checklistLijnlaser':
        return l10n.checklistLijnlaser;
      case 'checklistTroffel':
        return l10n.checklistTroffel;
      case 'checklistVoegrubber':
        return l10n.checklistVoegrubber;
      case 'checklistBezem':
        return l10n.checklistBezem;
      case 'checklistGrasrol':
        return l10n.checklistGrasrol;
      case 'checklistTakkenschaar':
        return l10n.checklistTakkenschaar;
      case 'checklistHeggenschaar':
        return l10n.checklistHeggenschaar;
      case 'checklistSnoeizaag':
        return l10n.checklistSnoeizaag;
      case 'checklistKettingzaag':
        return l10n.checklistKettingzaag;
      case 'checklistBitset':
        return l10n.checklistBitset;
      case 'checklistZaag':
        return l10n.checklistZaag;
      case 'checklistBorstel':
        return l10n.checklistBorstel;
      case 'checklistSpade':
        return l10n.checklistSpade;
      case 'checklistBladhark':
        return l10n.checklistBladhark;
      case 'checklistBladblazer':
        return l10n.checklistBladblazer;
      case 'checklistSlijpsteen':
        return l10n.checklistSlijpsteen;
      case 'checklistStaalborstel':
        return l10n.checklistStaalborstel;
      case 'checklistGereedschapsolie':
        return l10n.checklistGereedschapsolie;
      case 'checklistVoegenborstel':
        return l10n.checklistVoegenborstel;
      case 'checklistHogedrukreiniger':
        return l10n.checklistHogedrukreiniger;
      case 'checklistGaskantenknipper':
        return l10n.checklistGaskantenknipper;
      case 'checklistZwaaihaak':
        return l10n.localeName.startsWith('en')
            ? 'Adjustable bevel / Sliding T-bevel'
            : 'Zweihaak / Zwaaihaak';
      case 'checklistOntvetterdoek':
        return l10n.localeName.startsWith('en')
            ? 'Surface degreaser & cleaning cloth'
            : 'Ontvetter & schone doek';
      case 'checklistTacker':
        return l10n.checklistTacker;
      case 'checklistTrapspin':
        return l10n.checklistTrapspin;
      case 'checklistLijmkam':
        return l10n.checklistLijmkam;
      case 'checklistTrekijzer':
        return l10n.checklistTrekijzer;
      case 'checklistSlagblok':
        return l10n.checklistSlagblok;
      case 'checklistVloerwals':
        return l10n.checklistVloerwals;
      case 'checklistTrilplaat':
        return l10n.checklistTrilplaat;
      case 'checklistKitschraper':
        return l10n.checklistKitschraper;
      case 'checklistPlantenspuit':
        return l10n.localeName.startsWith('en')
            ? 'Spray bottle with soapy water'
            : 'Plantenspuit met afwasmiddel';
      case 'checklistKeukenpapier':
        return l10n.checklistKeukenpapier;
      case 'checklistLiniaal':
        return l10n.checklistLiniaal;
      case 'checklistCentrumbits':
        return l10n.checklistCentrumbits;
      case 'checklistLaminaatStarterKit':
        return l10n.localeName.startsWith('en')
            ? 'Laminate starter kit (tapping block, pull bar, spacers & wedges)'
            : 'Laminaat-starterset (klopblok, trekijzer, afstandswiggen)';
      case 'checklistWiggen':
        return l10n.checklistWiggen;
      case 'checklistGroteVerfroller':
        return l10n.checklistGroteVerfroller;
      case 'checklistKleineVerfroller':
        return l10n.checklistKleineVerfroller;
      case 'checklistVerlengstok':
        return l10n.checklistVerlengstok;
      case 'checklistKwasten':
        return l10n.checklistKwasten;
      case 'checklistRadiatorroller':
        return l10n.checklistRadiatorroller;
      case 'checklistStofzuiger':
        return l10n.checklistStofzuiger;
      case 'checklistSchroefboormachine':
        return l10n.checklistSchroefboormachine;
      case 'checklistSchroefboormachineBitset':
        return l10n.localeName.startsWith('en')
            ? 'Cordless drill/driver + bit set'
            : 'Schroefboormachine + bitset';
      case 'checklistGeisoleerdSchroefboormachineBitset':
        return l10n.localeName.startsWith('en')
            ? 'Insulated cordless drill/driver + bit set'
            : 'Geïsoleerde schroefboormachine + bitset';
      case 'checklistBoormachine':
        return l10n.checklistBoormachine;
      case 'checklistBuigtang':
        return l10n.checklistBuigtang;
      case 'checklistMoersleutel':
        return l10n.localeName.startsWith('en')
            ? 'Adjustable wrench'
            : 'Verstelbare moersleutel';
      case 'checklistOntbraker':
        return l10n.checklistOntbraker;
      case 'checklistLeidingzoeker':
        return l10n.checklistLeidingzoeker;
      case 'checklistSteeksleutel':
        return l10n.checklistSteeksleutel;
      case 'checklistInbussleutel':
        return l10n.checklistInbussleutel;
      case 'checklistFrees':
        return l10n.checklistFrees;
      case 'checklistOntstoppingsveer':
        return l10n.checklistOntstoppingsveer;
      case 'checklistOntstoppingsmachine':
        return l10n.checklistOntstoppingsmachine;
      case 'checklistRioolkabel':
        return l10n.checklistRioolkabel;
      case 'checklistHandschoenen':
        return l10n.localeName.startsWith('en') ? 'Gloves' : 'Handschoenen';
      case 'checklistDoek':
        return l10n.checklistDoek;
      case 'checklistIsolatiemes':
        return l10n.checklistIsolatiemes;
      case 'checklistSpanningstester':
        return l10n.localeName.startsWith('en')
            ? 'Two-pole voltage tester'
            : 'Tweepolige spanningstester';
      case 'checklistStriptang':
        return l10n.checklistStriptang;
      case 'checklistKabelknipper':
        return l10n.checklistKabelknipper;
      case 'checklistGeisoleerGereedschap':
        return l10n.checklistGeisoleerGereedschap;
      case 'checklistMeetTestgereedschap':
        return l10n.checklistMeetTestgereedschap;
      case 'checklistMomentsleutel':
        return l10n.checklistMomentsleutel;
      case 'checklistTrapjeOfSteiger':
        return l10n.checklistTrapjeOfSteiger;
      case 'checklistTrekveer':
        return l10n.checklistTrekveer;
      case 'checklistBuisbuiger':
        return l10n.checklistBuisbuiger;
      case 'checklistZeskantsleutel':
        return l10n.checklistZeskantsleutel;
      case 'checklistSlijptol':
        return l10n.localeName.startsWith('en')
            ? 'Angle grinder + diamond disc'
            : 'Slijptol + diamantschijf';
      case 'checklistViltstift':
        return l10n.checklistViltstift;
      case 'checklistVoegspijker':
      case 'checklistAfstrijkmesje':
        return l10n.localeName.startsWith('en')
            ? 'Finishing spatula / sealant smoother'
            : 'Afstrijkmesje / voegspijker';
      case 'checklistZuignap':
        return l10n.checklistZuignap;
      case 'checklistDoekOfLap':
        return l10n.localeName.startsWith('en')
            ? 'Cleaning cloth / clean rag'
            : 'Poetsdoek / schone lap';
      case 'checklistStofferEnBlik':
        return l10n.checklistStofferEnBlik;
      case 'checklistLaarzen':
        return l10n.checklistLaarzen;
      case 'checklistSchepnet':
        return l10n.checklistSchepnet;
      case 'checklistMenggarde':
        return l10n.localeName.startsWith('en')
            ? 'Mixing paddle / Mortar mixer'
            : 'Menggarde / Mengstaaf';
      case 'checklistMengkuip':
        return l10n.localeName.startsWith('en')
            ? 'Mixing tub / Mixing bucket'
            : 'Mengkuip / Mengemmer';
      case 'checklistTrimmer':
        return l10n.checklistTrimmer;
      case 'checklistContourmal':
        return l10n.checklistContourmal;
      case 'checklistDeken':
        return l10n.checklistDeken;
      case 'checklistDeurheffer':
        return l10n.checklistDeurheffer;
      case 'checklistFijngetandeZaag':
        return l10n.checklistFijngetandeZaag;
      case 'checklistVerstekzaag':
        return l10n.checklistVerstekzaag;
      default:
        if (key.startsWith('checklist')) {
          final stripped = key.replaceFirst('checklist', '');
          return stripped.replaceAllMapped(
            RegExp(r'([a-z])([A-Z])'),
            (m) => '${m[1]} ${m[2]}',
          );
        }
        return key;
    }
  }
}
