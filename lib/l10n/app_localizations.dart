import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_nl.dart';

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
    Locale('en'),
    Locale('nl'),
  ];

  /// Account section title
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get settingsAccount;

  /// Account section subtitle
  ///
  /// In en, this message translates to:
  /// **'Manage your account information.'**
  String get settingsAccountSubtitle;

  /// Name label
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get settingsName;

  /// Email address label
  ///
  /// In en, this message translates to:
  /// **'Email Address'**
  String get settingsEmailAddress;

  /// Language section title
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settingsLanguage;

  /// Language section subtitle
  ///
  /// In en, this message translates to:
  /// **'Choose your preferred language.'**
  String get settingsLanguageSubtitle;

  /// Units section title
  ///
  /// In en, this message translates to:
  /// **'Units'**
  String get settingsUnits;

  /// Units section subtitle
  ///
  /// In en, this message translates to:
  /// **'Choose the units of measurement.'**
  String get settingsUnitsSubtitle;

  /// Meters unit label
  ///
  /// In en, this message translates to:
  /// **'Meters (m)'**
  String get settingsMeters;

  /// Inches unit label
  ///
  /// In en, this message translates to:
  /// **'Inches (in)'**
  String get settingsInches;

  /// Other section title
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get settingsOther;

  /// Privacy policy label
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get settingsPrivacyPolicy;

  /// Terms and conditions label
  ///
  /// In en, this message translates to:
  /// **'Terms & Conditions'**
  String get settingsTermsConditions;

  /// Help and support label
  ///
  /// In en, this message translates to:
  /// **'Help & Support'**
  String get settingsHelpSupport;

  /// About label
  ///
  /// In en, this message translates to:
  /// **'About Easy4DIY'**
  String get settingsAbout;

  /// Logout button label
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get settingsLogout;

  /// No description provided for @dashboardTitle.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get dashboardTitle;

  /// No description provided for @dashboardWelcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome back! Here\'s an overview of all your jobs, savings and performance.'**
  String get dashboardWelcome;

  /// No description provided for @dashboardTotalJobs.
  ///
  /// In en, this message translates to:
  /// **'Total jobs'**
  String get dashboardTotalJobs;

  /// No description provided for @dashboardAllTime.
  ///
  /// In en, this message translates to:
  /// **'All time'**
  String get dashboardAllTime;

  /// No description provided for @dashboardCompletedJobs.
  ///
  /// In en, this message translates to:
  /// **'Completed jobs'**
  String get dashboardCompletedJobs;

  /// No description provided for @dashboardCompleted.
  ///
  /// In en, this message translates to:
  /// **'completed'**
  String get dashboardCompleted;

  /// No description provided for @dashboardTotalSavings.
  ///
  /// In en, this message translates to:
  /// **'Total savings'**
  String get dashboardTotalSavings;

  /// No description provided for @dashboardAllJobs.
  ///
  /// In en, this message translates to:
  /// **'All jobs'**
  String get dashboardAllJobs;

  /// No description provided for @dashboardMoneySaved.
  ///
  /// In en, this message translates to:
  /// **'Money saved'**
  String get dashboardMoneySaved;

  /// No description provided for @dashboardThisMonth.
  ///
  /// In en, this message translates to:
  /// **'This month'**
  String get dashboardThisMonth;

  /// No description provided for @dashboardSavingsOverview.
  ///
  /// In en, this message translates to:
  /// **'Savings overview'**
  String get dashboardSavingsOverview;

  /// No description provided for @dashboardViewAll.
  ///
  /// In en, this message translates to:
  /// **'View all'**
  String get dashboardViewAll;

  /// No description provided for @dashboardDoItYourself.
  ///
  /// In en, this message translates to:
  /// **'Do it yourself'**
  String get dashboardDoItYourself;

  /// No description provided for @dashboardToolsRental.
  ///
  /// In en, this message translates to:
  /// **'Tools (rental)'**
  String get dashboardToolsRental;

  /// No description provided for @dashboardTotal.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get dashboardTotal;

  /// No description provided for @dashboardHireProfessional.
  ///
  /// In en, this message translates to:
  /// **'Hire a professional'**
  String get dashboardHireProfessional;

  /// No description provided for @dashboardTimeEstimate.
  ///
  /// In en, this message translates to:
  /// **'Time estimate'**
  String get dashboardTimeEstimate;

  /// No description provided for @dashboardHours.
  ///
  /// In en, this message translates to:
  /// **'hours'**
  String get dashboardHours;

  /// No description provided for @dashboardYouSave.
  ///
  /// In en, this message translates to:
  /// **'You save'**
  String get dashboardYouSave;

  /// No description provided for @dashboardSmartDiy.
  ///
  /// In en, this message translates to:
  /// **'That\'s smart DIY!'**
  String get dashboardSmartDiy;

  /// No description provided for @dashboardCostOverview.
  ///
  /// In en, this message translates to:
  /// **'Cost overview'**
  String get dashboardCostOverview;

  /// No description provided for @dashboardThisYear.
  ///
  /// In en, this message translates to:
  /// **'This year'**
  String get dashboardThisYear;

  /// No description provided for @dashboardTotalCosts.
  ///
  /// In en, this message translates to:
  /// **'Total costs'**
  String get dashboardTotalCosts;

  /// No description provided for @dashboardMaterials.
  ///
  /// In en, this message translates to:
  /// **'Materials'**
  String get dashboardMaterials;

  /// No description provided for @dashboardTools.
  ///
  /// In en, this message translates to:
  /// **'Tools'**
  String get dashboardTools;

  /// No description provided for @dashboardSubscriptions.
  ///
  /// In en, this message translates to:
  /// **'Subscriptions'**
  String get dashboardSubscriptions;

  /// No description provided for @dashboardOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get dashboardOther;

  /// No description provided for @dashboardRecentActivities.
  ///
  /// In en, this message translates to:
  /// **'Recent activities'**
  String get dashboardRecentActivities;

  /// No description provided for @dashboardNoRecentJobs.
  ///
  /// In en, this message translates to:
  /// **'No recent jobs yet. Start your first job!'**
  String get dashboardNoRecentJobs;

  /// No description provided for @dashboardJobCompleted.
  ///
  /// In en, this message translates to:
  /// **'{jobName} completed! € {savings} saved.'**
  String dashboardJobCompleted(String jobName, String savings);

  /// No description provided for @dashboardHoursAgo.
  ///
  /// In en, this message translates to:
  /// **'hours ago'**
  String get dashboardHoursAgo;

  /// No description provided for @dashboardDayAgo.
  ///
  /// In en, this message translates to:
  /// **'day ago'**
  String get dashboardDayAgo;

  /// No description provided for @dashboardDaysAgo.
  ///
  /// In en, this message translates to:
  /// **'days ago'**
  String get dashboardDaysAgo;

  /// No description provided for @dashboardWeekAgo.
  ///
  /// In en, this message translates to:
  /// **'week ago'**
  String get dashboardWeekAgo;

  /// No description provided for @dashboardViewAllActivities.
  ///
  /// In en, this message translates to:
  /// **'View all activities'**
  String get dashboardViewAllActivities;

  /// No description provided for @dashboardQuickAccess.
  ///
  /// In en, this message translates to:
  /// **'Quick access'**
  String get dashboardQuickAccess;

  /// No description provided for @dashboardNewJob.
  ///
  /// In en, this message translates to:
  /// **'New job'**
  String get dashboardNewJob;

  /// No description provided for @rootDashboard.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get rootDashboard;

  /// No description provided for @rootSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get rootSettings;

  /// No description provided for @rootMyJobs.
  ///
  /// In en, this message translates to:
  /// **'My Jobs'**
  String get rootMyJobs;

  /// No description provided for @rootTasks.
  ///
  /// In en, this message translates to:
  /// **'Tasks'**
  String get rootTasks;

  /// No description provided for @rootSizesCalculations.
  ///
  /// In en, this message translates to:
  /// **'Sizes & Calculations'**
  String get rootSizesCalculations;

  /// No description provided for @rootMaterials.
  ///
  /// In en, this message translates to:
  /// **'Materials'**
  String get rootMaterials;

  /// No description provided for @rootCostsSavings.
  ///
  /// In en, this message translates to:
  /// **'Costs & Savings'**
  String get rootCostsSavings;

  /// No description provided for @rootSubscriptions.
  ///
  /// In en, this message translates to:
  /// **'Subscriptions'**
  String get rootSubscriptions;

  /// No description provided for @rootToolChecklist.
  ///
  /// In en, this message translates to:
  /// **'Tool Checklist'**
  String get rootToolChecklist;

  /// No description provided for @rootFaq.
  ///
  /// In en, this message translates to:
  /// **'FAQ'**
  String get rootFaq;

  /// No description provided for @rootPreferences.
  ///
  /// In en, this message translates to:
  /// **'Preferences'**
  String get rootPreferences;

  /// No description provided for @rootStepByStep.
  ///
  /// In en, this message translates to:
  /// **'STEP BY STEP'**
  String get rootStepByStep;

  /// No description provided for @rootGoPremium.
  ///
  /// In en, this message translates to:
  /// **'Go Premium'**
  String get rootGoPremium;

  /// No description provided for @rootUnlockPremium.
  ///
  /// In en, this message translates to:
  /// **'Unlock more jobs\nand premium features.'**
  String get rootUnlockPremium;

  /// No description provided for @rootUpgradeNow.
  ///
  /// In en, this message translates to:
  /// **'Upgrade Now'**
  String get rootUpgradeNow;

  /// No description provided for @onboardingStep.
  ///
  /// In en, this message translates to:
  /// **'Step {current} of {total}'**
  String onboardingStep(int current, int total);

  /// No description provided for @onboardingWelcomeTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Easy4DIY!'**
  String get onboardingWelcomeTitle;

  /// No description provided for @onboardingWelcomeDesc.
  ///
  /// In en, this message translates to:
  /// **'Measure twice, know exactly! Quickly and easily calculate square meters, materials, costs, and tools for any project. In just a few steps, you’ll have a complete overview. Your first project is completely free. We’re continuously growing, adding new features and projects. Our goal? To become the biggest and best DIY app in the world. Will you build that future with us?'**
  String get onboardingWelcomeDesc;

  /// No description provided for @onboardingChooseJob.
  ///
  /// In en, this message translates to:
  /// **'Which field?'**
  String get onboardingChooseJob;

  /// No description provided for @onboardingWhatWork.
  ///
  /// In en, this message translates to:
  /// **'Select the trade for your job'**
  String get onboardingWhatWork;

  /// No description provided for @onboardingSelectJob.
  ///
  /// In en, this message translates to:
  /// **'Select your job'**
  String get onboardingSelectJob;

  /// No description provided for @onboardingJobCarpenter.
  ///
  /// In en, this message translates to:
  /// **'Carpenter'**
  String get onboardingJobCarpenter;

  /// No description provided for @onboardingJobPlumber.
  ///
  /// In en, this message translates to:
  /// **'Plumber'**
  String get onboardingJobPlumber;

  /// No description provided for @onboardingJobPainter.
  ///
  /// In en, this message translates to:
  /// **'Painter'**
  String get onboardingJobPainter;

  /// No description provided for @onboardingJobGardener.
  ///
  /// In en, this message translates to:
  /// **'Gardener'**
  String get onboardingJobGardener;

  /// No description provided for @onboardingJobElectrician.
  ///
  /// In en, this message translates to:
  /// **'Electrician'**
  String get onboardingJobElectrician;

  /// No description provided for @onboardingJobTiler.
  ///
  /// In en, this message translates to:
  /// **'Tiler'**
  String get onboardingJobTiler;

  /// No description provided for @onboardingFillSizes.
  ///
  /// In en, this message translates to:
  /// **'Fill in the sizes'**
  String get onboardingFillSizes;

  /// No description provided for @onboardingRoomDimensions.
  ///
  /// In en, this message translates to:
  /// **'Enter the dimensions of your room'**
  String get onboardingRoomDimensions;

  /// No description provided for @onboardingMeasureHeader.
  ///
  /// In en, this message translates to:
  /// **'In the Easy4DIY app, measuring works like this:'**
  String get onboardingMeasureHeader;

  /// No description provided for @onboardingMeasureStep1.
  ///
  /// In en, this message translates to:
  /// **'First, choose the surface: floor, wall, or ceiling.'**
  String get onboardingMeasureStep1;

  /// No description provided for @onboardingMeasureExampleTitle.
  ///
  /// In en, this message translates to:
  /// **'Example:'**
  String get onboardingMeasureExampleTitle;

  /// No description provided for @onboardingMeasureExampleDesc.
  ///
  /// In en, this message translates to:
  /// **'A floor 5.00 m long and 4.00 m wide → 5.00 × 4.00 = 20.00 m².'**
  String get onboardingMeasureExampleDesc;

  /// No description provided for @onboardingMeasureFormulaFloor.
  ///
  /// In en, this message translates to:
  /// **'Floor: length × width'**
  String get onboardingMeasureFormulaFloor;

  /// No description provided for @onboardingMeasureFormulaWall.
  ///
  /// In en, this message translates to:
  /// **'Wall: length × height'**
  String get onboardingMeasureFormulaWall;

  /// No description provided for @onboardingMeasureFormulaCeiling.
  ///
  /// In en, this message translates to:
  /// **'Ceiling: length × width'**
  String get onboardingMeasureFormulaCeiling;

  /// No description provided for @onboardingMeasureFooter.
  ///
  /// In en, this message translates to:
  /// **'Fill everything in in meters – the app does the rest.'**
  String get onboardingMeasureFooter;

  /// No description provided for @onboardingTypeFloor.
  ///
  /// In en, this message translates to:
  /// **'Floor (lxw)'**
  String get onboardingTypeFloor;

  /// No description provided for @onboardingTypeWall.
  ///
  /// In en, this message translates to:
  /// **'Wall (lxh)'**
  String get onboardingTypeWall;

  /// No description provided for @onboardingTypeCeiling.
  ///
  /// In en, this message translates to:
  /// **'Ceiling (lxw)'**
  String get onboardingTypeCeiling;

  /// No description provided for @onboardingLength.
  ///
  /// In en, this message translates to:
  /// **'Length (m)'**
  String get onboardingLength;

  /// No description provided for @onboardingWidth.
  ///
  /// In en, this message translates to:
  /// **'Width (m)'**
  String get onboardingWidth;

  /// No description provided for @onboardingHeight.
  ///
  /// In en, this message translates to:
  /// **'Height (m)'**
  String get onboardingHeight;

  /// No description provided for @onboardingTotalArea.
  ///
  /// In en, this message translates to:
  /// **'Total area (m²)'**
  String get onboardingTotalArea;

  /// No description provided for @onboardingCuttingLoss.
  ///
  /// In en, this message translates to:
  /// **'+10% cutting loss (recommended)'**
  String get onboardingCuttingLoss;

  /// No description provided for @onboardingTotalWithLoss.
  ///
  /// In en, this message translates to:
  /// **'Total with cutting loss: {area} m²'**
  String onboardingTotalWithLoss(String area);

  /// No description provided for @onboardingHowLong.
  ///
  /// In en, this message translates to:
  /// **'How long does this job take approximately?'**
  String get onboardingHowLong;

  /// No description provided for @onboardingChooseIndication.
  ///
  /// In en, this message translates to:
  /// **'Choose an indication'**
  String get onboardingChooseIndication;

  /// No description provided for @onboardingMaterialsOverview.
  ///
  /// In en, this message translates to:
  /// **'Materials overview'**
  String get onboardingMaterialsOverview;

  /// No description provided for @onboardingMaterial.
  ///
  /// In en, this message translates to:
  /// **'Material'**
  String get onboardingMaterial;

  /// No description provided for @onboardingQty.
  ///
  /// In en, this message translates to:
  /// **'Qty'**
  String get onboardingQty;

  /// No description provided for @onboardingPrice.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get onboardingPrice;

  /// No description provided for @onboardingBasedOnArea.
  ///
  /// In en, this message translates to:
  /// **'Based on {area} m²\n(incl. 10% cutting loss)'**
  String onboardingBasedOnArea(String area);

  /// No description provided for @onboardingToolsCheck.
  ///
  /// In en, this message translates to:
  /// **'Tools check'**
  String get onboardingToolsCheck;

  /// No description provided for @onboardingHaveRightTools.
  ///
  /// In en, this message translates to:
  /// **'Do you already have the right tools?'**
  String get onboardingHaveRightTools;

  /// No description provided for @onboardingFaqTitle.
  ///
  /// In en, this message translates to:
  /// **'Most asked questions\nabout your job'**
  String get onboardingFaqTitle;

  /// No description provided for @onboardingCostOverview.
  ///
  /// In en, this message translates to:
  /// **'Cost overview'**
  String get onboardingCostOverview;

  /// No description provided for @onboardingCostDiy.
  ///
  /// In en, this message translates to:
  /// **'What does it cost if you do it yourself?'**
  String get onboardingCostDiy;

  /// No description provided for @onboardingDoItYourself.
  ///
  /// In en, this message translates to:
  /// **'DO IT YOURSELF'**
  String get onboardingDoItYourself;

  /// No description provided for @onboardingHireProfessional.
  ///
  /// In en, this message translates to:
  /// **'HIRE A PROFESSIONAL'**
  String get onboardingHireProfessional;

  /// No description provided for @onboardingYouSave.
  ///
  /// In en, this message translates to:
  /// **'YOU SAVE'**
  String get onboardingYouSave;

  /// No description provided for @onboardingSmartDiy.
  ///
  /// In en, this message translates to:
  /// **'That\'s smart DIY!'**
  String get onboardingSmartDiy;

  /// No description provided for @onboardingPrev.
  ///
  /// In en, this message translates to:
  /// **'Previous'**
  String get onboardingPrev;

  /// No description provided for @onboardingNext.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get onboardingNext;

  /// No description provided for @onboardingFinish.
  ///
  /// In en, this message translates to:
  /// **'Finish'**
  String get onboardingFinish;

  /// No description provided for @onboardingChoosePlan.
  ///
  /// In en, this message translates to:
  /// **'Choose your subscription'**
  String get onboardingChoosePlan;

  /// No description provided for @onboardingUnlockFeatures.
  ///
  /// In en, this message translates to:
  /// **'Unlock all features'**
  String get onboardingUnlockFeatures;

  /// No description provided for @onboardingPlanEssential.
  ///
  /// In en, this message translates to:
  /// **'Essential'**
  String get onboardingPlanEssential;

  /// No description provided for @onboardingPlanEverything.
  ///
  /// In en, this message translates to:
  /// **'Everything you need'**
  String get onboardingPlanEverything;

  /// No description provided for @onboardingPlanDemanding.
  ///
  /// In en, this message translates to:
  /// **'For the demanding handyman'**
  String get onboardingPlanDemanding;

  /// No description provided for @onboardingPlanMostChosen.
  ///
  /// In en, this message translates to:
  /// **'MOST CHOSEN'**
  String get onboardingPlanMostChosen;

  /// No description provided for @onboardingStartFreeTrial.
  ///
  /// In en, this message translates to:
  /// **'FIRST TIME FREE'**
  String get onboardingStartFreeTrial;

  /// No description provided for @onboardingCalculateArea.
  ///
  /// In en, this message translates to:
  /// **'CALCULATE m²'**
  String get onboardingCalculateArea;

  /// No description provided for @onboardingBack.
  ///
  /// In en, this message translates to:
  /// **'BACK'**
  String get onboardingBack;

  /// No description provided for @onboardingSafe.
  ///
  /// In en, this message translates to:
  /// **'Safe'**
  String get onboardingSafe;

  /// No description provided for @onboardingReliable.
  ///
  /// In en, this message translates to:
  /// **'Reliable'**
  String get onboardingReliable;

  /// No description provided for @onboardingEveryJob.
  ///
  /// In en, this message translates to:
  /// **'For every job'**
  String get onboardingEveryJob;

  /// No description provided for @onboardingBannerHint.
  ///
  /// In en, this message translates to:
  /// **'How to fill in the measurements'**
  String get onboardingBannerHint;

  /// No description provided for @onboardingJobBannerHint.
  ///
  /// In en, this message translates to:
  /// **'Select the trade for your job'**
  String get onboardingJobBannerHint;

  /// No description provided for @onboardingDurationHalfDay.
  ///
  /// In en, this message translates to:
  /// **'Half day (2–4 hours)'**
  String get onboardingDurationHalfDay;

  /// No description provided for @onboardingDurationOneDay.
  ///
  /// In en, this message translates to:
  /// **'1 day'**
  String get onboardingDurationOneDay;

  /// No description provided for @onboardingDurationTwoDays.
  ///
  /// In en, this message translates to:
  /// **'2–3 days'**
  String get onboardingDurationTwoDays;

  /// No description provided for @onboardingDurationOneWeek.
  ///
  /// In en, this message translates to:
  /// **'1 week'**
  String get onboardingDurationOneWeek;

  /// No description provided for @onboardingDurationMultipleWeeks.
  ///
  /// In en, this message translates to:
  /// **'Multiple weeks'**
  String get onboardingDurationMultipleWeeks;

  /// No description provided for @onboardingDurationSelected.
  ///
  /// In en, this message translates to:
  /// **'Estimated duration: {duration}'**
  String onboardingDurationSelected(String duration);

  /// No description provided for @authLogin.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get authLogin;

  /// No description provided for @authWelcomeMessage.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Easy4DIY; glad you\'re here. Please enter your details here and much more.'**
  String get authWelcomeMessage;

  /// No description provided for @authEmail.
  ///
  /// In en, this message translates to:
  /// **'Email Address'**
  String get authEmail;

  /// No description provided for @authEmailHint.
  ///
  /// In en, this message translates to:
  /// **'enter your email address'**
  String get authEmailHint;

  /// No description provided for @authPassword.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get authPassword;

  /// No description provided for @authPasswordHint.
  ///
  /// In en, this message translates to:
  /// **'enter your password'**
  String get authPasswordHint;

  /// No description provided for @authForgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get authForgotPassword;

  /// No description provided for @authNoAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account? '**
  String get authNoAccount;

  /// No description provided for @authCreateOne.
  ///
  /// In en, this message translates to:
  /// **'Create one'**
  String get authCreateOne;

  /// No description provided for @authCreateAccount.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get authCreateAccount;

  /// No description provided for @authWelcomeSignup.
  ///
  /// In en, this message translates to:
  /// **'Welcome! Fill in your details to get started.'**
  String get authWelcomeSignup;

  /// No description provided for @authFullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get authFullName;

  /// No description provided for @authFullNameHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your full name'**
  String get authFullNameHint;

  /// No description provided for @authPhone.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get authPhone;

  /// No description provided for @authPhoneHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your phone number'**
  String get authPhoneHint;

  /// No description provided for @authChoosePassword.
  ///
  /// In en, this message translates to:
  /// **'Choose a password'**
  String get authChoosePassword;

  /// No description provided for @authConfirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm password'**
  String get authConfirmPassword;

  /// No description provided for @authConfirmPasswordHint.
  ///
  /// In en, this message translates to:
  /// **'Confirm your password'**
  String get authConfirmPasswordHint;

  /// No description provided for @authOr.
  ///
  /// In en, this message translates to:
  /// **'OR'**
  String get authOr;

  /// No description provided for @authAlreadyHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account? '**
  String get authAlreadyHaveAccount;

  /// Error shown when login email is not registered
  ///
  /// In en, this message translates to:
  /// **'User not found. Please sign up.'**
  String get authUserNotFound;

  /// Error shown when login password is wrong
  ///
  /// In en, this message translates to:
  /// **'Incorrect password. Please try again.'**
  String get authWrongPassword;

  /// Title of the forgot password dialog
  ///
  /// In en, this message translates to:
  /// **'Forgot password'**
  String get authForgotPasswordTitle;

  /// Description shown in forgot password dialog
  ///
  /// In en, this message translates to:
  /// **'Enter your email address to reset your password.'**
  String get authForgotPasswordDesc;

  /// Short email hint in forgot password field
  ///
  /// In en, this message translates to:
  /// **'your@email.com'**
  String get authEmailHintShort;

  /// Validation error when email field is empty
  ///
  /// In en, this message translates to:
  /// **'Please enter your email'**
  String get authEmailRequired;

  /// Validation error when email format is wrong
  ///
  /// In en, this message translates to:
  /// **'Invalid email address'**
  String get authEmailInvalid;

  /// Error shown when forgot-password email is not found
  ///
  /// In en, this message translates to:
  /// **'No account found with this email address.'**
  String get authNoAccountFound;

  /// Cancel button label
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get authCancel;

  /// Continue button label
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get authContinue;

  /// Title of the new password dialog
  ///
  /// In en, this message translates to:
  /// **'New password'**
  String get authNewPasswordTitle;

  /// Label for the new password field
  ///
  /// In en, this message translates to:
  /// **'New password'**
  String get authNewPasswordLabel;

  /// Validation error when new password field is empty
  ///
  /// In en, this message translates to:
  /// **'Please enter a password'**
  String get authPasswordRequired;

  /// Validation error when new password is too short
  ///
  /// In en, this message translates to:
  /// **'Minimum 6 characters required'**
  String get authPasswordMinLength;

  /// Label for the confirm password field
  ///
  /// In en, this message translates to:
  /// **'Confirm password'**
  String get authConfirmPasswordLabel;

  /// Validation error when confirm password field is empty
  ///
  /// In en, this message translates to:
  /// **'Confirm your password'**
  String get authConfirmPasswordRequired;

  /// Validation error when passwords do not match
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get authPasswordMismatch;

  /// Save button label
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get authSave;

  /// Success message after password is reset
  ///
  /// In en, this message translates to:
  /// **'Password successfully changed!'**
  String get authPasswordChanged;

  /// No description provided for @onboardingPlayVideo.
  ///
  /// In en, this message translates to:
  /// **'Play instruction video'**
  String get onboardingPlayVideo;

  /// No description provided for @onboardingPlanFree.
  ///
  /// In en, this message translates to:
  /// **'USE 1X FOR FREE'**
  String get onboardingPlanFree;

  /// No description provided for @onboardingHowItWorks.
  ///
  /// In en, this message translates to:
  /// **'HOW IT WORKS'**
  String get onboardingHowItWorks;

  /// No description provided for @onboardingFreeStep1.
  ///
  /// In en, this message translates to:
  /// **'Log in with Google or e-mail'**
  String get onboardingFreeStep1;

  /// No description provided for @onboardingFreeStep2.
  ///
  /// In en, this message translates to:
  /// **'Watch 2 short ads'**
  String get onboardingFreeStep2;

  /// No description provided for @onboardingFreeStep3.
  ///
  /// In en, this message translates to:
  /// **'Start 1 job for free'**
  String get onboardingFreeStep3;

  /// No description provided for @onboardingEasyToUse.
  ///
  /// In en, this message translates to:
  /// **'EASY TO USE'**
  String get onboardingEasyToUse;

  /// No description provided for @onboardingDownloadApp.
  ///
  /// In en, this message translates to:
  /// **'download the app on smartphone or website'**
  String get onboardingDownloadApp;

  /// No description provided for @onboardingPlanPremium.
  ///
  /// In en, this message translates to:
  /// **'MONTHLY'**
  String get onboardingPlanPremium;

  /// No description provided for @onboardingPlanYearly.
  ///
  /// In en, this message translates to:
  /// **'YEARLY'**
  String get onboardingPlanYearly;

  /// No description provided for @onboardingBestChoice.
  ///
  /// In en, this message translates to:
  /// **'BEST CHOICE'**
  String get onboardingBestChoice;

  /// No description provided for @onboardingUnlimitedJobs.
  ///
  /// In en, this message translates to:
  /// **'Unlimited jobs'**
  String get onboardingUnlimitedJobs;

  /// No description provided for @onboardingAllFeatures.
  ///
  /// In en, this message translates to:
  /// **'All features'**
  String get onboardingAllFeatures;

  /// No description provided for @onboardingNoAds.
  ///
  /// In en, this message translates to:
  /// **'No ads'**
  String get onboardingNoAds;

  /// No description provided for @onboardingPremiumSupport.
  ///
  /// In en, this message translates to:
  /// **'Multilingual'**
  String get onboardingPremiumSupport;

  /// No description provided for @onboardingUpdateNewJobs.
  ///
  /// In en, this message translates to:
  /// **'Update & new jobs'**
  String get onboardingUpdateNewJobs;

  /// No description provided for @onboardingChoosePremium.
  ///
  /// In en, this message translates to:
  /// **'CHOOSE MONTHLY'**
  String get onboardingChoosePremium;

  /// No description provided for @onboardingChooseYearly.
  ///
  /// In en, this message translates to:
  /// **'CHOOSE YEARLY'**
  String get onboardingChooseYearly;

  /// No description provided for @onboardingSave17.
  ///
  /// In en, this message translates to:
  /// **'SAVE 44%'**
  String get onboardingSave17;

  /// No description provided for @onboardingSubscriptionChoice.
  ///
  /// In en, this message translates to:
  /// **'Subscription choice'**
  String get onboardingSubscriptionChoice;

  /// No description provided for @onboardingIndicativePrices.
  ///
  /// In en, this message translates to:
  /// **'Prices are indicative'**
  String get onboardingIndicativePrices;

  /// No description provided for @onboardingIndicativeCalculation.
  ///
  /// In en, this message translates to:
  /// **'Note: This is an indicative calculation.'**
  String get onboardingIndicativeCalculation;

  /// No description provided for @subscriptionChoosePlan.
  ///
  /// In en, this message translates to:
  /// **'Choose your package'**
  String get subscriptionChoosePlan;

  /// No description provided for @subscriptionMonthlyPlan.
  ///
  /// In en, this message translates to:
  /// **'Monthly Plan'**
  String get subscriptionMonthlyPlan;

  /// No description provided for @subscriptionYearlyPlan.
  ///
  /// In en, this message translates to:
  /// **'Yearly Plan'**
  String get subscriptionYearlyPlan;

  /// No description provided for @subscriptionRecurring.
  ///
  /// In en, this message translates to:
  /// **'Recurring Subscription'**
  String get subscriptionRecurring;

  /// No description provided for @subscriptionPerMonth.
  ///
  /// In en, this message translates to:
  /// **'Per Month'**
  String get subscriptionPerMonth;

  /// No description provided for @subscriptionPerYear.
  ///
  /// In en, this message translates to:
  /// **'Per Year'**
  String get subscriptionPerYear;

  /// No description provided for @subscriptionMostPopular.
  ///
  /// In en, this message translates to:
  /// **'Most Popular'**
  String get subscriptionMostPopular;

  /// No description provided for @subscriptionBestValue.
  ///
  /// In en, this message translates to:
  /// **'Best Value'**
  String get subscriptionBestValue;

  /// No description provided for @subscriptionTwoMonthsFree.
  ///
  /// In en, this message translates to:
  /// **'5 months free'**
  String get subscriptionTwoMonthsFree;

  /// No description provided for @subscriptionEverythingIncluded.
  ///
  /// In en, this message translates to:
  /// **'Everything Included'**
  String get subscriptionEverythingIncluded;

  /// No description provided for @subscriptionPremiumActivated.
  ///
  /// In en, this message translates to:
  /// **'Premium Activated! Thank you for your purchase.'**
  String get subscriptionPremiumActivated;

  /// No description provided for @subscriptionVerifying.
  ///
  /// In en, this message translates to:
  /// **'Verifying...'**
  String get subscriptionVerifying;

  /// No description provided for @subscriptionProcessing.
  ///
  /// In en, this message translates to:
  /// **'Processing...'**
  String get subscriptionProcessing;

  /// No description provided for @subscriptionSubscribeWithPrice.
  ///
  /// In en, this message translates to:
  /// **'Subscribe now — {price}'**
  String subscriptionSubscribeWithPrice(String price);

  /// No description provided for @subscriptionSubscribe.
  ///
  /// In en, this message translates to:
  /// **'Subscribe now'**
  String get subscriptionSubscribe;

  /// No description provided for @subscriptionRestoring.
  ///
  /// In en, this message translates to:
  /// **'Restoring...'**
  String get subscriptionRestoring;

  /// No description provided for @subscriptionRestorePurchases.
  ///
  /// In en, this message translates to:
  /// **'Restore Purchases'**
  String get subscriptionRestorePurchases;

  /// No description provided for @subscriptionManageSubscription.
  ///
  /// In en, this message translates to:
  /// **'Manage Subscription'**
  String get subscriptionManageSubscription;

  /// No description provided for @subscriptionPlansNotLoaded.
  ///
  /// In en, this message translates to:
  /// **'Subscription plans could not be loaded.'**
  String get subscriptionPlansNotLoaded;

  /// No description provided for @subscriptionLoading.
  ///
  /// In en, this message translates to:
  /// **'Loading…'**
  String get subscriptionLoading;

  /// No description provided for @subscriptionRetry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get subscriptionRetry;

  /// No description provided for @onboardingClose.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get onboardingClose;

  /// No description provided for @onboardingAveragePrice.
  ///
  /// In en, this message translates to:
  /// **'Average price'**
  String get onboardingAveragePrice;

  /// No description provided for @onboardingPerMonth.
  ///
  /// In en, this message translates to:
  /// **'/MONTH'**
  String get onboardingPerMonth;

  /// No description provided for @onboardingPerYear.
  ///
  /// In en, this message translates to:
  /// **'/YEAR'**
  String get onboardingPerYear;

  /// No description provided for @onboardingMeasurementTipFloor.
  ///
  /// In en, this message translates to:
  /// **'Floor (l x w)'**
  String get onboardingMeasurementTipFloor;

  /// No description provided for @onboardingMeasurementTipFloorDesc.
  ///
  /// In en, this message translates to:
  /// **'For a floor, measure the length and width (l x w).'**
  String get onboardingMeasurementTipFloorDesc;

  /// No description provided for @onboardingMeasurementTipWall.
  ///
  /// In en, this message translates to:
  /// **'Wall (l x h)'**
  String get onboardingMeasurementTipWall;

  /// No description provided for @onboardingMeasurementTipWallDesc.
  ///
  /// In en, this message translates to:
  /// **'For a wall, measure the length and height (l x h).'**
  String get onboardingMeasurementTipWallDesc;

  /// No description provided for @onboardingMeasurementTipCeiling.
  ///
  /// In en, this message translates to:
  /// **'Ceiling (l x w)'**
  String get onboardingMeasurementTipCeiling;

  /// No description provided for @onboardingMeasurementTipCeilingDesc.
  ///
  /// In en, this message translates to:
  /// **'For a ceiling, measure the length and width (l x w).'**
  String get onboardingMeasurementTipCeilingDesc;

  /// No description provided for @onboardingMeasurementTipNote.
  ///
  /// In en, this message translates to:
  /// **'Enter the dimensions in meters and the app automatically calculates the area in m².'**
  String get onboardingMeasurementTipNote;

  /// No description provided for @faqBehangenQ1.
  ///
  /// In en, this message translates to:
  /// **'How long does wallpapering take on average?'**
  String get faqBehangenQ1;

  /// No description provided for @faqBehangenA1.
  ///
  /// In en, this message translates to:
  /// **'Wallpapering a room takes on average half to a full day, depending on the size of the room and the number of corners and niches.'**
  String get faqBehangenA1;

  /// No description provided for @faqBehangenQ2.
  ///
  /// In en, this message translates to:
  /// **'How many wallpaper rolls do I need?'**
  String get faqBehangenQ2;

  /// No description provided for @faqBehangenA2.
  ///
  /// In en, this message translates to:
  /// **'Calculate the room perimeter (in meters) multiplied by the height. A standard roll covers about 5 m². Don\'t forget to order 10% extra for cutting loss.'**
  String get faqBehangenA2;

  /// No description provided for @faqBehangenQ3.
  ///
  /// In en, this message translates to:
  /// **'What tools do I need?'**
  String get faqBehangenQ3;

  /// No description provided for @faqBehangenA3.
  ///
  /// In en, this message translates to:
  /// **'For wallpapering you need: a wallpaper table, wallpaper brush, paste roller, tape measure, spirit level, pencil, scissors or wallpaper knife, and sponges to wipe away excess paste.'**
  String get faqBehangenA3;

  /// No description provided for @faqBehangenQ4.
  ///
  /// In en, this message translates to:
  /// **'Which wallpaper paste should I use?'**
  String get faqBehangenQ4;

  /// No description provided for @faqBehangenA4.
  ///
  /// In en, this message translates to:
  /// **'This depends on the type of wallpaper. For non-woven wallpaper, use a special non-woven paste; for regular wallpaper, use a universal paste. Always check the packaging.'**
  String get faqBehangenA4;

  /// No description provided for @faqBehangenQ5.
  ///
  /// In en, this message translates to:
  /// **'How do I prepare the wall?'**
  String get faqBehangenQ5;

  /// No description provided for @faqBehangenA5.
  ///
  /// In en, this message translates to:
  /// **'Remove old wallpaper thoroughly and clean the wall. Let the wall dry completely. Then apply a coat of wallpaper primer for better adhesion.'**
  String get faqBehangenA5;

  /// No description provided for @faqBehangenQ6.
  ///
  /// In en, this message translates to:
  /// **'How do I start in the room?'**
  String get faqBehangenQ6;

  /// No description provided for @faqBehangenA6.
  ///
  /// In en, this message translates to:
  /// **'Always start next to a window or door. Draw a vertical line with a spirit level as a starting point to prevent crooked strips.'**
  String get faqBehangenA6;

  /// No description provided for @faqBehangenQ7.
  ///
  /// In en, this message translates to:
  /// **'How do I handle corners correctly?'**
  String get faqBehangenQ7;

  /// No description provided for @faqBehangenA7.
  ///
  /// In en, this message translates to:
  /// **'For inner corners, let the strip run 1–2 cm around the corner. For outer corners, fold the strip at least 2 cm around the corner.'**
  String get faqBehangenA7;

  /// No description provided for @faqBehangenQ8.
  ///
  /// In en, this message translates to:
  /// **'Can I do this as a beginner?'**
  String get faqBehangenQ8;

  /// No description provided for @faqBehangenA8.
  ///
  /// In en, this message translates to:
  /// **'Yes, with the right preparation wallpapering is perfectly manageable on your own. Start with a simple plain wallpaper without large patterns.'**
  String get faqBehangenA8;

  /// No description provided for @faqBehangenQ9.
  ///
  /// In en, this message translates to:
  /// **'How do I prevent air bubbles?'**
  String get faqBehangenQ9;

  /// No description provided for @faqBehangenA9.
  ///
  /// In en, this message translates to:
  /// **'Smooth the wallpaper immediately after applying, from top to bottom, with a wallpaper brush. Work any bubbles toward the edges.'**
  String get faqBehangenA9;

  /// No description provided for @faqBehangenQ10.
  ///
  /// In en, this message translates to:
  /// **'How long to wait before using the room?'**
  String get faqBehangenQ10;

  /// No description provided for @faqBehangenA10.
  ///
  /// In en, this message translates to:
  /// **'Let the wallpaper dry for at least 24 hours. Ensure adequate ventilation but avoid direct drafts.'**
  String get faqBehangenA10;

  /// No description provided for @faqBehangenQ11.
  ///
  /// In en, this message translates to:
  /// **'What are common wallpapering mistakes?'**
  String get faqBehangenQ11;

  /// No description provided for @faqBehangenA11.
  ///
  /// In en, this message translates to:
  /// **'The most common mistakes are: not properly preparing the wall, making the wallpaper too wet, and not smoothing out air bubbles.'**
  String get faqBehangenA11;

  /// No description provided for @faqBehangenQ12.
  ///
  /// In en, this message translates to:
  /// **'How much extra wallpaper should I order?'**
  String get faqBehangenQ12;

  /// No description provided for @faqBehangenA12.
  ///
  /// In en, this message translates to:
  /// **'Always order 10–15% extra. With patterns you need to allow extra for the pattern repeat.'**
  String get faqBehangenA12;

  /// No description provided for @faqBehangenQ13.
  ///
  /// In en, this message translates to:
  /// **'What do I do if the wallpaper comes loose?'**
  String get faqBehangenQ13;

  /// No description provided for @faqBehangenA13.
  ///
  /// In en, this message translates to:
  /// **'Press the loose edge up, apply fresh paste with a small brush and wipe away excess paste with a damp sponge.'**
  String get faqBehangenA13;

  /// No description provided for @faqBehangenQ14.
  ///
  /// In en, this message translates to:
  /// **'Which DIY store do you recommend?'**
  String get faqBehangenQ14;

  /// No description provided for @faqBehangenA14.
  ///
  /// In en, this message translates to:
  /// **'For DIY homeowners, we recommend Gamma and Hornbach (or Home Depot and Lowe\'s) for a wide range of wallpaper. For professional contractors, trade suppliers like Bouwmaat and Jongeneel offer commercial-grade materials.'**
  String get faqBehangenA14;

  /// No description provided for @faqBehangenQ15.
  ///
  /// In en, this message translates to:
  /// **'Do I need to remove old paint before wallpapering?'**
  String get faqBehangenQ15;

  /// No description provided for @faqBehangenA15.
  ///
  /// In en, this message translates to:
  /// **'Not always. Make sure the paint layer is firmly attached, clean and grease-free. Loose paint must be removed.'**
  String get faqBehangenA15;

  /// No description provided for @faqBehangenQ16.
  ///
  /// In en, this message translates to:
  /// **'Can I wallpaper over existing wallpaper?'**
  String get faqBehangenQ16;

  /// No description provided for @faqBehangenA16.
  ///
  /// In en, this message translates to:
  /// **'This is usually not recommended. Remove old wallpaper for the best result and good adhesion of the new wallpaper.'**
  String get faqBehangenA16;

  /// No description provided for @faqBehangenQ17.
  ///
  /// In en, this message translates to:
  /// **'What temperature is ideal for wallpapering?'**
  String get faqBehangenQ17;

  /// No description provided for @faqBehangenA17.
  ///
  /// In en, this message translates to:
  /// **'The ideal room temperature is between 18°C and 22°C. Avoid extreme cold, heat and drafts during drying.'**
  String get faqBehangenA17;

  /// No description provided for @faqBehangenQ18.
  ///
  /// In en, this message translates to:
  /// **'How do I cut wallpaper neatly?'**
  String get faqBehangenQ18;

  /// No description provided for @faqBehangenA18.
  ///
  /// In en, this message translates to:
  /// **'Use a sharp wallpaper knife and a ruler or spatula as a guide. Replace the knife regularly for clean cuts.'**
  String get faqBehangenA18;

  /// No description provided for @faqBehangenQ19.
  ///
  /// In en, this message translates to:
  /// **'How do I clean wallpaper?'**
  String get faqBehangenQ19;

  /// No description provided for @faqBehangenA19.
  ///
  /// In en, this message translates to:
  /// **'Washable wallpaper can be carefully cleaned with a damp cloth. Always check the manufacturer\'s care instructions first.'**
  String get faqBehangenA19;

  /// No description provided for @faqBehangenQ20.
  ///
  /// In en, this message translates to:
  /// **'How long does wallpaper last on average?'**
  String get faqBehangenQ20;

  /// No description provided for @faqBehangenA20.
  ///
  /// In en, this message translates to:
  /// **'Quality wallpaper can last 10 to 15 years with normal use, depending on the room and maintenance conditions.'**
  String get faqBehangenA20;

  /// No description provided for @faqPainterQ1.
  ///
  /// In en, this message translates to:
  /// **'How long does painting take on average?'**
  String get faqPainterQ1;

  /// No description provided for @faqPainterA1.
  ///
  /// In en, this message translates to:
  /// **'Painting an average room (walls + ceiling) takes 4–8 hours including preparation. Accounting for drying time between coats it can take 1–2 days.'**
  String get faqPainterA1;

  /// No description provided for @faqPainterQ2.
  ///
  /// In en, this message translates to:
  /// **'How much paint do I need?'**
  String get faqPainterQ2;

  /// No description provided for @faqPainterA2.
  ///
  /// In en, this message translates to:
  /// **'One litre of paint covers on average 10–12 m² per coat. Measure the surface and allow for 2 coats. Order 10% extra as a reserve.'**
  String get faqPainterA2;

  /// No description provided for @faqPainterQ3.
  ///
  /// In en, this message translates to:
  /// **'What tools do I need?'**
  String get faqPainterQ3;

  /// No description provided for @faqPainterA3.
  ///
  /// In en, this message translates to:
  /// **'You need: paint roller(s), brush(es), paint tray, masking tape, sandpaper, dust sheets and possibly a ladder.'**
  String get faqPainterA3;

  /// No description provided for @faqPainterQ4.
  ///
  /// In en, this message translates to:
  /// **'How do I prepare the wall?'**
  String get faqPainterQ4;

  /// No description provided for @faqPainterA4.
  ///
  /// In en, this message translates to:
  /// **'Fill any cracks and holes, sand rough areas, remove dust and apply a coat of primer on new or very absorbent walls.'**
  String get faqPainterA4;

  /// No description provided for @faqPainterQ5.
  ///
  /// In en, this message translates to:
  /// **'How long should I wait between coats?'**
  String get faqPainterQ5;

  /// No description provided for @faqPainterA5.
  ///
  /// In en, this message translates to:
  /// **'Wait at least 2–4 hours between coats (see drying time on the packaging). Full curing takes 24–48 hours.'**
  String get faqPainterA5;

  /// No description provided for @faqPainterQ6.
  ///
  /// In en, this message translates to:
  /// **'Can I do this as a beginner?'**
  String get faqPainterQ6;

  /// No description provided for @faqPainterA6.
  ///
  /// In en, this message translates to:
  /// **'Yes, painting is perfectly manageable on your own. Take your time with proper preparation and masking and the result will be excellent.'**
  String get faqPainterA6;

  /// No description provided for @faqPainterQ7.
  ///
  /// In en, this message translates to:
  /// **'Which paint should I choose for interior walls?'**
  String get faqPainterQ7;

  /// No description provided for @faqPainterA7.
  ///
  /// In en, this message translates to:
  /// **'Choose water-based wall paint for interior walls. Pay attention to the washability category (1–5 stars). For wet rooms, choose bathroom paint.'**
  String get faqPainterA7;

  /// No description provided for @faqPainterQ8.
  ///
  /// In en, this message translates to:
  /// **'What are common painting mistakes?'**
  String get faqPainterQ8;

  /// No description provided for @faqPainterA8.
  ///
  /// In en, this message translates to:
  /// **'Applying coats that are too thin, insufficient drying between coats, poor masking and not cleaning the surface are the most common mistakes.'**
  String get faqPainterA8;

  /// No description provided for @faqPainterQ9.
  ///
  /// In en, this message translates to:
  /// **'Do I need to use primer?'**
  String get faqPainterQ9;

  /// No description provided for @faqPainterA9.
  ///
  /// In en, this message translates to:
  /// **'Primer improves adhesion and ensures a more even finish, especially on new or repaired surfaces.'**
  String get faqPainterA9;

  /// No description provided for @faqPainterQ10.
  ///
  /// In en, this message translates to:
  /// **'Can I paint over old paint?'**
  String get faqPainterQ10;

  /// No description provided for @faqPainterA10.
  ///
  /// In en, this message translates to:
  /// **'Yes, if the old paint is in good condition. Clean and lightly sand the surface first.'**
  String get faqPainterA10;

  /// No description provided for @faqPainterQ11.
  ///
  /// In en, this message translates to:
  /// **'What temperature is best for painting?'**
  String get faqPainterQ11;

  /// No description provided for @faqPainterA11.
  ///
  /// In en, this message translates to:
  /// **'Most paints perform best between 10°C and 25°C.'**
  String get faqPainterA11;

  /// No description provided for @faqPainterQ12.
  ///
  /// In en, this message translates to:
  /// **'How do I avoid roller marks?'**
  String get faqPainterQ12;

  /// No description provided for @faqPainterA12.
  ///
  /// In en, this message translates to:
  /// **'Use even pressure and maintain a wet edge while painting.'**
  String get faqPainterA12;

  /// No description provided for @faqPainterQ13.
  ///
  /// In en, this message translates to:
  /// **'Should I remove furniture?'**
  String get faqPainterQ13;

  /// No description provided for @faqPainterA13.
  ///
  /// In en, this message translates to:
  /// **'Move furniture away from walls and cover it with protective sheets.'**
  String get faqPainterA13;

  /// No description provided for @faqPainterQ14.
  ///
  /// In en, this message translates to:
  /// **'How do I clean paint brushes?'**
  String get faqPainterQ14;

  /// No description provided for @faqPainterA14.
  ///
  /// In en, this message translates to:
  /// **'Water-based paint can be cleaned with water. Solvent-based paint requires paint thinner.'**
  String get faqPainterA14;

  /// No description provided for @faqPainterQ15.
  ///
  /// In en, this message translates to:
  /// **'Can I paint in humid conditions?'**
  String get faqPainterQ15;

  /// No description provided for @faqPainterA15.
  ///
  /// In en, this message translates to:
  /// **'High humidity can slow drying and affect the finish. Ventilate the room well.'**
  String get faqPainterA15;

  /// No description provided for @faqPainterQ16.
  ///
  /// In en, this message translates to:
  /// **'How many coats are recommended?'**
  String get faqPainterQ16;

  /// No description provided for @faqPainterA16.
  ///
  /// In en, this message translates to:
  /// **'Two coats provide the best coverage and durability.'**
  String get faqPainterA16;

  /// No description provided for @faqPainterQ17.
  ///
  /// In en, this message translates to:
  /// **'What finish should I choose?'**
  String get faqPainterQ17;

  /// No description provided for @faqPainterA17.
  ///
  /// In en, this message translates to:
  /// **'Matt hides imperfections, satin is durable, and gloss is highly washable.'**
  String get faqPainterA17;

  /// No description provided for @faqPainterQ18.
  ///
  /// In en, this message translates to:
  /// **'How long does paint last?'**
  String get faqPainterQ18;

  /// No description provided for @faqPainterA18.
  ///
  /// In en, this message translates to:
  /// **'Unopened paint can last several years when stored properly.'**
  String get faqPainterA18;

  /// No description provided for @faqPainterQ19.
  ///
  /// In en, this message translates to:
  /// **'Can I paint ceilings first?'**
  String get faqPainterQ19;

  /// No description provided for @faqPainterA19.
  ///
  /// In en, this message translates to:
  /// **'Yes, always paint ceilings before walls to avoid splatters.'**
  String get faqPainterA19;

  /// No description provided for @faqPainterQ20.
  ///
  /// In en, this message translates to:
  /// **'How do I calculate painting costs?'**
  String get faqPainterQ20;

  /// No description provided for @faqPainterA20.
  ///
  /// In en, this message translates to:
  /// **'Multiply wall area by paint coverage and material costs.'**
  String get faqPainterA20;

  /// No description provided for @faqMuurSauzenQ1.
  ///
  /// In en, this message translates to:
  /// **'Which latex should I use in a bathroom or kitchen?'**
  String get faqMuurSauzenQ1;

  /// No description provided for @faqMuurSauzenA1.
  ///
  /// In en, this message translates to:
  /// **'Use moisture-resistant latex in a bathroom or kitchen. This is more resistant to moisture and mildew. Regular latex can start to peel or develop mildew more quickly in humid spaces.'**
  String get faqMuurSauzenA1;

  /// No description provided for @faqMuurSauzenQ2.
  ///
  /// In en, this message translates to:
  /// **'Should I degrease the wall first?'**
  String get faqMuurSauzenQ2;

  /// No description provided for @faqMuurSauzenA2.
  ///
  /// In en, this message translates to:
  /// **'Yes, for greasy or dirty spots (e.g. in a kitchen), first clean with an all-purpose cleaner/degreaser — wear gloves — then allow to dry before painting.'**
  String get faqMuurSauzenA2;

  /// No description provided for @faqMuurSauzenQ3.
  ///
  /// In en, this message translates to:
  /// **'When should I use primer?'**
  String get faqMuurSauzenQ3;

  /// No description provided for @faqMuurSauzenA3.
  ///
  /// In en, this message translates to:
  /// **'Use primer on an absorbent, new or heavily repaired surface, so the paint covers evenly and is less likely to stain.'**
  String get faqMuurSauzenA3;

  /// No description provided for @faqMuurSauzenQ4.
  ///
  /// In en, this message translates to:
  /// **'How do I fill holes and cracks before painting?'**
  String get faqMuurSauzenQ4;

  /// No description provided for @faqMuurSauzenA4.
  ///
  /// In en, this message translates to:
  /// **'Fill holes and cracks with wall filler or plaster, allow to dry, and sand smooth. Seal small gaps with acrylic sealant. This prevents imperfections remaining visible through the paint.'**
  String get faqMuurSauzenA4;

  /// No description provided for @faqMuurSauzenQ5.
  ///
  /// In en, this message translates to:
  /// **'How many coats are needed?'**
  String get faqMuurSauzenQ5;

  /// No description provided for @faqMuurSauzenA5.
  ///
  /// In en, this message translates to:
  /// **'Allow for at least two coats for an even result; if changing colour (e.g. from dark to light) a third coat may be required.'**
  String get faqMuurSauzenA5;

  /// No description provided for @faqMuurSauzenQ6.
  ///
  /// In en, this message translates to:
  /// **'Should I sand before painting?'**
  String get faqMuurSauzenQ6;

  /// No description provided for @faqMuurSauzenA6.
  ///
  /// In en, this message translates to:
  /// **'Light sanding is part of preparation, especially on an uneven or glossy surface, so the paint adheres better. Wear a dust mask while doing this. For larger areas, a sanding machine can speed up the work.'**
  String get faqMuurSauzenA6;

  /// No description provided for @faqMuurSauzenQ7.
  ///
  /// In en, this message translates to:
  /// **'How do I calculate how many litres of paint I need?'**
  String get faqMuurSauzenQ7;

  /// No description provided for @faqMuurSauzenA7.
  ///
  /// In en, this message translates to:
  /// **'The app calculates this automatically based on your entered m², the number of coats, and the coverage of the selected product.'**
  String get faqMuurSauzenA7;

  /// No description provided for @faqMuurSauzenQ8.
  ///
  /// In en, this message translates to:
  /// **'Can I use a brush instead of a roller?'**
  String get faqMuurSauzenQ8;

  /// No description provided for @faqMuurSauzenA8.
  ///
  /// In en, this message translates to:
  /// **'For large surfaces, a roller is faster and more even; use a brush for corners, edges and near the baseboard.'**
  String get faqMuurSauzenA8;

  /// No description provided for @faqMuurSauzenQ9.
  ///
  /// In en, this message translates to:
  /// **'Should I let the paint dry between coats?'**
  String get faqMuurSauzenQ9;

  /// No description provided for @faqMuurSauzenA9.
  ///
  /// In en, this message translates to:
  /// **'Yes, always follow the drying and recoating time on the paint packaging.'**
  String get faqMuurSauzenA9;

  /// No description provided for @faqMuurSauzenQ10.
  ///
  /// In en, this message translates to:
  /// **'Can I paint a wall without primer?'**
  String get faqMuurSauzenQ10;

  /// No description provided for @faqMuurSauzenA10.
  ///
  /// In en, this message translates to:
  /// **'On a well-bonding, non-absorbent surface it is sometimes possible, but primer improves adhesion and the result. Follow the product advice.'**
  String get faqMuurSauzenA10;

  /// No description provided for @faqPlafondSauzenQ1.
  ///
  /// In en, this message translates to:
  /// **'Which latex should I use in a bathroom or kitchen?'**
  String get faqPlafondSauzenQ1;

  /// No description provided for @faqPlafondSauzenA1.
  ///
  /// In en, this message translates to:
  /// **'Use moisture-resistant latex in a bathroom or kitchen. This is more resistant to moisture and mildew. Regular latex can start to peel or develop mildew more quickly in humid spaces.'**
  String get faqPlafondSauzenA1;

  /// No description provided for @faqPlafondSauzenQ2.
  ///
  /// In en, this message translates to:
  /// **'Do I need an extension pole?'**
  String get faqPlafondSauzenQ2;

  /// No description provided for @faqPlafondSauzenA2.
  ///
  /// In en, this message translates to:
  /// **'An extension pole on the roller is recommended so you can reach the ceiling without a ladder or with less ladder work.'**
  String get faqPlafondSauzenA2;

  /// No description provided for @faqPlafondSauzenQ3.
  ///
  /// In en, this message translates to:
  /// **'Should I cover furniture and the floor?'**
  String get faqPlafondSauzenQ3;

  /// No description provided for @faqPlafondSauzenA3.
  ///
  /// In en, this message translates to:
  /// **'Yes, cover the floor and furniture with dust sheets; ceiling work splashes more than wall work.'**
  String get faqPlafondSauzenA3;

  /// No description provided for @faqPlafondSauzenQ4.
  ///
  /// In en, this message translates to:
  /// **'How do I fill holes and cracks before painting?'**
  String get faqPlafondSauzenQ4;

  /// No description provided for @faqPlafondSauzenA4.
  ///
  /// In en, this message translates to:
  /// **'Fill holes and cracks with wall filler or plaster, allow to dry, and sand smooth. This prevents imperfections remaining visible through the paint.'**
  String get faqPlafondSauzenA4;

  /// No description provided for @faqPlafondSauzenQ5.
  ///
  /// In en, this message translates to:
  /// **'How many coats are needed?'**
  String get faqPlafondSauzenQ5;

  /// No description provided for @faqPlafondSauzenA5.
  ///
  /// In en, this message translates to:
  /// **'Here too, allow for at least two coats for an even, opaque finish.'**
  String get faqPlafondSauzenA5;

  /// No description provided for @faqPlafondSauzenQ6.
  ///
  /// In en, this message translates to:
  /// **'Which roller thickness is suitable for a ceiling?'**
  String get faqPlafondSauzenQ6;

  /// No description provided for @faqPlafondSauzenA6.
  ///
  /// In en, this message translates to:
  /// **'A roller with short to medium pile works well on a smooth ceiling; for a rough or textured ceiling, choose a roller with longer pile.'**
  String get faqPlafondSauzenA6;

  /// No description provided for @faqPlafondSauzenQ7.
  ///
  /// In en, this message translates to:
  /// **'How do I prevent splashes and drips?'**
  String get faqPlafondSauzenQ7;

  /// No description provided for @faqPlafondSauzenA7.
  ///
  /// In en, this message translates to:
  /// **'Work with a properly rolled-out roller (not too much paint) and roll in calm, overlapping passes.'**
  String get faqPlafondSauzenA7;

  /// No description provided for @faqPlafondSauzenQ8.
  ///
  /// In en, this message translates to:
  /// **'Should I prime first?'**
  String get faqPlafondSauzenQ8;

  /// No description provided for @faqPlafondSauzenA8.
  ///
  /// In en, this message translates to:
  /// **'Yes, for a new or absorbent surface; for an already painted ceiling in good condition this is usually not necessary.'**
  String get faqPlafondSauzenA8;

  /// No description provided for @faqPlafondSauzenQ9.
  ///
  /// In en, this message translates to:
  /// **'What if there are stains, for example from water or nicotine?'**
  String get faqPlafondSauzenQ9;

  /// No description provided for @faqPlafondSauzenA9.
  ///
  /// In en, this message translates to:
  /// **'Treat these first with a suitable stain-blocking primer, otherwise they may show through again after painting.'**
  String get faqPlafondSauzenA9;

  /// No description provided for @faqPlafondSauzenQ10.
  ///
  /// In en, this message translates to:
  /// **'Should I always paint a ceiling twice?'**
  String get faqPlafondSauzenQ10;

  /// No description provided for @faqPlafondSauzenA10.
  ///
  /// In en, this message translates to:
  /// **'For an even result, two coats are almost always needed. For a heavily absorbent or dark surface, an extra coat may be required.'**
  String get faqPlafondSauzenA10;

  /// No description provided for @faqBehangenDoc4Q1.
  ///
  /// In en, this message translates to:
  /// **'Non-woven or paper wallpaper, what is the difference?'**
  String get faqBehangenDoc4Q1;

  /// No description provided for @faqBehangenDoc4A1.
  ///
  /// In en, this message translates to:
  /// **'With non-woven wallpaper the adhesive goes on the wall and you hang the wallpaper dry; with paper wallpaper the adhesive goes on the wallpaper itself, which then needs to soak for a while.'**
  String get faqBehangenDoc4A1;

  /// No description provided for @faqBehangenDoc4Q2.
  ///
  /// In en, this message translates to:
  /// **'Should I level the wall first?'**
  String get faqBehangenDoc4Q2;

  /// No description provided for @faqBehangenDoc4A2.
  ///
  /// In en, this message translates to:
  /// **'Yes, the wall must be flat and clean before wallpapering. Repair holes and cracks with wall filler or levelling compound, allow to dry, and sand smooth.'**
  String get faqBehangenDoc4A2;

  /// No description provided for @faqBehangenDoc4Q3.
  ///
  /// In en, this message translates to:
  /// **'Do I need a wallpaper table?'**
  String get faqBehangenDoc4Q3;

  /// No description provided for @faqBehangenDoc4A3.
  ///
  /// In en, this message translates to:
  /// **'Only for traditional paper wallpaper, to paste and allow the wallpaper to soak. A wallpaper table is not needed for non-woven wallpaper.'**
  String get faqBehangenDoc4A3;

  /// No description provided for @faqBehangenDoc4Q4.
  ///
  /// In en, this message translates to:
  /// **'Which roll width should I choose?'**
  String get faqBehangenDoc4Q4;

  /// No description provided for @faqBehangenDoc4A4.
  ///
  /// In en, this message translates to:
  /// **'Non-woven wallpaper is available in 53 cm and 70 cm widths. Choose based on wall height and pattern. Calculate using the actual roll width.'**
  String get faqBehangenDoc4A4;

  /// No description provided for @faqBehangenDoc4Q5.
  ///
  /// In en, this message translates to:
  /// **'What is pattern repeat waste?'**
  String get faqBehangenDoc4Q5;

  /// No description provided for @faqBehangenDoc4A5.
  ///
  /// In en, this message translates to:
  /// **'With patterned wallpaper you must align each strip with the pattern, which means you need to trim pieces. Allow for approximately 10% extra material.'**
  String get faqBehangenDoc4A5;

  /// No description provided for @faqBehangenDoc4Q6.
  ///
  /// In en, this message translates to:
  /// **'Which adhesive should I use?'**
  String get faqBehangenDoc4Q6;

  /// No description provided for @faqBehangenDoc4A6.
  ///
  /// In en, this message translates to:
  /// **'It depends on the wallpaper type and weight; follow the adhesive advice on the wallpaper roll or the adhesive packaging. Wear gloves during prolonged contact with adhesive.'**
  String get faqBehangenDoc4A6;

  /// No description provided for @faqBehangenDoc4Q7.
  ///
  /// In en, this message translates to:
  /// **'How do I deal with corners and electrical outlets?'**
  String get faqBehangenDoc4Q7;

  /// No description provided for @faqBehangenDoc4A7.
  ///
  /// In en, this message translates to:
  /// **'For electrical outlets and switches, always turn off the power first, and work in corners with smaller, overlapping strips for a tight join.'**
  String get faqBehangenDoc4A7;

  /// No description provided for @faqBehangenDoc4Q8.
  ///
  /// In en, this message translates to:
  /// **'What should I do about drafts while drying?'**
  String get faqBehangenDoc4Q8;

  /// No description provided for @faqBehangenDoc4A8.
  ///
  /// In en, this message translates to:
  /// **'Avoid strong drafts (open windows/doors) during drying; this can cause seams to lift or come loose.'**
  String get faqBehangenDoc4A8;

  /// No description provided for @faqBehangenDoc4Q9.
  ///
  /// In en, this message translates to:
  /// **'Can I simply wallpaper over old wallpaper?'**
  String get faqBehangenDoc4Q9;

  /// No description provided for @faqBehangenDoc4A9.
  ///
  /// In en, this message translates to:
  /// **'This is not recommended; when removing suitable old wallpaper use a wallpaper steamer if applicable, and start with a clean, flat surface.'**
  String get faqBehangenDoc4A9;

  /// No description provided for @faqBehangenDoc4Q10.
  ///
  /// In en, this message translates to:
  /// **'How do I prevent air bubbles under the wallpaper?'**
  String get faqBehangenDoc4Q10;

  /// No description provided for @faqBehangenDoc4A10.
  ///
  /// In en, this message translates to:
  /// **'Work in small sections, smooth the wallpaper well with a wallpaper brush or seam roller, and ensure the adhesive is applied evenly.'**
  String get faqBehangenDoc4A10;

  /// No description provided for @faqKozijnSchilderenQ1.
  ///
  /// In en, this message translates to:
  /// **'Should I degrease first?'**
  String get faqKozijnSchilderenQ1;

  /// No description provided for @faqKozijnSchilderenA1.
  ///
  /// In en, this message translates to:
  /// **'Yes, degreasing is the first step, especially for frames and doors that are frequently touched. Wear gloves while doing this.'**
  String get faqKozijnSchilderenA1;

  /// No description provided for @faqKozijnSchilderenQ2.
  ///
  /// In en, this message translates to:
  /// **'When should I use primer?'**
  String get faqKozijnSchilderenQ2;

  /// No description provided for @faqKozijnSchilderenA2.
  ///
  /// In en, this message translates to:
  /// **'Use primer on bare wood, or when going from a dark to a light colour.'**
  String get faqKozijnSchilderenA2;

  /// No description provided for @faqKozijnSchilderenQ3.
  ///
  /// In en, this message translates to:
  /// **'How do I recognize a lead-containing old paint layer?'**
  String get faqKozijnSchilderenQ3;

  /// No description provided for @faqKozijnSchilderenA3.
  ///
  /// In en, this message translates to:
  /// **'If uncertain about old woodwork: do not sand with a machine yourself while dry, but have the layer assessed or tested first. When working with old paint layers always wear a dust mask (FFP2/FFP3) and gloves in any case.'**
  String get faqKozijnSchilderenA3;

  /// No description provided for @faqKozijnSchilderenQ4.
  ///
  /// In en, this message translates to:
  /// **'How many finish coats are needed?'**
  String get faqKozijnSchilderenQ4;

  /// No description provided for @faqKozijnSchilderenA4.
  ///
  /// In en, this message translates to:
  /// **'Allow for at least two finish coats after the primer for a durable result.'**
  String get faqKozijnSchilderenA4;

  /// No description provided for @faqKozijnSchilderenQ5.
  ///
  /// In en, this message translates to:
  /// **'Should I sand between coats?'**
  String get faqKozijnSchilderenQ5;

  /// No description provided for @faqKozijnSchilderenA5.
  ///
  /// In en, this message translates to:
  /// **'Light intermediate sanding provides a smoother, more even final coat; follow the product advice. For larger areas, a sanding machine can speed up the work.'**
  String get faqKozijnSchilderenA5;

  /// No description provided for @faqKozijnSchilderenQ6.
  ///
  /// In en, this message translates to:
  /// **'Can I use paint and varnish interchangeably?'**
  String get faqKozijnSchilderenQ6;

  /// No description provided for @faqKozijnSchilderenA6.
  ///
  /// In en, this message translates to:
  /// **'No, use one paint system from start to finish; mixing different systems can cause adhesion problems.'**
  String get faqKozijnSchilderenA6;

  /// No description provided for @faqKozijnSchilderenQ7.
  ///
  /// In en, this message translates to:
  /// **'How do I repair holes with wood filler?'**
  String get faqKozijnSchilderenQ7;

  /// No description provided for @faqKozijnSchilderenA7.
  ///
  /// In en, this message translates to:
  /// **'Fill the hole or damage with wood filler, allow to dry according to the product instructions, then sand smooth before priming.'**
  String get faqKozijnSchilderenA7;

  /// No description provided for @faqKozijnSchilderenQ8.
  ///
  /// In en, this message translates to:
  /// **'Must I take the door off its hinges to paint?'**
  String get faqKozijnSchilderenQ8;

  /// No description provided for @faqKozijnSchilderenA8.
  ///
  /// In en, this message translates to:
  /// **'It is not always necessary, but it can make the work easier. In any case, ensure a stable surface and sufficient space.'**
  String get faqKozijnSchilderenA8;

  /// No description provided for @faqKozijnSchilderenQ9.
  ///
  /// In en, this message translates to:
  /// **'Can I paint outside in rain or cold?'**
  String get faqKozijnSchilderenQ9;

  /// No description provided for @faqKozijnSchilderenA9.
  ///
  /// In en, this message translates to:
  /// **'No, paint outside in dry weather and a temperature suitable for the paint system; moisture and cold affect drying and adhesion.'**
  String get faqKozijnSchilderenA9;

  /// No description provided for @faqKozijnSchilderenQ10.
  ///
  /// In en, this message translates to:
  /// **'How long should I wait before using the door again?'**
  String get faqKozijnSchilderenQ10;

  /// No description provided for @faqKozijnSchilderenA10.
  ///
  /// In en, this message translates to:
  /// **'Follow the drying time of the final finish coat on the packaging before using the door intensively again.'**
  String get faqKozijnSchilderenA10;

  /// No description provided for @faqRadiatorSchilderenQ1.
  ///
  /// In en, this message translates to:
  /// **'Must the radiator be cold?'**
  String get faqRadiatorSchilderenQ1;

  /// No description provided for @faqRadiatorSchilderenA1.
  ///
  /// In en, this message translates to:
  /// **'Yes, allow the radiator to cool down completely and turn off the heating before starting.'**
  String get faqRadiatorSchilderenA1;

  /// No description provided for @faqRadiatorSchilderenQ2.
  ///
  /// In en, this message translates to:
  /// **'Should I degrease before painting?'**
  String get faqRadiatorSchilderenQ2;

  /// No description provided for @faqRadiatorSchilderenA2.
  ///
  /// In en, this message translates to:
  /// **'Yes, degrease the radiator first, especially a surface that is often warm — grease and dust stick there more quickly. Wear gloves while doing this.'**
  String get faqRadiatorSchilderenA2;

  /// No description provided for @faqRadiatorSchilderenQ3.
  ///
  /// In en, this message translates to:
  /// **'What should I do about rust?'**
  String get faqRadiatorSchilderenQ3;

  /// No description provided for @faqRadiatorSchilderenA3.
  ///
  /// In en, this message translates to:
  /// **'Treat rust spots before painting, for example with a suitable rust converter or rust inhibitor. Wear gloves while doing this and, when sanding rust, a dust mask.'**
  String get faqRadiatorSchilderenA3;

  /// No description provided for @faqRadiatorSchilderenQ4.
  ///
  /// In en, this message translates to:
  /// **'Which primer should I use?'**
  String get faqRadiatorSchilderenQ4;

  /// No description provided for @faqRadiatorSchilderenA4.
  ///
  /// In en, this message translates to:
  /// **'Use a metal primer that matches the chosen paint system, especially on bare or rusted areas.'**
  String get faqRadiatorSchilderenA4;

  /// No description provided for @faqRadiatorSchilderenQ5.
  ///
  /// In en, this message translates to:
  /// **'Which paint is suitable for a radiator?'**
  String get faqRadiatorSchilderenQ5;

  /// No description provided for @faqRadiatorSchilderenA5.
  ///
  /// In en, this message translates to:
  /// **'Use radiator paint; it is heat-resistant and yellows less quickly than ordinary wall paint or wood varnish.'**
  String get faqRadiatorSchilderenA5;

  /// No description provided for @faqRadiatorSchilderenQ6.
  ///
  /// In en, this message translates to:
  /// **'How many coats are needed?'**
  String get faqRadiatorSchilderenQ6;

  /// No description provided for @faqRadiatorSchilderenA6.
  ///
  /// In en, this message translates to:
  /// **'Usually one coat of primer (where needed) and one to two coats of radiator paint are sufficient; follow the product advice.'**
  String get faqRadiatorSchilderenA6;

  /// No description provided for @faqRadiatorSchilderenQ7.
  ///
  /// In en, this message translates to:
  /// **'How long must the paint dry before I turn the heating back on?'**
  String get faqRadiatorSchilderenQ7;

  /// No description provided for @faqRadiatorSchilderenA7.
  ///
  /// In en, this message translates to:
  /// **'Follow the drying time of the radiator paint as stated on the packaging before using the heating again.'**
  String get faqRadiatorSchilderenA7;

  /// No description provided for @faqRadiatorSchilderenQ8.
  ///
  /// In en, this message translates to:
  /// **'Can I paint the radiator without dismantling it?'**
  String get faqRadiatorSchilderenQ8;

  /// No description provided for @faqRadiatorSchilderenA8.
  ///
  /// In en, this message translates to:
  /// **'Yes, that is possible with a radiator roller and brush behind the pipes; dismantling is usually not necessary.'**
  String get faqRadiatorSchilderenA8;

  /// No description provided for @faqRadiatorSchilderenQ9.
  ///
  /// In en, this message translates to:
  /// **'Should I cover the wall behind it?'**
  String get faqRadiatorSchilderenQ9;

  /// No description provided for @faqRadiatorSchilderenA9.
  ///
  /// In en, this message translates to:
  /// **'Yes, cover the wall and floor behind and beneath the radiator with dust sheets and masking tape.'**
  String get faqRadiatorSchilderenA9;

  /// No description provided for @faqRadiatorSchilderenQ10.
  ///
  /// In en, this message translates to:
  /// **'Which brush should I use for the radiator?'**
  String get faqRadiatorSchilderenQ10;

  /// No description provided for @faqRadiatorSchilderenA10.
  ///
  /// In en, this message translates to:
  /// **'A radiator roller for the large surfaces and a narrow brush for the hard-to-reach areas behind the pipes.'**
  String get faqRadiatorSchilderenA10;

  /// No description provided for @faqStopcontactQ1.
  ///
  /// In en, this message translates to:
  /// **'Do I need to turn off the power before I start?'**
  String get faqStopcontactQ1;

  /// No description provided for @faqStopcontactA1.
  ///
  /// In en, this message translates to:
  /// **'Yes, always switch off the relevant circuit at the fuse box and check with a voltage tester that the circuit is truly de-energized before you begin.'**
  String get faqStopcontactA1;

  /// No description provided for @faqStopcontactQ2.
  ///
  /// In en, this message translates to:
  /// **'Which tools do I need for installing a power outlet?'**
  String get faqStopcontactQ2;

  /// No description provided for @faqStopcontactA2.
  ///
  /// In en, this message translates to:
  /// **'You need a screwdriver set, wire strippers, side cutters, voltage tester, spirit level, pencil and possibly a hammer drill (for fixing holes).'**
  String get faqStopcontactA2;

  /// No description provided for @faqStopcontactQ3.
  ///
  /// In en, this message translates to:
  /// **'How do I connect the wires correctly?'**
  String get faqStopcontactQ3;

  /// No description provided for @faqStopcontactA3.
  ///
  /// In en, this message translates to:
  /// **'Follow the color coding: brown (live), blue (neutral) and yellow-green (earth). Check your local regulations (e.g. NEN 1010) and the outlet instructions.'**
  String get faqStopcontactA3;

  /// No description provided for @faqStopcontactQ4.
  ///
  /// In en, this message translates to:
  /// **'Can I replace an outlet myself?'**
  String get faqStopcontactQ4;

  /// No description provided for @faqStopcontactA4.
  ///
  /// In en, this message translates to:
  /// **'Replacing an existing outlet is relatively simple if you have basic electrical knowledge and follow safety rules. For new installations, always work to the NEN 1010 standard.'**
  String get faqStopcontactA4;

  /// No description provided for @faqStopcontactQ5.
  ///
  /// In en, this message translates to:
  /// **'How deep should the flush-mounting box be?'**
  String get faqStopcontactQ5;

  /// No description provided for @faqStopcontactA5.
  ///
  /// In en, this message translates to:
  /// **'A standard flush-mounting box for an outlet is about 40–50 mm deep. Use a dry-wall saw or masonry bit to cut the recess.'**
  String get faqStopcontactA5;

  /// No description provided for @faqStopcontactQ6.
  ///
  /// In en, this message translates to:
  /// **'What should I do if there is no earth wire?'**
  String get faqStopcontactQ6;

  /// No description provided for @faqStopcontactA6.
  ///
  /// In en, this message translates to:
  /// **'In older installations there may be no earth wire. For safety, always have earthing added. Contact a certified electrician if necessary.'**
  String get faqStopcontactA6;

  /// No description provided for @faqStopcontactQ7.
  ///
  /// In en, this message translates to:
  /// **'Can I install an outlet in the bathroom?'**
  String get faqStopcontactQ7;

  /// No description provided for @faqStopcontactA7.
  ///
  /// In en, this message translates to:
  /// **'Yes, but only outside the splash zones and with GFCI/RCD protection. Check your local wet-room regulations.'**
  String get faqStopcontactA7;

  /// No description provided for @faqStopcontactQ8.
  ///
  /// In en, this message translates to:
  /// **'How do I test if the outlet works properly?'**
  String get faqStopcontactQ8;

  /// No description provided for @faqStopcontactA8.
  ///
  /// In en, this message translates to:
  /// **'After installation, switch the power back on and test the outlet with a socket tester or multimeter to check correct voltage and earthing.'**
  String get faqStopcontactA8;

  /// No description provided for @faqStopcontactQ9.
  ///
  /// In en, this message translates to:
  /// **'What is the maximum load per circuit?'**
  String get faqStopcontactQ9;

  /// No description provided for @faqStopcontactA9.
  ///
  /// In en, this message translates to:
  /// **'A standard 16A circuit can handle approximately 3680W. Do not exceed the circuit capacity and spread heavy appliances across multiple circuits.'**
  String get faqStopcontactA9;

  /// No description provided for @faqStopcontactQ10.
  ///
  /// In en, this message translates to:
  /// **'Can I do this as a beginner?'**
  String get faqStopcontactQ10;

  /// No description provided for @faqStopcontactA10.
  ///
  /// In en, this message translates to:
  /// **'Replacing an existing outlet is doable with good preparation. For new installations or complex wiring, consult a certified electrician.'**
  String get faqStopcontactA10;

  /// No description provided for @faqVerlichtingQ1.
  ///
  /// In en, this message translates to:
  /// **'Should I turn off the power first?'**
  String get faqVerlichtingQ1;

  /// No description provided for @faqVerlichtingA1.
  ///
  /// In en, this message translates to:
  /// **'Yes, always switch off the relevant circuit at the fuse box and check with a voltage tester that there is no voltage before you begin.'**
  String get faqVerlichtingA1;

  /// No description provided for @faqVerlichtingQ2.
  ///
  /// In en, this message translates to:
  /// **'What is the difference between a ceiling rose and a junction box?'**
  String get faqVerlichtingQ2;

  /// No description provided for @faqVerlichtingA2.
  ///
  /// In en, this message translates to:
  /// **'A ceiling rose is visible and decorative; a junction box is concealed in the ceiling for the electrical connections.'**
  String get faqVerlichtingA2;

  /// No description provided for @faqVerlichtingQ3.
  ///
  /// In en, this message translates to:
  /// **'How do I connect a ceiling light?'**
  String get faqVerlichtingQ3;

  /// No description provided for @faqVerlichtingA3.
  ///
  /// In en, this message translates to:
  /// **'Connect brown (live) to brown, blue (neutral) to blue and yellow-green (earth) to the earth terminal. Follow the light fitting instructions and local regulations.'**
  String get faqVerlichtingA3;

  /// No description provided for @faqVerlichtingQ4.
  ///
  /// In en, this message translates to:
  /// **'Can I install LED spotlights myself?'**
  String get faqVerlichtingQ4;

  /// No description provided for @faqVerlichtingA4.
  ///
  /// In en, this message translates to:
  /// **'Yes, if you have basic electrical knowledge and follow the installation instructions. Ensure the transformer (if needed) matches the LED power rating.'**
  String get faqVerlichtingA4;

  /// No description provided for @faqVerlichtingQ5.
  ///
  /// In en, this message translates to:
  /// **'What should I do if the fixture is too heavy?'**
  String get faqVerlichtingQ5;

  /// No description provided for @faqVerlichtingA5.
  ///
  /// In en, this message translates to:
  /// **'Use appropriate fixings (e.g. ceiling anchors or toggle bolts) or attach the light to a ceiling joist for safe installation.'**
  String get faqVerlichtingA5;

  /// No description provided for @faqVerlichtingQ6.
  ///
  /// In en, this message translates to:
  /// **'Do I need a dimmer switch for LED lights?'**
  String get faqVerlichtingQ6;

  /// No description provided for @faqVerlichtingA6.
  ///
  /// In en, this message translates to:
  /// **'Only if the LEDs are dimmable. Use a compatible LED dimmer; standard dimmers may cause flickering.'**
  String get faqVerlichtingA6;

  /// No description provided for @faqVerlichtingQ7.
  ///
  /// In en, this message translates to:
  /// **'How do I connect multiple spots in series?'**
  String get faqVerlichtingQ7;

  /// No description provided for @faqVerlichtingA7.
  ///
  /// In en, this message translates to:
  /// **'Connect the spots in parallel using a junction box, so each spot receives the full voltage. Do not daisy-chain in series.'**
  String get faqVerlichtingA7;

  /// No description provided for @faqVerlichtingQ8.
  ///
  /// In en, this message translates to:
  /// **'What cable thickness should I use?'**
  String get faqVerlichtingQ8;

  /// No description provided for @faqVerlichtingA8.
  ///
  /// In en, this message translates to:
  /// **'For lighting circuits, 1.5 mm² cable is usually sufficient. For high-wattage or long runs, use 2.5 mm² as per NEN 1010.'**
  String get faqVerlichtingA8;

  /// No description provided for @faqVerlichtingQ9.
  ///
  /// In en, this message translates to:
  /// **'Can I install outdoor lighting myself?'**
  String get faqVerlichtingQ9;

  /// No description provided for @faqVerlichtingA9.
  ///
  /// In en, this message translates to:
  /// **'Yes, provided you use weatherproof (IP-rated) fixtures and cables, and ensure GFCI/RCD protection on the circuit.'**
  String get faqVerlichtingA9;

  /// No description provided for @faqVerlichtingQ10.
  ///
  /// In en, this message translates to:
  /// **'How do I test if the light works correctly?'**
  String get faqVerlichtingQ10;

  /// No description provided for @faqVerlichtingA10.
  ///
  /// In en, this message translates to:
  /// **'Switch the power back on, test the light switch, and check for proper operation and no flickering.'**
  String get faqVerlichtingA10;

  /// No description provided for @faqStroomleidingQ1.
  ///
  /// In en, this message translates to:
  /// **'Which cable should I use for power outlets?'**
  String get faqStroomleidingQ1;

  /// No description provided for @faqStroomleidingA1.
  ///
  /// In en, this message translates to:
  /// **'For standard 16A power circuits use 2.5 mm² cable (3-core: live, neutral, earth). For heavier loads (cooker, etc.) use 4–6 mm².'**
  String get faqStroomleidingA1;

  /// No description provided for @faqStroomleidingQ2.
  ///
  /// In en, this message translates to:
  /// **'Should I lay cables in conduit?'**
  String get faqStroomleidingQ2;

  /// No description provided for @faqStroomleidingA2.
  ///
  /// In en, this message translates to:
  /// **'Cables buried in walls or floors should be protected by conduit or trunking. Surface-mounted cables must also be protected.'**
  String get faqStroomleidingA2;

  /// No description provided for @faqStroomleidingQ3.
  ///
  /// In en, this message translates to:
  /// **'How deep should I bury cables in the wall?'**
  String get faqStroomleidingQ3;

  /// No description provided for @faqStroomleidingA3.
  ///
  /// In en, this message translates to:
  /// **'Cables should be routed vertically or horizontally from outlets/switches and buried at least 50 mm deep to avoid accidental drilling.'**
  String get faqStroomleidingA3;

  /// No description provided for @faqStroomleidingQ4.
  ///
  /// In en, this message translates to:
  /// **'Can I extend an existing circuit?'**
  String get faqStroomleidingQ4;

  /// No description provided for @faqStroomleidingA4.
  ///
  /// In en, this message translates to:
  /// **'Yes, provided the circuit is not overloaded and you follow the NEN 1010 standard. Use junction boxes for connections.'**
  String get faqStroomleidingA4;

  /// No description provided for @faqStroomleidingQ5.
  ///
  /// In en, this message translates to:
  /// **'What is the difference between single-core and multi-core cable?'**
  String get faqStroomleidingQ5;

  /// No description provided for @faqStroomleidingA5.
  ///
  /// In en, this message translates to:
  /// **'Single-core cables are separate conductors (used in conduit); multi-core cables (e.g. 3-core) have all conductors in one sheath.'**
  String get faqStroomleidingA5;

  /// No description provided for @faqStroomleidingQ6.
  ///
  /// In en, this message translates to:
  /// **'How do I connect cables in a junction box?'**
  String get faqStroomleidingQ6;

  /// No description provided for @faqStroomleidingA6.
  ///
  /// In en, this message translates to:
  /// **'Use connector blocks or WAGO connectors to join like colors: brown to brown, blue to blue, yellow-green to yellow-green.'**
  String get faqStroomleidingA6;

  /// No description provided for @faqStroomleidingQ7.
  ///
  /// In en, this message translates to:
  /// **'Should I test the circuit after installation?'**
  String get faqStroomleidingQ7;

  /// No description provided for @faqStroomleidingA7.
  ///
  /// In en, this message translates to:
  /// **'Yes, always test for continuity, insulation resistance and correct earthing before energizing the circuit.'**
  String get faqStroomleidingA7;

  /// No description provided for @faqStroomleidingQ8.
  ///
  /// In en, this message translates to:
  /// **'Can I run cables through the attic?'**
  String get faqStroomleidingQ8;

  /// No description provided for @faqStroomleidingA8.
  ///
  /// In en, this message translates to:
  /// **'Yes, but ensure cables are secured and protected from mechanical damage. Use conduit or trunking where required.'**
  String get faqStroomleidingA8;

  /// No description provided for @faqStroomleidingQ9.
  ///
  /// In en, this message translates to:
  /// **'What should I do if I hit an existing cable?'**
  String get faqStroomleidingQ9;

  /// No description provided for @faqStroomleidingA9.
  ///
  /// In en, this message translates to:
  /// **'Switch off power immediately. Assess the damage. If the cable is nicked or cut, repair or replace the section. Never leave damaged cables live.'**
  String get faqStroomleidingA9;

  /// No description provided for @faqStroomleidingQ10.
  ///
  /// In en, this message translates to:
  /// **'Can I do this as a beginner?'**
  String get faqStroomleidingQ10;

  /// No description provided for @faqStroomleidingA10.
  ///
  /// In en, this message translates to:
  /// **'Basic cable runs are manageable with proper planning and safety precautions. For complex installations or fuse box work, consult a certified electrician.'**
  String get faqStroomleidingA10;

  /// No description provided for @faqKabelgootQ1.
  ///
  /// In en, this message translates to:
  /// **'What is cable trunking used for?'**
  String get faqKabelgootQ1;

  /// No description provided for @faqKabelgootA1.
  ///
  /// In en, this message translates to:
  /// **'Cable trunking protects and conceals surface-mounted cables, keeping installations neat and safe from mechanical damage.'**
  String get faqKabelgootA1;

  /// No description provided for @faqKabelgootQ2.
  ///
  /// In en, this message translates to:
  /// **'Which size trunking do I need?'**
  String get faqKabelgootQ2;

  /// No description provided for @faqKabelgootA2.
  ///
  /// In en, this message translates to:
  /// **'Choose a size that allows cables to fill no more than 60% of the trunking cross-section for heat dissipation and easy pulling.'**
  String get faqKabelgootA2;

  /// No description provided for @faqKabelgootQ3.
  ///
  /// In en, this message translates to:
  /// **'Can I install trunking on any surface?'**
  String get faqKabelgootQ3;

  /// No description provided for @faqKabelgootA3.
  ///
  /// In en, this message translates to:
  /// **'Yes, trunking can be mounted on walls, skirting boards or ceilings using screws or adhesive, depending on the surface and trunking type.'**
  String get faqKabelgootA3;

  /// No description provided for @faqKabelgootQ4.
  ///
  /// In en, this message translates to:
  /// **'How do I cut trunking to size?'**
  String get faqKabelgootQ4;

  /// No description provided for @faqKabelgootA4.
  ///
  /// In en, this message translates to:
  /// **'Use a fine-toothed saw or a sharp knife. Measure carefully, mark the cut line, and cut squarely for neat joints.'**
  String get faqKabelgootA4;

  /// No description provided for @faqKabelgootQ5.
  ///
  /// In en, this message translates to:
  /// **'Should I use trunking for outdoor cables?'**
  String get faqKabelgootQ5;

  /// No description provided for @faqKabelgootA5.
  ///
  /// In en, this message translates to:
  /// **'Use weatherproof trunking (IP-rated) for outdoor installations to protect cables from moisture and UV damage.'**
  String get faqKabelgootA5;

  /// No description provided for @faqKabelgootQ6.
  ///
  /// In en, this message translates to:
  /// **'How do I join trunking sections?'**
  String get faqKabelgootQ6;

  /// No description provided for @faqKabelgootA6.
  ///
  /// In en, this message translates to:
  /// **'Use coupling pieces or connectors supplied by the manufacturer for a secure, neat join between sections.'**
  String get faqKabelgootA6;

  /// No description provided for @faqKabelgootQ7.
  ///
  /// In en, this message translates to:
  /// **'Can I paint cable trunking?'**
  String get faqKabelgootQ7;

  /// No description provided for @faqKabelgootA7.
  ///
  /// In en, this message translates to:
  /// **'Yes, most PVC trunking can be painted with suitable primer and paint to match your décor.'**
  String get faqKabelgootA7;

  /// No description provided for @faqKabelgootQ8.
  ///
  /// In en, this message translates to:
  /// **'How do I route trunking around corners?'**
  String get faqKabelgootQ8;

  /// No description provided for @faqKabelgootA8.
  ///
  /// In en, this message translates to:
  /// **'Use corner pieces, bends or cut and miter the trunking at 45° for internal/external corners.'**
  String get faqKabelgootA8;

  /// No description provided for @faqKabelgootQ9.
  ///
  /// In en, this message translates to:
  /// **'Should trunking be fixed horizontally or vertically?'**
  String get faqKabelgootQ9;

  /// No description provided for @faqKabelgootA9.
  ///
  /// In en, this message translates to:
  /// **'Follow the same rules as buried cables: run vertically or horizontally from outlets and switches for safety and ease of future work.'**
  String get faqKabelgootA9;

  /// No description provided for @faqKabelgootQ10.
  ///
  /// In en, this message translates to:
  /// **'Can I do this as a beginner?'**
  String get faqKabelgootQ10;

  /// No description provided for @faqKabelgootA10.
  ///
  /// In en, this message translates to:
  /// **'Yes, installing trunking is straightforward with basic DIY skills. Measure carefully, cut neatly, and secure firmly.'**
  String get faqKabelgootA10;

  /// No description provided for @faqRookmelderQ1.
  ///
  /// In en, this message translates to:
  /// **'Where should I install a smoke detector?'**
  String get faqRookmelderQ1;

  /// No description provided for @faqRookmelderA1.
  ///
  /// In en, this message translates to:
  /// **'Install smoke detectors on the ceiling or high on the wall (within 30 cm of the ceiling) in hallways, landings and bedrooms. Avoid kitchens and bathrooms.'**
  String get faqRookmelderA1;

  /// No description provided for @faqRookmelderQ2.
  ///
  /// In en, this message translates to:
  /// **'How many smoke detectors do I need?'**
  String get faqRookmelderQ2;

  /// No description provided for @faqRookmelderA2.
  ///
  /// In en, this message translates to:
  /// **'At least one per floor and one in each bedroom. For larger homes, add more for complete coverage.'**
  String get faqRookmelderA2;

  /// No description provided for @faqRookmelderQ3.
  ///
  /// In en, this message translates to:
  /// **'Should I use battery or mains-powered detectors?'**
  String get faqRookmelderQ3;

  /// No description provided for @faqRookmelderA3.
  ///
  /// In en, this message translates to:
  /// **'Mains-powered (230V) detectors with battery backup are most reliable. Battery-only detectors are easier to install but require regular battery changes.'**
  String get faqRookmelderA3;

  /// No description provided for @faqRookmelderQ4.
  ///
  /// In en, this message translates to:
  /// **'How do I install a mains-powered smoke detector?'**
  String get faqRookmelderQ4;

  /// No description provided for @faqRookmelderA4.
  ///
  /// In en, this message translates to:
  /// **'Switch off the circuit, connect the detector to the lighting circuit (live, neutral, earth), secure the base to the ceiling and attach the detector head.'**
  String get faqRookmelderA4;

  /// No description provided for @faqRookmelderQ5.
  ///
  /// In en, this message translates to:
  /// **'Can I interlink multiple smoke detectors?'**
  String get faqRookmelderQ5;

  /// No description provided for @faqRookmelderA5.
  ///
  /// In en, this message translates to:
  /// **'Yes, interlinked detectors (wired or wireless) sound all alarms when one detects smoke, providing better warning throughout the home.'**
  String get faqRookmelderA5;

  /// No description provided for @faqRookmelderQ6.
  ///
  /// In en, this message translates to:
  /// **'How often should I test the smoke detector?'**
  String get faqRookmelderQ6;

  /// No description provided for @faqRookmelderA6.
  ///
  /// In en, this message translates to:
  /// **'Test monthly by pressing the test button. Replace batteries yearly (or when the low-battery warning sounds).'**
  String get faqRookmelderA6;

  /// No description provided for @faqRookmelderQ7.
  ///
  /// In en, this message translates to:
  /// **'What is the difference between smoke and heat detectors?'**
  String get faqRookmelderQ7;

  /// No description provided for @faqRookmelderA7.
  ///
  /// In en, this message translates to:
  /// **'Smoke detectors sense smoke particles; heat detectors sense temperature rise. Use heat detectors in kitchens/garages where smoke detectors may false alarm.'**
  String get faqRookmelderA7;

  /// No description provided for @faqRookmelderQ8.
  ///
  /// In en, this message translates to:
  /// **'How long do smoke detectors last?'**
  String get faqRookmelderQ8;

  /// No description provided for @faqRookmelderA8.
  ///
  /// In en, this message translates to:
  /// **'Most smoke detectors last 10 years. Check the manufacture date and replace expired units.'**
  String get faqRookmelderA8;

  /// No description provided for @faqRookmelderQ9.
  ///
  /// In en, this message translates to:
  /// **'Can I paint or decorate a smoke detector?'**
  String get faqRookmelderQ9;

  /// No description provided for @faqRookmelderA9.
  ///
  /// In en, this message translates to:
  /// **'No, never paint or cover a smoke detector. This blocks the sensor and prevents it working correctly.'**
  String get faqRookmelderA9;

  /// No description provided for @faqRookmelderQ10.
  ///
  /// In en, this message translates to:
  /// **'Can I do this as a beginner?'**
  String get faqRookmelderQ10;

  /// No description provided for @faqRookmelderA10.
  ///
  /// In en, this message translates to:
  /// **'Battery-powered detectors are easy to install. Mains-powered detectors require electrical knowledge; if unsure, consult a certified electrician.'**
  String get faqRookmelderA10;

  /// No description provided for @faqVloertegelQ1.
  ///
  /// In en, this message translates to:
  /// **'Do I need to level, prime and degrease?'**
  String get faqVloertegelQ1;

  /// No description provided for @faqVloertegelA1.
  ///
  /// In en, this message translates to:
  /// **'Yes, check the flatness and load-bearing capacity of the substrate and level where needed. Use primer if the adhesive system or substrate requires it. Degrease greasy or contaminated substrates (e.g. kitchen floor) with a suitable degreaser/cleaner.'**
  String get faqVloertegelA1;

  /// No description provided for @faqVloertegelQ2.
  ///
  /// In en, this message translates to:
  /// **'How do I calculate cutting loss and number of tiles?'**
  String get faqVloertegelQ2;

  /// No description provided for @faqVloertegelA2.
  ///
  /// In en, this message translates to:
  /// **'Calculate the surface area and divide by the area of one tile. As a guideline, allow approximately 10% cutting loss; for patterned or diagonal laying approximately 15% or more.'**
  String get faqVloertegelA2;

  /// No description provided for @faqVloertegelQ3.
  ///
  /// In en, this message translates to:
  /// **'How do I get good adhesion with adhesive?'**
  String get faqVloertegelQ3;

  /// No description provided for @faqVloertegelA3.
  ///
  /// In en, this message translates to:
  /// **'Use the correct notched trowel and adhesive for the tile and substrate. Apply adhesive to a clean, dust-free substrate. For large tiles, apply back-buttering as per adhesive guidelines.'**
  String get faqVloertegelA3;

  /// No description provided for @faqVloertegelQ4.
  ///
  /// In en, this message translates to:
  /// **'How long to let dry before grouting?'**
  String get faqVloertegelQ4;

  /// No description provided for @faqVloertegelA4.
  ///
  /// In en, this message translates to:
  /// **'Often a minimum of 24 hours; with large tiles, low temperatures or less absorbent substrates this can be longer. Always follow the product data sheet.'**
  String get faqVloertegelA4;

  /// No description provided for @faqVloertegelQ5.
  ///
  /// In en, this message translates to:
  /// **'How do I prevent height differences?'**
  String get faqVloertegelQ5;

  /// No description provided for @faqVloertegelA5.
  ///
  /// In en, this message translates to:
  /// **'Use tile wedges or a levelling system and check regularly with a spirit level and straightedge.'**
  String get faqVloertegelA5;

  /// No description provided for @faqVloertegelQ6.
  ///
  /// In en, this message translates to:
  /// **'What to do with a loose or broken tile?'**
  String get faqVloertegelQ6;

  /// No description provided for @faqVloertegelA6.
  ///
  /// In en, this message translates to:
  /// **'Carefully remove the tile, clear the substrate of loose adhesive and dust, and place a suitable new tile with appropriate adhesive.'**
  String get faqVloertegelA6;

  /// No description provided for @faqVloertegelQ7.
  ///
  /// In en, this message translates to:
  /// **'How to clean after grouting?'**
  String get faqVloertegelQ7;

  /// No description provided for @faqVloertegelA7.
  ///
  /// In en, this message translates to:
  /// **'Remove grout residue at the right time with a suitable sponge and clean water, before the grout fully hardens.'**
  String get faqVloertegelA7;

  /// No description provided for @faqVloertegelQ8.
  ///
  /// In en, this message translates to:
  /// **'How do I maintain a tile floor?'**
  String get faqVloertegelQ8;

  /// No description provided for @faqVloertegelA8.
  ///
  /// In en, this message translates to:
  /// **'Daily: pH-neutral tile cleaner or all-purpose cleaner. Periodically: lime/cement cleaner for stubborn deposits, but only if the tile type tolerates it. Avoid vinegar and acidic agents on natural stone, and abrasives on all tiles. Optional: impregnator on cement-based grout.'**
  String get faqVloertegelA8;

  /// No description provided for @faqVloertegelQ9.
  ///
  /// In en, this message translates to:
  /// **'What safety measures when sawing?'**
  String get faqVloertegelQ9;

  /// No description provided for @faqVloertegelA9.
  ///
  /// In en, this message translates to:
  /// **'Where possible use a wet tile saw or source extraction (construction vacuum) to limit silica dust. Wear appropriate eye, ear and respiratory protection.'**
  String get faqVloertegelA9;

  /// No description provided for @faqVloertegelQ10.
  ///
  /// In en, this message translates to:
  /// **'Do I need an expansion joint for large areas?'**
  String get faqVloertegelQ10;

  /// No description provided for @faqVloertegelA10.
  ///
  /// In en, this message translates to:
  /// **'For large areas or with underfloor heating, an expansion joint may be needed to accommodate movement. Follow the manufacturer\'s recommendations and applicable standards for maximum area without expansion.'**
  String get faqVloertegelA10;

  /// No description provided for @faqWandtegelQ1.
  ///
  /// In en, this message translates to:
  /// **'Do I need to level, prime and degrease?'**
  String get faqWandtegelQ1;

  /// No description provided for @faqWandtegelA1.
  ///
  /// In en, this message translates to:
  /// **'Check that the wall is flat, clean, dry, load-bearing and grease-free. Level where needed and use primer if the substrate or adhesive system requires it. Degrease greasy or contaminated substrates (e.g. kitchen wall) with a suitable degreaser/cleaner.'**
  String get faqWandtegelA1;

  /// No description provided for @faqWandtegelQ2.
  ///
  /// In en, this message translates to:
  /// **'How do I calculate the number of tiles and cutting loss?'**
  String get faqWandtegelQ2;

  /// No description provided for @faqWandtegelA2.
  ///
  /// In en, this message translates to:
  /// **'Calculate the wall surface area and divide by the area of one tile. As a guideline, allow approximately 10% extra; for patterned or diagonal laying approximately 15% or more.'**
  String get faqWandtegelA2;

  /// No description provided for @faqWandtegelQ3.
  ///
  /// In en, this message translates to:
  /// **'How do I prevent loosening?'**
  String get faqWandtegelQ3;

  /// No description provided for @faqWandtegelA3.
  ///
  /// In en, this message translates to:
  /// **'Use the correct notched trowel and adhesive for the tile and substrate, don\'t work too much adhesive at once, and press the tiles firmly. For large tiles, back-buttering may be necessary.'**
  String get faqWandtegelA3;

  /// No description provided for @faqWandtegelQ4.
  ///
  /// In en, this message translates to:
  /// **'How long to let dry before grouting?'**
  String get faqWandtegelQ4;

  /// No description provided for @faqWandtegelA4.
  ///
  /// In en, this message translates to:
  /// **'Often a minimum of 24 hours; with large tiles or unfavourable conditions this can be longer. Follow the product data sheet.'**
  String get faqWandtegelA4;

  /// No description provided for @faqWandtegelQ5.
  ///
  /// In en, this message translates to:
  /// **'How do I saw tiles without breaking?'**
  String get faqWandtegelQ5;

  /// No description provided for @faqWandtegelA5.
  ///
  /// In en, this message translates to:
  /// **'Use a tile cutter for straight cuts and an angle grinder with diamond blade for cutouts. Work calmly and support the tile well.'**
  String get faqWandtegelA5;

  /// No description provided for @faqWandtegelQ6.
  ///
  /// In en, this message translates to:
  /// **'What if the wall is not level?'**
  String get faqWandtegelQ6;

  /// No description provided for @faqWandtegelA6.
  ///
  /// In en, this message translates to:
  /// **'Repair or level the substrate where needed before tiling. Do not correct indefinitely with extra adhesive.'**
  String get faqWandtegelA6;

  /// No description provided for @faqWandtegelQ7.
  ///
  /// In en, this message translates to:
  /// **'How do I deal with sloped walls?'**
  String get faqWandtegelQ7;

  /// No description provided for @faqWandtegelA7.
  ///
  /// In en, this message translates to:
  /// **'Measure the angle with a bevel square and cut tiles to size. Work from a square starting line and check regularly with a spirit level.'**
  String get faqWandtegelA7;

  /// No description provided for @faqWandtegelQ8.
  ///
  /// In en, this message translates to:
  /// **'How to clean after grouting?'**
  String get faqWandtegelQ8;

  /// No description provided for @faqWandtegelA8.
  ///
  /// In en, this message translates to:
  /// **'Use a soft sponge and clean water at the right time before full hardening. Refresh the water regularly.'**
  String get faqWandtegelA8;

  /// No description provided for @faqWandtegelQ9.
  ///
  /// In en, this message translates to:
  /// **'How do I maintain wall tiles?'**
  String get faqWandtegelQ9;

  /// No description provided for @faqWandtegelA9.
  ///
  /// In en, this message translates to:
  /// **'Daily: pH-neutral tile cleaner or mild all-purpose cleaner. For limescale: lime remover, only if the tile type tolerates it. Avoid abrasives and aggressive acids on vulnerable tiles or grout.'**
  String get faqWandtegelA9;

  /// No description provided for @faqWandtegelQ10.
  ///
  /// In en, this message translates to:
  /// **'How do I work around outlets and switches?'**
  String get faqWandtegelQ10;

  /// No description provided for @faqWandtegelA10.
  ///
  /// In en, this message translates to:
  /// **'First switch off the power. Remove the cover frame, tile around the flush box to size and place the tile with a suitable cutout. Then remount the cover frame.'**
  String get faqWandtegelA10;

  /// No description provided for @faqTegelReparerenQ1.
  ///
  /// In en, this message translates to:
  /// **'How do I remove an old tile without damaging the surrounding tiles?'**
  String get faqTegelReparerenQ1;

  /// No description provided for @faqTegelReparerenA1.
  ///
  /// In en, this message translates to:
  /// **'If necessary, first cut through the grout around the tile. Carefully drill several holes in the centre of the tile and break it out piece by piece using a chisel.'**
  String get faqTegelReparerenA1;

  /// No description provided for @faqTegelReparerenQ2.
  ///
  /// In en, this message translates to:
  /// **'Which adhesive should I use for one tile?'**
  String get faqTegelReparerenQ2;

  /// No description provided for @faqTegelReparerenA2.
  ///
  /// In en, this message translates to:
  /// **'Use a tile adhesive or repair mortar suitable for the tile, substrate, and application. Only use fast-drying products according to the product data sheet.'**
  String get faqTegelReparerenA2;

  /// No description provided for @faqTegelReparerenQ3.
  ///
  /// In en, this message translates to:
  /// **'How do I make sure the new tile sits level?'**
  String get faqTegelReparerenQ3;

  /// No description provided for @faqTegelReparerenA3.
  ///
  /// In en, this message translates to:
  /// **'Remove old adhesive without damaging the substrate. Check the flatness and use the correct notched trowel and amount of adhesive. Check with a straightedge and spirit level.'**
  String get faqTegelReparerenA3;

  /// No description provided for @faqTegelReparerenQ4.
  ///
  /// In en, this message translates to:
  /// **'How long should I wait before grouting?'**
  String get faqTegelReparerenQ4;

  /// No description provided for @faqTegelReparerenA4.
  ///
  /// In en, this message translates to:
  /// **'This depends on the adhesive. Only grout after the drying and curing time specified on the product data sheet. For fast-drying adhesive, follow the explicit product instructions.'**
  String get faqTegelReparerenA4;

  /// No description provided for @faqTegelReparerenQ5.
  ///
  /// In en, this message translates to:
  /// **'How do I make the repaired grout joint blend in?'**
  String get faqTegelReparerenQ5;

  /// No description provided for @faqTegelReparerenA5.
  ///
  /// In en, this message translates to:
  /// **'Use the same grout or demonstrably compatible grout in the same colour. Fill the joint completely and finish it according to the manufacturer\'s instructions.'**
  String get faqTegelReparerenA5;

  /// No description provided for @faqTegelReparerenQ6.
  ///
  /// In en, this message translates to:
  /// **'What if the substrate is damaged?'**
  String get faqTegelReparerenQ6;

  /// No description provided for @faqTegelReparerenA6.
  ///
  /// In en, this message translates to:
  /// **'Repair the substrate first with a suitable repair or levelling compound. Allow it to cure sufficiently.'**
  String get faqTegelReparerenA6;

  /// No description provided for @faqTegelReparerenQ7.
  ///
  /// In en, this message translates to:
  /// **'How do I prevent adhesive residue?'**
  String get faqTegelReparerenQ7;

  /// No description provided for @faqTegelReparerenA7.
  ///
  /// In en, this message translates to:
  /// **'Remove excess adhesive immediately using the method specified by the manufacturer, without damaging the tile or grout.'**
  String get faqTegelReparerenA7;

  /// No description provided for @faqTegelReparerenQ8.
  ///
  /// In en, this message translates to:
  /// **'How do I maintain the repaired tile?'**
  String get faqTegelReparerenQ8;

  /// No description provided for @faqTegelReparerenA8.
  ///
  /// In en, this message translates to:
  /// **'Maintain it in the same way as the rest of the floor or wall, using a suitable cleaning product.'**
  String get faqTegelReparerenA8;

  /// No description provided for @faqTegelReparerenQ9.
  ///
  /// In en, this message translates to:
  /// **'What safety measures are required?'**
  String get faqTegelReparerenQ9;

  /// No description provided for @faqTegelReparerenA9.
  ///
  /// In en, this message translates to:
  /// **'Control dust during drilling and grinding using source extraction with a construction vacuum cleaner or wet processing. Wear appropriate eye and respiratory protection.\n\n⚠️ If in doubt, consult a professional. Always check the instructions for the material being used and the current Dutch regulations.'**
  String get faqTegelReparerenA9;

  /// No description provided for @faqTegelReparerenQ10.
  ///
  /// In en, this message translates to:
  /// **'How long does it take?'**
  String get faqTegelReparerenQ10;

  /// No description provided for @faqTegelReparerenA10.
  ///
  /// In en, this message translates to:
  /// **'Professional: 0.50 hours per tile. DIY: 1.25 hours per tile.'**
  String get faqTegelReparerenA10;

  /// No description provided for @faqVoegenQ1.
  ///
  /// In en, this message translates to:
  /// **'Do the joints need to be clean and dry?'**
  String get faqVoegenQ1;

  /// No description provided for @faqVoegenA1.
  ///
  /// In en, this message translates to:
  /// **'Yes. Remove adhesive residue and dirt from the joints. The joints must meet the drying and processing requirements of the selected grout.'**
  String get faqVoegenA1;

  /// No description provided for @faqVoegenQ2.
  ///
  /// In en, this message translates to:
  /// **'Which grout should I use indoors?'**
  String get faqVoegenQ2;

  /// No description provided for @faqVoegenA2.
  ///
  /// In en, this message translates to:
  /// **'Choose based on the tile type, joint width, and application. Cement-based or epoxy grout may be suitable indoors. Follow the product data sheet.'**
  String get faqVoegenA2;

  /// No description provided for @faqVoegenQ3.
  ///
  /// In en, this message translates to:
  /// **'How do I mix grout?'**
  String get faqVoegenQ3;

  /// No description provided for @faqVoegenA3.
  ///
  /// In en, this message translates to:
  /// **'Follow the exact mixing ratio and processing time stated on the packaging. Use clean water and a suitable mixer.'**
  String get faqVoegenA3;

  /// No description provided for @faqVoegenQ4.
  ///
  /// In en, this message translates to:
  /// **'How long should grout cure before the surface can be used?'**
  String get faqVoegenQ4;

  /// No description provided for @faqVoegenA4.
  ///
  /// In en, this message translates to:
  /// **'This varies depending on the product, temperature, and application. Follow the waiting time for use and complete curing stated on the product data sheet.'**
  String get faqVoegenA4;

  /// No description provided for @faqVoegenQ5.
  ///
  /// In en, this message translates to:
  /// **'How do I prevent grout from drying out or cracking?'**
  String get faqVoegenQ5;

  /// No description provided for @faqVoegenA5.
  ///
  /// In en, this message translates to:
  /// **'Work in small sections. Avoid drafts, direct sunlight, and excessively rapid drying. Only moisten the grout if the manufacturer specifically instructs you to do so.'**
  String get faqVoegenA5;

  /// No description provided for @faqVoegenQ6.
  ///
  /// In en, this message translates to:
  /// **'What should I do about uneven grout joints?'**
  String get faqVoegenQ6;

  /// No description provided for @faqVoegenA6.
  ///
  /// In en, this message translates to:
  /// **'Finish the grout within the permitted processing time using the correct tools. After curing, repairs may remain visible. Follow the product instructions for repair.'**
  String get faqVoegenA6;

  /// No description provided for @faqVoegenQ7.
  ///
  /// In en, this message translates to:
  /// **'How do I clean tiles without damaging the grout?'**
  String get faqVoegenQ7;

  /// No description provided for @faqVoegenA7.
  ///
  /// In en, this message translates to:
  /// **'Clean at the correct time with a suitable sponge and a limited amount of clean water. Do not wait until a hard cement haze has formed.'**
  String get faqVoegenA7;

  /// No description provided for @faqVoegenQ8.
  ///
  /// In en, this message translates to:
  /// **'How do I maintain grout?'**
  String get faqVoegenQ8;

  /// No description provided for @faqVoegenA8.
  ///
  /// In en, this message translates to:
  /// **'Clean regularly with a product suitable for the type of grout. Impregnation may be appropriate for some cement-based grouts.'**
  String get faqVoegenA8;

  /// No description provided for @faqVoegenQ9.
  ///
  /// In en, this message translates to:
  /// **'What safety measures are required?'**
  String get faqVoegenQ9;

  /// No description provided for @faqVoegenA9.
  ///
  /// In en, this message translates to:
  /// **'Wear suitable gloves and eye protection. Control dust when mixing powdered products and ensure adequate ventilation.\n\n⚠️ If in doubt, consult a professional. Always check the instructions for the material being used and the current Dutch regulations.'**
  String get faqVoegenA9;

  /// No description provided for @faqVoegenQ10.
  ///
  /// In en, this message translates to:
  /// **'How long does it take?'**
  String get faqVoegenQ10;

  /// No description provided for @faqVoegenA10.
  ///
  /// In en, this message translates to:
  /// **'Professional: 0.10 hours per m². DIY: 0.25 hours per m².'**
  String get faqVoegenA10;

  /// No description provided for @faqKitAanbrengenQ1.
  ///
  /// In en, this message translates to:
  /// **'Do I need to degrease and dry the surface?'**
  String get faqKitAanbrengenQ1;

  /// No description provided for @faqKitAanbrengenA1.
  ///
  /// In en, this message translates to:
  /// **'Yes. Clean the substrate and make sure it is free from grease and dust. Allow it to dry unless the product specifically states otherwise.'**
  String get faqKitAanbrengenA1;

  /// No description provided for @faqKitAanbrengenQ2.
  ///
  /// In en, this message translates to:
  /// **'Which sealant should I use?'**
  String get faqKitAanbrengenQ2;

  /// No description provided for @faqKitAanbrengenA2.
  ///
  /// In en, this message translates to:
  /// **'Silicone sealant is suitable for many sanitary and wet-area joints. Acrylic sealant is often used for paintable joints indoors.'**
  String get faqKitAanbrengenA2;

  /// No description provided for @faqKitAanbrengenQ3.
  ///
  /// In en, this message translates to:
  /// **'How do I remove old sealant?'**
  String get faqKitAanbrengenQ3;

  /// No description provided for @faqKitAanbrengenA3.
  ///
  /// In en, this message translates to:
  /// **'Carefully cut or scrape away the old sealant using a sealant scraper. If necessary, use a suitable sealant remover. Then clean the surface according to the instructions for the new sealant product.'**
  String get faqKitAanbrengenA3;

  /// No description provided for @faqKitAanbrengenQ4.
  ///
  /// In en, this message translates to:
  /// **'How do I apply sealant evenly?'**
  String get faqKitAanbrengenQ4;

  /// No description provided for @faqKitAanbrengenA4.
  ///
  /// In en, this message translates to:
  /// **'Cut the nozzle diagonally to the desired joint width. Apply the sealant evenly. Smooth it with a rubber sealant finishing tool or suitable sealant spatula. Use a spray bottle with a finishing agent approved by the manufacturer.'**
  String get faqKitAanbrengenA4;

  /// No description provided for @faqKitAanbrengenQ5.
  ///
  /// In en, this message translates to:
  /// **'How long should I wait before the sealant can be exposed to load?'**
  String get faqKitAanbrengenQ5;

  /// No description provided for @faqKitAanbrengenA5.
  ///
  /// In en, this message translates to:
  /// **'This depends on the sealant type, joint dimensions, and environmental conditions. Follow the skin-formation, curing, and load-bearing times stated on the packaging.'**
  String get faqKitAanbrengenA5;

  /// No description provided for @faqKitAanbrengenQ6.
  ///
  /// In en, this message translates to:
  /// **'How do I smooth sealant?'**
  String get faqKitAanbrengenQ6;

  /// No description provided for @faqKitAanbrengenA6.
  ///
  /// In en, this message translates to:
  /// **'Use a rubber sealant finishing tool or suitable sealant spatula together with a finishing agent approved by the manufacturer. Do not automatically use dishwashing liquid.'**
  String get faqKitAanbrengenA6;

  /// No description provided for @faqKitAanbrengenQ7.
  ///
  /// In en, this message translates to:
  /// **'What if the sealant does not adhere?'**
  String get faqKitAanbrengenQ7;

  /// No description provided for @faqKitAanbrengenA7.
  ///
  /// In en, this message translates to:
  /// **'Remove the sealant. Check whether the substrate is suitable. Clean and dry the surface again. If necessary, use the primer specified by the manufacturer.'**
  String get faqKitAanbrengenA7;

  /// No description provided for @faqKitAanbrengenQ8.
  ///
  /// In en, this message translates to:
  /// **'How do I maintain sealant joints?'**
  String get faqKitAanbrengenQ8;

  /// No description provided for @faqKitAanbrengenA8.
  ///
  /// In en, this message translates to:
  /// **'Regularly check for detachment, cracks, mould, and discolouration. Repair or replace the sealant joint when the seal is no longer effective.'**
  String get faqKitAanbrengenA8;

  /// No description provided for @faqKitAanbrengenQ9.
  ///
  /// In en, this message translates to:
  /// **'What safety measures are required?'**
  String get faqKitAanbrengenQ9;

  /// No description provided for @faqKitAanbrengenA9.
  ///
  /// In en, this message translates to:
  /// **'Ensure sufficient ventilation. Wear suitable gloves. Avoid contact with skin and eyes.\n\n⚠️ If in doubt, consult a professional. Always check the instructions for the material being used and the current Dutch regulations.'**
  String get faqKitAanbrengenA9;

  /// No description provided for @faqKitAanbrengenQ10.
  ///
  /// In en, this message translates to:
  /// **'How long does it take?'**
  String get faqKitAanbrengenQ10;

  /// No description provided for @faqKitAanbrengenA10.
  ///
  /// In en, this message translates to:
  /// **'Professional: 0.05 hours per metre. DIY: 0.125 hours per metre.'**
  String get faqKitAanbrengenA10;

  /// No description provided for @faqPlumberQ1.
  ///
  /// In en, this message translates to:
  /// **'How do I fix a dripping faucet?'**
  String get faqPlumberQ1;

  /// No description provided for @faqPlumberA1.
  ///
  /// In en, this message translates to:
  /// **'Usually by replacing the washer or cartridge inside the faucet.'**
  String get faqPlumberA1;

  /// No description provided for @faqPlumberQ2.
  ///
  /// In en, this message translates to:
  /// **'How do I unblock a drain?'**
  String get faqPlumberQ2;

  /// No description provided for @faqPlumberA2.
  ///
  /// In en, this message translates to:
  /// **'Use a plunger, drain snake or suitable drain cleaner.'**
  String get faqPlumberA2;

  /// No description provided for @faqPlumberQ3.
  ///
  /// In en, this message translates to:
  /// **'What is PEX piping?'**
  String get faqPlumberQ3;

  /// No description provided for @faqPlumberA3.
  ///
  /// In en, this message translates to:
  /// **'PEX is flexible plastic piping commonly used for water supply lines.'**
  String get faqPlumberA3;

  /// No description provided for @faqPlumberQ4.
  ///
  /// In en, this message translates to:
  /// **'How do I detect leaks?'**
  String get faqPlumberQ4;

  /// No description provided for @faqPlumberA4.
  ///
  /// In en, this message translates to:
  /// **'Look for water stains, damp spots or unexpected increases in water bills.'**
  String get faqPlumberA4;

  /// No description provided for @faqPlumberQ5.
  ///
  /// In en, this message translates to:
  /// **'Should I use Teflon tape?'**
  String get faqPlumberQ5;

  /// No description provided for @faqPlumberA5.
  ///
  /// In en, this message translates to:
  /// **'Yes, on threaded connections to improve sealing.'**
  String get faqPlumberA5;

  /// No description provided for @faqPlumberQ6.
  ///
  /// In en, this message translates to:
  /// **'Can I replace a toilet myself?'**
  String get faqPlumberQ6;

  /// No description provided for @faqPlumberA6.
  ///
  /// In en, this message translates to:
  /// **'Yes, many homeowners can replace a toilet with basic tools.'**
  String get faqPlumberA6;

  /// No description provided for @faqPlumberQ7.
  ///
  /// In en, this message translates to:
  /// **'How much water pressure is normal?'**
  String get faqPlumberQ7;

  /// No description provided for @faqPlumberA7.
  ///
  /// In en, this message translates to:
  /// **'Most homes operate between 2 and 5 bar.'**
  String get faqPlumberA7;

  /// No description provided for @faqPlumberQ8.
  ///
  /// In en, this message translates to:
  /// **'How do I prevent frozen pipes?'**
  String get faqPlumberQ8;

  /// No description provided for @faqPlumberA8.
  ///
  /// In en, this message translates to:
  /// **'Insulate exposed pipes and maintain indoor temperatures.'**
  String get faqPlumberA8;

  /// No description provided for @faqPlumberQ9.
  ///
  /// In en, this message translates to:
  /// **'What are common plumbing mistakes?'**
  String get faqPlumberQ9;

  /// No description provided for @faqPlumberA9.
  ///
  /// In en, this message translates to:
  /// **'Overtightening fittings and forgetting to check for leaks.'**
  String get faqPlumberA9;

  /// No description provided for @faqPlumberQ10.
  ///
  /// In en, this message translates to:
  /// **'How often should pipes be inspected?'**
  String get faqPlumberQ10;

  /// No description provided for @faqPlumberA10.
  ///
  /// In en, this message translates to:
  /// **'A yearly inspection helps detect issues early.'**
  String get faqPlumberA10;

  /// No description provided for @faqPlumberQ11.
  ///
  /// In en, this message translates to:
  /// **'What tools are essential for beginners?'**
  String get faqPlumberQ11;

  /// No description provided for @faqPlumberA11.
  ///
  /// In en, this message translates to:
  /// **'Adjustable wrench, pliers, pipe cutter and Teflon tape.'**
  String get faqPlumberA11;

  /// No description provided for @faqPlumberQ12.
  ///
  /// In en, this message translates to:
  /// **'Can I install a new sink myself?'**
  String get faqPlumberQ12;

  /// No description provided for @faqPlumberA12.
  ///
  /// In en, this message translates to:
  /// **'Yes, if plumbing connections are straightforward.'**
  String get faqPlumberA12;

  /// No description provided for @faqPlumberQ13.
  ///
  /// In en, this message translates to:
  /// **'How do I reduce water consumption?'**
  String get faqPlumberQ13;

  /// No description provided for @faqPlumberA13.
  ///
  /// In en, this message translates to:
  /// **'Install water-saving fixtures and repair leaks promptly.'**
  String get faqPlumberA13;

  /// No description provided for @faqPlumberQ14.
  ///
  /// In en, this message translates to:
  /// **'How long do plumbing repairs last?'**
  String get faqPlumberQ14;

  /// No description provided for @faqPlumberA14.
  ///
  /// In en, this message translates to:
  /// **'Quality repairs can last many years when done correctly.'**
  String get faqPlumberA14;

  /// No description provided for @faqPlumberQ15.
  ///
  /// In en, this message translates to:
  /// **'When should I call a professional?'**
  String get faqPlumberQ15;

  /// No description provided for @faqPlumberA15.
  ///
  /// In en, this message translates to:
  /// **'For gas lines, major leaks or extensive pipe replacements.'**
  String get faqPlumberA15;

  /// No description provided for @faqPlumberQ16.
  ///
  /// In en, this message translates to:
  /// **'How long does this job take?'**
  String get faqPlumberQ16;

  /// No description provided for @faqPlumberA16.
  ///
  /// In en, this message translates to:
  /// **'Depending on the complexity, a plumbing job takes 1–8 hours. Replacing a simple faucet takes about 30 minutes; laying a pipe can take a day or more.'**
  String get faqPlumberA16;

  /// No description provided for @faqPlumberQ17.
  ///
  /// In en, this message translates to:
  /// **'What tools do I need?'**
  String get faqPlumberQ17;

  /// No description provided for @faqPlumberA17.
  ///
  /// In en, this message translates to:
  /// **'Basic tools: water pump pliers, wrenches, pipe cutter, Teflon tape, soldering torch (for copper work) and a bucket.'**
  String get faqPlumberA17;

  /// No description provided for @faqPlumberQ18.
  ///
  /// In en, this message translates to:
  /// **'Do I need to shut off the water supply?'**
  String get faqPlumberQ18;

  /// No description provided for @faqPlumberA18.
  ///
  /// In en, this message translates to:
  /// **'Yes, always shut off the water supply before starting. Use the main valve or a local shut-off valve and then open a tap to release the pressure.'**
  String get faqPlumberA18;

  /// No description provided for @faqPlumberQ19.
  ///
  /// In en, this message translates to:
  /// **'What type of pipe material should I choose?'**
  String get faqPlumberQ19;

  /// No description provided for @faqPlumberA19.
  ///
  /// In en, this message translates to:
  /// **'Copper is durable but more expensive. PEX is flexible and easy to work with. PVC is widely used for drain pipes. Choose based on the application.'**
  String get faqPlumberA19;

  /// No description provided for @faqPlumberQ20.
  ///
  /// In en, this message translates to:
  /// **'Can I do this as a beginner?'**
  String get faqPlumberQ20;

  /// No description provided for @faqPlumberA20.
  ///
  /// In en, this message translates to:
  /// **'Simple jobs like replacing a faucet or repairing a toilet are perfectly doable on your own. More complex work (gas, new pipework) is better left to a certified plumber.'**
  String get faqPlumberA20;

  /// No description provided for @faqElectricianQ1.
  ///
  /// In en, this message translates to:
  /// **'What is a circuit breaker?'**
  String get faqElectricianQ1;

  /// No description provided for @faqElectricianA1.
  ///
  /// In en, this message translates to:
  /// **'A safety device that cuts power when overloads occur.'**
  String get faqElectricianA1;

  /// No description provided for @faqElectricianQ2.
  ///
  /// In en, this message translates to:
  /// **'How do I test a power outlet?'**
  String get faqElectricianQ2;

  /// No description provided for @faqElectricianA2.
  ///
  /// In en, this message translates to:
  /// **'Use a socket tester or multimeter.'**
  String get faqElectricianA2;

  /// No description provided for @faqElectricianQ3.
  ///
  /// In en, this message translates to:
  /// **'Can I replace a light fixture myself?'**
  String get faqElectricianQ3;

  /// No description provided for @faqElectricianA3.
  ///
  /// In en, this message translates to:
  /// **'Yes, after switching off power and following safety procedures.'**
  String get faqElectricianA3;

  /// No description provided for @faqElectricianQ4.
  ///
  /// In en, this message translates to:
  /// **'Why does a breaker trip?'**
  String get faqElectricianQ4;

  /// No description provided for @faqElectricianA4.
  ///
  /// In en, this message translates to:
  /// **'Usually because of overloads, short circuits or faulty appliances.'**
  String get faqElectricianA4;

  /// No description provided for @faqElectricianQ5.
  ///
  /// In en, this message translates to:
  /// **'What is grounding?'**
  String get faqElectricianQ5;

  /// No description provided for @faqElectricianA5.
  ///
  /// In en, this message translates to:
  /// **'Grounding provides a safe path for electrical faults.'**
  String get faqElectricianA5;

  /// No description provided for @faqElectricianQ6.
  ///
  /// In en, this message translates to:
  /// **'How do I identify wires?'**
  String get faqElectricianQ6;

  /// No description provided for @faqElectricianA6.
  ///
  /// In en, this message translates to:
  /// **'Use local wiring color codes and verify with a tester.'**
  String get faqElectricianA6;

  /// No description provided for @faqElectricianQ7.
  ///
  /// In en, this message translates to:
  /// **'Can I add extra outlets?'**
  String get faqElectricianQ7;

  /// No description provided for @faqElectricianA7.
  ///
  /// In en, this message translates to:
  /// **'Yes, provided the circuit can handle the load.'**
  String get faqElectricianA7;

  /// No description provided for @faqElectricianQ8.
  ///
  /// In en, this message translates to:
  /// **'What PPE should I wear?'**
  String get faqElectricianQ8;

  /// No description provided for @faqElectricianA8.
  ///
  /// In en, this message translates to:
  /// **'Insulated gloves and safety glasses are recommended.'**
  String get faqElectricianA8;

  /// No description provided for @faqElectricianQ9.
  ///
  /// In en, this message translates to:
  /// **'How do I avoid electric shock?'**
  String get faqElectricianQ9;

  /// No description provided for @faqElectricianA9.
  ///
  /// In en, this message translates to:
  /// **'Always isolate power before starting work.'**
  String get faqElectricianA9;

  /// No description provided for @faqElectricianQ10.
  ///
  /// In en, this message translates to:
  /// **'How long do electrical installations last?'**
  String get faqElectricianQ10;

  /// No description provided for @faqElectricianA10.
  ///
  /// In en, this message translates to:
  /// **'Many installations last 20–40 years with proper maintenance.'**
  String get faqElectricianA10;

  /// No description provided for @faqElectricianQ11.
  ///
  /// In en, this message translates to:
  /// **'What is a GFCI/RCD?'**
  String get faqElectricianQ11;

  /// No description provided for @faqElectricianA11.
  ///
  /// In en, this message translates to:
  /// **'A device that protects against electric shock.'**
  String get faqElectricianA11;

  /// No description provided for @faqElectricianQ12.
  ///
  /// In en, this message translates to:
  /// **'Can I install outdoor lighting?'**
  String get faqElectricianQ12;

  /// No description provided for @faqElectricianA12.
  ///
  /// In en, this message translates to:
  /// **'Yes, using weatherproof fixtures and cables.'**
  String get faqElectricianA12;

  /// No description provided for @faqElectricianQ13.
  ///
  /// In en, this message translates to:
  /// **'What are common electrical mistakes?'**
  String get faqElectricianQ13;

  /// No description provided for @faqElectricianA13.
  ///
  /// In en, this message translates to:
  /// **'Working live and using incorrect wire sizes.'**
  String get faqElectricianA13;

  /// No description provided for @faqElectricianQ14.
  ///
  /// In en, this message translates to:
  /// **'How do I calculate power consumption?'**
  String get faqElectricianQ14;

  /// No description provided for @faqElectricianA14.
  ///
  /// In en, this message translates to:
  /// **'Multiply watts by hours of use and divide by 1000.'**
  String get faqElectricianA14;

  /// No description provided for @faqElectricianQ15.
  ///
  /// In en, this message translates to:
  /// **'When should I call an electrician?'**
  String get faqElectricianQ15;

  /// No description provided for @faqElectricianA15.
  ///
  /// In en, this message translates to:
  /// **'For extensions to the fuse box, new wiring or complex installations, it is wise to call a certified electrician.'**
  String get faqElectricianA15;

  /// No description provided for @faqElectricianQ16.
  ///
  /// In en, this message translates to:
  /// **'How long does this job take?'**
  String get faqElectricianQ16;

  /// No description provided for @faqElectricianA16.
  ///
  /// In en, this message translates to:
  /// **'Installing an outlet or switch takes 30–60 minutes. Larger projects such as adding a new circuit can take half to a full day.'**
  String get faqElectricianA16;

  /// No description provided for @faqElectricianQ17.
  ///
  /// In en, this message translates to:
  /// **'What tools do I need?'**
  String get faqElectricianQ17;

  /// No description provided for @faqElectricianA17.
  ///
  /// In en, this message translates to:
  /// **'You need: a screwdriver set, wire puller, side cutters, multimeter, insulation tape and possibly a hammer drill.'**
  String get faqElectricianA17;

  /// No description provided for @faqElectricianQ18.
  ///
  /// In en, this message translates to:
  /// **'How do I work safely?'**
  String get faqElectricianQ18;

  /// No description provided for @faqElectricianA18.
  ///
  /// In en, this message translates to:
  /// **'Always turn off the power via the fuse box and check with a voltage tester that the circuit is truly de-energized before starting.'**
  String get faqElectricianA18;

  /// No description provided for @faqElectricianQ19.
  ///
  /// In en, this message translates to:
  /// **'What wire thickness should I use?'**
  String get faqElectricianQ19;

  /// No description provided for @faqElectricianA19.
  ///
  /// In en, this message translates to:
  /// **'For outlets and lighting: 2.5 mm² for normal circuits. For heavier appliances (hob, washing machine): 4–6 mm². Consult the NEN 1010 standard.'**
  String get faqElectricianA19;

  /// No description provided for @faqElectricianQ20.
  ///
  /// In en, this message translates to:
  /// **'Can I do this as a beginner?'**
  String get faqElectricianQ20;

  /// No description provided for @faqElectricianA20.
  ///
  /// In en, this message translates to:
  /// **'Simple replacements (switch, outlet) can be done independently if you follow safety rules. Work on the fuse box or new circuits should be left to a certified electrician.'**
  String get faqElectricianA20;

  /// No description provided for @faqTilerQ1.
  ///
  /// In en, this message translates to:
  /// **'Which tile adhesive should I use?'**
  String get faqTilerQ1;

  /// No description provided for @faqTilerA1.
  ///
  /// In en, this message translates to:
  /// **'Choose adhesive based on the tile type and substrate. Flexible adhesive is recommended for most modern installations.'**
  String get faqTilerA1;

  /// No description provided for @faqTilerQ2.
  ///
  /// In en, this message translates to:
  /// **'Do I need to waterproof the surface?'**
  String get faqTilerQ2;

  /// No description provided for @faqTilerA2.
  ///
  /// In en, this message translates to:
  /// **'Yes, bathrooms and wet areas should be waterproofed before tiling.'**
  String get faqTilerA2;

  /// No description provided for @faqTilerQ3.
  ///
  /// In en, this message translates to:
  /// **'How do I keep tiles level?'**
  String get faqTilerQ3;

  /// No description provided for @faqTilerA3.
  ///
  /// In en, this message translates to:
  /// **'Use tile spacers and a leveling system to ensure an even surface.'**
  String get faqTilerA3;

  /// No description provided for @faqTilerQ4.
  ///
  /// In en, this message translates to:
  /// **'When can I walk on newly laid tiles?'**
  String get faqTilerQ4;

  /// No description provided for @faqTilerA4.
  ///
  /// In en, this message translates to:
  /// **'Wait at least 24 hours after installation before walking on the tiles.'**
  String get faqTilerA4;

  /// No description provided for @faqTilerQ5.
  ///
  /// In en, this message translates to:
  /// **'How long before grouting?'**
  String get faqTilerQ5;

  /// No description provided for @faqTilerA5.
  ///
  /// In en, this message translates to:
  /// **'Most tile adhesives require 24 hours of curing before grouting.'**
  String get faqTilerA5;

  /// No description provided for @faqTilerQ6.
  ///
  /// In en, this message translates to:
  /// **'What grout color should I choose?'**
  String get faqTilerQ6;

  /// No description provided for @faqTilerA6.
  ///
  /// In en, this message translates to:
  /// **'Choose a grout color that complements your tile or creates the desired contrast.'**
  String get faqTilerA6;

  /// No description provided for @faqTilerQ7.
  ///
  /// In en, this message translates to:
  /// **'How do I cut tiles accurately?'**
  String get faqTilerQ7;

  /// No description provided for @faqTilerA7.
  ///
  /// In en, this message translates to:
  /// **'Use a tile cutter for straight cuts and a wet saw for complex shapes.'**
  String get faqTilerA7;

  /// No description provided for @faqTilerQ8.
  ///
  /// In en, this message translates to:
  /// **'Can I tile over existing tiles?'**
  String get faqTilerQ8;

  /// No description provided for @faqTilerA8.
  ///
  /// In en, this message translates to:
  /// **'Yes, if the existing tiles are stable, clean and properly prepared.'**
  String get faqTilerA8;

  /// No description provided for @faqTilerQ9.
  ///
  /// In en, this message translates to:
  /// **'What are common tiling mistakes?'**
  String get faqTilerQ9;

  /// No description provided for @faqTilerA9.
  ///
  /// In en, this message translates to:
  /// **'Uneven adhesive application, poor spacing and insufficient surface preparation.'**
  String get faqTilerA9;

  /// No description provided for @faqTilerQ10.
  ///
  /// In en, this message translates to:
  /// **'How do I clean grout haze?'**
  String get faqTilerQ10;

  /// No description provided for @faqTilerA10.
  ///
  /// In en, this message translates to:
  /// **'Use a damp sponge shortly after grouting and a grout haze remover if necessary.'**
  String get faqTilerA10;

  /// No description provided for @faqTilerQ11.
  ///
  /// In en, this message translates to:
  /// **'How much grout do I need?'**
  String get faqTilerQ11;

  /// No description provided for @faqTilerA11.
  ///
  /// In en, this message translates to:
  /// **'The amount depends on tile size, thickness and joint width.'**
  String get faqTilerA11;

  /// No description provided for @faqTilerQ12.
  ///
  /// In en, this message translates to:
  /// **'Should I seal grout?'**
  String get faqTilerQ12;

  /// No description provided for @faqTilerA12.
  ///
  /// In en, this message translates to:
  /// **'Sealing grout helps prevent stains and moisture penetration.'**
  String get faqTilerA12;

  /// No description provided for @faqTilerQ13.
  ///
  /// In en, this message translates to:
  /// **'Can beginners tile a bathroom?'**
  String get faqTilerQ13;

  /// No description provided for @faqTilerA13.
  ///
  /// In en, this message translates to:
  /// **'Yes, but start with simple layouts and take time with preparation.'**
  String get faqTilerA13;

  /// No description provided for @faqTilerQ14.
  ///
  /// In en, this message translates to:
  /// **'How do I replace a broken tile?'**
  String get faqTilerQ14;

  /// No description provided for @faqTilerA14.
  ///
  /// In en, this message translates to:
  /// **'Carefully remove the damaged tile and install a matching replacement.'**
  String get faqTilerA14;

  /// No description provided for @faqTilerQ15.
  ///
  /// In en, this message translates to:
  /// **'How long do tiled surfaces last?'**
  String get faqTilerQ15;

  /// No description provided for @faqTilerA15.
  ///
  /// In en, this message translates to:
  /// **'Properly installed tiles can last several decades with minimal maintenance.'**
  String get faqTilerA15;

  /// No description provided for @faqTilerQ16.
  ///
  /// In en, this message translates to:
  /// **'How long does tiling take?'**
  String get faqTilerQ16;

  /// No description provided for @faqTilerA16.
  ///
  /// In en, this message translates to:
  /// **'Tiling a bathroom takes an average of 1–3 days. Tiling a small floor or wall takes about 4–8 hours, depending on the complexity.'**
  String get faqTilerA16;

  /// No description provided for @faqTilerQ17.
  ///
  /// In en, this message translates to:
  /// **'What tools do I need?'**
  String get faqTilerQ17;

  /// No description provided for @faqTilerA17.
  ///
  /// In en, this message translates to:
  /// **'You need: tile cutter, notched trowel, grout float, rubber mallet, spirit level, tape measure, sponge and tile spacers.'**
  String get faqTilerA17;

  /// No description provided for @faqTilerQ18.
  ///
  /// In en, this message translates to:
  /// **'How do I prepare the substrate?'**
  String get faqTilerQ18;

  /// No description provided for @faqTilerA18.
  ///
  /// In en, this message translates to:
  /// **'The substrate must be dry, flat and clean. Check for height differences with a spirit level. Apply tile adhesive to an even substrate.'**
  String get faqTilerA18;

  /// No description provided for @faqTilerQ19.
  ///
  /// In en, this message translates to:
  /// **'How many extra tiles do I need?'**
  String get faqTilerQ19;

  /// No description provided for @faqTilerA19.
  ///
  /// In en, this message translates to:
  /// **'Always order 10–15% extra. For diagonal or herringbone patterns, allow even 20% extra for cutting loss.'**
  String get faqTilerA19;

  /// No description provided for @faqTilerQ20.
  ///
  /// In en, this message translates to:
  /// **'Can I do this as a beginner?'**
  String get faqTilerQ20;

  /// No description provided for @faqTilerA20.
  ///
  /// In en, this message translates to:
  /// **'Simple tiling can be done independently with the right preparation. Start with a straight wall or floor without many niches or obstacles.'**
  String get faqTilerA20;

  /// No description provided for @faqSchuttingPlaatsenQ1.
  ///
  /// In en, this message translates to:
  /// **'Do I need a permit to install a fence?'**
  String get faqSchuttingPlaatsenQ1;

  /// No description provided for @faqSchuttingPlaatsenA1.
  ///
  /// In en, this message translates to:
  /// **'Check in advance via the Omgevingsloket and/or your local council whether a permit or notification is required for your location, height, boundary, and construction.'**
  String get faqSchuttingPlaatsenA1;

  /// No description provided for @faqSchuttingPlaatsenQ2.
  ///
  /// In en, this message translates to:
  /// **'How many posts and what is the correct spacing?'**
  String get faqSchuttingPlaatsenQ2;

  /// No description provided for @faqSchuttingPlaatsenA2.
  ///
  /// In en, this message translates to:
  /// **'The number of posts and their spacing depend on the chosen system, panel width and wind load. Follow the manufacturer\'s specifications.'**
  String get faqSchuttingPlaatsenA2;

  /// No description provided for @faqSchuttingPlaatsenQ3.
  ///
  /// In en, this message translates to:
  /// **'How deep do the posts need to go?'**
  String get faqSchuttingPlaatsenQ3;

  /// No description provided for @faqSchuttingPlaatsenA3.
  ///
  /// In en, this message translates to:
  /// **'As a general guideline, approximately 1/3 of the post length should be underground, but the required foundation depth depends on soil, post thickness, wind load and the chosen system. Always follow the specifications of the chosen system.'**
  String get faqSchuttingPlaatsenA3;

  /// No description provided for @faqSchuttingPlaatsenQ4.
  ///
  /// In en, this message translates to:
  /// **'Which post thickness should I choose?'**
  String get faqSchuttingPlaatsenQ4;

  /// No description provided for @faqSchuttingPlaatsenA4.
  ///
  /// In en, this message translates to:
  /// **'Choose a thicker post for a robust appearance or in high wind areas. Follow the advice of the manufacturer or supplier.'**
  String get faqSchuttingPlaatsenA4;

  /// No description provided for @faqSchuttingPlaatsenQ5.
  ///
  /// In en, this message translates to:
  /// **'How long must the concrete cure before loading the fence?'**
  String get faqSchuttingPlaatsenQ5;

  /// No description provided for @faqSchuttingPlaatsenA5.
  ///
  /// In en, this message translates to:
  /// **'Follow the specifications of the concrete product used. Curing time depends on temperature, moisture and product; 24 hours is not automatically sufficient for full load.'**
  String get faqSchuttingPlaatsenA5;

  /// No description provided for @faqSchuttingPlaatsenQ6.
  ///
  /// In en, this message translates to:
  /// **'How do I ensure the fence is level?'**
  String get faqSchuttingPlaatsenQ6;

  /// No description provided for @faqSchuttingPlaatsenA6.
  ///
  /// In en, this message translates to:
  /// **'Use a spirit level and guide line, each post at equal height. Check regularly. Use a suitable and safe ladder or platform for placing the top panels.'**
  String get faqSchuttingPlaatsenA6;

  /// No description provided for @faqSchuttingPlaatsenQ7.
  ///
  /// In en, this message translates to:
  /// **'What if the ground is too soft?'**
  String get faqSchuttingPlaatsenQ7;

  /// No description provided for @faqSchuttingPlaatsenA7.
  ///
  /// In en, this message translates to:
  /// **'Extra concrete or dig deeper. Consider a post holder. Follow the system advice.'**
  String get faqSchuttingPlaatsenA7;

  /// No description provided for @faqSchuttingPlaatsenQ8.
  ///
  /// In en, this message translates to:
  /// **'How do I maintain the fence?'**
  String get faqSchuttingPlaatsenQ8;

  /// No description provided for @faqSchuttingPlaatsenA8.
  ///
  /// In en, this message translates to:
  /// **'Wood: check periodically and treat according to the maintenance advice for the wood type or manufacturer (e.g. wood stain or wood oil). Plastic: rinse with water.'**
  String get faqSchuttingPlaatsenA8;

  /// No description provided for @faqSchuttingPlaatsenQ9.
  ///
  /// In en, this message translates to:
  /// **'What are the most common mistakes?'**
  String get faqSchuttingPlaatsenQ9;

  /// No description provided for @faqSchuttingPlaatsenA9.
  ///
  /// In en, this message translates to:
  /// **'Not deep enough, not level, too few posts or insufficient foundation, system specifications not followed.'**
  String get faqSchuttingPlaatsenA9;

  /// No description provided for @faqSchuttingPlaatsenQ10.
  ///
  /// In en, this message translates to:
  /// **'Best tip for a sturdy fence?'**
  String get faqSchuttingPlaatsenQ10;

  /// No description provided for @faqSchuttingPlaatsenA10.
  ///
  /// In en, this message translates to:
  /// **'Posts in concrete according to the system, use stainless steel screws. Always follow the manufacturer\'s specifications.'**
  String get faqSchuttingPlaatsenA10;

  /// No description provided for @faqBestratingAanleggenQ1.
  ///
  /// In en, this message translates to:
  /// **'Do I need to prepare the ground?'**
  String get faqBestratingAanleggenQ1;

  /// No description provided for @faqBestratingAanleggenA1.
  ///
  /// In en, this message translates to:
  /// **'Yes. Excavate to the required depth, remove old paving and level the surface. A weed control membrane is not always necessary; only use it if appropriate for your application.'**
  String get faqBestratingAanleggenA1;

  /// No description provided for @faqBestratingAanleggenQ2.
  ///
  /// In en, this message translates to:
  /// **'How much material do I need?'**
  String get faqBestratingAanleggenQ2;

  /// No description provided for @faqBestratingAanleggenA2.
  ///
  /// In en, this message translates to:
  /// **'Calculate the area in m² and determine the quantity of gravel tiles based on 60 x 60 cm per tile. Allow for project-specific cutting waste; with a lot of sawing, more than 5% is needed.'**
  String get faqBestratingAanleggenA2;

  /// No description provided for @faqBestratingAanleggenQ3.
  ///
  /// In en, this message translates to:
  /// **'How do I make a good sand bed?'**
  String get faqBestratingAanleggenQ3;

  /// No description provided for @faqBestratingAanleggenA3.
  ///
  /// In en, this message translates to:
  /// **'The required foundation and sand layer depend on the load, subsoil and type of paving. Apply the correct layer thickness, compact it well and ensure a stable base.'**
  String get faqBestratingAanleggenA3;

  /// No description provided for @faqBestratingAanleggenQ4.
  ///
  /// In en, this message translates to:
  /// **'How do I lay the paving?'**
  String get faqBestratingAanleggenQ4;

  /// No description provided for @faqBestratingAanleggenA4.
  ///
  /// In en, this message translates to:
  /// **'Lay the blocks tightly against each other and tap them down with a rubber mallet. Check for height differences regularly.'**
  String get faqBestratingAanleggenA4;

  /// No description provided for @faqBestratingAanleggenQ5.
  ///
  /// In en, this message translates to:
  /// **'How long should the sand bed rest?'**
  String get faqBestratingAanleggenQ5;

  /// No description provided for @faqBestratingAanleggenA5.
  ///
  /// In en, this message translates to:
  /// **'You can start laying immediately after compacting, provided the sand bed is well compacted. Work in small sections.'**
  String get faqBestratingAanleggenA5;

  /// No description provided for @faqBestratingAanleggenQ6.
  ///
  /// In en, this message translates to:
  /// **'How do I fix a sunken area?'**
  String get faqBestratingAanleggenQ6;

  /// No description provided for @faqBestratingAanleggenA6.
  ///
  /// In en, this message translates to:
  /// **'Lift the sunken tiles, top up the sand bed, compact it again and replace the tiles level.'**
  String get faqBestratingAanleggenA6;

  /// No description provided for @faqBestratingAanleggenQ7.
  ///
  /// In en, this message translates to:
  /// **'How do I maintain the paving?'**
  String get faqBestratingAanleggenQ7;

  /// No description provided for @faqBestratingAanleggenA7.
  ///
  /// In en, this message translates to:
  /// **'Sweep regularly, remove weeds between the joints and top up the jointing sand if necessary.'**
  String get faqBestratingAanleggenA7;

  /// No description provided for @faqBestratingAanleggenQ8.
  ///
  /// In en, this message translates to:
  /// **'What safety precautions apply?'**
  String get faqBestratingAanleggenQ8;

  /// No description provided for @faqBestratingAanleggenA8.
  ///
  /// In en, this message translates to:
  /// **'Gloves and safety glasses. Wear a dust mask when dust is released, for example during dry sawing.'**
  String get faqBestratingAanleggenA8;

  /// No description provided for @faqBestratingAanleggenQ9.
  ///
  /// In en, this message translates to:
  /// **'What are the most common mistakes?'**
  String get faqBestratingAanleggenQ9;

  /// No description provided for @faqBestratingAanleggenA9.
  ///
  /// In en, this message translates to:
  /// **'Insufficient foundation or compaction, incorrect drainage, wrong layer structure, insufficient slope.'**
  String get faqBestratingAanleggenA9;

  /// No description provided for @faqBestratingAanleggenQ10.
  ///
  /// In en, this message translates to:
  /// **'Best tip for a sleek result?'**
  String get faqBestratingAanleggenQ10;

  /// No description provided for @faqBestratingAanleggenA10.
  ///
  /// In en, this message translates to:
  /// **'Maintain sufficient slope for good water drainage; the required gradient depends on the application and subsoil. Check with a spirit level.'**
  String get faqBestratingAanleggenA10;

  /// No description provided for @faqSnoeienQ1.
  ///
  /// In en, this message translates to:
  /// **'When is the best time to prune?'**
  String get faqSnoeienQ1;

  /// No description provided for @faqSnoeienA1.
  ///
  /// In en, this message translates to:
  /// **'The correct pruning time and method differ per hydrangea species. First check which species you have. Then follow the advice for that specific species.'**
  String get faqSnoeienA1;

  /// No description provided for @faqSnoeienQ2.
  ///
  /// In en, this message translates to:
  /// **'What tools do I need?'**
  String get faqSnoeienQ2;

  /// No description provided for @faqSnoeienA2.
  ///
  /// In en, this message translates to:
  /// **'Pruning shears for thin branches, loppers or pruning saw for thicker branches. Sharp tools.'**
  String get faqSnoeienA2;

  /// No description provided for @faqSnoeienQ3.
  ///
  /// In en, this message translates to:
  /// **'How many branches should I remove?'**
  String get faqSnoeienQ3;

  /// No description provided for @faqSnoeienA3.
  ///
  /// In en, this message translates to:
  /// **'Do not prune too much at once. Remove dead, diseased or damaged branches and old flowers. The approach differs per species (mophead hydrangea versus panicle hydrangea).'**
  String get faqSnoeienA3;

  /// No description provided for @faqSnoeienQ4.
  ///
  /// In en, this message translates to:
  /// **'How exactly should I prune?'**
  String get faqSnoeienQ4;

  /// No description provided for @faqSnoeienA4.
  ///
  /// In en, this message translates to:
  /// **'Cut just above a new green bud or growing point, at an angle away from the bud. Work from the inside out.'**
  String get faqSnoeienA4;

  /// No description provided for @faqSnoeienQ5.
  ///
  /// In en, this message translates to:
  /// **'How do I repair damage from pruning?'**
  String get faqSnoeienQ5;

  /// No description provided for @faqSnoeienA5.
  ///
  /// In en, this message translates to:
  /// **'Prune damaged branches back to healthy wood. Let the plant rest.'**
  String get faqSnoeienA5;

  /// No description provided for @faqSnoeienQ6.
  ///
  /// In en, this message translates to:
  /// **'How do I maintain plants after pruning?'**
  String get faqSnoeienQ6;

  /// No description provided for @faqSnoeienA6.
  ///
  /// In en, this message translates to:
  /// **'Water the plant after pruning only when necessary and apply fertiliser according to the hydrangea\'s needs. Remove pruning waste.'**
  String get faqSnoeienA6;

  /// No description provided for @faqSnoeienQ7.
  ///
  /// In en, this message translates to:
  /// **'What safety precautions apply?'**
  String get faqSnoeienQ7;

  /// No description provided for @faqSnoeienA7.
  ///
  /// In en, this message translates to:
  /// **'Gloves, safety glasses, stable ladder for high work. Watch out for falling branches.'**
  String get faqSnoeienA7;

  /// No description provided for @faqSnoeienQ8.
  ///
  /// In en, this message translates to:
  /// **'What are the most common mistakes?'**
  String get faqSnoeienQ8;

  /// No description provided for @faqSnoeienA8.
  ///
  /// In en, this message translates to:
  /// **'Wrong period, wrong pruning method for the species, blunt tools, not clearing waste.'**
  String get faqSnoeienA8;

  /// No description provided for @faqSnoeienQ9.
  ///
  /// In en, this message translates to:
  /// **'Best tip for pruning?'**
  String get faqSnoeienQ9;

  /// No description provided for @faqSnoeienA9.
  ///
  /// In en, this message translates to:
  /// **'Preferably do not prune during frost or when severe frost is expected directly after pruning. First check which hydrangea species you have and follow the advice for that species.'**
  String get faqSnoeienA9;

  /// No description provided for @faqSnoeienQ10.
  ///
  /// In en, this message translates to:
  /// **'Should I treat pruning wounds with a product?'**
  String get faqSnoeienQ10;

  /// No description provided for @faqSnoeienA10.
  ///
  /// In en, this message translates to:
  /// **'No, the use of wound sealants is not recommended as standard for hydrangeas. The plant heals best naturally after a clean, sharp cut.'**
  String get faqSnoeienA10;

  /// No description provided for @faqOverkappingBouwenQ1.
  ///
  /// In en, this message translates to:
  /// **'Do I need a permit?'**
  String get faqOverkappingBouwenQ1;

  /// No description provided for @faqOverkappingBouwenA1.
  ///
  /// In en, this message translates to:
  /// **'Check beforehand with your local authority whether a permit or notification is required for the canopy. Also check any local association rules.'**
  String get faqOverkappingBouwenA1;

  /// No description provided for @faqOverkappingBouwenQ2.
  ///
  /// In en, this message translates to:
  /// **'How many posts do I need and how heavy should they be?'**
  String get faqOverkappingBouwenQ2;

  /// No description provided for @faqOverkappingBouwenA2.
  ///
  /// In en, this message translates to:
  /// **'The number and dimensions of posts, beams and connections depend on the dimensions, span, roof load, wind load and foundation. Consult a structural engineer if in doubt.'**
  String get faqOverkappingBouwenA2;

  /// No description provided for @faqOverkappingBouwenQ3.
  ///
  /// In en, this message translates to:
  /// **'How do I build a sturdy frame?'**
  String get faqOverkappingBouwenQ3;

  /// No description provided for @faqOverkappingBouwenA3.
  ///
  /// In en, this message translates to:
  /// **'Use the correct wood dimensions and connections according to the structural calculation. Ensure a level and stable frame. Consult a structural engineer if in doubt.'**
  String get faqOverkappingBouwenA3;

  /// No description provided for @faqOverkappingBouwenQ4.
  ///
  /// In en, this message translates to:
  /// **'How long should the concrete dry?'**
  String get faqOverkappingBouwenQ4;

  /// No description provided for @faqOverkappingBouwenA4.
  ///
  /// In en, this message translates to:
  /// **'Follow the specifications of the concrete product used. Curing time depends on temperature, moisture and product; 24 hours is not automatically sufficient for full load.'**
  String get faqOverkappingBouwenA4;

  /// No description provided for @faqOverkappingBouwenQ5.
  ///
  /// In en, this message translates to:
  /// **'How do I prevent the wood from rotting or discolouring?'**
  String get faqOverkappingBouwenQ5;

  /// No description provided for @faqOverkappingBouwenA5.
  ///
  /// In en, this message translates to:
  /// **'Choose a suitable wood type or another material (plastic/aluminium). Treat according to the manufacturer\'s maintenance advice.'**
  String get faqOverkappingBouwenA5;

  /// No description provided for @faqOverkappingBouwenQ6.
  ///
  /// In en, this message translates to:
  /// **'How do I ensure good drainage?'**
  String get faqOverkappingBouwenQ6;

  /// No description provided for @faqOverkappingBouwenA6.
  ///
  /// In en, this message translates to:
  /// **'Maintain sufficient slope for good water drainage; the required gradient depends on application and roofing material. Follow the specifications of the roofing material.'**
  String get faqOverkappingBouwenA6;

  /// No description provided for @faqOverkappingBouwenQ7.
  ///
  /// In en, this message translates to:
  /// **'How do I maintain the canopy?'**
  String get faqOverkappingBouwenQ7;

  /// No description provided for @faqOverkappingBouwenA7.
  ///
  /// In en, this message translates to:
  /// **'Check annually for damage and clean the roof. Treat woodwork according to the maintenance advice for the wood type or manufacturer.'**
  String get faqOverkappingBouwenA7;

  /// No description provided for @faqOverkappingBouwenQ8.
  ///
  /// In en, this message translates to:
  /// **'What safety precautions apply?'**
  String get faqOverkappingBouwenQ8;

  /// No description provided for @faqOverkappingBouwenA8.
  ///
  /// In en, this message translates to:
  /// **'Helmet, gloves, scaffolding. Never work at height alone. Use a suitable and safe ladder or platform for lower work.'**
  String get faqOverkappingBouwenA8;

  /// No description provided for @faqOverkappingBouwenQ9.
  ///
  /// In en, this message translates to:
  /// **'What are the most common mistakes?'**
  String get faqOverkappingBouwenQ9;

  /// No description provided for @faqOverkappingBouwenA9.
  ///
  /// In en, this message translates to:
  /// **'Insufficient or incorrectly executed structure, not level, wrong roof pitch, no good foundation, forgetting the permit.'**
  String get faqOverkappingBouwenA9;

  /// No description provided for @faqOverkappingBouwenQ10.
  ///
  /// In en, this message translates to:
  /// **'Best tip for a good canopy?'**
  String get faqOverkappingBouwenQ10;

  /// No description provided for @faqOverkappingBouwenA10.
  ///
  /// In en, this message translates to:
  /// **'Maintain sufficient slope for rain drainage. Check everything level. Consult a structural engineer if in doubt.'**
  String get faqOverkappingBouwenA10;

  /// No description provided for @faqGazonLeggenQ1.
  ///
  /// In en, this message translates to:
  /// **'Why choose artificial grass?'**
  String get faqGazonLeggenQ1;

  /// No description provided for @faqGazonLeggenA1.
  ///
  /// In en, this message translates to:
  /// **'Artificial grass generally requires less maintenance than natural grass and stays green all year round. Regular cleaning and brushing is still needed. Choose a quality that suits the usage.'**
  String get faqGazonLeggenA1;

  /// No description provided for @faqGazonLeggenQ2.
  ///
  /// In en, this message translates to:
  /// **'Do I need to prepare the ground?'**
  String get faqGazonLeggenQ2;

  /// No description provided for @faqGazonLeggenA2.
  ///
  /// In en, this message translates to:
  /// **'Yes, level and compact. Remove old turf, weeds and unevenness. Apply a stable base layer.'**
  String get faqGazonLeggenA2;

  /// No description provided for @faqGazonLeggenQ3.
  ///
  /// In en, this message translates to:
  /// **'How much artificial grass do I need?'**
  String get faqGazonLeggenQ3;

  /// No description provided for @faqGazonLeggenA3.
  ///
  /// In en, this message translates to:
  /// **'Area + cutting waste (minimum 5%, more with extensive cutting). Artificial grass is usually supplied on rolls with a fixed width.'**
  String get faqGazonLeggenA3;

  /// No description provided for @faqGazonLeggenQ4.
  ///
  /// In en, this message translates to:
  /// **'How do I lay artificial grass?'**
  String get faqGazonLeggenQ4;

  /// No description provided for @faqGazonLeggenA4.
  ///
  /// In en, this message translates to:
  /// **'Roll out the artificial grass, let it acclimatise to the temperature, cut to size and lay the seams tightly together. Optionally use seam tape.'**
  String get faqGazonLeggenA4;

  /// No description provided for @faqGazonLeggenQ5.
  ///
  /// In en, this message translates to:
  /// **'How do I maintain artificial grass?'**
  String get faqGazonLeggenQ5;

  /// No description provided for @faqGazonLeggenA5.
  ///
  /// In en, this message translates to:
  /// **'Brush regularly, remove leaves and rinse with water. Do not use aggressive products.'**
  String get faqGazonLeggenA5;

  /// No description provided for @faqGazonLeggenQ6.
  ///
  /// In en, this message translates to:
  /// **'What should I do about puddles or poor drainage?'**
  String get faqGazonLeggenQ6;

  /// No description provided for @faqGazonLeggenA6.
  ///
  /// In en, this message translates to:
  /// **'Ensure a permeable base layer. A drainage system may be needed in heavy rain.'**
  String get faqGazonLeggenA6;

  /// No description provided for @faqGazonLeggenQ7.
  ///
  /// In en, this message translates to:
  /// **'What safety precautions apply?'**
  String get faqGazonLeggenQ7;

  /// No description provided for @faqGazonLeggenA7.
  ///
  /// In en, this message translates to:
  /// **'Gloves when cutting. Watch out for heavy equipment. Work stably.'**
  String get faqGazonLeggenA7;

  /// No description provided for @faqGazonLeggenQ8.
  ///
  /// In en, this message translates to:
  /// **'What are the most common mistakes?'**
  String get faqGazonLeggenQ8;

  /// No description provided for @faqGazonLeggenA8.
  ///
  /// In en, this message translates to:
  /// **'Insufficient levelling, no stable base layer, seams not tight, incorrect cutting technique.'**
  String get faqGazonLeggenA8;

  /// No description provided for @faqGazonLeggenQ9.
  ///
  /// In en, this message translates to:
  /// **'What are the most common mistakes?'**
  String get faqGazonLeggenQ9;

  /// No description provided for @faqGazonLeggenA9.
  ///
  /// In en, this message translates to:
  /// **'Not levelling the ground properly, watering too little or irregularly, laying at the wrong time of year and not pressing the ground down enough.'**
  String get faqGazonLeggenA9;

  /// No description provided for @faqGazonLeggenQ10.
  ///
  /// In en, this message translates to:
  /// **'Best tip for a beautiful lawn?'**
  String get faqGazonLeggenQ10;

  /// No description provided for @faqGazonLeggenA10.
  ///
  /// In en, this message translates to:
  /// **'Lay or sow the lawn in spring or early autumn for the best growth and rooting. Avoid laying during hot, dry summer months.'**
  String get faqGazonLeggenA10;

  /// No description provided for @faqGardenerQ1.
  ///
  /// In en, this message translates to:
  /// **'How often should I water plants?'**
  String get faqGardenerQ1;

  /// No description provided for @faqGardenerA1.
  ///
  /// In en, this message translates to:
  /// **'Most plants benefit from deep watering 1–3 times per week depending on weather conditions.'**
  String get faqGardenerA1;

  /// No description provided for @faqGardenerQ2.
  ///
  /// In en, this message translates to:
  /// **'What type of soil is best?'**
  String get faqGardenerQ2;

  /// No description provided for @faqGardenerA2.
  ///
  /// In en, this message translates to:
  /// **'Well-draining soil enriched with compost is suitable for most garden plants.'**
  String get faqGardenerA2;

  /// No description provided for @faqGardenerQ3.
  ///
  /// In en, this message translates to:
  /// **'How do I improve soil quality?'**
  String get faqGardenerQ3;

  /// No description provided for @faqGardenerA3.
  ///
  /// In en, this message translates to:
  /// **'Add compost, organic matter and mulch regularly.'**
  String get faqGardenerA3;

  /// No description provided for @faqGardenerQ4.
  ///
  /// In en, this message translates to:
  /// **'When should I fertilize?'**
  String get faqGardenerQ4;

  /// No description provided for @faqGardenerA4.
  ///
  /// In en, this message translates to:
  /// **'Most plants benefit from fertilizing during the growing season.'**
  String get faqGardenerA4;

  /// No description provided for @faqGardenerQ5.
  ///
  /// In en, this message translates to:
  /// **'How do I control weeds?'**
  String get faqGardenerQ5;

  /// No description provided for @faqGardenerA5.
  ///
  /// In en, this message translates to:
  /// **'Mulching and regular weeding are the most effective methods.'**
  String get faqGardenerA5;

  /// No description provided for @faqGardenerQ6.
  ///
  /// In en, this message translates to:
  /// **'Can I plant during summer?'**
  String get faqGardenerQ6;

  /// No description provided for @faqGardenerA6.
  ///
  /// In en, this message translates to:
  /// **'Yes, but plants may require more frequent watering.'**
  String get faqGardenerA6;

  /// No description provided for @faqGardenerQ7.
  ///
  /// In en, this message translates to:
  /// **'What is mulch used for?'**
  String get faqGardenerQ7;

  /// No description provided for @faqGardenerA7.
  ///
  /// In en, this message translates to:
  /// **'Mulch retains moisture, suppresses weeds and improves soil health.'**
  String get faqGardenerA7;

  /// No description provided for @faqGardenerQ8.
  ///
  /// In en, this message translates to:
  /// **'How do I prune shrubs correctly?'**
  String get faqGardenerQ8;

  /// No description provided for @faqGardenerA8.
  ///
  /// In en, this message translates to:
  /// **'Remove dead or damaged branches and prune according to the plant type.'**
  String get faqGardenerA8;

  /// No description provided for @faqGardenerQ9.
  ///
  /// In en, this message translates to:
  /// **'How can I attract pollinators?'**
  String get faqGardenerQ9;

  /// No description provided for @faqGardenerA9.
  ///
  /// In en, this message translates to:
  /// **'Plant flowering species that attract bees and butterflies.'**
  String get faqGardenerA9;

  /// No description provided for @faqGardenerQ10.
  ///
  /// In en, this message translates to:
  /// **'How do I prevent pests naturally?'**
  String get faqGardenerQ10;

  /// No description provided for @faqGardenerA10.
  ///
  /// In en, this message translates to:
  /// **'Encourage beneficial insects and use organic pest control methods.'**
  String get faqGardenerA10;

  /// No description provided for @faqGardenerQ11.
  ///
  /// In en, this message translates to:
  /// **'When is the best time to mow the lawn?'**
  String get faqGardenerQ11;

  /// No description provided for @faqGardenerA11.
  ///
  /// In en, this message translates to:
  /// **'Mow regularly during the growing season and avoid cutting too short.'**
  String get faqGardenerA11;

  /// No description provided for @faqGardenerQ12.
  ///
  /// In en, this message translates to:
  /// **'How do I start a vegetable garden?'**
  String get faqGardenerQ12;

  /// No description provided for @faqGardenerA12.
  ///
  /// In en, this message translates to:
  /// **'Choose a sunny location, prepare the soil and select suitable crops.'**
  String get faqGardenerA12;

  /// No description provided for @faqGardenerQ13.
  ///
  /// In en, this message translates to:
  /// **'Can I garden in containers?'**
  String get faqGardenerQ13;

  /// No description provided for @faqGardenerA13.
  ///
  /// In en, this message translates to:
  /// **'Yes, container gardening is ideal for patios and small spaces.'**
  String get faqGardenerA13;

  /// No description provided for @faqGardenerQ14.
  ///
  /// In en, this message translates to:
  /// **'How do I reduce garden maintenance?'**
  String get faqGardenerQ14;

  /// No description provided for @faqGardenerA14.
  ///
  /// In en, this message translates to:
  /// **'Use mulch, drought-tolerant plants and automated irrigation where possible.'**
  String get faqGardenerA14;

  /// No description provided for @faqGardenerQ15.
  ///
  /// In en, this message translates to:
  /// **'What are common gardening mistakes?'**
  String get faqGardenerQ15;

  /// No description provided for @faqGardenerA15.
  ///
  /// In en, this message translates to:
  /// **'Overwatering, poor plant spacing and neglecting soil preparation.'**
  String get faqGardenerA15;

  /// No description provided for @faqGardenerQ16.
  ///
  /// In en, this message translates to:
  /// **'How long does this garden job take?'**
  String get faqGardenerQ16;

  /// No description provided for @faqGardenerA16.
  ///
  /// In en, this message translates to:
  /// **'This varies greatly per job. Laying a lawn takes half a day; laying a terrace can take 1–3 days, depending on the size.'**
  String get faqGardenerA16;

  /// No description provided for @faqGardenerQ17.
  ///
  /// In en, this message translates to:
  /// **'What tools do I need?'**
  String get faqGardenerQ17;

  /// No description provided for @faqGardenerA17.
  ///
  /// In en, this message translates to:
  /// **'Basic tools: spade, rake, wheelbarrow, pruning shears and garden gloves. Specific jobs may require additional tools.'**
  String get faqGardenerA17;

  /// No description provided for @faqGardenerQ18.
  ///
  /// In en, this message translates to:
  /// **'When is the best time for garden work?'**
  String get faqGardenerQ18;

  /// No description provided for @faqGardenerA18.
  ///
  /// In en, this message translates to:
  /// **'Spring and autumn are ideal times for planting and major work. Avoid extreme heat or frost.'**
  String get faqGardenerA18;

  /// No description provided for @faqGardenerQ19.
  ///
  /// In en, this message translates to:
  /// **'How do I check if my soil is good?'**
  String get faqGardenerQ19;

  /// No description provided for @faqGardenerA19.
  ///
  /// In en, this message translates to:
  /// **'Take a soil sample and test the pH value. Most plants grow best at a pH of 6–7. Add compost to improve soil quality.'**
  String get faqGardenerA19;

  /// No description provided for @faqGardenerQ20.
  ///
  /// In en, this message translates to:
  /// **'Can I do this as a beginner?'**
  String get faqGardenerQ20;

  /// No description provided for @faqGardenerA20.
  ///
  /// In en, this message translates to:
  /// **'Yes, most garden jobs can be done independently with the right tools and our step-by-step guide.'**
  String get faqGardenerA20;

  /// No description provided for @faqCarpenterQ1.
  ///
  /// In en, this message translates to:
  /// **'What type of wood should I choose?'**
  String get faqCarpenterQ1;

  /// No description provided for @faqCarpenterA1.
  ///
  /// In en, this message translates to:
  /// **'The best choice depends on the project. Pine is affordable, while hardwoods are more durable.'**
  String get faqCarpenterA1;

  /// No description provided for @faqCarpenterQ2.
  ///
  /// In en, this message translates to:
  /// **'How do I measure accurately?'**
  String get faqCarpenterQ2;

  /// No description provided for @faqCarpenterA2.
  ///
  /// In en, this message translates to:
  /// **'Measure twice and cut once to avoid costly mistakes.'**
  String get faqCarpenterA2;

  /// No description provided for @faqCarpenterQ3.
  ///
  /// In en, this message translates to:
  /// **'Should I pre-drill holes?'**
  String get faqCarpenterQ3;

  /// No description provided for @faqCarpenterA3.
  ///
  /// In en, this message translates to:
  /// **'Yes, pre-drilling helps prevent wood from splitting.'**
  String get faqCarpenterA3;

  /// No description provided for @faqCarpenterQ4.
  ///
  /// In en, this message translates to:
  /// **'What screws should I use?'**
  String get faqCarpenterQ4;

  /// No description provided for @faqCarpenterA4.
  ///
  /// In en, this message translates to:
  /// **'Summary for the average DIYer:\nOutdoor = Stainless steel (RVS) with Torx, length is 2.5x timber thickness, and thickness is 6mm for rafters/battens and 8mm+ for heavy structural beams. Indoor = affordable galvanized screws with the same length rule.'**
  String get faqCarpenterA4;

  /// No description provided for @faqCarpenterQ5.
  ///
  /// In en, this message translates to:
  /// **'How do I keep cuts straight?'**
  String get faqCarpenterQ5;

  /// No description provided for @faqCarpenterA5.
  ///
  /// In en, this message translates to:
  /// **'Use a guide rail, square or fence when cutting.'**
  String get faqCarpenterA5;

  /// No description provided for @faqCarpenterQ6.
  ///
  /// In en, this message translates to:
  /// **'Can I use reclaimed wood?'**
  String get faqCarpenterQ6;

  /// No description provided for @faqCarpenterA6.
  ///
  /// In en, this message translates to:
  /// **'Yes, provided it is clean, dry and structurally sound.'**
  String get faqCarpenterA6;

  /// No description provided for @faqCarpenterQ7.
  ///
  /// In en, this message translates to:
  /// **'How do I prevent wood from warping?'**
  String get faqCarpenterQ7;

  /// No description provided for @faqCarpenterA7.
  ///
  /// In en, this message translates to:
  /// **'Store wood flat in a dry environment before use.'**
  String get faqCarpenterA7;

  /// No description provided for @faqCarpenterQ8.
  ///
  /// In en, this message translates to:
  /// **'What safety equipment should I wear?'**
  String get faqCarpenterQ8;

  /// No description provided for @faqCarpenterA8.
  ///
  /// In en, this message translates to:
  /// **'Safety glasses, hearing protection and dust masks are recommended.'**
  String get faqCarpenterA8;

  /// No description provided for @faqCarpenterQ9.
  ///
  /// In en, this message translates to:
  /// **'How do I sand wood properly?'**
  String get faqCarpenterQ9;

  /// No description provided for @faqCarpenterA9.
  ///
  /// In en, this message translates to:
  /// **'Start with coarse grit and gradually move to finer grits.'**
  String get faqCarpenterA9;

  /// No description provided for @faqCarpenterQ10.
  ///
  /// In en, this message translates to:
  /// **'When should I use wood glue?'**
  String get faqCarpenterQ10;

  /// No description provided for @faqCarpenterA10.
  ///
  /// In en, this message translates to:
  /// **'Wood glue strengthens joints and is recommended for most woodworking projects.'**
  String get faqCarpenterA10;

  /// No description provided for @faqCarpenterQ11.
  ///
  /// In en, this message translates to:
  /// **'How do I finish wood surfaces?'**
  String get faqCarpenterQ11;

  /// No description provided for @faqCarpenterA11.
  ///
  /// In en, this message translates to:
  /// **'Apply stain, varnish, oil or paint depending on the desired appearance.'**
  String get faqCarpenterA11;

  /// No description provided for @faqCarpenterQ12.
  ///
  /// In en, this message translates to:
  /// **'What are common carpentry mistakes?'**
  String get faqCarpenterQ12;

  /// No description provided for @faqCarpenterA12.
  ///
  /// In en, this message translates to:
  /// **'Incorrect measurements, poor alignment and rushing the assembly process.'**
  String get faqCarpenterA12;

  /// No description provided for @faqCarpenterQ13.
  ///
  /// In en, this message translates to:
  /// **'How long does a woodworking project last?'**
  String get faqCarpenterQ13;

  /// No description provided for @faqCarpenterA13.
  ///
  /// In en, this message translates to:
  /// **'With proper materials and maintenance, woodworking projects can last decades.'**
  String get faqCarpenterA13;

  /// No description provided for @faqCarpenterQ14.
  ///
  /// In en, this message translates to:
  /// **'How long does this job take?'**
  String get faqCarpenterQ14;

  /// No description provided for @faqCarpenterA14.
  ///
  /// In en, this message translates to:
  /// **'On average, allow half to a full day for a standard carpentry job. For larger projects this can run to several days.'**
  String get faqCarpenterA14;

  /// No description provided for @faqCarpenterQ15.
  ///
  /// In en, this message translates to:
  /// **'What tools do I need?'**
  String get faqCarpenterQ15;

  /// No description provided for @faqCarpenterA15.
  ///
  /// In en, this message translates to:
  /// **'Basic tools: tape measure, spirit level, pencil, drill, screws, saw and hammer.'**
  String get faqCarpenterA15;

  /// No description provided for @faqCarpenterQ16.
  ///
  /// In en, this message translates to:
  /// **'How do I prepare the substrate?'**
  String get faqCarpenterQ16;

  /// No description provided for @faqCarpenterA16.
  ///
  /// In en, this message translates to:
  /// **'Check that the floor or wall is flat and sturdy. Remove loose parts and ensure the surface is dry and clean.'**
  String get faqCarpenterA16;

  /// No description provided for @faqCarpenterQ17.
  ///
  /// In en, this message translates to:
  /// **'How much extra material should I order?'**
  String get faqCarpenterQ17;

  /// No description provided for @faqCarpenterA17.
  ///
  /// In en, this message translates to:
  /// **'Always order 10% extra for cutting loss. Enable the \"cutting loss\" option in the app to calculate this automatically.'**
  String get faqCarpenterA17;

  /// No description provided for @faqCarpenterQ18.
  ///
  /// In en, this message translates to:
  /// **'Can I do this as a beginner?'**
  String get faqCarpenterQ18;

  /// No description provided for @faqCarpenterA18.
  ///
  /// In en, this message translates to:
  /// **'Yes, with the right preparation and our step-by-step guide you can carry out this job independently.'**
  String get faqCarpenterA18;

  /// No description provided for @faqCarpenterQ19.
  ///
  /// In en, this message translates to:
  /// **'Do I need a permit?'**
  String get faqCarpenterQ19;

  /// No description provided for @faqCarpenterA19.
  ///
  /// In en, this message translates to:
  /// **'A permit is not required for most DIY jobs indoors. For outdoor work or structural changes, consult your municipality.'**
  String get faqCarpenterA19;

  /// No description provided for @faqCarpenterQ20.
  ///
  /// In en, this message translates to:
  /// **'Which DIY store do you recommend?'**
  String get faqCarpenterQ20;

  /// No description provided for @faqCarpenterA20.
  ///
  /// In en, this message translates to:
  /// **'For DIY homeowners, we recommend consumer home centers like Gamma and Hornbach (or Home Depot and Lowe\'s). For professional contractors and builders, trade wholesalers like Bouwmaat and Jongeneel (or Ferguson and White Cap) provide specialist construction materials and bulk supplies.'**
  String get faqCarpenterA20;

  /// No description provided for @faqVloerleggenQ1.
  ///
  /// In en, this message translates to:
  /// **'Should I acclimatise the laminate flooring?'**
  String get faqVloerleggenQ1;

  /// No description provided for @faqVloerleggenA1.
  ///
  /// In en, this message translates to:
  /// **'Follow the manufacturer\'s instructions; often 48 hours.'**
  String get faqVloerleggenA1;

  /// No description provided for @faqVloerleggenQ2.
  ///
  /// In en, this message translates to:
  /// **'What if the subfloor is not level?'**
  String get faqVloerleggenQ2;

  /// No description provided for @faqVloerleggenA2.
  ///
  /// In en, this message translates to:
  /// **'Level it or use a suitable underlay.'**
  String get faqVloerleggenA2;

  /// No description provided for @faqVloerleggenQ3.
  ///
  /// In en, this message translates to:
  /// **'Do I need underlay?'**
  String get faqVloerleggenQ3;

  /// No description provided for @faqVloerleggenA3.
  ///
  /// In en, this message translates to:
  /// **'Usually yes, for sound insulation and stability.'**
  String get faqVloerleggenA3;

  /// No description provided for @faqVloerleggenQ4.
  ///
  /// In en, this message translates to:
  /// **'How much space should I leave at the walls?'**
  String get faqVloerleggenQ4;

  /// No description provided for @faqVloerleggenA4.
  ///
  /// In en, this message translates to:
  /// **'Maintain the edge clearance specified by the manufacturer.'**
  String get faqVloerleggenA4;

  /// No description provided for @faqVloerleggenQ5.
  ///
  /// In en, this message translates to:
  /// **'Do I need to wait before walking on the floor?'**
  String get faqVloerleggenQ5;

  /// No description provided for @faqVloerleggenA5.
  ///
  /// In en, this message translates to:
  /// **'Follow the click-lock system\'s instructions; many systems can be walked on immediately.'**
  String get faqVloerleggenA5;

  /// No description provided for @faqVloerleggenQ6.
  ///
  /// In en, this message translates to:
  /// **'How do I prevent creaking?'**
  String get faqVloerleggenQ6;

  /// No description provided for @faqVloerleggenA6.
  ///
  /// In en, this message translates to:
  /// **'Ensure a level subfloor and correct installation.'**
  String get faqVloerleggenA6;

  /// No description provided for @faqVloerleggenQ7.
  ///
  /// In en, this message translates to:
  /// **'What should I do if a plank is damaged?'**
  String get faqVloerleggenQ7;

  /// No description provided for @faqVloerleggenA7.
  ///
  /// In en, this message translates to:
  /// **'Replace it according to the manufacturer\'s instructions.'**
  String get faqVloerleggenA7;

  /// No description provided for @faqVloerleggenQ8.
  ///
  /// In en, this message translates to:
  /// **'How do I maintain the floor?'**
  String get faqVloerleggenQ8;

  /// No description provided for @faqVloerleggenA8.
  ///
  /// In en, this message translates to:
  /// **'Use a suitable cleaning product and do not make the floor too wet.'**
  String get faqVloerleggenA8;

  /// No description provided for @faqVloerleggenQ9.
  ///
  /// In en, this message translates to:
  /// **'What safety precautions are required?'**
  String get faqVloerleggenQ9;

  /// No description provided for @faqVloerleggenA9.
  ///
  /// In en, this message translates to:
  /// **'Wear eye and hearing protection when sawing.'**
  String get faqVloerleggenA9;

  /// No description provided for @faqVloerleggenQ10.
  ///
  /// In en, this message translates to:
  /// **'Best tip?'**
  String get faqVloerleggenQ10;

  /// No description provided for @faqVloerleggenA10.
  ///
  /// In en, this message translates to:
  /// **'Read the installation instructions and check the subfloor.'**
  String get faqVloerleggenA10;

  /// No description provided for @faqVloerleggenQ11.
  ///
  /// In en, this message translates to:
  /// **'How do I maintain the floor?'**
  String get faqVloerleggenQ11;

  /// No description provided for @faqVloerleggenA11.
  ///
  /// In en, this message translates to:
  /// **'Use a suitable cleaning product and do not make the floor too wet.'**
  String get faqVloerleggenA11;

  /// No description provided for @faqDeurPlaatsenQ1.
  ///
  /// In en, this message translates to:
  /// **'Which type of interior door?'**
  String get faqDeurPlaatsenQ1;

  /// No description provided for @faqDeurPlaatsenA1.
  ///
  /// In en, this message translates to:
  /// **'Flush door or rebated door.'**
  String get faqDeurPlaatsenA1;

  /// No description provided for @faqDeurPlaatsenQ2.
  ///
  /// In en, this message translates to:
  /// **'How do I measure the door and frame?'**
  String get faqDeurPlaatsenQ2;

  /// No description provided for @faqDeurPlaatsenA2.
  ///
  /// In en, this message translates to:
  /// **'Measure the structural opening and clearance according to the manufacturer\'s instructions.'**
  String get faqDeurPlaatsenA2;

  /// No description provided for @faqDeurPlaatsenQ3.
  ///
  /// In en, this message translates to:
  /// **'Where should the hinges go?'**
  String get faqDeurPlaatsenQ3;

  /// No description provided for @faqDeurPlaatsenA3.
  ///
  /// In en, this message translates to:
  /// **'Follow the manufacturer\'s instructions.'**
  String get faqDeurPlaatsenA3;

  /// No description provided for @faqDeurPlaatsenQ4.
  ///
  /// In en, this message translates to:
  /// **'How do I prevent the door from sticking?'**
  String get faqDeurPlaatsenQ4;

  /// No description provided for @faqDeurPlaatsenA4.
  ///
  /// In en, this message translates to:
  /// **'Ensure the correct clearance and alignment.'**
  String get faqDeurPlaatsenA4;

  /// No description provided for @faqDeurPlaatsenQ5.
  ///
  /// In en, this message translates to:
  /// **'What if the door does not hang properly?'**
  String get faqDeurPlaatsenQ5;

  /// No description provided for @faqDeurPlaatsenA5.
  ///
  /// In en, this message translates to:
  /// **'Check the frame, hinges, and clearance.'**
  String get faqDeurPlaatsenA5;

  /// No description provided for @faqDeurPlaatsenQ6.
  ///
  /// In en, this message translates to:
  /// **'Do I need to wait before painting?'**
  String get faqDeurPlaatsenQ6;

  /// No description provided for @faqDeurPlaatsenA6.
  ///
  /// In en, this message translates to:
  /// **'Follow the paint manufacturer\'s instructions.'**
  String get faqDeurPlaatsenA6;

  /// No description provided for @faqDeurPlaatsenQ7.
  ///
  /// In en, this message translates to:
  /// **'How do I prevent warping?'**
  String get faqDeurPlaatsenQ7;

  /// No description provided for @faqDeurPlaatsenA7.
  ///
  /// In en, this message translates to:
  /// **'Apply proper primer and finishing.'**
  String get faqDeurPlaatsenA7;

  /// No description provided for @faqDeurPlaatsenQ8.
  ///
  /// In en, this message translates to:
  /// **'How do I maintain the hinges and locking hardware?'**
  String get faqDeurPlaatsenQ8;

  /// No description provided for @faqDeurPlaatsenA8.
  ///
  /// In en, this message translates to:
  /// **'Follow the manufacturer\'s instructions.'**
  String get faqDeurPlaatsenA8;

  /// No description provided for @faqDeurPlaatsenQ9.
  ///
  /// In en, this message translates to:
  /// **'What are the most common mistakes?'**
  String get faqDeurPlaatsenQ9;

  /// No description provided for @faqDeurPlaatsenA9.
  ///
  /// In en, this message translates to:
  /// **'Incorrect measurements, clearance, or hardware.'**
  String get faqDeurPlaatsenA9;

  /// No description provided for @faqDeurPlaatsenQ10.
  ///
  /// In en, this message translates to:
  /// **'Best tip?'**
  String get faqDeurPlaatsenQ10;

  /// No description provided for @faqDeurPlaatsenA10.
  ///
  /// In en, this message translates to:
  /// **'Use a door lifter and work safely.'**
  String get faqDeurPlaatsenA10;

  /// No description provided for @faqPlintenMonerenQ1.
  ///
  /// In en, this message translates to:
  /// **'Do I need to clean the wall and floor?'**
  String get faqPlintenMonerenQ1;

  /// No description provided for @faqPlintenMonerenA1.
  ///
  /// In en, this message translates to:
  /// **'Yes. The surfaces must be clean, dry, and free from dust and grease for the selected fixing method.'**
  String get faqPlintenMonerenA1;

  /// No description provided for @faqPlintenMonerenQ2.
  ///
  /// In en, this message translates to:
  /// **'How do I make a 45-degree mitre cut?'**
  String get faqPlintenMonerenQ2;

  /// No description provided for @faqPlintenMonerenA2.
  ///
  /// In en, this message translates to:
  /// **'Use a mitre box or mitre saw and determine the actual angle with a sliding bevel when the corner is not exactly 90 degrees.'**
  String get faqPlintenMonerenA2;

  /// No description provided for @faqPlintenMonerenQ3.
  ///
  /// In en, this message translates to:
  /// **'How many metres of skirting board do I need?'**
  String get faqPlintenMonerenQ3;

  /// No description provided for @faqPlintenMonerenA3.
  ///
  /// In en, this message translates to:
  /// **'Measure the total length to be covered and generally add about 10% for cutting waste. More may be needed when there are many corners.'**
  String get faqPlintenMonerenA3;

  /// No description provided for @faqPlintenMonerenQ4.
  ///
  /// In en, this message translates to:
  /// **'How do I prevent the skirting board from coming loose?'**
  String get faqPlintenMonerenQ4;

  /// No description provided for @faqPlintenMonerenA4.
  ///
  /// In en, this message translates to:
  /// **'Use the correct fixing method for the type of skirting board and substrate. Clean the substrate and follow the instructions for the adhesive or tape.'**
  String get faqPlintenMonerenA4;

  /// No description provided for @faqPlintenMonerenQ5.
  ///
  /// In en, this message translates to:
  /// **'How do I deal with uneven surfaces?'**
  String get faqPlintenMonerenQ5;

  /// No description provided for @faqPlintenMonerenA5.
  ///
  /// In en, this message translates to:
  /// **'For continuous skirting boards, small gaps can be finished with suitable acrylic sealant. Large gaps require an appropriate solution; do not use sealant as a structural filler.'**
  String get faqPlintenMonerenA5;

  /// No description provided for @faqPlintenMonerenQ6.
  ///
  /// In en, this message translates to:
  /// **'How long does the skirting board need to dry?'**
  String get faqPlintenMonerenQ6;

  /// No description provided for @faqPlintenMonerenA6.
  ///
  /// In en, this message translates to:
  /// **'Follow the drying and curing time of the adhesive or sealant being used. Tape/adhesive skirting systems may behave differently from glued or mechanically fixed skirting boards.'**
  String get faqPlintenMonerenA6;

  /// No description provided for @faqPlintenMonerenQ7.
  ///
  /// In en, this message translates to:
  /// **'What if the skirting board does not fit tightly?'**
  String get faqPlintenMonerenQ7;

  /// No description provided for @faqPlintenMonerenA7.
  ///
  /// In en, this message translates to:
  /// **'Check the corner, floor, and wall. Small cosmetic gaps can be appropriately finished; larger deviations should be resolved first.'**
  String get faqPlintenMonerenA7;

  /// No description provided for @faqPlintenMonerenQ8.
  ///
  /// In en, this message translates to:
  /// **'How do I maintain skirting boards?'**
  String get faqPlintenMonerenQ8;

  /// No description provided for @faqPlintenMonerenA8.
  ///
  /// In en, this message translates to:
  /// **'Clean them with a surface-appropriate damp cloth and repair any damage according to the manufacturer\'s instructions.'**
  String get faqPlintenMonerenA8;

  /// No description provided for @faqPlintenMonerenQ9.
  ///
  /// In en, this message translates to:
  /// **'What safety measures are needed?'**
  String get faqPlintenMonerenQ9;

  /// No description provided for @faqPlintenMonerenA9.
  ///
  /// In en, this message translates to:
  /// **'Use eye protection when using power saws and appropriate respiratory protection when dust is produced. Keep your hands away from the cutting line.'**
  String get faqPlintenMonerenA9;

  /// No description provided for @faqPlintenMonerenQ10.
  ///
  /// In en, this message translates to:
  /// **'What is the best tip for non-square corners?'**
  String get faqPlintenMonerenQ10;

  /// No description provided for @faqPlintenMonerenA10.
  ///
  /// In en, this message translates to:
  /// **'Measure the actual angle and first test it with a short test piece before cutting the final skirting board.'**
  String get faqPlintenMonerenA10;

  /// No description provided for @faqPlakplintQ1.
  ///
  /// In en, this message translates to:
  /// **'Should I clean the wall and floor?'**
  String get faqPlakplintQ1;

  /// No description provided for @faqPlakplintA1.
  ///
  /// In en, this message translates to:
  /// **'Yes, they must be clean, dry, and dust-free.'**
  String get faqPlakplintA1;

  /// No description provided for @faqPlakplintQ2.
  ///
  /// In en, this message translates to:
  /// **'How do I cut a mitre?'**
  String get faqPlakplintQ2;

  /// No description provided for @faqPlakplintA2.
  ///
  /// In en, this message translates to:
  /// **'Use a mitre box or mitre saw and measure the angle.'**
  String get faqPlakplintA2;

  /// No description provided for @faqPlakplintQ3.
  ///
  /// In en, this message translates to:
  /// **'How many metres of skirting do I need?'**
  String get faqPlakplintQ3;

  /// No description provided for @faqPlakplintA3.
  ///
  /// In en, this message translates to:
  /// **'Perimeter plus 10% for cutting waste.'**
  String get faqPlakplintA3;

  /// No description provided for @faqPlakplintQ4.
  ///
  /// In en, this message translates to:
  /// **'How do I prevent the skirting from coming loose?'**
  String get faqPlakplintQ4;

  /// No description provided for @faqPlakplintA4.
  ///
  /// In en, this message translates to:
  /// **'Ensure the floor is clean and dry, and press firmly.'**
  String get faqPlakplintA4;

  /// No description provided for @faqPlakplintQ5.
  ///
  /// In en, this message translates to:
  /// **'How do I hide uneven areas?'**
  String get faqPlakplintQ5;

  /// No description provided for @faqPlakplintA5.
  ///
  /// In en, this message translates to:
  /// **'Do not use sealant for this; ensure the floor is level.'**
  String get faqPlakplintA5;

  /// No description provided for @faqPlakplintQ6.
  ///
  /// In en, this message translates to:
  /// **'Do I need to wait before putting pressure on the skirting?'**
  String get faqPlakplintQ6;

  /// No description provided for @faqPlakplintA6.
  ///
  /// In en, this message translates to:
  /// **'It is ready immediately; follow the adhesive or sealant instructions.'**
  String get faqPlakplintA6;

  /// No description provided for @faqPlakplintQ7.
  ///
  /// In en, this message translates to:
  /// **'What if the skirting does not fit tightly?'**
  String get faqPlakplintQ7;

  /// No description provided for @faqPlakplintA7.
  ///
  /// In en, this message translates to:
  /// **'Check the floor; use filler for large gaps.'**
  String get faqPlakplintA7;

  /// No description provided for @faqPlakplintQ8.
  ///
  /// In en, this message translates to:
  /// **'How do I maintain skirting boards?'**
  String get faqPlakplintQ8;

  /// No description provided for @faqPlakplintA8.
  ///
  /// In en, this message translates to:
  /// **'Wipe with a damp cloth.'**
  String get faqPlakplintA8;

  /// No description provided for @faqPlakplintQ9.
  ///
  /// In en, this message translates to:
  /// **'What safety precautions are required?'**
  String get faqPlakplintQ9;

  /// No description provided for @faqPlakplintA9.
  ///
  /// In en, this message translates to:
  /// **'Wear eye and hearing protection when sawing.'**
  String get faqPlakplintA9;

  /// No description provided for @faqPlakplintQ10.
  ///
  /// In en, this message translates to:
  /// **'Best tip?'**
  String get faqPlakplintQ10;

  /// No description provided for @faqPlakplintA10.
  ///
  /// In en, this message translates to:
  /// **'Test the corner with a sample piece first.'**
  String get faqPlakplintA10;

  /// No description provided for @faqVoorzetplintQ1.
  ///
  /// In en, this message translates to:
  /// **'Do I need to degrease the wall before gluing?'**
  String get faqVoorzetplintQ1;

  /// No description provided for @faqVoorzetplintA1.
  ///
  /// In en, this message translates to:
  /// **'Yes, a degreased and dust-free surface is essential for good adhesion of the glue or mounting adhesive. Use a degreaser and allow the wall to dry completely.'**
  String get faqVoorzetplintA1;

  /// No description provided for @faqVoorzetplintQ2.
  ///
  /// In en, this message translates to:
  /// **'How do I cut a 45-degree mitre?'**
  String get faqVoorzetplintQ2;

  /// No description provided for @faqVoorzetplintA2.
  ///
  /// In en, this message translates to:
  /// **'Use a mitre box or electric mitre saw. Saw with the decorative face up for a clean finish. Always dry-fit the corner before fixing it permanently.'**
  String get faqVoorzetplintA2;

  /// No description provided for @faqVoorzetplintQ3.
  ///
  /// In en, this message translates to:
  /// **'How many metres of skirting board do I need?'**
  String get faqVoorzetplintQ3;

  /// No description provided for @faqVoorzetplintA3.
  ///
  /// In en, this message translates to:
  /// **'Measure the perimeter of the room and add 10% for cutting waste at corners.'**
  String get faqVoorzetplintA3;

  /// No description provided for @faqVoorzetplintQ4.
  ///
  /// In en, this message translates to:
  /// **'How do I prevent the overlay skirting board from coming loose?'**
  String get faqVoorzetplintQ4;

  /// No description provided for @faqVoorzetplintA4.
  ///
  /// In en, this message translates to:
  /// **'Use the correct mounting adhesive or double-sided tape and ensure the wall is dust-free, grease-free, and dry. Screws provide extra security for heavy boards.'**
  String get faqVoorzetplintA4;

  /// No description provided for @faqVoorzetplintQ5.
  ///
  /// In en, this message translates to:
  /// **'How do I fill gaps and unevenness?'**
  String get faqVoorzetplintQ5;

  /// No description provided for @faqVoorzetplintA5.
  ///
  /// In en, this message translates to:
  /// **'Seal the joints around the board with acrylic caulk and smooth it with a wet finger or finishing tool for a neat result.'**
  String get faqVoorzetplintA5;

  /// No description provided for @faqVoorzetplintQ6.
  ///
  /// In en, this message translates to:
  /// **'How long must the caulk dry before painting?'**
  String get faqVoorzetplintQ6;

  /// No description provided for @faqVoorzetplintA6.
  ///
  /// In en, this message translates to:
  /// **'Acrylic caulk is usually touch-dry within 1 hour and fully cured after 24 hours. Follow the drying time stated on the product packaging.'**
  String get faqVoorzetplintA6;

  /// No description provided for @faqVoorzetplintQ7.
  ///
  /// In en, this message translates to:
  /// **'What if the overlay board does not sit flush against the wall?'**
  String get faqVoorzetplintQ7;

  /// No description provided for @faqVoorzetplintA7.
  ///
  /// In en, this message translates to:
  /// **'Apply extra caulk or use a filler strip. For larger gaps, expanding foam or an additional wood strip is a better solution than caulk alone.'**
  String get faqVoorzetplintA7;

  /// No description provided for @faqVoorzetplintQ8.
  ///
  /// In en, this message translates to:
  /// **'How do I maintain overlay skirting boards?'**
  String get faqVoorzetplintQ8;

  /// No description provided for @faqVoorzetplintA8.
  ///
  /// In en, this message translates to:
  /// **'Wipe regularly with a lightly damp cloth. For lacquered boards, touch up any damage with matching lacquer. Check the caulk joint annually.'**
  String get faqVoorzetplintA8;

  /// No description provided for @faqVoorzetplintQ9.
  ///
  /// In en, this message translates to:
  /// **'What safety measures apply when sawing?'**
  String get faqVoorzetplintQ9;

  /// No description provided for @faqVoorzetplintA9.
  ///
  /// In en, this message translates to:
  /// **'Wear a dust mask and work gloves. Always use a sharp blade for a clean, dust-free cut.'**
  String get faqVoorzetplintA9;

  /// No description provided for @faqVoorzetplintQ10.
  ///
  /// In en, this message translates to:
  /// **'What is the best tip for invisible corners?'**
  String get faqVoorzetplintQ10;

  /// No description provided for @faqVoorzetplintA10.
  ///
  /// In en, this message translates to:
  /// **'Saw with the decorative face up and use a fine-toothed blade. Always dry-fit the corner before fixing it permanently.'**
  String get faqVoorzetplintA10;

  /// No description provided for @faqTrapRenoverenQ1.
  ///
  /// In en, this message translates to:
  /// **'Do I need to level the staircase?'**
  String get faqTrapRenoverenQ1;

  /// No description provided for @faqTrapRenoverenA1.
  ///
  /// In en, this message translates to:
  /// **'Only if needed.'**
  String get faqTrapRenoverenA1;

  /// No description provided for @faqTrapRenoverenQ2.
  ///
  /// In en, this message translates to:
  /// **'How much material do I need?'**
  String get faqTrapRenoverenQ2;

  /// No description provided for @faqTrapRenoverenA2.
  ///
  /// In en, this message translates to:
  /// **'Count the steps and measure the width, depth, and height. Allow for cutting waste.'**
  String get faqTrapRenoverenA2;

  /// No description provided for @faqTrapRenoverenQ3.
  ///
  /// In en, this message translates to:
  /// **'Which adhesive should I use?'**
  String get faqTrapRenoverenQ3;

  /// No description provided for @faqTrapRenoverenA3.
  ///
  /// In en, this message translates to:
  /// **'An adhesive suitable for laminate.'**
  String get faqTrapRenoverenA3;

  /// No description provided for @faqTrapRenoverenQ4.
  ///
  /// In en, this message translates to:
  /// **'Do I need to wait before using the stairs?'**
  String get faqTrapRenoverenQ4;

  /// No description provided for @faqTrapRenoverenA4.
  ///
  /// In en, this message translates to:
  /// **'Follow the adhesive manufacturer.'**
  String get faqTrapRenoverenA4;

  /// No description provided for @faqTrapRenoverenQ5.
  ///
  /// In en, this message translates to:
  /// **'How do I finish the edges?'**
  String get faqTrapRenoverenQ5;

  /// No description provided for @faqTrapRenoverenA5.
  ///
  /// In en, this message translates to:
  /// **'With stair nosings and profiles.'**
  String get faqTrapRenoverenA5;

  /// No description provided for @faqTrapRenoverenQ6.
  ///
  /// In en, this message translates to:
  /// **'What if a step is damaged?'**
  String get faqTrapRenoverenQ6;

  /// No description provided for @faqTrapRenoverenA6.
  ///
  /// In en, this message translates to:
  /// **'Repair or replace the step.'**
  String get faqTrapRenoverenA6;

  /// No description provided for @faqTrapRenoverenQ7.
  ///
  /// In en, this message translates to:
  /// **'How do I maintain the staircase?'**
  String get faqTrapRenoverenQ7;

  /// No description provided for @faqTrapRenoverenA7.
  ///
  /// In en, this message translates to:
  /// **'Follow the maintenance advice.'**
  String get faqTrapRenoverenA7;

  /// No description provided for @faqTrapRenoverenQ8.
  ///
  /// In en, this message translates to:
  /// **'What safety precautions are required?'**
  String get faqTrapRenoverenQ8;

  /// No description provided for @faqTrapRenoverenA8.
  ///
  /// In en, this message translates to:
  /// **'Stable access, ventilation, and personal protection.'**
  String get faqTrapRenoverenA8;

  /// No description provided for @faqTrapRenoverenQ9.
  ///
  /// In en, this message translates to:
  /// **'What are the most common mistakes?'**
  String get faqTrapRenoverenQ9;

  /// No description provided for @faqTrapRenoverenA9.
  ///
  /// In en, this message translates to:
  /// **'Measuring, preparation, adhesive, and finishing.'**
  String get faqTrapRenoverenA9;

  /// No description provided for @faqTrapRenoverenQ10.
  ///
  /// In en, this message translates to:
  /// **'Best tip?'**
  String get faqTrapRenoverenQ10;

  /// No description provided for @faqTrapRenoverenA10.
  ///
  /// In en, this message translates to:
  /// **'Finish one step first as a reference.'**
  String get faqTrapRenoverenA10;

  /// No description provided for @faqTrapRenoverenQ11.
  ///
  /// In en, this message translates to:
  /// **'How do I finish edges and corners?'**
  String get faqTrapRenoverenQ11;

  /// No description provided for @faqTrapRenoverenA11.
  ///
  /// In en, this message translates to:
  /// **'Use stair nosings and profiles suitable for the chosen system. Follow the manufacturer\'s instructions for a neat finish.'**
  String get faqTrapRenoverenA11;

  /// No description provided for @faqWandPlaatsenQ1.
  ///
  /// In en, this message translates to:
  /// **'What is the correct stud spacing?'**
  String get faqWandPlaatsenQ1;

  /// No description provided for @faqWandPlaatsenA1.
  ///
  /// In en, this message translates to:
  /// **'Follow the selected wall system and the manufacturer\'s instructions. A spacing of 600 mm is common in many Metal Stud systems, but it is not universally correct for every board, wall, or load.'**
  String get faqWandPlaatsenA1;

  /// No description provided for @faqWandPlaatsenQ2.
  ///
  /// In en, this message translates to:
  /// **'Do I need insulation?'**
  String get faqWandPlaatsenQ2;

  /// No description provided for @faqWandPlaatsenA2.
  ///
  /// In en, this message translates to:
  /// **'Insulation depends on the purpose of the wall, such as thermal insulation or sound insulation. Choose a material and thickness suitable for the selected wall system.'**
  String get faqWandPlaatsenA2;

  /// No description provided for @faqWandPlaatsenQ3.
  ///
  /// In en, this message translates to:
  /// **'How do I build the frame level?'**
  String get faqWandPlaatsenQ3;

  /// No description provided for @faqWandPlaatsenA3.
  ///
  /// In en, this message translates to:
  /// **'Mark out the wall, install the U-profiles according to the system, and check the floor, ceiling, and studs for alignment. Metal Stud U- and C-profiles are normally made from galvanized steel.'**
  String get faqWandPlaatsenA3;

  /// No description provided for @faqWandPlaatsenQ4.
  ///
  /// In en, this message translates to:
  /// **'How long should I wait before sealing/jointing?'**
  String get faqWandPlaatsenQ4;

  /// No description provided for @faqWandPlaatsenA4.
  ///
  /// In en, this message translates to:
  /// **'There is no general mandatory 24-hour waiting period for the construction. Follow the processing times of the jointing compound, sealant, and other products used.'**
  String get faqWandPlaatsenA4;

  /// No description provided for @faqWandPlaatsenQ5.
  ///
  /// In en, this message translates to:
  /// **'How do I finish the joints and screw holes?'**
  String get faqWandPlaatsenQ5;

  /// No description provided for @faqWandPlaatsenA5.
  ///
  /// In en, this message translates to:
  /// **'For plasterboard, use a suitable jointing/finishing system, such as joint compound and joint tape where required by the system. Follow the manufacturer\'s instructions.'**
  String get faqWandPlaatsenA5;

  /// No description provided for @faqWandPlaatsenQ6.
  ///
  /// In en, this message translates to:
  /// **'What if the wall or floor is not level?'**
  String get faqWandPlaatsenQ6;

  /// No description provided for @faqWandPlaatsenA6.
  ///
  /// In en, this message translates to:
  /// **'Correctly align the frame using suitable, stable fixing and leveling materials. Do not use expanding foam as a general structural filler.'**
  String get faqWandPlaatsenA6;

  /// No description provided for @faqWandPlaatsenQ7.
  ///
  /// In en, this message translates to:
  /// **'How do I maintain the wall?'**
  String get faqWandPlaatsenQ7;

  /// No description provided for @faqWandPlaatsenA7.
  ///
  /// In en, this message translates to:
  /// **'After proper finishing, maintain the wall according to the selected paint or finishing system. Follow the instructions from the paint and board manufacturer.'**
  String get faqWandPlaatsenA7;

  /// No description provided for @faqWandPlaatsenQ8.
  ///
  /// In en, this message translates to:
  /// **'What safety measures are required?'**
  String get faqWandPlaatsenQ8;

  /// No description provided for @faqWandPlaatsenA8.
  ///
  /// In en, this message translates to:
  /// **'Use eye, hand, and respiratory protection where necessary. Be careful with sharp profile edges and work from a stable ladder or platform that is suitable for the situation.'**
  String get faqWandPlaatsenA8;

  /// No description provided for @faqWandPlaatsenQ9.
  ///
  /// In en, this message translates to:
  /// **'What are the most common mistakes?'**
  String get faqWandPlaatsenQ9;

  /// No description provided for @faqWandPlaatsenA9.
  ///
  /// In en, this message translates to:
  /// **'Common mistakes include: incorrect system selection, incorrect centre-to-centre (h.o.h.) spacing, insufficient fixing, missing reinforcement, and incorrect joint finishing.'**
  String get faqWandPlaatsenA9;

  /// No description provided for @faqWandPlaatsenQ10.
  ///
  /// In en, this message translates to:
  /// **'What is the best tip for a strong wall?'**
  String get faqWandPlaatsenQ10;

  /// No description provided for @faqWandPlaatsenA10.
  ///
  /// In en, this message translates to:
  /// **'Plan heavy attachment points in advance and install suitable backing/support or system reinforcement according to the wall manufacturer\'s instructions.'**
  String get faqWandPlaatsenA10;

  /// No description provided for @faqWandPlaatsenQ11.
  ///
  /// In en, this message translates to:
  /// **'How do I hang a heavy object on this wall?'**
  String get faqWandPlaatsenQ11;

  /// No description provided for @faqWandPlaatsenA11.
  ///
  /// In en, this message translates to:
  /// **'Use special plasterboard screws or plugs for light objects. For heavy objects, a reinforced wooden block must be placed behind the plasterboard during construction of the wall.'**
  String get faqWandPlaatsenA11;

  /// No description provided for @faqVloertegelsBadkamerQ1.
  ///
  /// In en, this message translates to:
  /// **'Do I need to level, prime, and degrease?'**
  String get faqVloertegelsBadkamerQ1;

  /// No description provided for @faqVloertegelsBadkamerA1.
  ///
  /// In en, this message translates to:
  /// **'Yes. Check the flatness and load-bearing capacity of the substrate and level it where necessary. Use primer if required by the adhesive system or substrate. Degrease a greasy or contaminated surface, such as a kitchen floor, with a suitable degreaser/cleaner.'**
  String get faqVloertegelsBadkamerA1;

  /// No description provided for @faqVloertegelsBadkamerQ2.
  ///
  /// In en, this message translates to:
  /// **'How do I calculate cutting waste and the number of tiles?'**
  String get faqVloertegelsBadkamerQ2;

  /// No description provided for @faqVloertegelsBadkamerA2.
  ///
  /// In en, this message translates to:
  /// **'Calculate the surface area and divide it by the area of one tile. As a guideline, allow approximately 10% cutting waste. For patterned or diagonal installation, allow approximately 15% or more.'**
  String get faqVloertegelsBadkamerA2;

  /// No description provided for @faqVloertegelsBadkamerQ3.
  ///
  /// In en, this message translates to:
  /// **'How do I achieve good adhesion with tile adhesive?'**
  String get faqVloertegelsBadkamerQ3;

  /// No description provided for @faqVloertegelsBadkamerA3.
  ///
  /// In en, this message translates to:
  /// **'Use the correct notched trowel and adhesive for the tile and substrate. Apply the adhesive to a clean, dust-free surface. For large tiles, use back-buttering according to the adhesive manufacturer\'s instructions.'**
  String get faqVloertegelsBadkamerA3;

  /// No description provided for @faqVloertegelsBadkamerQ4.
  ///
  /// In en, this message translates to:
  /// **'How long should I wait before grouting?'**
  String get faqVloertegelsBadkamerQ4;

  /// No description provided for @faqVloertegelsBadkamerA4.
  ///
  /// In en, this message translates to:
  /// **'Often at least 24 hours. Large tiles, low temperatures, or low-absorption substrates may require more time. Always follow the product data sheet.'**
  String get faqVloertegelsBadkamerA4;

  /// No description provided for @faqVloertegelsBadkamerQ5.
  ///
  /// In en, this message translates to:
  /// **'How do I prevent differences in tile height?'**
  String get faqVloertegelsBadkamerQ5;

  /// No description provided for @faqVloertegelsBadkamerA5.
  ///
  /// In en, this message translates to:
  /// **'Use tile wedges or a tile levelling system. Regularly check with a spirit level and straightedge.'**
  String get faqVloertegelsBadkamerA5;

  /// No description provided for @faqVloertegelsBadkamerQ6.
  ///
  /// In en, this message translates to:
  /// **'What should I do with a loose or broken tile?'**
  String get faqVloertegelsBadkamerQ6;

  /// No description provided for @faqVloertegelsBadkamerA6.
  ///
  /// In en, this message translates to:
  /// **'Carefully remove the tile. Remove loose adhesive and dust from the substrate. Install a suitable replacement tile using appropriate adhesive.'**
  String get faqVloertegelsBadkamerA6;

  /// No description provided for @faqVloertegelsBadkamerQ7.
  ///
  /// In en, this message translates to:
  /// **'How do I clean after grouting?'**
  String get faqVloertegelsBadkamerQ7;

  /// No description provided for @faqVloertegelsBadkamerA7.
  ///
  /// In en, this message translates to:
  /// **'Remove grout residue at the correct time using a suitable sponge and clean water before the grout has completely hardened.'**
  String get faqVloertegelsBadkamerA7;

  /// No description provided for @faqVloertegelsBadkamerQ8.
  ///
  /// In en, this message translates to:
  /// **'How do I maintain a tiled floor?'**
  String get faqVloertegelsBadkamerQ8;

  /// No description provided for @faqVloertegelsBadkamerA8.
  ///
  /// In en, this message translates to:
  /// **'Use a pH-neutral cleaning product suitable for the tile. Avoid abrasive cleaning products.'**
  String get faqVloertegelsBadkamerA8;

  /// No description provided for @faqVloertegelsBadkamerQ9.
  ///
  /// In en, this message translates to:
  /// **'What safety measures are required when cutting?'**
  String get faqVloertegelsBadkamerQ9;

  /// No description provided for @faqVloertegelsBadkamerA9.
  ///
  /// In en, this message translates to:
  /// **'Where possible, use wet cutting or source extraction with a construction vacuum cleaner to reduce silica dust. Wear suitable eye, hearing, and respiratory protection.\n\n⚠️ If in doubt, consult a professional. Always check the instructions for the material being used and the current Dutch regulations.'**
  String get faqVloertegelsBadkamerA9;

  /// No description provided for @faqVloertegelsBadkamerQ10.
  ///
  /// In en, this message translates to:
  /// **'How long does it take?'**
  String get faqVloertegelsBadkamerQ10;

  /// No description provided for @faqVloertegelsBadkamerA10.
  ///
  /// In en, this message translates to:
  /// **'Professional: 0.50 hours per m². DIY: 1.20 hours per m².'**
  String get faqVloertegelsBadkamerA10;

  /// No description provided for @faqWandtegelsPlaatsenQ1.
  ///
  /// In en, this message translates to:
  /// **'Do I need to level, prime, and degrease?'**
  String get faqWandtegelsPlaatsenQ1;

  /// No description provided for @faqWandtegelsPlaatsenA1.
  ///
  /// In en, this message translates to:
  /// **'Check that the wall is flat, clean, dry, load-bearing, and free from grease. Level it where necessary and use primer if required by the substrate or adhesive system. Degrease a greasy or contaminated surface, such as a kitchen wall, with a suitable degreaser/cleaner.'**
  String get faqWandtegelsPlaatsenA1;

  /// No description provided for @faqWandtegelsPlaatsenQ2.
  ///
  /// In en, this message translates to:
  /// **'How do I calculate the number of tiles and cutting waste?'**
  String get faqWandtegelsPlaatsenQ2;

  /// No description provided for @faqWandtegelsPlaatsenA2.
  ///
  /// In en, this message translates to:
  /// **'Calculate the wall area and divide it by the area of one tile. As a guideline, allow approximately 10% extra. For patterned or diagonal installation, allow approximately 15% or more.'**
  String get faqWandtegelsPlaatsenA2;

  /// No description provided for @faqWandtegelsPlaatsenQ3.
  ///
  /// In en, this message translates to:
  /// **'How do I prevent tiles from coming loose?'**
  String get faqWandtegelsPlaatsenQ3;

  /// No description provided for @faqWandtegelsPlaatsenA3.
  ///
  /// In en, this message translates to:
  /// **'Use the correct notched trowel and adhesive for the tile and substrate. Do not apply too much adhesive at once and press the tiles firmly into place. Back-buttering may be required for large tiles.'**
  String get faqWandtegelsPlaatsenA3;

  /// No description provided for @faqWandtegelsPlaatsenQ4.
  ///
  /// In en, this message translates to:
  /// **'How long should I wait before grouting?'**
  String get faqWandtegelsPlaatsenQ4;

  /// No description provided for @faqWandtegelsPlaatsenA4.
  ///
  /// In en, this message translates to:
  /// **'Often at least 24 hours. Large tiles or unfavourable conditions may require longer. Follow the product data sheet.'**
  String get faqWandtegelsPlaatsenA4;

  /// No description provided for @faqWandtegelsPlaatsenQ5.
  ///
  /// In en, this message translates to:
  /// **'How do I cut tiles without breaking them?'**
  String get faqWandtegelsPlaatsenQ5;

  /// No description provided for @faqWandtegelsPlaatsenA5.
  ///
  /// In en, this message translates to:
  /// **'Use a tile cutter for straight cuts. Use an angle grinder with a diamond blade for cut-outs. Work slowly and support the tile properly.'**
  String get faqWandtegelsPlaatsenA5;

  /// No description provided for @faqWandtegelsPlaatsenQ6.
  ///
  /// In en, this message translates to:
  /// **'What if the wall is not level?'**
  String get faqWandtegelsPlaatsenQ6;

  /// No description provided for @faqWandtegelsPlaatsenA6.
  ///
  /// In en, this message translates to:
  /// **'Repair or level the substrate where necessary before tiling. Do not try to compensate indefinitely by applying extra adhesive.'**
  String get faqWandtegelsPlaatsenA6;

  /// No description provided for @faqWandtegelsPlaatsenQ7.
  ///
  /// In en, this message translates to:
  /// **'How do I deal with angled walls?'**
  String get faqWandtegelsPlaatsenQ7;

  /// No description provided for @faqWandtegelsPlaatsenA7.
  ///
  /// In en, this message translates to:
  /// **'Measure the angle with a sliding bevel and cut the tiles to size. Start from a square reference line and regularly check with a spirit level.'**
  String get faqWandtegelsPlaatsenA7;

  /// No description provided for @faqWandtegelsPlaatsenQ8.
  ///
  /// In en, this message translates to:
  /// **'How do I clean after grouting?'**
  String get faqWandtegelsPlaatsenQ8;

  /// No description provided for @faqWandtegelsPlaatsenA8.
  ///
  /// In en, this message translates to:
  /// **'Use a soft sponge and clean water at the correct time, before the grout has fully hardened. Change the water regularly.'**
  String get faqWandtegelsPlaatsenA8;

  /// No description provided for @faqWandtegelsPlaatsenQ9.
  ///
  /// In en, this message translates to:
  /// **'How do I maintain wall tiles?'**
  String get faqWandtegelsPlaatsenQ9;

  /// No description provided for @faqWandtegelsPlaatsenA9.
  ///
  /// In en, this message translates to:
  /// **'Use a damp cloth and mild cleaning product. Avoid abrasive products.\n\n⚠️ If in doubt, consult a professional. Always check the instructions for the material being used and the current Dutch regulations.'**
  String get faqWandtegelsPlaatsenA9;

  /// No description provided for @faqWandtegelsPlaatsenQ10.
  ///
  /// In en, this message translates to:
  /// **'How long does it take?'**
  String get faqWandtegelsPlaatsenQ10;

  /// No description provided for @faqWandtegelsPlaatsenA10.
  ///
  /// In en, this message translates to:
  /// **'Professional: 0.40 hours per m². DIY: 1.00 hour per m².'**
  String get faqWandtegelsPlaatsenA10;

  /// No description provided for @faqKraanVervangenQ1.
  ///
  /// In en, this message translates to:
  /// **'Must I shut off the water?'**
  String get faqKraanVervangenQ1;

  /// No description provided for @faqKraanVervangenA1.
  ///
  /// In en, this message translates to:
  /// **'Yes. Close the relevant shut-off valve or main tap and depressurize the pipe.'**
  String get faqKraanVervangenA1;

  /// No description provided for @faqKraanVervangenQ2.
  ///
  /// In en, this message translates to:
  /// **'How do I remove the old tap?'**
  String get faqKraanVervangenQ2;

  /// No description provided for @faqKraanVervangenA2.
  ///
  /// In en, this message translates to:
  /// **'Use suitable tools and hold fixed connections steady. Do not force stuck or damaged connections.'**
  String get faqKraanVervangenA2;

  /// No description provided for @faqKraanVervangenQ3.
  ///
  /// In en, this message translates to:
  /// **'How do I know which tap I need?'**
  String get faqKraanVervangenQ3;

  /// No description provided for @faqKraanVervangenA3.
  ///
  /// In en, this message translates to:
  /// **'Check whether it\'s countertop or wall mounting and measure the existing connection and available space.'**
  String get faqKraanVervangenA3;

  /// No description provided for @faqKraanVervangenQ4.
  ///
  /// In en, this message translates to:
  /// **'What connection does a standard countertop tap have?'**
  String get faqKraanVervangenQ4;

  /// No description provided for @faqKraanVervangenA4.
  ///
  /// In en, this message translates to:
  /// **'Many kitchen taps are supplied with flexible connection hoses and a standard connection. Always check the specific product.'**
  String get faqKraanVervangenA4;

  /// No description provided for @faqKraanVervangenQ5.
  ///
  /// In en, this message translates to:
  /// **'Must a wooden countertop be sealed?'**
  String get faqKraanVervangenQ5;

  /// No description provided for @faqKraanVervangenA5.
  ///
  /// In en, this message translates to:
  /// **'With a wooden countertop, sealing around the tap opening may be necessary to prevent moisture penetration. Follow the countertop and sealant specifications.'**
  String get faqKraanVervangenA5;

  /// No description provided for @faqKraanVervangenQ6.
  ///
  /// In en, this message translates to:
  /// **'How do I check for leaks?'**
  String get faqKraanVervangenQ6;

  /// No description provided for @faqKraanVervangenA6.
  ///
  /// In en, this message translates to:
  /// **'Open the water supply gently and check all connections with a dry cloth.'**
  String get faqKraanVervangenA6;

  /// No description provided for @faqKraanVervangenQ7.
  ///
  /// In en, this message translates to:
  /// **'What if the tap keeps leaking?'**
  String get faqKraanVervangenQ7;

  /// No description provided for @faqKraanVervangenA7.
  ///
  /// In en, this message translates to:
  /// **'Shut off the water and check the connection, seal, and mounting method. Do not overtighten connections indefinitely.'**
  String get faqKraanVervangenA7;

  /// No description provided for @faqKraanVervangenQ8.
  ///
  /// In en, this message translates to:
  /// **'Can I always replace an old tap with a new one?'**
  String get faqKraanVervangenQ8;

  /// No description provided for @faqKraanVervangenA8.
  ///
  /// In en, this message translates to:
  /// **'Not without checking. Check connection, hole size, available space, and tap type.'**
  String get faqKraanVervangenA8;

  /// No description provided for @faqKraanVervangenQ9.
  ///
  /// In en, this message translates to:
  /// **'Most common mistake?'**
  String get faqKraanVervangenQ9;

  /// No description provided for @faqKraanVervangenA9.
  ///
  /// In en, this message translates to:
  /// **'Wrong measurements or overtightening a connection.'**
  String get faqKraanVervangenA9;

  /// No description provided for @faqKraanVervangenQ10.
  ///
  /// In en, this message translates to:
  /// **'Best tip?'**
  String get faqKraanVervangenQ10;

  /// No description provided for @faqKraanVervangenA10.
  ///
  /// In en, this message translates to:
  /// **'Take a photo before dismantling and compare all connections with the new tap.'**
  String get faqKraanVervangenA10;

  /// No description provided for @faqLeidingOntstoppenQ1.
  ///
  /// In en, this message translates to:
  /// **'Which tool should I use first?'**
  String get faqLeidingOntstoppenQ1;

  /// No description provided for @faqLeidingOntstoppenA1.
  ///
  /// In en, this message translates to:
  /// **'Start with a plunger for a light blockage.'**
  String get faqLeidingOntstoppenA1;

  /// No description provided for @faqLeidingOntstoppenQ2.
  ///
  /// In en, this message translates to:
  /// **'When do I use a drain snake?'**
  String get faqLeidingOntstoppenQ2;

  /// No description provided for @faqLeidingOntstoppenA2.
  ///
  /// In en, this message translates to:
  /// **'When the plunger gives insufficient results and the blockage is accessible.'**
  String get faqLeidingOntstoppenA2;

  /// No description provided for @faqLeidingOntstoppenQ3.
  ///
  /// In en, this message translates to:
  /// **'Must I use chemical drain cleaner?'**
  String get faqLeidingOntstoppenQ3;

  /// No description provided for @faqLeidingOntstoppenA3.
  ///
  /// In en, this message translates to:
  /// **'Not as standard. Mechanical unblocking is preferred. Use a chemical agent only when suitable for the application and follow the label exactly.'**
  String get faqLeidingOntstoppenA3;

  /// No description provided for @faqLeidingOntstoppenQ4.
  ///
  /// In en, this message translates to:
  /// **'May I mix different drain cleaners?'**
  String get faqLeidingOntstoppenQ4;

  /// No description provided for @faqLeidingOntstoppenA4.
  ///
  /// In en, this message translates to:
  /// **'No. Never mix different chemical agents.'**
  String get faqLeidingOntstoppenA4;

  /// No description provided for @faqLeidingOntstoppenQ5.
  ///
  /// In en, this message translates to:
  /// **'Can I clean the siphon?'**
  String get faqLeidingOntstoppenQ5;

  /// No description provided for @faqLeidingOntstoppenA5.
  ///
  /// In en, this message translates to:
  /// **'With an accessible siphon, it can be dismantled and cleaned, provided this is safe and appropriate.'**
  String get faqLeidingOntstoppenA5;

  /// No description provided for @faqLeidingOntstoppenQ6.
  ///
  /// In en, this message translates to:
  /// **'What if the blockage returns?'**
  String get faqLeidingOntstoppenQ6;

  /// No description provided for @faqLeidingOntstoppenA6.
  ///
  /// In en, this message translates to:
  /// **'Have the cause investigated instead of repeatedly using agents.'**
  String get faqLeidingOntstoppenA6;

  /// No description provided for @faqLeidingOntstoppenQ7.
  ///
  /// In en, this message translates to:
  /// **'When to call a professional?'**
  String get faqLeidingOntstoppenQ7;

  /// No description provided for @faqLeidingOntstoppenA7.
  ///
  /// In en, this message translates to:
  /// **'For a deep, stubborn, or recurring blockage or suspected pipe damage.'**
  String get faqLeidingOntstoppenA7;

  /// No description provided for @faqLeidingOntstoppenQ8.
  ///
  /// In en, this message translates to:
  /// **'What protection?'**
  String get faqLeidingOntstoppenQ8;

  /// No description provided for @faqLeidingOntstoppenA8.
  ///
  /// In en, this message translates to:
  /// **'Gloves and eye protection. Extra caution when chemicals have been used previously.'**
  String get faqLeidingOntstoppenA8;

  /// No description provided for @faqLeidingOntstoppenQ9.
  ///
  /// In en, this message translates to:
  /// **'What is a common mistake?'**
  String get faqLeidingOntstoppenQ9;

  /// No description provided for @faqLeidingOntstoppenA9.
  ///
  /// In en, this message translates to:
  /// **'Forcing too hard or mixing chemical agents.'**
  String get faqLeidingOntstoppenA9;

  /// No description provided for @faqLeidingOntstoppenQ10.
  ///
  /// In en, this message translates to:
  /// **'Best tip?'**
  String get faqLeidingOntstoppenQ10;

  /// No description provided for @faqLeidingOntstoppenA10.
  ///
  /// In en, this message translates to:
  /// **'Start mechanically and investigate recurring blockages.'**
  String get faqLeidingOntstoppenA10;

  /// No description provided for @faqToiletInstallerenQ1.
  ///
  /// In en, this message translates to:
  /// **'Must the existing drain fit?'**
  String get faqToiletInstallerenQ1;

  /// No description provided for @faqToiletInstallerenA1.
  ///
  /// In en, this message translates to:
  /// **'Yes. Check position, size, type, and connection options before purchase.'**
  String get faqToiletInstallerenA1;

  /// No description provided for @faqToiletInstallerenQ2.
  ///
  /// In en, this message translates to:
  /// **'Standard or raised toilet?'**
  String get faqToiletInstallerenQ2;

  /// No description provided for @faqToiletInstallerenA2.
  ///
  /// In en, this message translates to:
  /// **'A standard toilet is the starting point. A raised toilet has a higher seat height; the exact height varies by model.'**
  String get faqToiletInstallerenA2;

  /// No description provided for @faqToiletInstallerenQ3.
  ///
  /// In en, this message translates to:
  /// **'Can every toilet fit every drain?'**
  String get faqToiletInstallerenQ3;

  /// No description provided for @faqToiletInstallerenA3.
  ///
  /// In en, this message translates to:
  /// **'No. Check the connection dimensions and position.'**
  String get faqToiletInstallerenA3;

  /// No description provided for @faqToiletInstallerenQ4.
  ///
  /// In en, this message translates to:
  /// **'How do I fix the toilet?'**
  String get faqToiletInstallerenQ4;

  /// No description provided for @faqToiletInstallerenA4.
  ///
  /// In en, this message translates to:
  /// **'Use the manufacturer\'s fixing and ensure the toilet is stable and level.'**
  String get faqToiletInstallerenA4;

  /// No description provided for @faqToiletInstallerenQ5.
  ///
  /// In en, this message translates to:
  /// **'What is sanitary sealant for?'**
  String get faqToiletInstallerenQ5;

  /// No description provided for @faqToiletInstallerenA5.
  ///
  /// In en, this message translates to:
  /// **'For sealing where required by the system. Sealant is not a replacement for mechanical fixing.'**
  String get faqToiletInstallerenA5;

  /// No description provided for @faqToiletInstallerenQ6.
  ///
  /// In en, this message translates to:
  /// **'How do I check the connection?'**
  String get faqToiletInstallerenQ6;

  /// No description provided for @faqToiletInstallerenA6.
  ///
  /// In en, this message translates to:
  /// **'After installation, flush gently and check all connections for leaks.'**
  String get faqToiletInstallerenA6;

  /// No description provided for @faqToiletInstallerenQ7.
  ///
  /// In en, this message translates to:
  /// **'What if there\'s a leaking connection?'**
  String get faqToiletInstallerenQ7;

  /// No description provided for @faqToiletInstallerenA7.
  ///
  /// In en, this message translates to:
  /// **'Shut off the water and check the relevant connection again.'**
  String get faqToiletInstallerenA7;

  /// No description provided for @faqToiletInstallerenQ8.
  ///
  /// In en, this message translates to:
  /// **'What protection?'**
  String get faqToiletInstallerenQ8;

  /// No description provided for @faqToiletInstallerenA8.
  ///
  /// In en, this message translates to:
  /// **'Gloves, safe lifting, and accounting for residual water.'**
  String get faqToiletInstallerenA8;

  /// No description provided for @faqToiletInstallerenQ9.
  ///
  /// In en, this message translates to:
  /// **'Most common mistakes?'**
  String get faqToiletInstallerenQ9;

  /// No description provided for @faqToiletInstallerenA9.
  ///
  /// In en, this message translates to:
  /// **'Wrong drain size, wrong connection, or insufficient fixing.'**
  String get faqToiletInstallerenA9;

  /// No description provided for @faqToiletInstallerenQ10.
  ///
  /// In en, this message translates to:
  /// **'Best tip?'**
  String get faqToiletInstallerenQ10;

  /// No description provided for @faqToiletInstallerenA10.
  ///
  /// In en, this message translates to:
  /// **'Measure all connection dimensions first before buying the toilet.'**
  String get faqToiletInstallerenA10;

  /// No description provided for @faqCvBijvullenQ1.
  ///
  /// In en, this message translates to:
  /// **'When must I refill?'**
  String get faqCvBijvullenQ1;

  /// No description provided for @faqCvBijvullenA1.
  ///
  /// In en, this message translates to:
  /// **'When the pressure is too low according to the appliance manual.'**
  String get faqCvBijvullenA1;

  /// No description provided for @faqCvBijvullenQ2.
  ///
  /// In en, this message translates to:
  /// **'What value should I maintain?'**
  String get faqCvBijvullenQ2;

  /// No description provided for @faqCvBijvullenA2.
  ///
  /// In en, this message translates to:
  /// **'The specified value of the specific appliance is leading.'**
  String get faqCvBijvullenA2;

  /// No description provided for @faqCvBijvullenQ3.
  ///
  /// In en, this message translates to:
  /// **'Must the installation be cooled?'**
  String get faqCvBijvullenQ3;

  /// No description provided for @faqCvBijvullenA3.
  ///
  /// In en, this message translates to:
  /// **'Follow the appliance manual for this.'**
  String get faqCvBijvullenA3;

  /// No description provided for @faqCvBijvullenQ4.
  ///
  /// In en, this message translates to:
  /// **'How do I refill?'**
  String get faqCvBijvullenQ4;

  /// No description provided for @faqCvBijvullenA4.
  ///
  /// In en, this message translates to:
  /// **'Use only the prescribed refill procedure.'**
  String get faqCvBijvullenA4;

  /// No description provided for @faqCvBijvullenQ5.
  ///
  /// In en, this message translates to:
  /// **'Must I bleed afterwards?'**
  String get faqCvBijvullenQ5;

  /// No description provided for @faqCvBijvullenA5.
  ///
  /// In en, this message translates to:
  /// **'Only when this is necessary according to the manual or the situation.'**
  String get faqCvBijvullenA5;

  /// No description provided for @faqCvBijvullenQ6.
  ///
  /// In en, this message translates to:
  /// **'What if the pressure keeps dropping?'**
  String get faqCvBijvullenQ6;

  /// No description provided for @faqCvBijvullenA6.
  ///
  /// In en, this message translates to:
  /// **'Do not keep refilling. Recurring pressure loss may indicate a problem or leak.'**
  String get faqCvBijvullenA6;

  /// No description provided for @faqCvBijvullenQ7.
  ///
  /// In en, this message translates to:
  /// **'May I repair the boiler myself?'**
  String get faqCvBijvullenQ7;

  /// No description provided for @faqCvBijvullenA7.
  ///
  /// In en, this message translates to:
  /// **'No. Work on gas combustion installations must be carried out by a certified company.'**
  String get faqCvBijvullenA7;

  /// No description provided for @faqCvBijvullenQ8.
  ///
  /// In en, this message translates to:
  /// **'May I open gas-side components?'**
  String get faqCvBijvullenQ8;

  /// No description provided for @faqCvBijvullenA8.
  ///
  /// In en, this message translates to:
  /// **'No.'**
  String get faqCvBijvullenA8;

  /// No description provided for @faqCvBijvullenQ9.
  ///
  /// In en, this message translates to:
  /// **'What is a common mistake?'**
  String get faqCvBijvullenQ9;

  /// No description provided for @faqCvBijvullenA9.
  ///
  /// In en, this message translates to:
  /// **'Refilling too much or too fast and ignoring recurring pressure loss.'**
  String get faqCvBijvullenA9;

  /// No description provided for @faqCvBijvullenQ10.
  ///
  /// In en, this message translates to:
  /// **'Best tip?'**
  String get faqCvBijvullenQ10;

  /// No description provided for @faqCvBijvullenA10.
  ///
  /// In en, this message translates to:
  /// **'Keep the appliance manual and follow the specific refill procedure.'**
  String get faqCvBijvullenA10;

  /// No description provided for @faqLeidingAanleggenQ1.
  ///
  /// In en, this message translates to:
  /// **'What material should I use for water or drainage?'**
  String get faqLeidingAanleggenQ1;

  /// No description provided for @faqLeidingAanleggenA1.
  ///
  /// In en, this message translates to:
  /// **'Use a system suitable for the application and the chosen water pipe purpose.'**
  String get faqLeidingAanleggenA1;

  /// No description provided for @faqLeidingAanleggenQ2.
  ///
  /// In en, this message translates to:
  /// **'What diameter must I use?'**
  String get faqLeidingAanleggenQ2;

  /// No description provided for @faqLeidingAanleggenA2.
  ///
  /// In en, this message translates to:
  /// **'Not automatically 12 or 15 mm. The required diameter depends on application, pipe length, required flow rate, and the chosen system.'**
  String get faqLeidingAanleggenA2;

  /// No description provided for @faqLeidingAanleggenQ3.
  ///
  /// In en, this message translates to:
  /// **'Must hot water pipe be insulated?'**
  String get faqLeidingAanleggenQ3;

  /// No description provided for @faqLeidingAanleggenA3.
  ///
  /// In en, this message translates to:
  /// **'Where heat loss must be limited, pipe insulation can be applied according to installation requirements.'**
  String get faqLeidingAanleggenA3;

  /// No description provided for @faqLeidingAanleggenQ4.
  ///
  /// In en, this message translates to:
  /// **'How much pipe do I need?'**
  String get faqLeidingAanleggenQ4;

  /// No description provided for @faqLeidingAanleggenA4.
  ///
  /// In en, this message translates to:
  /// **'Measure the full route and account for bends, connections, and cutting waste.'**
  String get faqLeidingAanleggenA4;

  /// No description provided for @faqLeidingAanleggenQ5.
  ///
  /// In en, this message translates to:
  /// **'How do I connect copper pipe?'**
  String get faqLeidingAanleggenQ5;

  /// No description provided for @faqLeidingAanleggenA5.
  ///
  /// In en, this message translates to:
  /// **'Use a suitable connection system and follow the manufacturer and installation specifications.'**
  String get faqLeidingAanleggenA5;

  /// No description provided for @faqLeidingAanleggenQ6.
  ///
  /// In en, this message translates to:
  /// **'Can I use a pipe bender?'**
  String get faqLeidingAanleggenQ6;

  /// No description provided for @faqLeidingAanleggenA6.
  ///
  /// In en, this message translates to:
  /// **'Yes, when suitable for the chosen pipe and application.'**
  String get faqLeidingAanleggenA6;

  /// No description provided for @faqLeidingAanleggenQ7.
  ///
  /// In en, this message translates to:
  /// **'How do I fix pipes?'**
  String get faqLeidingAanleggenQ7;

  /// No description provided for @faqLeidingAanleggenA7.
  ///
  /// In en, this message translates to:
  /// **'Use suitable fixing according to the chosen system, material, diameter, and temperature load.'**
  String get faqLeidingAanleggenA7;

  /// No description provided for @faqLeidingAanleggenQ8.
  ///
  /// In en, this message translates to:
  /// **'May I just chase a wall?'**
  String get faqLeidingAanleggenQ8;

  /// No description provided for @faqLeidingAanleggenA8.
  ///
  /// In en, this message translates to:
  /// **'No. Check beforehand for existing pipes, cables, and building constraints.'**
  String get faqLeidingAanleggenA8;

  /// No description provided for @faqLeidingAanleggenQ9.
  ///
  /// In en, this message translates to:
  /// **'How do I test the pipe?'**
  String get faqLeidingAanleggenQ9;

  /// No description provided for @faqLeidingAanleggenA9.
  ///
  /// In en, this message translates to:
  /// **'Test the installation according to the specifications of the chosen system before it is finally covered.'**
  String get faqLeidingAanleggenA9;

  /// No description provided for @faqLeidingAanleggenQ10.
  ///
  /// In en, this message translates to:
  /// **'Best tip?'**
  String get faqLeidingAanleggenQ10;

  /// No description provided for @faqLeidingAanleggenA10.
  ///
  /// In en, this message translates to:
  /// **'Make a pipe plan beforehand with route, connection points, shut-off points, and material choice. ⚠️ For drinking water installations, suitable materials and applicable Dutch requirements must be followed, including NEN 1006 and the Water worksheets.'**
  String get faqLeidingAanleggenA10;

  /// No description provided for @faqStopcontactPlaatsenQ1.
  ///
  /// In en, this message translates to:
  /// **'Should I use an earthed or unearthed socket?'**
  String get faqStopcontactPlaatsenQ1;

  /// No description provided for @faqStopcontactPlaatsenA1.
  ///
  /// In en, this message translates to:
  /// **'Earthed sockets are required for appliances with an earthed plug (washing machines, dishwashers, microwaves) and are mandatory in all wet areas such as bathrooms, kitchens, utility rooms, garages, and outdoors. An unearthed socket is only for double-insulated appliances and is no longer used in wet areas for new installations. When in doubt, or in a wet area, always choose an earthed socket.'**
  String get faqStopcontactPlaatsenA1;

  /// No description provided for @faqStopcontactPlaatsenQ2.
  ///
  /// In en, this message translates to:
  /// **'Do I need to switch off the electricity?'**
  String get faqStopcontactPlaatsenQ2;

  /// No description provided for @faqStopcontactPlaatsenA2.
  ///
  /// In en, this message translates to:
  /// **'Yes. Switch off the circuit and use a two-pole voltage tester to confirm that the installation is de-energized. Never work on a live installation.'**
  String get faqStopcontactPlaatsenA2;

  /// No description provided for @faqStopcontactPlaatsenQ3.
  ///
  /// In en, this message translates to:
  /// **'How many flush-mounted boxes do I need?'**
  String get faqStopcontactPlaatsenQ3;

  /// No description provided for @faqStopcontactPlaatsenA3.
  ///
  /// In en, this message translates to:
  /// **'One flush-mounted box per socket. For a double socket, use a double box or two single boxes.'**
  String get faqStopcontactPlaatsenA3;

  /// No description provided for @faqStopcontactPlaatsenQ4.
  ///
  /// In en, this message translates to:
  /// **'How do I connect the socket?'**
  String get faqStopcontactPlaatsenQ4;

  /// No description provided for @faqStopcontactPlaatsenA4.
  ///
  /// In en, this message translates to:
  /// **'Connect the live, neutral, and protective earth conductors according to the product\'s wiring diagram and the applicable installation requirements. The wiring is usually already present in the wall. Use wire connectors or a terminal block. In wet areas, a 30 mA residual-current device (RCD) is mandatory.'**
  String get faqStopcontactPlaatsenA4;

  /// No description provided for @faqStopcontactPlaatsenQ5.
  ///
  /// In en, this message translates to:
  /// **'How long does it take?'**
  String get faqStopcontactPlaatsenQ5;

  /// No description provided for @faqStopcontactPlaatsenA5.
  ///
  /// In en, this message translates to:
  /// **'Professional: 0.75 hours per socket. DIY: 1.9 hours per socket. Flush-mounted installation can take longer due to chiselling, drilling, and repair work.'**
  String get faqStopcontactPlaatsenA5;

  /// No description provided for @faqStopcontactPlaatsenQ6.
  ///
  /// In en, this message translates to:
  /// **'What if the socket does not work?'**
  String get faqStopcontactPlaatsenQ6;

  /// No description provided for @faqStopcontactPlaatsenA6.
  ///
  /// In en, this message translates to:
  /// **'Switch off the power and check the connection, wiring, and protection. If in doubt, do not switch it back on. Consult a qualified person.'**
  String get faqStopcontactPlaatsenA6;

  /// No description provided for @faqStopcontactPlaatsenQ7.
  ///
  /// In en, this message translates to:
  /// **'What safety measures are required?'**
  String get faqStopcontactPlaatsenQ7;

  /// No description provided for @faqStopcontactPlaatsenA7.
  ///
  /// In en, this message translates to:
  /// **'Never work on a live installation. Use suitable measuring equipment. Wear appropriate protective equipment. Use a safe working method. Use a cable/pipe detector before drilling.'**
  String get faqStopcontactPlaatsenA7;

  /// No description provided for @faqStopcontactPlaatsenQ8.
  ///
  /// In en, this message translates to:
  /// **'What are the most common mistakes?'**
  String get faqStopcontactPlaatsenQ8;

  /// No description provided for @faqStopcontactPlaatsenA8.
  ///
  /// In en, this message translates to:
  /// **'Incorrect connection or component, forgetting the protective earth, failing to verify the circuit is de-energized, insufficient fixing, incorrect flush-mounted box, and installing an unearthed socket in a wet area where earthing is mandatory.'**
  String get faqStopcontactPlaatsenA8;

  /// No description provided for @faqStopcontactPlaatsenQ9.
  ///
  /// In en, this message translates to:
  /// **'Can I do this myself?'**
  String get faqStopcontactPlaatsenQ9;

  /// No description provided for @faqStopcontactPlaatsenA9.
  ///
  /// In en, this message translates to:
  /// **'Yes, provided you switch off the electricity, use a voltage tester, and follow the connection instructions. If unsure about earthing or modifying the distribution board, consult a qualified electrician.'**
  String get faqStopcontactPlaatsenA9;

  /// No description provided for @faqStopcontactPlaatsenQ10.
  ///
  /// In en, this message translates to:
  /// **'Best tip?'**
  String get faqStopcontactPlaatsenQ10;

  /// No description provided for @faqStopcontactPlaatsenA10.
  ///
  /// In en, this message translates to:
  /// **'If safe to do so, take a photo of the original situation before disconnecting anything. Never rely solely on the photograph — verify wiring with measuring equipment and the product wiring diagram. In wet areas, always use an earthed socket with an RCD. Consult a professional if in doubt. Always check current Dutch regulations, applicable installation requirements, and the technical product data sheet.'**
  String get faqStopcontactPlaatsenA10;

  /// No description provided for @faqVerlichtingPlaatsenQ1.
  ///
  /// In en, this message translates to:
  /// **'What type of lamp or light fixture should I choose?'**
  String get faqVerlichtingPlaatsenQ1;

  /// No description provided for @faqVerlichtingPlaatsenA1.
  ///
  /// In en, this message translates to:
  /// **'For indoor areas, a ceiling light, pendant light, or surface-mounted fixture is most common. In wet areas such as bathrooms and kitchens, use a moisture-resistant fixture with an appropriate IP rating, for example IP44 or higher.'**
  String get faqVerlichtingPlaatsenA1;

  /// No description provided for @faqVerlichtingPlaatsenQ2.
  ///
  /// In en, this message translates to:
  /// **'Do I need to switch off the electricity?'**
  String get faqVerlichtingPlaatsenQ2;

  /// No description provided for @faqVerlichtingPlaatsenA2.
  ///
  /// In en, this message translates to:
  /// **'Yes. Switch off the circuit and use a two-pole voltage tester to confirm the installation is de-energized. Never work on a live installation.'**
  String get faqVerlichtingPlaatsenA2;

  /// No description provided for @faqVerlichtingPlaatsenQ3.
  ///
  /// In en, this message translates to:
  /// **'How many light points do I need?'**
  String get faqVerlichtingPlaatsenQ3;

  /// No description provided for @faqVerlichtingPlaatsenA3.
  ///
  /// In en, this message translates to:
  /// **'This depends on the room, its function, and the desired light level. There is no universal number.'**
  String get faqVerlichtingPlaatsenA3;

  /// No description provided for @faqVerlichtingPlaatsenQ4.
  ///
  /// In en, this message translates to:
  /// **'How do I install the light fixture?'**
  String get faqVerlichtingPlaatsenQ4;

  /// No description provided for @faqVerlichtingPlaatsenA4.
  ///
  /// In en, this message translates to:
  /// **'Install the mounting bracket according to the manufacturer\'s instructions. Connect the wiring using the wiring diagram and install the fixture. The wiring is usually already present in the ceiling. Use a terminal block or wire connectors. Only connect protective earth when required by the fixture or installation system.'**
  String get faqVerlichtingPlaatsenA4;

  /// No description provided for @faqVerlichtingPlaatsenQ5.
  ///
  /// In en, this message translates to:
  /// **'How long does it take?'**
  String get faqVerlichtingPlaatsenQ5;

  /// No description provided for @faqVerlichtingPlaatsenA5.
  ///
  /// In en, this message translates to:
  /// **'Professional: 0.50 hours per light point. DIY: 1.25 hours per light point. Wet areas may require additional time for suitable sealing and installation.'**
  String get faqVerlichtingPlaatsenA5;

  /// No description provided for @faqVerlichtingPlaatsenQ6.
  ///
  /// In en, this message translates to:
  /// **'What if the light does not turn on?'**
  String get faqVerlichtingPlaatsenQ6;

  /// No description provided for @faqVerlichtingPlaatsenA6.
  ///
  /// In en, this message translates to:
  /// **'First switch off the electricity. Check the connection, switch, and protection using a safe testing procedure. If in doubt, consult an electrician.'**
  String get faqVerlichtingPlaatsenA6;

  /// No description provided for @faqVerlichtingPlaatsenQ7.
  ///
  /// In en, this message translates to:
  /// **'What safety measures are required?'**
  String get faqVerlichtingPlaatsenQ7;

  /// No description provided for @faqVerlichtingPlaatsenA7.
  ///
  /// In en, this message translates to:
  /// **'Never work on a live installation. Use a stable ladder and suitable eye and hand protection. Use a cable/pipe detector before drilling.'**
  String get faqVerlichtingPlaatsenA7;

  /// No description provided for @faqVerlichtingPlaatsenQ8.
  ///
  /// In en, this message translates to:
  /// **'What are the most common mistakes?'**
  String get faqVerlichtingPlaatsenQ8;

  /// No description provided for @faqVerlichtingPlaatsenA8.
  ///
  /// In en, this message translates to:
  /// **'Incorrect fixture for a wet area, poor electrical connection, incorrect installation, and incorrect connection of the protective earth where required.'**
  String get faqVerlichtingPlaatsenA8;

  /// No description provided for @faqVerlichtingPlaatsenQ9.
  ///
  /// In en, this message translates to:
  /// **'What should I consider in wet areas?'**
  String get faqVerlichtingPlaatsenQ9;

  /// No description provided for @faqVerlichtingPlaatsenA9.
  ///
  /// In en, this message translates to:
  /// **'Use a fixture with an appropriate IP rating, at least IP44 for bathrooms and kitchens. Ensure proper sealing and connect the protective earth correctly when required by the system.'**
  String get faqVerlichtingPlaatsenA9;

  /// No description provided for @faqVerlichtingPlaatsenQ10.
  ///
  /// In en, this message translates to:
  /// **'Best tip?'**
  String get faqVerlichtingPlaatsenQ10;

  /// No description provided for @faqVerlichtingPlaatsenA10.
  ///
  /// In en, this message translates to:
  /// **'Choose a colour temperature and dimming capability appropriate for the room. Before purchasing, check that the dimmer, lamp, and fixture are compatible. In wet areas, always use an appropriate IP rating. Consult a professional if in doubt. Always check current Dutch regulations, applicable installation requirements, and the technical product data sheet.'**
  String get faqVerlichtingPlaatsenA10;

  /// No description provided for @faqStroomleidingLeggenQ1.
  ///
  /// In en, this message translates to:
  /// **'Which cable or wire should I choose?'**
  String get faqStroomleidingLeggenQ1;

  /// No description provided for @faqStroomleidingLeggenA1.
  ///
  /// In en, this message translates to:
  /// **'The cable type and conductor cross-section depend on the application, installation method, protection, electrical load, and applicable installation requirements. VD wire is used in an appropriate conduit/system. Cable types such as XMVK have their own application requirements.'**
  String get faqStroomleidingLeggenA1;

  /// No description provided for @faqStroomleidingLeggenQ2.
  ///
  /// In en, this message translates to:
  /// **'Do I need to switch off the electricity?'**
  String get faqStroomleidingLeggenQ2;

  /// No description provided for @faqStroomleidingLeggenA2.
  ///
  /// In en, this message translates to:
  /// **'Yes. Switch off the circuit and use suitable measuring equipment to verify the working area is de-energized.'**
  String get faqStroomleidingLeggenA2;

  /// No description provided for @faqStroomleidingLeggenQ3.
  ///
  /// In en, this message translates to:
  /// **'How many metres do I need?'**
  String get faqStroomleidingLeggenQ3;

  /// No description provided for @faqStroomleidingLeggenA3.
  ///
  /// In en, this message translates to:
  /// **'Measure the complete route and allow extra length for bends and connection points. 10% extra is a practical guideline, although complex routes may require more.'**
  String get faqStroomleidingLeggenA3;

  /// No description provided for @faqStroomleidingLeggenQ4.
  ///
  /// In en, this message translates to:
  /// **'How do I install the cable?'**
  String get faqStroomleidingLeggenQ4;

  /// No description provided for @faqStroomleidingLeggenA4.
  ///
  /// In en, this message translates to:
  /// **'Mark the route and check for existing cables and pipes with a cable/pipe detector. Use suitable equipment and dust extraction for chasing and drilling. The chase depth and installation method must suit the cable/conduit system, wall construction, and applicable requirements. Install the conduit or cable and pull the wires. Cut conduit to length using a hacksaw.'**
  String get faqStroomleidingLeggenA4;

  /// No description provided for @faqStroomleidingLeggenQ5.
  ///
  /// In en, this message translates to:
  /// **'How long does it take?'**
  String get faqStroomleidingLeggenQ5;

  /// No description provided for @faqStroomleidingLeggenA5.
  ///
  /// In en, this message translates to:
  /// **'Professional: 0.10 hours per metre. DIY: 0.25 hours per metre. Preparation, routing, wall type, and finishing can affect total time.'**
  String get faqStroomleidingLeggenA5;

  /// No description provided for @faqStroomleidingLeggenQ6.
  ///
  /// In en, this message translates to:
  /// **'What if a cable is damaged?'**
  String get faqStroomleidingLeggenQ6;

  /// No description provided for @faqStroomleidingLeggenA6.
  ///
  /// In en, this message translates to:
  /// **'Switch off the electricity. Damaged cables must not simply be covered up. Repair them using an appropriate and standards-compliant method.'**
  String get faqStroomleidingLeggenA6;

  /// No description provided for @faqStroomleidingLeggenQ7.
  ///
  /// In en, this message translates to:
  /// **'What safety measures are required?'**
  String get faqStroomleidingLeggenQ7;

  /// No description provided for @faqStroomleidingLeggenA7.
  ///
  /// In en, this message translates to:
  /// **'Work with the power switched off. Check for existing cables and structural elements before starting. Wear appropriate protective equipment. Avoid unsafe deep or long chases in load-bearing walls — have structural concerns assessed by a qualified professional.'**
  String get faqStroomleidingLeggenA7;

  /// No description provided for @faqStroomleidingLeggenQ8.
  ///
  /// In en, this message translates to:
  /// **'What are the most common mistakes?'**
  String get faqStroomleidingLeggenQ8;

  /// No description provided for @faqStroomleidingLeggenA8.
  ///
  /// In en, this message translates to:
  /// **'Incorrect cable or conductor size, bends that are too sharp, poor fixing, insufficient pulling provision, hitting existing cables, and failing to check the wall before chasing.'**
  String get faqStroomleidingLeggenA8;

  /// No description provided for @faqStroomleidingLeggenQ9.
  ///
  /// In en, this message translates to:
  /// **'Can I chase a load-bearing wall?'**
  String get faqStroomleidingLeggenQ9;

  /// No description provided for @faqStroomleidingLeggenA9.
  ///
  /// In en, this message translates to:
  /// **'No. Deep or long horizontal chases in load-bearing walls can reduce structural strength. Always have structural questions assessed by a qualified professional.'**
  String get faqStroomleidingLeggenA9;

  /// No description provided for @faqStroomleidingLeggenQ10.
  ///
  /// In en, this message translates to:
  /// **'Best tip?'**
  String get faqStroomleidingLeggenQ10;

  /// No description provided for @faqStroomleidingLeggenA10.
  ///
  /// In en, this message translates to:
  /// **'Plan the route carefully and document cables before closing the chases. For future modifications, only use provisions designed for the intended application. Consult a professional if in doubt. Always check current Dutch regulations, applicable installation requirements, and the technical product data sheet.'**
  String get faqStroomleidingLeggenA10;

  /// No description provided for @faqKabelgootMonterenQ1.
  ///
  /// In en, this message translates to:
  /// **'Which type of cable trunking should I use?'**
  String get faqKabelgootMonterenQ1;

  /// No description provided for @faqKabelgootMonterenA1.
  ///
  /// In en, this message translates to:
  /// **'Self-adhesive trunking is for lightweight cables on a smooth, clean surface. Screw-mounted trunking is for heavier cables, rougher surfaces, or outdoor use. A common indoor size is 20 × 12 mm to 25 × 16 mm.'**
  String get faqKabelgootMonterenA1;

  /// No description provided for @faqKabelgootMonterenQ2.
  ///
  /// In en, this message translates to:
  /// **'Do I need to prepare the surface?'**
  String get faqKabelgootMonterenQ2;

  /// No description provided for @faqKabelgootMonterenA2.
  ///
  /// In en, this message translates to:
  /// **'Yes. Clean the surface and make sure it is grease-free and dry when required by the manufacturer. Self-adhesive systems require particular attention to surface preparation.'**
  String get faqKabelgootMonterenA2;

  /// No description provided for @faqKabelgootMonterenQ3.
  ///
  /// In en, this message translates to:
  /// **'How many metres do I need?'**
  String get faqKabelgootMonterenQ3;

  /// No description provided for @faqKabelgootMonterenA3.
  ///
  /// In en, this message translates to:
  /// **'Measure the route and allow extra material for corners, connections, and cutting waste. 10% extra is a practical guideline.'**
  String get faqKabelgootMonterenA3;

  /// No description provided for @faqKabelgootMonterenQ4.
  ///
  /// In en, this message translates to:
  /// **'How do I install the cable trunking?'**
  String get faqKabelgootMonterenQ4;

  /// No description provided for @faqKabelgootMonterenA4.
  ///
  /// In en, this message translates to:
  /// **'Follow the installation instructions for the selected system. Cut it straight to size using a hacksaw. For corners, use suitable accessories or a neat mitre joint. Use a stable ladder when working at height.'**
  String get faqKabelgootMonterenA4;

  /// No description provided for @faqKabelgootMonterenQ5.
  ///
  /// In en, this message translates to:
  /// **'How long does it take?'**
  String get faqKabelgootMonterenQ5;

  /// No description provided for @faqKabelgootMonterenA5.
  ///
  /// In en, this message translates to:
  /// **'Professional: 0.07 hours per metre. DIY: 0.17 hours per metre. Drilling into hard surfaces can require additional time.'**
  String get faqKabelgootMonterenA5;

  /// No description provided for @faqKabelgootMonterenQ6.
  ///
  /// In en, this message translates to:
  /// **'What if the cable trunking comes loose?'**
  String get faqKabelgootMonterenQ6;

  /// No description provided for @faqKabelgootMonterenA6.
  ///
  /// In en, this message translates to:
  /// **'Remove the loose material, clean the surface, and repair it according to the manufacturer\'s recommended fixing method. For heavier loads, use suitable mechanical fixing.'**
  String get faqKabelgootMonterenA6;

  /// No description provided for @faqKabelgootMonterenQ7.
  ///
  /// In en, this message translates to:
  /// **'What safety measures are required?'**
  String get faqKabelgootMonterenQ7;

  /// No description provided for @faqKabelgootMonterenA7.
  ///
  /// In en, this message translates to:
  /// **'Wear gloves and eye protection. Watch out for sharp edges. Use a cable/pipe detector before drilling.'**
  String get faqKabelgootMonterenA7;

  /// No description provided for @faqKabelgootMonterenQ8.
  ///
  /// In en, this message translates to:
  /// **'What are the most common mistakes?'**
  String get faqKabelgootMonterenQ8;

  /// No description provided for @faqKabelgootMonterenA8.
  ///
  /// In en, this message translates to:
  /// **'Not cleaning the surface, incorrect fixing method for the surface, not marking the route straight, incorrect size, and insufficient fixing points.'**
  String get faqKabelgootMonterenA8;

  /// No description provided for @faqKabelgootMonterenQ9.
  ///
  /// In en, this message translates to:
  /// **'Can I use cable trunking outdoors?'**
  String get faqKabelgootMonterenQ9;

  /// No description provided for @faqKabelgootMonterenA9.
  ///
  /// In en, this message translates to:
  /// **'Only if the cable trunking is specifically suitable for outdoor use. Preferably use screw mounting rather than self-adhesive mounting.'**
  String get faqKabelgootMonterenA9;

  /// No description provided for @faqKabelgootMonterenQ10.
  ///
  /// In en, this message translates to:
  /// **'Best tip?'**
  String get faqKabelgootMonterenQ10;

  /// No description provided for @faqKabelgootMonterenA10.
  ///
  /// In en, this message translates to:
  /// **'For corners, use suitable accessories or a neat mitre joint. Install the cable trunking straight and tightly. Consult a professional if in doubt. Always check current Dutch regulations, applicable installation requirements, and the technical product data sheet.'**
  String get faqKabelgootMonterenA10;

  /// No description provided for @faqRookmelderPlaatsenQ1.
  ///
  /// In en, this message translates to:
  /// **'Which type of smoke detector should I use?'**
  String get faqRookmelderPlaatsenQ1;

  /// No description provided for @faqRookmelderPlaatsenA1.
  ///
  /// In en, this message translates to:
  /// **'An optical smoke detector is a common choice for many residential rooms. In a kitchen, a heat detector may be more suitable. Choose a product that meets the relevant requirements.'**
  String get faqRookmelderPlaatsenA1;

  /// No description provided for @faqRookmelderPlaatsenQ2.
  ///
  /// In en, this message translates to:
  /// **'Where should I install the detector?'**
  String get faqRookmelderPlaatsenQ2;

  /// No description provided for @faqRookmelderPlaatsenA2.
  ///
  /// In en, this message translates to:
  /// **'The Dutch government recommends installing smoke detectors on the ceiling, preferably in the hallway, at least 50 cm from a wall or corner and at least 30 cm from a light fixture. Do not place the detector directly next to ventilation openings or heating. Always follow the manufacturer\'s instructions.'**
  String get faqRookmelderPlaatsenA2;

  /// No description provided for @faqRookmelderPlaatsenQ3.
  ///
  /// In en, this message translates to:
  /// **'How many detectors do I need?'**
  String get faqRookmelderPlaatsenQ3;

  /// No description provided for @faqRookmelderPlaatsenA3.
  ///
  /// In en, this message translates to:
  /// **'In the Netherlands, a smoke detector is mandatory on every residential floor. The exact number and best locations depend on the property. Follow current legal requirements and the manufacturer\'s instructions.'**
  String get faqRookmelderPlaatsenA3;

  /// No description provided for @faqRookmelderPlaatsenQ4.
  ///
  /// In en, this message translates to:
  /// **'How do I install the detector?'**
  String get faqRookmelderPlaatsenQ4;

  /// No description provided for @faqRookmelderPlaatsenA4.
  ///
  /// In en, this message translates to:
  /// **'Install the mounting bracket according to the manufacturer\'s instructions. Attach the detector and test it after installation. Use appropriate wall plugs and screws when mechanical fixing is required.'**
  String get faqRookmelderPlaatsenA4;

  /// No description provided for @faqRookmelderPlaatsenQ5.
  ///
  /// In en, this message translates to:
  /// **'How long does it take?'**
  String get faqRookmelderPlaatsenQ5;

  /// No description provided for @faqRookmelderPlaatsenA5.
  ///
  /// In en, this message translates to:
  /// **'Professional: 0.25 hours per detector. DIY: 0.60 hours per detector. Drilling, accessibility, and ceiling type can require additional time.'**
  String get faqRookmelderPlaatsenA5;

  /// No description provided for @faqRookmelderPlaatsenQ6.
  ///
  /// In en, this message translates to:
  /// **'What should I do if there are false alarms?'**
  String get faqRookmelderPlaatsenQ6;

  /// No description provided for @faqRookmelderPlaatsenA6.
  ///
  /// In en, this message translates to:
  /// **'First determine the cause. Clean dust according to the manufacturer\'s instructions and check the detector\'s location, ventilation, and moisture conditions. Only move the detector if the new location meets the applicable requirements.'**
  String get faqRookmelderPlaatsenA6;

  /// No description provided for @faqRookmelderPlaatsenQ7.
  ///
  /// In en, this message translates to:
  /// **'What safety measures are required?'**
  String get faqRookmelderPlaatsenQ7;

  /// No description provided for @faqRookmelderPlaatsenA7.
  ///
  /// In en, this message translates to:
  /// **'Use a stable ladder and work safely. Test the detector after installation and follow the manufacturer\'s instructions. Use a cable/pipe detector before drilling into the ceiling.'**
  String get faqRookmelderPlaatsenA7;

  /// No description provided for @faqRookmelderPlaatsenQ8.
  ///
  /// In en, this message translates to:
  /// **'What are the most common mistakes?'**
  String get faqRookmelderPlaatsenQ8;

  /// No description provided for @faqRookmelderPlaatsenA8.
  ///
  /// In en, this message translates to:
  /// **'Incorrect positioning, not testing the detector, empty or missing battery, dirt/contamination, and not replacing the detector when the manufacturer specifies the end of its service life.'**
  String get faqRookmelderPlaatsenA8;

  /// No description provided for @faqRookmelderPlaatsenQ9.
  ///
  /// In en, this message translates to:
  /// **'How do I test the detector?'**
  String get faqRookmelderPlaatsenQ9;

  /// No description provided for @faqRookmelderPlaatsenA9.
  ///
  /// In en, this message translates to:
  /// **'Test it regularly using the test button according to the manufacturer\'s instructions. Keep the detector free of dust and follow the maintenance and replacement instructions for the specific model.'**
  String get faqRookmelderPlaatsenA9;

  /// No description provided for @faqRookmelderPlaatsenQ10.
  ///
  /// In en, this message translates to:
  /// **'Best tip?'**
  String get faqRookmelderPlaatsenQ10;

  /// No description provided for @faqRookmelderPlaatsenA10.
  ///
  /// In en, this message translates to:
  /// **'Use the test button regularly and replace the battery or complete detector according to the manufacturer\'s instructions. Take the legal positioning requirements into account. Consult a professional if in doubt. Always check current Dutch regulations, applicable installation requirements, and the technical product data sheet.'**
  String get faqRookmelderPlaatsenA10;

  /// No description provided for @jobCarpenter01.
  ///
  /// In en, this message translates to:
  /// **'Floor laying – laminate'**
  String get jobCarpenter01;

  /// No description provided for @jobCarpenter02.
  ///
  /// In en, this message translates to:
  /// **'Door installation – interior door (solid)'**
  String get jobCarpenter02;

  /// No description provided for @jobCarpenter03.
  ///
  /// In en, this message translates to:
  /// **'Skirting board installation – adhesive skirting'**
  String get jobCarpenter03;

  /// No description provided for @jobCarpenter04.
  ///
  /// In en, this message translates to:
  /// **'Stair renovation – laminate'**
  String get jobCarpenter04;

  /// No description provided for @jobCarpenter05.
  ///
  /// In en, this message translates to:
  /// **'Wall installation – plasterboard with metal studs'**
  String get jobCarpenter05;

  /// No description provided for @jobPlumber01.
  ///
  /// In en, this message translates to:
  /// **'Kitchen tap replacement'**
  String get jobPlumber01;

  /// No description provided for @jobPlumber02.
  ///
  /// In en, this message translates to:
  /// **'Drain unblocking'**
  String get jobPlumber02;

  /// No description provided for @jobPlumber03.
  ///
  /// In en, this message translates to:
  /// **'Toilet installation'**
  String get jobPlumber03;

  /// No description provided for @jobPlumber04.
  ///
  /// In en, this message translates to:
  /// **'Central heating refill'**
  String get jobPlumber04;

  /// No description provided for @jobPlumber05.
  ///
  /// In en, this message translates to:
  /// **'Water pipe installation (copper)'**
  String get jobPlumber05;

  /// No description provided for @jobPainter01.
  ///
  /// In en, this message translates to:
  /// **'Paint walls'**
  String get jobPainter01;

  /// No description provided for @jobPainter02.
  ///
  /// In en, this message translates to:
  /// **'Paint ceilings'**
  String get jobPainter02;

  /// No description provided for @jobPainter03.
  ///
  /// In en, this message translates to:
  /// **'Wallpapering'**
  String get jobPainter03;

  /// No description provided for @jobPainter04.
  ///
  /// In en, this message translates to:
  /// **'Window frame/door painting'**
  String get jobPainter04;

  /// No description provided for @jobPainter05.
  ///
  /// In en, this message translates to:
  /// **'Radiator painting'**
  String get jobPainter05;

  /// No description provided for @jobGardener01.
  ///
  /// In en, this message translates to:
  /// **'Fence installation'**
  String get jobGardener01;

  /// No description provided for @jobGardener02.
  ///
  /// In en, this message translates to:
  /// **'Paving installation'**
  String get jobGardener02;

  /// No description provided for @jobGardener03.
  ///
  /// In en, this message translates to:
  /// **'Pruning'**
  String get jobGardener03;

  /// No description provided for @jobGardener04.
  ///
  /// In en, this message translates to:
  /// **'Canopy construction'**
  String get jobGardener04;

  /// No description provided for @jobGardener05.
  ///
  /// In en, this message translates to:
  /// **'Lawn laying'**
  String get jobGardener05;

  /// No description provided for @jobElectrician01.
  ///
  /// In en, this message translates to:
  /// **'Outlet installation'**
  String get jobElectrician01;

  /// No description provided for @jobElectrician02.
  ///
  /// In en, this message translates to:
  /// **'Lighting installation'**
  String get jobElectrician02;

  /// No description provided for @jobElectrician03.
  ///
  /// In en, this message translates to:
  /// **'Cable laying'**
  String get jobElectrician03;

  /// No description provided for @jobElectrician04.
  ///
  /// In en, this message translates to:
  /// **'Cable trunking installation'**
  String get jobElectrician04;

  /// No description provided for @jobElectrician05.
  ///
  /// In en, this message translates to:
  /// **'Smoke detector installation'**
  String get jobElectrician05;

  /// No description provided for @jobTiler01.
  ///
  /// In en, this message translates to:
  /// **'Laying floor tiles'**
  String get jobTiler01;

  /// No description provided for @jobTiler02.
  ///
  /// In en, this message translates to:
  /// **'Installing wall tiles'**
  String get jobTiler02;

  /// No description provided for @jobTiler03.
  ///
  /// In en, this message translates to:
  /// **'Repairing tiles'**
  String get jobTiler03;

  /// No description provided for @jobTiler04.
  ///
  /// In en, this message translates to:
  /// **'Grouting'**
  String get jobTiler04;

  /// No description provided for @jobTiler05.
  ///
  /// In en, this message translates to:
  /// **'Applying sealant'**
  String get jobTiler05;

  /// No description provided for @checklistBehangtafel.
  ///
  /// In en, this message translates to:
  /// **'Wallpaper table'**
  String get checklistBehangtafel;

  /// No description provided for @checklistBehangborstel.
  ///
  /// In en, this message translates to:
  /// **'Wallpaper brush'**
  String get checklistBehangborstel;

  /// No description provided for @checklistBehanglijmRoller.
  ///
  /// In en, this message translates to:
  /// **'Paste roller'**
  String get checklistBehanglijmRoller;

  /// No description provided for @checklistMeetlint.
  ///
  /// In en, this message translates to:
  /// **'Tape measure'**
  String get checklistMeetlint;

  /// No description provided for @checklistWaterpas.
  ///
  /// In en, this message translates to:
  /// **'Spirit level'**
  String get checklistWaterpas;

  /// No description provided for @checklistPotlood.
  ///
  /// In en, this message translates to:
  /// **'Pencil'**
  String get checklistPotlood;

  /// No description provided for @checklistSchaarBehangmes.
  ///
  /// In en, this message translates to:
  /// **'Scissors / Wallpaper knife'**
  String get checklistSchaarBehangmes;

  /// No description provided for @checklistSponzen.
  ///
  /// In en, this message translates to:
  /// **'Sponges'**
  String get checklistSponzen;

  /// No description provided for @checklistEmmerVoorLijm.
  ///
  /// In en, this message translates to:
  /// **'Bucket (for paste)'**
  String get checklistEmmerVoorLijm;

  /// No description provided for @checklistTrapLadder.
  ///
  /// In en, this message translates to:
  /// **'Stepladder / Ladder'**
  String get checklistTrapLadder;

  /// No description provided for @checklistStucloperAfdekfolie.
  ///
  /// In en, this message translates to:
  /// **'Protective cover / dust sheet'**
  String get checklistStucloperAfdekfolie;

  /// No description provided for @checklistSponsDoek.
  ///
  /// In en, this message translates to:
  /// **'Sponge / cloth'**
  String get checklistSponsDoek;

  /// No description provided for @checklistLoodlijn.
  ///
  /// In en, this message translates to:
  /// **'Plumb line'**
  String get checklistLoodlijn;

  /// No description provided for @checklistPlamuurmes.
  ///
  /// In en, this message translates to:
  /// **'Filling knife'**
  String get checklistPlamuurmes;

  /// No description provided for @checklistBehangnaadroller.
  ///
  /// In en, this message translates to:
  /// **'Seam roller (optional)'**
  String get checklistBehangnaadroller;

  /// No description provided for @checklistVerfroller.
  ///
  /// In en, this message translates to:
  /// **'Paint roller'**
  String get checklistVerfroller;

  /// No description provided for @checklistKwast.
  ///
  /// In en, this message translates to:
  /// **'Paintbrush'**
  String get checklistKwast;

  /// No description provided for @checklistVerfbak.
  ///
  /// In en, this message translates to:
  /// **'Paint tray'**
  String get checklistVerfbak;

  /// No description provided for @checklistAfplaktape.
  ///
  /// In en, this message translates to:
  /// **'Masking tape'**
  String get checklistAfplaktape;

  /// No description provided for @checklistSchuurpapier.
  ///
  /// In en, this message translates to:
  /// **'Sandpaper'**
  String get checklistSchuurpapier;

  /// No description provided for @checklistStofzuigerStofdoek.
  ///
  /// In en, this message translates to:
  /// **'Vacuum / Dust cloth'**
  String get checklistStofzuigerStofdoek;

  /// No description provided for @checklistLadderTrap.
  ///
  /// In en, this message translates to:
  /// **'Ladder / Step ladder'**
  String get checklistLadderTrap;

  /// No description provided for @checklistDekkleed.
  ///
  /// In en, this message translates to:
  /// **'Dust sheet'**
  String get checklistDekkleed;

  /// No description provided for @checklistDecoupeerzaag.
  ///
  /// In en, this message translates to:
  /// **'Jigsaw'**
  String get checklistDecoupeerzaag;

  /// No description provided for @checklistRolmaat.
  ///
  /// In en, this message translates to:
  /// **'Tape measure (roll)'**
  String get checklistRolmaat;

  /// No description provided for @checklistPlintenknipper.
  ///
  /// In en, this message translates to:
  /// **'Skirting board cutter'**
  String get checklistPlintenknipper;

  /// No description provided for @checklistHamer.
  ///
  /// In en, this message translates to:
  /// **'Hammer'**
  String get checklistHamer;

  /// No description provided for @checklistAccuboormachine.
  ///
  /// In en, this message translates to:
  /// **'Cordless drill'**
  String get checklistAccuboormachine;

  /// No description provided for @checklistSchroevendraaier.
  ///
  /// In en, this message translates to:
  /// **'Screwdriver'**
  String get checklistSchroevendraaier;

  /// No description provided for @checklistKitpistool.
  ///
  /// In en, this message translates to:
  /// **'Caulking gun'**
  String get checklistKitpistool;

  /// No description provided for @checklistWaterpomptang.
  ///
  /// In en, this message translates to:
  /// **'Water pump pliers'**
  String get checklistWaterpomptang;

  /// No description provided for @checklistTeflonTape.
  ///
  /// In en, this message translates to:
  /// **'Teflon tape'**
  String get checklistTeflonTape;

  /// No description provided for @checklistSleutelset.
  ///
  /// In en, this message translates to:
  /// **'Wrench set'**
  String get checklistSleutelset;

  /// No description provided for @checklistPijpsnijder.
  ///
  /// In en, this message translates to:
  /// **'Pipe cutter'**
  String get checklistPijpsnijder;

  /// No description provided for @checklistIJzerzaag.
  ///
  /// In en, this message translates to:
  /// **'Hacksaw'**
  String get checklistIJzerzaag;

  /// No description provided for @checklistOntluchtingssleutel.
  ///
  /// In en, this message translates to:
  /// **'Bleeding key'**
  String get checklistOntluchtingssleutel;

  /// No description provided for @checklistSoldeerbrander.
  ///
  /// In en, this message translates to:
  /// **'Soldering torch'**
  String get checklistSoldeerbrander;

  /// No description provided for @checklistAfsluiters.
  ///
  /// In en, this message translates to:
  /// **'Shut-off valves'**
  String get checklistAfsluiters;

  /// No description provided for @checklistEmmer.
  ///
  /// In en, this message translates to:
  /// **'Bucket'**
  String get checklistEmmer;

  /// No description provided for @checklistSchroevendraaierSet.
  ///
  /// In en, this message translates to:
  /// **'Screwdriver set'**
  String get checklistSchroevendraaierSet;

  /// No description provided for @checklistTrekkerDraadtrekker.
  ///
  /// In en, this message translates to:
  /// **'Cable puller / Wire puller'**
  String get checklistTrekkerDraadtrekker;

  /// No description provided for @checklistKrimpkous.
  ///
  /// In en, this message translates to:
  /// **'Heat shrink tubing'**
  String get checklistKrimpkous;

  /// No description provided for @checklistMultimeter.
  ///
  /// In en, this message translates to:
  /// **'Multimeter'**
  String get checklistMultimeter;

  /// No description provided for @checklistKnijtang.
  ///
  /// In en, this message translates to:
  /// **'Side cutters'**
  String get checklistKnijtang;

  /// No description provided for @checklistBoorhamers.
  ///
  /// In en, this message translates to:
  /// **'Hammer drill'**
  String get checklistBoorhamers;

  /// No description provided for @checklistIsolatietape.
  ///
  /// In en, this message translates to:
  /// **'Insulation tape'**
  String get checklistIsolatietape;

  /// No description provided for @checklistNulschakelaar.
  ///
  /// In en, this message translates to:
  /// **'Isolator switch'**
  String get checklistNulschakelaar;

  /// No description provided for @checklistTegelsnijder.
  ///
  /// In en, this message translates to:
  /// **'Tile cutter'**
  String get checklistTegelsnijder;

  /// No description provided for @checklistTandspaan.
  ///
  /// In en, this message translates to:
  /// **'Notched trowel'**
  String get checklistTandspaan;

  /// No description provided for @checklistVoegspuit.
  ///
  /// In en, this message translates to:
  /// **'Grout float'**
  String get checklistVoegspuit;

  /// No description provided for @checklistSpons.
  ///
  /// In en, this message translates to:
  /// **'Sponge'**
  String get checklistSpons;

  /// No description provided for @checklistRubberHamer.
  ///
  /// In en, this message translates to:
  /// **'Rubber mallet'**
  String get checklistRubberHamer;

  /// No description provided for @checklistSchop.
  ///
  /// In en, this message translates to:
  /// **'Spade'**
  String get checklistSchop;

  /// No description provided for @checklistHark.
  ///
  /// In en, this message translates to:
  /// **'Rake'**
  String get checklistHark;

  /// No description provided for @checklistSnoeischaar.
  ///
  /// In en, this message translates to:
  /// **'Pruning shears'**
  String get checklistSnoeischaar;

  /// No description provided for @checklistKruiwagen.
  ///
  /// In en, this message translates to:
  /// **'Wheelbarrow'**
  String get checklistKruiwagen;

  /// No description provided for @checklistTuinhandschoenen.
  ///
  /// In en, this message translates to:
  /// **'Garden gloves'**
  String get checklistTuinhandschoenen;

  /// No description provided for @checklistGraafmachine.
  ///
  /// In en, this message translates to:
  /// **'Excavator'**
  String get checklistGraafmachine;

  /// No description provided for @checklistGieter.
  ///
  /// In en, this message translates to:
  /// **'Watering can'**
  String get checklistGieter;

  /// No description provided for @checklistBeitel.
  ///
  /// In en, this message translates to:
  /// **'Chisel'**
  String get checklistBeitel;

  /// No description provided for @checklistMontageschuimpistool.
  ///
  /// In en, this message translates to:
  /// **'Foam gun'**
  String get checklistMontageschuimpistool;

  /// No description provided for @checklistBlokhaak.
  ///
  /// In en, this message translates to:
  /// **'Try square'**
  String get checklistBlokhaak;

  /// No description provided for @checklistBreekijzer.
  ///
  /// In en, this message translates to:
  /// **'Crowbar'**
  String get checklistBreekijzer;

  /// No description provided for @checklistLijmtang.
  ///
  /// In en, this message translates to:
  /// **'Clamp'**
  String get checklistLijmtang;

  /// No description provided for @checklistSpeedboor.
  ///
  /// In en, this message translates to:
  /// **'Spade bit (for lock hole)'**
  String get checklistSpeedboor;

  /// No description provided for @checklistStofmasker.
  ///
  /// In en, this message translates to:
  /// **'Dust mask'**
  String get checklistStofmasker;

  /// No description provided for @checklistVeiligheidsbril.
  ///
  /// In en, this message translates to:
  /// **'Safety goggles'**
  String get checklistVeiligheidsbril;

  /// No description provided for @checklistVerlengkabel.
  ///
  /// In en, this message translates to:
  /// **'Extension cord'**
  String get checklistVerlengkabel;

  /// No description provided for @checklistTrapje.
  ///
  /// In en, this message translates to:
  /// **'Step stool'**
  String get checklistTrapje;

  /// No description provided for @checklistFreesmachine.
  ///
  /// In en, this message translates to:
  /// **'Router (optional)'**
  String get checklistFreesmachine;

  /// No description provided for @checklistSchuurmachine.
  ///
  /// In en, this message translates to:
  /// **'Sanding machine'**
  String get checklistSchuurmachine;

  /// No description provided for @checklistSchaafmachine.
  ///
  /// In en, this message translates to:
  /// **'Electric planer'**
  String get checklistSchaafmachine;

  /// No description provided for @checklistAfkortzaag.
  ///
  /// In en, this message translates to:
  /// **'Cross-cut / Miter saw'**
  String get checklistAfkortzaag;

  /// No description provided for @checklistStofdoek.
  ///
  /// In en, this message translates to:
  /// **'Dust cloth'**
  String get checklistStofdoek;

  /// No description provided for @checklistKniebeschermers.
  ///
  /// In en, this message translates to:
  /// **'Knee pads'**
  String get checklistKniebeschermers;

  /// No description provided for @checklistStanleymes.
  ///
  /// In en, this message translates to:
  /// **'Utility knife'**
  String get checklistStanleymes;

  /// No description provided for @checklistGatenzaag.
  ///
  /// In en, this message translates to:
  /// **'Hole saw (for cutouts)'**
  String get checklistGatenzaag;

  /// No description provided for @checklistLijmklemmen.
  ///
  /// In en, this message translates to:
  /// **'Clamps'**
  String get checklistLijmklemmen;

  /// No description provided for @checklistWerkhandschoenen.
  ///
  /// In en, this message translates to:
  /// **'Work gloves'**
  String get checklistWerkhandschoenen;

  /// No description provided for @checklistCirkelzaag.
  ///
  /// In en, this message translates to:
  /// **'Circular / Plunge saw'**
  String get checklistCirkelzaag;

  /// No description provided for @checklistGipsschaar.
  ///
  /// In en, this message translates to:
  /// **'Drywall scissors'**
  String get checklistGipsschaar;

  /// No description provided for @checklistSteiger.
  ///
  /// In en, this message translates to:
  /// **'Step stool / Scaffolding'**
  String get checklistSteiger;

  /// No description provided for @checklistBehangafstomer.
  ///
  /// In en, this message translates to:
  /// **'Wallpaper steamer (hire)'**
  String get checklistBehangafstomer;

  /// No description provided for @checklistGrondboor.
  ///
  /// In en, this message translates to:
  /// **'Post hole digger'**
  String get checklistGrondboor;

  /// No description provided for @checklistVerstekbak.
  ///
  /// In en, this message translates to:
  /// **'Miter box'**
  String get checklistVerstekbak;

  /// No description provided for @checklistLijnlaser.
  ///
  /// In en, this message translates to:
  /// **'Line laser (optional)'**
  String get checklistLijnlaser;

  /// No description provided for @checklistTroffel.
  ///
  /// In en, this message translates to:
  /// **'Trowel'**
  String get checklistTroffel;

  /// No description provided for @checklistVoegrubber.
  ///
  /// In en, this message translates to:
  /// **'Grout float'**
  String get checklistVoegrubber;

  /// No description provided for @checklistBezem.
  ///
  /// In en, this message translates to:
  /// **'Broom'**
  String get checklistBezem;

  /// No description provided for @checklistGrasrol.
  ///
  /// In en, this message translates to:
  /// **'Lawn roller'**
  String get checklistGrasrol;

  /// No description provided for @checklistTakkenschaar.
  ///
  /// In en, this message translates to:
  /// **'Loppers'**
  String get checklistTakkenschaar;

  /// No description provided for @checklistHeggenschaar.
  ///
  /// In en, this message translates to:
  /// **'Hedge shears'**
  String get checklistHeggenschaar;

  /// No description provided for @checklistSnoeizaag.
  ///
  /// In en, this message translates to:
  /// **'Pruning saw'**
  String get checklistSnoeizaag;

  /// No description provided for @checklistKettingzaag.
  ///
  /// In en, this message translates to:
  /// **'Chainsaw (hire, only for safe & appropriate use)'**
  String get checklistKettingzaag;

  /// No description provided for @checklistBitset.
  ///
  /// In en, this message translates to:
  /// **'Bit set'**
  String get checklistBitset;

  /// No description provided for @checklistZaag.
  ///
  /// In en, this message translates to:
  /// **'Hand saw'**
  String get checklistZaag;

  /// No description provided for @checklistBorstel.
  ///
  /// In en, this message translates to:
  /// **'Brush'**
  String get checklistBorstel;

  /// No description provided for @checklistSpade.
  ///
  /// In en, this message translates to:
  /// **'Spade'**
  String get checklistSpade;

  /// No description provided for @checklistBladhark.
  ///
  /// In en, this message translates to:
  /// **'Leaf rake'**
  String get checklistBladhark;

  /// No description provided for @checklistBladblazer.
  ///
  /// In en, this message translates to:
  /// **'Leaf blower (optional)'**
  String get checklistBladblazer;

  /// No description provided for @checklistSlijpsteen.
  ///
  /// In en, this message translates to:
  /// **'Pruning shear sharpener / Whetstone'**
  String get checklistSlijpsteen;

  /// No description provided for @checklistStaalborstel.
  ///
  /// In en, this message translates to:
  /// **'Wire brush'**
  String get checklistStaalborstel;

  /// No description provided for @checklistGereedschapsolie.
  ///
  /// In en, this message translates to:
  /// **'Tool oil / Linseed oil (WD-40)'**
  String get checklistGereedschapsolie;

  /// No description provided for @checklistVoegenborstel.
  ///
  /// In en, this message translates to:
  /// **'Grout brush'**
  String get checklistVoegenborstel;

  /// No description provided for @checklistHogedrukreiniger.
  ///
  /// In en, this message translates to:
  /// **'Pressure washer (optional)'**
  String get checklistHogedrukreiniger;

  /// No description provided for @checklistGaskantenknipper.
  ///
  /// In en, this message translates to:
  /// **'Lawn edger'**
  String get checklistGaskantenknipper;

  /// No description provided for @checklistZwaaihaak.
  ///
  /// In en, this message translates to:
  /// **'Adjustable bevel / T-bevel'**
  String get checklistZwaaihaak;

  /// No description provided for @checklistTacker.
  ///
  /// In en, this message translates to:
  /// **'Staple gun (heavy-duty)'**
  String get checklistTacker;

  /// No description provided for @checklistTrapspin.
  ///
  /// In en, this message translates to:
  /// **'Stair square / Stair gauge'**
  String get checklistTrapspin;

  /// No description provided for @checklistLijmkam.
  ///
  /// In en, this message translates to:
  /// **'Glue spreader / Glue roller'**
  String get checklistLijmkam;

  /// No description provided for @checklistTrekijzer.
  ///
  /// In en, this message translates to:
  /// **'Pull bar'**
  String get checklistTrekijzer;

  /// No description provided for @checklistSlagblok.
  ///
  /// In en, this message translates to:
  /// **'Tapping block'**
  String get checklistSlagblok;

  /// No description provided for @checklistVloerwals.
  ///
  /// In en, this message translates to:
  /// **'Heavy roller (for pressing down)'**
  String get checklistVloerwals;

  /// No description provided for @checklistTrilplaat.
  ///
  /// In en, this message translates to:
  /// **'Vibrating plate compactor (hire)'**
  String get checklistTrilplaat;

  /// No description provided for @checklistKitschraper.
  ///
  /// In en, this message translates to:
  /// **'Sealant scraper / caulk remover'**
  String get checklistKitschraper;

  /// No description provided for @checklistPlantenspuit.
  ///
  /// In en, this message translates to:
  /// **'Spray bottle with washing-up liquid'**
  String get checklistPlantenspuit;

  /// No description provided for @checklistKeukenpapier.
  ///
  /// In en, this message translates to:
  /// **'Kitchen paper / paper towels'**
  String get checklistKeukenpapier;

  /// No description provided for @checklistBouwstofzuiger.
  ///
  /// In en, this message translates to:
  /// **'Construction vacuum cleaner (dust extraction when dry cutting/grinding)'**
  String get checklistBouwstofzuiger;

  /// No description provided for @checklistVoegkrabber.
  ///
  /// In en, this message translates to:
  /// **'Grout rake'**
  String get checklistVoegkrabber;

  /// No description provided for @checklistGlijhoek.
  ///
  /// In en, this message translates to:
  /// **'Sliding bevel (for angled walls)'**
  String get checklistGlijhoek;

  /// No description provided for @checklistRubbereKitspatel.
  ///
  /// In en, this message translates to:
  /// **'Rubber sealant finishing tool'**
  String get checklistRubbereKitspatel;

  /// No description provided for @checklistLiniaal.
  ///
  /// In en, this message translates to:
  /// **'Ruler / Steel ruler'**
  String get checklistLiniaal;

  /// No description provided for @checklistCentrumbits.
  ///
  /// In en, this message translates to:
  /// **'Centering bit / Hinge bit'**
  String get checklistCentrumbits;

  /// No description provided for @checklistWiggen.
  ///
  /// In en, this message translates to:
  /// **'Wedges / Spacers'**
  String get checklistWiggen;

  /// No description provided for @checklistGroteVerfroller.
  ///
  /// In en, this message translates to:
  /// **'Large paint roller'**
  String get checklistGroteVerfroller;

  /// No description provided for @checklistKleineVerfroller.
  ///
  /// In en, this message translates to:
  /// **'Small paint roller'**
  String get checklistKleineVerfroller;

  /// No description provided for @checklistVerlengstok.
  ///
  /// In en, this message translates to:
  /// **'Extension pole'**
  String get checklistVerlengstok;

  /// No description provided for @checklistKwasten.
  ///
  /// In en, this message translates to:
  /// **'Paint brushes'**
  String get checklistKwasten;

  /// No description provided for @checklistRadiatorroller.
  ///
  /// In en, this message translates to:
  /// **'Radiator roller'**
  String get checklistRadiatorroller;

  /// No description provided for @checklistStofzuiger.
  ///
  /// In en, this message translates to:
  /// **'Vacuum cleaner'**
  String get checklistStofzuiger;

  /// No description provided for @checklistSchroefboormachine.
  ///
  /// In en, this message translates to:
  /// **'Cordless drill / driver'**
  String get checklistSchroefboormachine;

  /// No description provided for @checklistBoormachine.
  ///
  /// In en, this message translates to:
  /// **'Drill'**
  String get checklistBoormachine;

  /// No description provided for @checklistBuigtang.
  ///
  /// In en, this message translates to:
  /// **'Pipe bender'**
  String get checklistBuigtang;

  /// No description provided for @checklistMoersleutel.
  ///
  /// In en, this message translates to:
  /// **'Wrench / Adjustable wrench'**
  String get checklistMoersleutel;

  /// No description provided for @checklistOntbraker.
  ///
  /// In en, this message translates to:
  /// **'Deburring tool'**
  String get checklistOntbraker;

  /// No description provided for @checklistLeidingzoeker.
  ///
  /// In en, this message translates to:
  /// **'Pipe & cable detector'**
  String get checklistLeidingzoeker;

  /// No description provided for @checklistSteeksleutel.
  ///
  /// In en, this message translates to:
  /// **'Open-end spanner'**
  String get checklistSteeksleutel;

  /// No description provided for @checklistInbussleutel.
  ///
  /// In en, this message translates to:
  /// **'Allen key'**
  String get checklistInbussleutel;

  /// No description provided for @checklistFrees.
  ///
  /// In en, this message translates to:
  /// **'Wall chaser / Router'**
  String get checklistFrees;

  /// No description provided for @checklistOntstoppingsveer.
  ///
  /// In en, this message translates to:
  /// **'Drain auger / snake'**
  String get checklistOntstoppingsveer;

  /// No description provided for @checklistOntstoppingsmachine.
  ///
  /// In en, this message translates to:
  /// **'Electric drain unblocking machine (hire)'**
  String get checklistOntstoppingsmachine;

  /// No description provided for @checklistRioolkabel.
  ///
  /// In en, this message translates to:
  /// **'Sewer cable'**
  String get checklistRioolkabel;

  /// No description provided for @checklistHandschoenen.
  ///
  /// In en, this message translates to:
  /// **'Work gloves'**
  String get checklistHandschoenen;

  /// No description provided for @checklistDoek.
  ///
  /// In en, this message translates to:
  /// **'Cleaning cloth'**
  String get checklistDoek;

  /// No description provided for @checklistIsolatiemes.
  ///
  /// In en, this message translates to:
  /// **'Insulation knife'**
  String get checklistIsolatiemes;

  /// No description provided for @checklistSpanningstester.
  ///
  /// In en, this message translates to:
  /// **'Voltage tester'**
  String get checklistSpanningstester;

  /// No description provided for @checklistStriptang.
  ///
  /// In en, this message translates to:
  /// **'Wire stripper'**
  String get checklistStriptang;

  /// No description provided for @checklistKabelknipper.
  ///
  /// In en, this message translates to:
  /// **'Cable cutter'**
  String get checklistKabelknipper;

  /// No description provided for @checklistGeisoleerGereedschap.
  ///
  /// In en, this message translates to:
  /// **'Insulated tools'**
  String get checklistGeisoleerGereedschap;

  /// No description provided for @checklistMeetTestgereedschap.
  ///
  /// In en, this message translates to:
  /// **'Measuring and testing equipment'**
  String get checklistMeetTestgereedschap;

  /// No description provided for @checklistMomentsleutel.
  ///
  /// In en, this message translates to:
  /// **'Torque wrench'**
  String get checklistMomentsleutel;

  /// No description provided for @checklistTrapjeOfSteiger.
  ///
  /// In en, this message translates to:
  /// **'Stepladder or scaffold'**
  String get checklistTrapjeOfSteiger;

  /// No description provided for @checklistTrekveer.
  ///
  /// In en, this message translates to:
  /// **'Fish tape / Cable puller'**
  String get checklistTrekveer;

  /// No description provided for @checklistBuisbuiger.
  ///
  /// In en, this message translates to:
  /// **'Conduit bender'**
  String get checklistBuisbuiger;

  /// No description provided for @checklistZeskantsleutel.
  ///
  /// In en, this message translates to:
  /// **'Hex key'**
  String get checklistZeskantsleutel;

  /// No description provided for @checklistSlijptol.
  ///
  /// In en, this message translates to:
  /// **'Angle grinder'**
  String get checklistSlijptol;

  /// No description provided for @checklistViltstift.
  ///
  /// In en, this message translates to:
  /// **'Marker / Felt-tip pen'**
  String get checklistViltstift;

  /// No description provided for @checklistRubbereHamer.
  ///
  /// In en, this message translates to:
  /// **'Rubber mallet'**
  String get checklistRubbereHamer;

  /// No description provided for @checklistVoegspijker.
  ///
  /// In en, this message translates to:
  /// **'Jointing trowel'**
  String get checklistVoegspijker;

  /// No description provided for @checklistZuignap.
  ///
  /// In en, this message translates to:
  /// **'Tile suction cup'**
  String get checklistZuignap;

  /// No description provided for @checklistDoekOfLap.
  ///
  /// In en, this message translates to:
  /// **'Cleaning rag'**
  String get checklistDoekOfLap;

  /// No description provided for @checklistBoorhamer.
  ///
  /// In en, this message translates to:
  /// **'Rotary hammer drill'**
  String get checklistBoorhamer;

  /// No description provided for @checklistStofferEnBlik.
  ///
  /// In en, this message translates to:
  /// **'Dustpan and brush (for clean up)'**
  String get checklistStofferEnBlik;

  /// No description provided for @checklistLaarzen.
  ///
  /// In en, this message translates to:
  /// **'Rubber boots / Waders'**
  String get checklistLaarzen;

  /// No description provided for @checklistSchepnet.
  ///
  /// In en, this message translates to:
  /// **'Landing net / Scoop net'**
  String get checklistSchepnet;

  /// No description provided for @checklistTrimmer.
  ///
  /// In en, this message translates to:
  /// **'String trimmer / Grass trimmer'**
  String get checklistTrimmer;

  /// No description provided for @calcStatusPreparationExcluded.
  ///
  /// In en, this message translates to:
  /// **'Preparation excluded'**
  String get calcStatusPreparationExcluded;

  /// No description provided for @calcStatusMaterialWaitExcluded.
  ///
  /// In en, this message translates to:
  /// **'Material waiting time excluded'**
  String get calcStatusMaterialWaitExcluded;

  /// No description provided for @calcStatusDryingCuringExcluded.
  ///
  /// In en, this message translates to:
  /// **'Drying/curing time excluded'**
  String get calcStatusDryingCuringExcluded;

  /// No description provided for @calcStatusIndicative.
  ///
  /// In en, this message translates to:
  /// **'Times are indicative'**
  String get calcStatusIndicative;

  /// No description provided for @calcStatusProjectSpecific.
  ///
  /// In en, this message translates to:
  /// **'Project-specific circumstances excluded'**
  String get calcStatusProjectSpecific;

  /// No description provided for @calcStatusPipeInstallNote.
  ///
  /// In en, this message translates to:
  /// **'For water pipe installation, the time per metre is a calculation basis only. Bends, fittings, wall penetrations, fastening, testing, and accessibility can significantly increase actual working time.'**
  String get calcStatusPipeInstallNote;

  /// Title of the load-bearing wall safety restriction notice
  ///
  /// In en, this message translates to:
  /// **'Easy4DIY Safety Restriction'**
  String get safetyLoadBearingTitle;

  /// Body text of the load-bearing wall safety restriction notice (Document 1, Final Version)
  ///
  /// In en, this message translates to:
  /// **'Easy4DIY does not cover the removal or modification of load-bearing structures. If there is any doubt, or if a wall may be load-bearing, it must first be assessed by a qualified professional. Modifications to load-bearing structures may require a building permit.'**
  String get safetyLoadBearingBody;

  /// No description provided for @onboardingSafetyTitle.
  ///
  /// In en, this message translates to:
  /// **'Safety check'**
  String get onboardingSafetyTitle;

  /// No description provided for @onboardingSafetyIntro.
  ///
  /// In en, this message translates to:
  /// **'Before continuing, select every condition below that applies to this job. Always use suitable protective equipment and follow the manufacturer\'s instructions.'**
  String get onboardingSafetyIntro;

  /// No description provided for @onboardingSafetyStopMessage.
  ///
  /// In en, this message translates to:
  /// **'Stop here. This job is outside Easy4DIY\'s safe scope. Do not continue with the calculation; contact a qualified professional.'**
  String get onboardingSafetyStopMessage;

  /// No description provided for @safetyStopUnknownServices.
  ///
  /// In en, this message translates to:
  /// **'Are there unknown pipes or cables inside the structure where you will work?'**
  String get safetyStopUnknownServices;

  /// No description provided for @safetyStopAsbestos.
  ///
  /// In en, this message translates to:
  /// **'Do you suspect that any material contains asbestos?'**
  String get safetyStopAsbestos;

  /// No description provided for @safetyStopPermit.
  ///
  /// In en, this message translates to:
  /// **'Does this work require a permit?'**
  String get safetyStopPermit;

  /// No description provided for @safetyStopHeight.
  ///
  /// In en, this message translates to:
  /// **'Would you need to work at height without suitable safety equipment?'**
  String get safetyStopHeight;

  /// No description provided for @safetyStopLoadBearing.
  ///
  /// In en, this message translates to:
  /// **'Could this job remove or modify a load-bearing structure, or is its structural safety uncertain?'**
  String get safetyStopLoadBearing;

  /// No description provided for @safetyStopGas.
  ///
  /// In en, this message translates to:
  /// **'Does this work involve gas pipes or a gas-burning appliance or installation?'**
  String get safetyStopGas;

  /// No description provided for @safetyStopFlue.
  ///
  /// In en, this message translates to:
  /// **'Does this work involve a flue-gas system?'**
  String get safetyStopFlue;

  /// No description provided for @safetyStopBoiler.
  ///
  /// In en, this message translates to:
  /// **'Does this work involve repairing a boiler?'**
  String get safetyStopBoiler;

  /// No description provided for @safetyStopSeriousLeak.
  ///
  /// In en, this message translates to:
  /// **'Is there a serious or unexplained leak?'**
  String get safetyStopSeriousLeak;

  /// No description provided for @safetyStopPressureLoss.
  ///
  /// In en, this message translates to:
  /// **'Is the central-heating system repeatedly losing pressure?'**
  String get safetyStopPressureLoss;

  /// No description provided for @safetyStopBlockage.
  ///
  /// In en, this message translates to:
  /// **'Is the blockage complex, recurring, or possibly caused by pipe damage?'**
  String get safetyStopBlockage;

  /// No description provided for @safetyStopDrinkingWater.
  ///
  /// In en, this message translates to:
  /// **'Is there any doubt about drinking-water safety?'**
  String get safetyStopDrinkingWater;

  /// No description provided for @safetyStopLeadPaint.
  ///
  /// In en, this message translates to:
  /// **'Could the existing paint contain lead?'**
  String get safetyStopLeadPaint;

  /// No description provided for @safetyStopMoisture.
  ///
  /// In en, this message translates to:
  /// **'Is there severe moisture damage or an unresolved moisture problem?'**
  String get safetyStopMoisture;

  /// No description provided for @safetyStopSubstrate.
  ///
  /// In en, this message translates to:
  /// **'Are you unsure whether the substrate is suitable or sound?'**
  String get safetyStopSubstrate;

  /// No description provided for @safetyStopWiring.
  ///
  /// In en, this message translates to:
  /// **'Is the existing wiring damaged or its condition unknown?'**
  String get safetyStopWiring;

  /// No description provided for @safetyStopEarthing.
  ///
  /// In en, this message translates to:
  /// **'Is the earthing missing or uncertain where it is required?'**
  String get safetyStopEarthing;

  /// No description provided for @safetyStopCircuit.
  ///
  /// In en, this message translates to:
  /// **'Are you uncertain about the fuse or circuit breaker?'**
  String get safetyStopCircuit;

  /// No description provided for @safetyStopHeavyEquipment.
  ///
  /// In en, this message translates to:
  /// **'Would this require heavy equipment you are not trained to use?'**
  String get safetyStopHeavyEquipment;

  /// No description provided for @safetyStopPesticide.
  ///
  /// In en, this message translates to:
  /// **'Would this involve pesticides that require special training or handling?'**
  String get safetyStopPesticide;

  /// No description provided for @checklistContourmal.
  ///
  /// In en, this message translates to:
  /// **'Contour gauge'**
  String get checklistContourmal;

  /// No description provided for @checklistDeken.
  ///
  /// In en, this message translates to:
  /// **'Blanket (protection)'**
  String get checklistDeken;

  /// No description provided for @checklistDeurheffer.
  ///
  /// In en, this message translates to:
  /// **'Door lifter'**
  String get checklistDeurheffer;

  /// No description provided for @checklistFijngetandeZaag.
  ///
  /// In en, this message translates to:
  /// **'Fine-toothed saw or laminate shears'**
  String get checklistFijngetandeZaag;

  /// No description provided for @checklistVerstekzaag.
  ///
  /// In en, this message translates to:
  /// **'Mitre saw'**
  String get checklistVerstekzaag;

  /// No description provided for @doc5HourlyRateCarpenter.
  ///
  /// In en, this message translates to:
  /// **'Carpenter hourly rate: €45/hr'**
  String get doc5HourlyRateCarpenter;

  /// No description provided for @doc5HourIndicationTitle.
  ///
  /// In en, this message translates to:
  /// **'Time Indication & Savings'**
  String get doc5HourIndicationTitle;

  /// No description provided for @doc5HourIndicationDisclaimer.
  ///
  /// In en, this message translates to:
  /// **'The times are app calculation values, not a guarantee for every situation. They assume a normal, easily accessible situation. Extra work due to preparation, substrate, customisation, accessibility or material choice is assessed separately.'**
  String get doc5HourIndicationDisclaimer;

  /// No description provided for @doc5ProTime.
  ///
  /// In en, this message translates to:
  /// **'Pro time'**
  String get doc5ProTime;

  /// No description provided for @doc5DiyTime.
  ///
  /// In en, this message translates to:
  /// **'DIY time'**
  String get doc5DiyTime;

  /// No description provided for @doc5IndicativeSaving.
  ///
  /// In en, this message translates to:
  /// **'Indicative saving'**
  String get doc5IndicativeSaving;

  /// No description provided for @doc5SavingDisclaimer.
  ///
  /// In en, this message translates to:
  /// **'This is purely a calculation basis. In practice, additional materials, reinforcement, finishing, bends, penetrations or unforeseen circumstances may cause extra costs and time.'**
  String get doc5SavingDisclaimer;

  /// No description provided for @doc5AppLogicTitle.
  ///
  /// In en, this message translates to:
  /// **'App logic – Fixed rules'**
  String get doc5AppLogicTitle;

  /// No description provided for @doc5RuleMostCommonMaterial.
  ///
  /// In en, this message translates to:
  /// **'Most common material first'**
  String get doc5RuleMostCommonMaterial;

  /// No description provided for @doc5RuleMostCommonMaterialDesc.
  ///
  /// In en, this message translates to:
  /// **'The app defaults to the most common material/product type for each job.'**
  String get doc5RuleMostCommonMaterialDesc;

  /// No description provided for @doc5RuleAveragePrice.
  ///
  /// In en, this message translates to:
  /// **'Average guide price'**
  String get doc5RuleAveragePrice;

  /// No description provided for @doc5RuleAveragePriceDesc.
  ///
  /// In en, this message translates to:
  /// **'The app uses one average guide price for each standard material.'**
  String get doc5RuleAveragePriceDesc;

  /// No description provided for @doc5RuleNoUnnecessaryMaterials.
  ///
  /// In en, this message translates to:
  /// **'No unnecessary material additions'**
  String get doc5RuleNoUnnecessaryMaterials;

  /// No description provided for @doc5RuleNoUnnecessaryMaterialsDesc.
  ///
  /// In en, this message translates to:
  /// **'Components included as standard with a product are not counted again as separate materials.'**
  String get doc5RuleNoUnnecessaryMaterialsDesc;

  /// No description provided for @doc5RuleOptionalMaterials.
  ///
  /// In en, this message translates to:
  /// **'Optional materials'**
  String get doc5RuleOptionalMaterials;

  /// No description provided for @doc5RuleOptionalMaterialsDesc.
  ///
  /// In en, this message translates to:
  /// **'Additional materials are only added when the situation or product choice requires it.'**
  String get doc5RuleOptionalMaterialsDesc;

  /// No description provided for @doc5RuleManufacturerFirst.
  ///
  /// In en, this message translates to:
  /// **'Manufacturer first'**
  String get doc5RuleManufacturerFirst;

  /// No description provided for @doc5RuleManufacturerFirstDesc.
  ///
  /// In en, this message translates to:
  /// **'Manufacturer instructions always take precedence over general calculation values.'**
  String get doc5RuleManufacturerFirstDesc;

  /// No description provided for @doc5RuleSituationCheck.
  ///
  /// In en, this message translates to:
  /// **'Situation check'**
  String get doc5RuleSituationCheck;

  /// No description provided for @doc5RuleSituationCheckDesc.
  ///
  /// In en, this message translates to:
  /// **'Before starting, confirm the job type, dimensions, material, substrate, accessibility and desired finish. Do not proceed if the actual situation falls outside these assumptions.'**
  String get doc5RuleSituationCheckDesc;

  /// No description provided for @doc5RuleStructuralSafety.
  ///
  /// In en, this message translates to:
  /// **'Structural safety'**
  String get doc5RuleStructuralSafety;

  /// No description provided for @doc5RuleStructuralSafetyDesc.
  ///
  /// In en, this message translates to:
  /// **'No load-bearing structures may be removed or modified. If in doubt or if a wall may be load-bearing: have it assessed by a professional first.'**
  String get doc5RuleStructuralSafetyDesc;

  /// No description provided for @doc5StopMomentTitle.
  ///
  /// In en, this message translates to:
  /// **'Stop moments'**
  String get doc5StopMomentTitle;

  /// No description provided for @doc5StopMomentLoadBearing.
  ///
  /// In en, this message translates to:
  /// **'Load-bearing structures'**
  String get doc5StopMomentLoadBearing;

  /// No description provided for @doc5StopMomentAsbestos.
  ///
  /// In en, this message translates to:
  /// **'Suspected asbestos materials'**
  String get doc5StopMomentAsbestos;

  /// No description provided for @doc5StopMomentMoisture.
  ///
  /// In en, this message translates to:
  /// **'Moisture or leakage problems'**
  String get doc5StopMomentMoisture;

  /// No description provided for @doc5StopMomentUnknownWiring.
  ///
  /// In en, this message translates to:
  /// **'Unknown pipes or cables in structures'**
  String get doc5StopMomentUnknownWiring;

  /// No description provided for @doc5StopMomentPermit.
  ///
  /// In en, this message translates to:
  /// **'Work requiring a permit'**
  String get doc5StopMomentPermit;

  /// No description provided for @doc5StopMomentComplex.
  ///
  /// In en, this message translates to:
  /// **'Complex structures'**
  String get doc5StopMomentComplex;

  /// No description provided for @doc5TestTitle.
  ///
  /// In en, this message translates to:
  /// **'Post-work testing'**
  String get doc5TestTitle;

  /// No description provided for @doc5TestLevel.
  ///
  /// In en, this message translates to:
  /// **'Level and stable result'**
  String get doc5TestLevel;

  /// No description provided for @doc5TestSecure.
  ///
  /// In en, this message translates to:
  /// **'Secure fastening'**
  String get doc5TestSecure;

  /// No description provided for @doc5TestFunction.
  ///
  /// In en, this message translates to:
  /// **'Correct functioning'**
  String get doc5TestFunction;

  /// No description provided for @doc5TestFinish.
  ///
  /// In en, this message translates to:
  /// **'Neat finish'**
  String get doc5TestFinish;

  /// No description provided for @doc5CostNote.
  ///
  /// In en, this message translates to:
  /// **'The app shows an average guide price. The live app can later retrieve current product prices.'**
  String get doc5CostNote;

  /// No description provided for @doc5HoursNote.
  ///
  /// In en, this message translates to:
  /// **'The app shows a calculated installation time and clearly states what is and is not included.'**
  String get doc5HoursNote;

  /// No description provided for @doc5SafetyNote.
  ///
  /// In en, this message translates to:
  /// **'Use appropriate personal protection and work according to the instructions for materials, tools and installation.'**
  String get doc5SafetyNote;

  /// No description provided for @doc5GuidanceTitle.
  ///
  /// In en, this message translates to:
  /// **'Important assumptions and safety checks'**
  String get doc5GuidanceTitle;

  /// No description provided for @doc5GuidanceCarpenter.
  ///
  /// In en, this message translates to:
  /// **'Do not remove or modify load-bearing structures. Have uncertain structures assessed by a qualified professional. Check that installed items are secure, level and stable.'**
  String get doc5GuidanceCarpenter;

  /// No description provided for @doc5GuidancePainter.
  ///
  /// In en, this message translates to:
  /// **'Follow the paint and primer instructions. Use suitable protection when sanding or handling chemicals. Stop if lead paint, asbestos, severe moisture or an unsuitable substrate is suspected. Drying and curing time is not included; check the finished surface for runs and defects.'**
  String get doc5GuidancePainter;

  /// No description provided for @doc5GuidancePlumber.
  ///
  /// In en, this message translates to:
  /// **'Follow product instructions and use materials suitable for drinking-water systems. Stop for gas, flues, boiler repairs, unexplained leaks, recurring pressure loss, serious blockages or uncertainty about water safety. Check for leaks and correct operation before covering pipework.'**
  String get doc5GuidancePlumber;

  /// No description provided for @doc5GuidanceGardener.
  ///
  /// In en, this message translates to:
  /// **'Follow instructions for machinery, treatments and materials; wear suitable protective equipment. Stop if structural stability, working at height, heavy equipment, pesticides or permits are uncertain. Check structural stability and drainage after the work.'**
  String get doc5GuidanceGardener;

  /// No description provided for @doc5GuidanceElectrician.
  ///
  /// In en, this message translates to:
  /// **'Never work on a live installation. If you cannot safely isolate and verify the circuit, or are unsure about wiring, earthing or circuit protection, stop and use a qualified electrician. Follow product instructions and applicable electrical standards; verify correct operation and earthing before use.'**
  String get doc5GuidanceElectrician;

  /// No description provided for @doc5GuidanceTiler.
  ///
  /// In en, this message translates to:
  /// **'Follow product instructions for adhesive, grout and sealant. Control silica dust during cutting and use suitable eye, hearing and respiratory protection. Stop for suspected asbestos, structural concerns, severe moisture or an unsuitable substrate. Check tile adhesion, grout and surface level after the work.'**
  String get doc5GuidanceTiler;

  /// No description provided for @safetyPlumberTitle.
  ///
  /// In en, this message translates to:
  /// **'Easy4DIY Safety Restriction – Plumber'**
  String get safetyPlumberTitle;

  /// No description provided for @safetyPlumberBody.
  ///
  /// In en, this message translates to:
  /// **'Easy4DIY does not cover gas lines, work on gas appliances, flue gas exhaust, boiler repairs or boiler maintenance. If in doubt, in case of leakage, structural problems or work beyond the simple job: stop and refer to a qualified/certified installer.'**
  String get safetyPlumberBody;
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
      <String>['en', 'nl'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'nl':
      return AppLocalizationsNl();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
