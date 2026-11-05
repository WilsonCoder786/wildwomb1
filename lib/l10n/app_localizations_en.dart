// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get settingsAccount => 'Account';

  @override
  String get settingsAccountSubtitle => 'Manage your account information.';

  @override
  String get settingsName => 'Name';

  @override
  String get settingsEmailAddress => 'Email Address';

  @override
  String get settingsLanguage => 'Language';

  @override
  String get settingsLanguageSubtitle => 'Choose your preferred language.';

  @override
  String get settingsUnits => 'Units';

  @override
  String get settingsUnitsSubtitle => 'Choose the units of measurement.';

  @override
  String get settingsMeters => 'Meters (m)';

  @override
  String get settingsInches => 'Inches (in)';

  @override
  String get settingsOther => 'Other';

  @override
  String get settingsPrivacyPolicy => 'Privacy Policy';

  @override
  String get settingsTermsConditions => 'Terms & Conditions';

  @override
  String get settingsHelpSupport => 'Help & Support';

  @override
  String get settingsAbout => 'About Easy4DIY';

  @override
  String get settingsLogout => 'Logout';

  @override
  String get dashboardTitle => 'Dashboard';

  @override
  String get dashboardWelcome =>
      'Welcome back! Here\'s an overview of all your jobs, savings and performance.';

  @override
  String get dashboardTotalJobs => 'Total jobs';

  @override
  String get dashboardAllTime => 'All time';

  @override
  String get dashboardCompletedJobs => 'Completed jobs';

  @override
  String get dashboardCompleted => 'completed';

  @override
  String get dashboardTotalSavings => 'Total savings';

  @override
  String get dashboardAllJobs => 'All jobs';

  @override
  String get dashboardMoneySaved => 'Money saved';

  @override
  String get dashboardThisMonth => 'This month';

  @override
  String get dashboardSavingsOverview => 'Savings overview';

  @override
  String get dashboardViewAll => 'View all';

  @override
  String get dashboardDoItYourself => 'Do it yourself';

  @override
  String get dashboardToolsRental => 'Tools (rental)';

  @override
  String get dashboardTotal => 'Total';

  @override
  String get dashboardHireProfessional => 'Hire a professional';

  @override
  String get dashboardTimeEstimate => 'Time estimate';

  @override
  String get dashboardHours => 'hours';

  @override
  String get dashboardYouSave => 'You save';

  @override
  String get dashboardSmartDiy => 'That\'s smart DIY!';

  @override
  String get dashboardCostOverview => 'Cost overview';

  @override
  String get dashboardThisYear => 'This year';

  @override
  String get dashboardTotalCosts => 'Total costs';

  @override
  String get dashboardMaterials => 'Materials';

  @override
  String get dashboardTools => 'Tools';

  @override
  String get dashboardSubscriptions => 'Subscriptions';

  @override
  String get dashboardOther => 'Other';

  @override
  String get dashboardRecentActivities => 'Recent activities';

  @override
  String get dashboardNoRecentJobs =>
      'No recent jobs yet. Start your first job!';

  @override
  String dashboardJobCompleted(String jobName, String savings) {
    return '$jobName completed! € $savings saved.';
  }

  @override
  String get dashboardHoursAgo => 'hours ago';

  @override
  String get dashboardDayAgo => 'day ago';

  @override
  String get dashboardDaysAgo => 'days ago';

  @override
  String get dashboardWeekAgo => 'week ago';

  @override
  String get dashboardViewAllActivities => 'View all activities';

  @override
  String get dashboardQuickAccess => 'Quick access';

  @override
  String get dashboardNewJob => 'New job';

  @override
  String get rootDashboard => 'Dashboard';

  @override
  String get rootSettings => 'Settings';

  @override
  String get rootMyJobs => 'My Jobs';

  @override
  String get rootTasks => 'Tasks';

  @override
  String get rootSizesCalculations => 'Sizes & Calculations';

  @override
  String get rootMaterials => 'Materials';

  @override
  String get rootCostsSavings => 'Costs & Savings';

  @override
  String get rootSubscriptions => 'Subscriptions';

  @override
  String get rootToolChecklist => 'Tool Checklist';

  @override
  String get rootFaq => 'FAQ';

  @override
  String get rootPreferences => 'Preferences';

  @override
  String get rootStepByStep => 'STEP BY STEP';

  @override
  String get rootGoPremium => 'Go Premium';

  @override
  String get rootUnlockPremium => 'Unlock more jobs\nand premium features.';

  @override
  String get rootUpgradeNow => 'Upgrade Now';

  @override
  String onboardingStep(int current, int total) {
    return 'Step $current of $total';
  }

  @override
  String get onboardingWelcomeTitle => 'Welcome to Easy4DIY!';

  @override
  String get onboardingWelcomeDesc =>
      'Measure twice, know exactly! Quickly and easily calculate square meters, materials, costs, and tools for any project. In just a few steps, you’ll have a complete overview. Your first project is completely free. We’re continuously growing, adding new features and projects. Our goal? To become the biggest and best DIY app in the world. Will you build that future with us?';

  @override
  String get onboardingChooseJob => 'Which field?';

  @override
  String get onboardingWhatWork => 'Select the trade for your job';

  @override
  String get onboardingSelectJob => 'Select your job';

  @override
  String get onboardingJobCarpenter => 'Carpenter';

  @override
  String get onboardingJobPlumber => 'Plumber';

  @override
  String get onboardingJobPainter => 'Painter';

  @override
  String get onboardingJobGardener => 'Gardener';

  @override
  String get onboardingJobElectrician => 'Electrician';

  @override
  String get onboardingJobTiler => 'Tiler';

  @override
  String get onboardingFillSizes => 'Fill in the sizes';

  @override
  String get onboardingRoomDimensions => 'Enter the dimensions of your room';

  @override
  String get onboardingMeasureHeader =>
      'In the Easy4DIY app, measuring works like this:';

  @override
  String get onboardingMeasureStep1 =>
      'First, choose the surface: floor, wall, or ceiling.';

  @override
  String get onboardingMeasureExampleTitle => 'Example:';

  @override
  String get onboardingMeasureExampleDesc =>
      'A floor 5.00 m long and 4.00 m wide → 5.00 × 4.00 = 20.00 m².';

  @override
  String get onboardingMeasureFormulaFloor => 'Floor: length × width';

  @override
  String get onboardingMeasureFormulaWall => 'Wall: length × height';

  @override
  String get onboardingMeasureFormulaCeiling => 'Ceiling: length × width';

  @override
  String get onboardingMeasureFooter =>
      'Fill everything in in meters – the app does the rest.';

  @override
  String get onboardingTypeFloor => 'Floor (lxw)';

  @override
  String get onboardingTypeWall => 'Wall (lxh)';

  @override
  String get onboardingTypeCeiling => 'Ceiling (lxw)';

  @override
  String get onboardingLength => 'Length (m)';

  @override
  String get onboardingWidth => 'Width (m)';

  @override
  String get onboardingHeight => 'Height (m)';

  @override
  String get onboardingTotalArea => 'Total area (m²)';

  @override
  String get onboardingCuttingLoss => '+10% cutting loss (recommended)';

  @override
  String onboardingTotalWithLoss(String area) {
    return 'Total with cutting loss: $area m²';
  }

  @override
  String get onboardingHowLong => 'How long does this job take approximately?';

  @override
  String get onboardingChooseIndication => 'Choose an indication';

  @override
  String get onboardingMaterialsOverview => 'Materials overview';

  @override
  String get onboardingMaterial => 'Material';

  @override
  String get onboardingQty => 'Qty';

  @override
  String get onboardingPrice => 'Price';

  @override
  String onboardingBasedOnArea(String area) {
    return 'Based on $area m²\n(incl. 10% cutting loss)';
  }

  @override
  String get onboardingToolsCheck => 'Tools check';

  @override
  String get onboardingHaveRightTools => 'Do you already have the right tools?';

  @override
  String get onboardingFaqTitle => 'Most asked questions\nabout your job';

  @override
  String get onboardingCostOverview => 'Cost overview';

  @override
  String get onboardingCostDiy => 'What does it cost if you do it yourself?';

  @override
  String get onboardingDoItYourself => 'DO IT YOURSELF';

  @override
  String get onboardingHireProfessional => 'HIRE A PROFESSIONAL';

  @override
  String get onboardingYouSave => 'YOU SAVE';

  @override
  String get onboardingSmartDiy => 'That\'s smart DIY!';

  @override
  String get onboardingPrev => 'Previous';

  @override
  String get onboardingNext => 'Next';

  @override
  String get onboardingFinish => 'Finish';

  @override
  String get onboardingChoosePlan => 'Choose your subscription';

  @override
  String get onboardingUnlockFeatures => 'Unlock all features';

  @override
  String get onboardingPlanEssential => 'Essential';

  @override
  String get onboardingPlanEverything => 'Everything you need';

  @override
  String get onboardingPlanDemanding => 'For the demanding handyman';

  @override
  String get onboardingPlanMostChosen => 'MOST CHOSEN';

  @override
  String get onboardingStartFreeTrial => 'FIRST TIME FREE';

  @override
  String get onboardingCalculateArea => 'CALCULATE m²';

  @override
  String get onboardingBack => 'BACK';

  @override
  String get onboardingSafe => 'Safe';

  @override
  String get onboardingReliable => 'Reliable';

  @override
  String get onboardingEveryJob => 'For every job';

  @override
  String get onboardingBannerHint => 'How to fill in the measurements';

  @override
  String get onboardingJobBannerHint => 'Select the trade for your job';

  @override
  String get onboardingDurationHalfDay => 'Half day (2–4 hours)';

  @override
  String get onboardingDurationOneDay => '1 day';

  @override
  String get onboardingDurationTwoDays => '2–3 days';

  @override
  String get onboardingDurationOneWeek => '1 week';

  @override
  String get onboardingDurationMultipleWeeks => 'Multiple weeks';

  @override
  String onboardingDurationSelected(String duration) {
    return 'Estimated duration: $duration';
  }

  @override
  String get authLogin => 'Login';

  @override
  String get authWelcomeMessage =>
      'Welcome to Easy4DIY; glad you\'re here. Please enter your details here and much more.';

  @override
  String get authEmail => 'Email Address';

  @override
  String get authEmailHint => 'enter your email address';

  @override
  String get authPassword => 'Password';

  @override
  String get authPasswordHint => 'enter your password';

  @override
  String get authForgotPassword => 'Forgot password?';

  @override
  String get authNoAccount => 'Don\'t have an account? ';

  @override
  String get authCreateOne => 'Create one';

  @override
  String get authCreateAccount => 'Create Account';

  @override
  String get authWelcomeSignup =>
      'Welcome! Fill in your details to get started.';

  @override
  String get authFullName => 'Full Name';

  @override
  String get authFullNameHint => 'Enter your full name';

  @override
  String get authPhone => 'Phone Number';

  @override
  String get authPhoneHint => 'Enter your phone number';

  @override
  String get authChoosePassword => 'Choose a password';

  @override
  String get authConfirmPassword => 'Confirm password';

  @override
  String get authConfirmPasswordHint => 'Confirm your password';

  @override
  String get authOr => 'OR';

  @override
  String get authAlreadyHaveAccount => 'Already have an account? ';

  @override
  String get authUserNotFound => 'User not found. Please sign up.';

  @override
  String get authWrongPassword => 'Incorrect password. Please try again.';

  @override
  String get authForgotPasswordTitle => 'Forgot password';

  @override
  String get authForgotPasswordDesc =>
      'Enter your email address to reset your password.';

  @override
  String get authEmailHintShort => 'your@email.com';

  @override
  String get authEmailRequired => 'Please enter your email';

  @override
  String get authEmailInvalid => 'Invalid email address';

  @override
  String get authNoAccountFound => 'No account found with this email address.';

  @override
  String get authCancel => 'Cancel';

  @override
  String get authContinue => 'Continue';

  @override
  String get authNewPasswordTitle => 'New password';

  @override
  String get authNewPasswordLabel => 'New password';

  @override
  String get authPasswordRequired => 'Please enter a password';

  @override
  String get authPasswordMinLength => 'Minimum 6 characters required';

  @override
  String get authConfirmPasswordLabel => 'Confirm password';

  @override
  String get authConfirmPasswordRequired => 'Confirm your password';

  @override
  String get authPasswordMismatch => 'Passwords do not match';

  @override
  String get authSave => 'Save';

  @override
  String get authPasswordChanged => 'Password successfully changed!';

  @override
  String get onboardingPlayVideo => 'Play instruction video';

  @override
  String get onboardingPlanFree => 'USE 1X FOR FREE';

  @override
  String get onboardingHowItWorks => 'HOW IT WORKS';

  @override
  String get onboardingFreeStep1 => 'Log in with Google or e-mail';

  @override
  String get onboardingFreeStep2 => 'Watch 2 short ads';

  @override
  String get onboardingFreeStep3 => 'Start 1 job for free';

  @override
  String get onboardingEasyToUse => 'EASY TO USE';

  @override
  String get onboardingDownloadApp =>
      'download the app on smartphone or website';

  @override
  String get onboardingPlanPremium => 'MONTHLY';

  @override
  String get onboardingPlanYearly => 'YEARLY';

  @override
  String get onboardingBestChoice => 'BEST CHOICE';

  @override
  String get onboardingUnlimitedJobs => 'Unlimited jobs';

  @override
  String get onboardingAllFeatures => 'All features';

  @override
  String get onboardingNoAds => 'No ads';

  @override
  String get onboardingPremiumSupport => 'Multilingual';

  @override
  String get onboardingUpdateNewJobs => 'Update & new jobs';

  @override
  String get onboardingChoosePremium => 'CHOOSE MONTHLY';

  @override
  String get onboardingChooseYearly => 'CHOOSE YEARLY';

  @override
  String get onboardingSave17 => 'SAVE 44%';

  @override
  String get onboardingSubscriptionChoice => 'Subscription choice';

  @override
  String get onboardingIndicativePrices => 'Prices are indicative';

  @override
  String get onboardingIndicativeCalculation =>
      'Note: This is an indicative calculation.';

  @override
  String get subscriptionChoosePlan => 'Choose your package';

  @override
  String get subscriptionMonthlyPlan => 'Monthly Plan';

  @override
  String get subscriptionYearlyPlan => 'Yearly Plan';

  @override
  String get subscriptionRecurring => 'Recurring Subscription';

  @override
  String get subscriptionPerMonth => 'Per Month';

  @override
  String get subscriptionPerYear => 'Per Year';

  @override
  String get subscriptionMostPopular => 'Most Popular';

  @override
  String get subscriptionBestValue => 'Best Value';

  @override
  String get subscriptionTwoMonthsFree => '5 months free';

  @override
  String get subscriptionEverythingIncluded => 'Everything Included';

  @override
  String get subscriptionPremiumActivated =>
      'Premium Activated! Thank you for your purchase.';

  @override
  String get subscriptionVerifying => 'Verifying...';

  @override
  String get subscriptionProcessing => 'Processing...';

  @override
  String subscriptionSubscribeWithPrice(String price) {
    return 'Subscribe now — $price';
  }

  @override
  String get subscriptionSubscribe => 'Subscribe now';

  @override
  String get subscriptionRestoring => 'Restoring...';

  @override
  String get subscriptionRestorePurchases => 'Restore Purchases';

  @override
  String get subscriptionManageSubscription => 'Manage Subscription';

  @override
  String get subscriptionPlansNotLoaded =>
      'Subscription plans could not be loaded.';

  @override
  String get subscriptionLoading => 'Loading…';

  @override
  String get subscriptionRetry => 'Retry';

  @override
  String get onboardingClose => 'Close';

  @override
  String get onboardingAveragePrice => 'Average price';

  @override
  String get onboardingPerMonth => '/MONTH';

  @override
  String get onboardingPerYear => '/YEAR';

  @override
  String get onboardingMeasurementTipFloor => 'Floor (l x w)';

  @override
  String get onboardingMeasurementTipFloorDesc =>
      'For a floor, measure the length and width (l x w).';

  @override
  String get onboardingMeasurementTipWall => 'Wall (l x h)';

  @override
  String get onboardingMeasurementTipWallDesc =>
      'For a wall, measure the length and height (l x h).';

  @override
  String get onboardingMeasurementTipCeiling => 'Ceiling (l x w)';

  @override
  String get onboardingMeasurementTipCeilingDesc =>
      'For a ceiling, measure the length and width (l x w).';

  @override
  String get onboardingMeasurementTipNote =>
      'Enter the dimensions in meters and the app automatically calculates the area in m².';

  @override
  String get faqBehangenQ1 => 'How long does wallpapering take on average?';

  @override
  String get faqBehangenA1 =>
      'Wallpapering a room takes on average half to a full day, depending on the size of the room and the number of corners and niches.';

  @override
  String get faqBehangenQ2 => 'How many wallpaper rolls do I need?';

  @override
  String get faqBehangenA2 =>
      'Calculate the room perimeter (in meters) multiplied by the height. A standard roll covers about 5 m². Don\'t forget to order 10% extra for cutting loss.';

  @override
  String get faqBehangenQ3 => 'What tools do I need?';

  @override
  String get faqBehangenA3 =>
      'For wallpapering you need: a wallpaper table, wallpaper brush, paste roller, tape measure, spirit level, pencil, scissors or wallpaper knife, and sponges to wipe away excess paste.';

  @override
  String get faqBehangenQ4 => 'Which wallpaper paste should I use?';

  @override
  String get faqBehangenA4 =>
      'This depends on the type of wallpaper. For non-woven wallpaper, use a special non-woven paste; for regular wallpaper, use a universal paste. Always check the packaging.';

  @override
  String get faqBehangenQ5 => 'How do I prepare the wall?';

  @override
  String get faqBehangenA5 =>
      'Remove old wallpaper thoroughly and clean the wall. Let the wall dry completely. Then apply a coat of wallpaper primer for better adhesion.';

  @override
  String get faqBehangenQ6 => 'How do I start in the room?';

  @override
  String get faqBehangenA6 =>
      'Always start next to a window or door. Draw a vertical line with a spirit level as a starting point to prevent crooked strips.';

  @override
  String get faqBehangenQ7 => 'How do I handle corners correctly?';

  @override
  String get faqBehangenA7 =>
      'For inner corners, let the strip run 1–2 cm around the corner. For outer corners, fold the strip at least 2 cm around the corner.';

  @override
  String get faqBehangenQ8 => 'Can I do this as a beginner?';

  @override
  String get faqBehangenA8 =>
      'Yes, with the right preparation wallpapering is perfectly manageable on your own. Start with a simple plain wallpaper without large patterns.';

  @override
  String get faqBehangenQ9 => 'How do I prevent air bubbles?';

  @override
  String get faqBehangenA9 =>
      'Smooth the wallpaper immediately after applying, from top to bottom, with a wallpaper brush. Work any bubbles toward the edges.';

  @override
  String get faqBehangenQ10 => 'How long to wait before using the room?';

  @override
  String get faqBehangenA10 =>
      'Let the wallpaper dry for at least 24 hours. Ensure adequate ventilation but avoid direct drafts.';

  @override
  String get faqBehangenQ11 => 'What are common wallpapering mistakes?';

  @override
  String get faqBehangenA11 =>
      'The most common mistakes are: not properly preparing the wall, making the wallpaper too wet, and not smoothing out air bubbles.';

  @override
  String get faqBehangenQ12 => 'How much extra wallpaper should I order?';

  @override
  String get faqBehangenA12 =>
      'Always order 10–15% extra. With patterns you need to allow extra for the pattern repeat.';

  @override
  String get faqBehangenQ13 => 'What do I do if the wallpaper comes loose?';

  @override
  String get faqBehangenA13 =>
      'Press the loose edge up, apply fresh paste with a small brush and wipe away excess paste with a damp sponge.';

  @override
  String get faqBehangenQ14 => 'Which DIY store do you recommend?';

  @override
  String get faqBehangenA14 =>
      'For DIY homeowners, we recommend Gamma and Hornbach (or Home Depot and Lowe\'s) for a wide range of wallpaper. For professional contractors, trade suppliers like Bouwmaat and Jongeneel offer commercial-grade materials.';

  @override
  String get faqBehangenQ15 =>
      'Do I need to remove old paint before wallpapering?';

  @override
  String get faqBehangenA15 =>
      'Not always. Make sure the paint layer is firmly attached, clean and grease-free. Loose paint must be removed.';

  @override
  String get faqBehangenQ16 => 'Can I wallpaper over existing wallpaper?';

  @override
  String get faqBehangenA16 =>
      'This is usually not recommended. Remove old wallpaper for the best result and good adhesion of the new wallpaper.';

  @override
  String get faqBehangenQ17 => 'What temperature is ideal for wallpapering?';

  @override
  String get faqBehangenA17 =>
      'The ideal room temperature is between 18°C and 22°C. Avoid extreme cold, heat and drafts during drying.';

  @override
  String get faqBehangenQ18 => 'How do I cut wallpaper neatly?';

  @override
  String get faqBehangenA18 =>
      'Use a sharp wallpaper knife and a ruler or spatula as a guide. Replace the knife regularly for clean cuts.';

  @override
  String get faqBehangenQ19 => 'How do I clean wallpaper?';

  @override
  String get faqBehangenA19 =>
      'Washable wallpaper can be carefully cleaned with a damp cloth. Always check the manufacturer\'s care instructions first.';

  @override
  String get faqBehangenQ20 => 'How long does wallpaper last on average?';

  @override
  String get faqBehangenA20 =>
      'Quality wallpaper can last 10 to 15 years with normal use, depending on the room and maintenance conditions.';

  @override
  String get faqPainterQ1 => 'How long does painting take on average?';

  @override
  String get faqPainterA1 =>
      'Painting an average room (walls + ceiling) takes 4–8 hours including preparation. Accounting for drying time between coats it can take 1–2 days.';

  @override
  String get faqPainterQ2 => 'How much paint do I need?';

  @override
  String get faqPainterA2 =>
      'One litre of paint covers on average 10–12 m² per coat. Measure the surface and allow for 2 coats. Order 10% extra as a reserve.';

  @override
  String get faqPainterQ3 => 'What tools do I need?';

  @override
  String get faqPainterA3 =>
      'You need: paint roller(s), brush(es), paint tray, masking tape, sandpaper, dust sheets and possibly a ladder.';

  @override
  String get faqPainterQ4 => 'How do I prepare the wall?';

  @override
  String get faqPainterA4 =>
      'Fill any cracks and holes, sand rough areas, remove dust and apply a coat of primer on new or very absorbent walls.';

  @override
  String get faqPainterQ5 => 'How long should I wait between coats?';

  @override
  String get faqPainterA5 =>
      'Wait at least 2–4 hours between coats (see drying time on the packaging). Full curing takes 24–48 hours.';

  @override
  String get faqPainterQ6 => 'Can I do this as a beginner?';

  @override
  String get faqPainterA6 =>
      'Yes, painting is perfectly manageable on your own. Take your time with proper preparation and masking and the result will be excellent.';

  @override
  String get faqPainterQ7 => 'Which paint should I choose for interior walls?';

  @override
  String get faqPainterA7 =>
      'Choose water-based wall paint for interior walls. Pay attention to the washability category (1–5 stars). For wet rooms, choose bathroom paint.';

  @override
  String get faqPainterQ8 => 'What are common painting mistakes?';

  @override
  String get faqPainterA8 =>
      'Applying coats that are too thin, insufficient drying between coats, poor masking and not cleaning the surface are the most common mistakes.';

  @override
  String get faqPainterQ9 => 'Do I need to use primer?';

  @override
  String get faqPainterA9 =>
      'Primer improves adhesion and ensures a more even finish, especially on new or repaired surfaces.';

  @override
  String get faqPainterQ10 => 'Can I paint over old paint?';

  @override
  String get faqPainterA10 =>
      'Yes, if the old paint is in good condition. Clean and lightly sand the surface first.';

  @override
  String get faqPainterQ11 => 'What temperature is best for painting?';

  @override
  String get faqPainterA11 => 'Most paints perform best between 10°C and 25°C.';

  @override
  String get faqPainterQ12 => 'How do I avoid roller marks?';

  @override
  String get faqPainterA12 =>
      'Use even pressure and maintain a wet edge while painting.';

  @override
  String get faqPainterQ13 => 'Should I remove furniture?';

  @override
  String get faqPainterA13 =>
      'Move furniture away from walls and cover it with protective sheets.';

  @override
  String get faqPainterQ14 => 'How do I clean paint brushes?';

  @override
  String get faqPainterA14 =>
      'Water-based paint can be cleaned with water. Solvent-based paint requires paint thinner.';

  @override
  String get faqPainterQ15 => 'Can I paint in humid conditions?';

  @override
  String get faqPainterA15 =>
      'High humidity can slow drying and affect the finish. Ventilate the room well.';

  @override
  String get faqPainterQ16 => 'How many coats are recommended?';

  @override
  String get faqPainterA16 =>
      'Two coats provide the best coverage and durability.';

  @override
  String get faqPainterQ17 => 'What finish should I choose?';

  @override
  String get faqPainterA17 =>
      'Matt hides imperfections, satin is durable, and gloss is highly washable.';

  @override
  String get faqPainterQ18 => 'How long does paint last?';

  @override
  String get faqPainterA18 =>
      'Unopened paint can last several years when stored properly.';

  @override
  String get faqPainterQ19 => 'Can I paint ceilings first?';

  @override
  String get faqPainterA19 =>
      'Yes, always paint ceilings before walls to avoid splatters.';

  @override
  String get faqPainterQ20 => 'How do I calculate painting costs?';

  @override
  String get faqPainterA20 =>
      'Multiply wall area by paint coverage and material costs.';

  @override
  String get faqMuurSauzenQ1 =>
      'Which latex should I use in a bathroom or kitchen?';

  @override
  String get faqMuurSauzenA1 =>
      'Use moisture-resistant latex in a bathroom or kitchen. This is more resistant to moisture and mildew. Regular latex can start to peel or develop mildew more quickly in humid spaces.';

  @override
  String get faqMuurSauzenQ2 => 'Should I degrease the wall first?';

  @override
  String get faqMuurSauzenA2 =>
      'Yes, for greasy or dirty spots (e.g. in a kitchen), first clean with an all-purpose cleaner/degreaser — wear gloves — then allow to dry before painting.';

  @override
  String get faqMuurSauzenQ3 => 'When should I use primer?';

  @override
  String get faqMuurSauzenA3 =>
      'Use primer on an absorbent, new or heavily repaired surface, so the paint covers evenly and is less likely to stain.';

  @override
  String get faqMuurSauzenQ4 =>
      'How do I fill holes and cracks before painting?';

  @override
  String get faqMuurSauzenA4 =>
      'Fill holes and cracks with wall filler or plaster, allow to dry, and sand smooth. Seal small gaps with acrylic sealant. This prevents imperfections remaining visible through the paint.';

  @override
  String get faqMuurSauzenQ5 => 'How many coats are needed?';

  @override
  String get faqMuurSauzenA5 =>
      'Allow for at least two coats for an even result; if changing colour (e.g. from dark to light) a third coat may be required.';

  @override
  String get faqMuurSauzenQ6 => 'Should I sand before painting?';

  @override
  String get faqMuurSauzenA6 =>
      'Light sanding is part of preparation, especially on an uneven or glossy surface, so the paint adheres better. Wear a dust mask while doing this. For larger areas, a sanding machine can speed up the work.';

  @override
  String get faqMuurSauzenQ7 =>
      'How do I calculate how many litres of paint I need?';

  @override
  String get faqMuurSauzenA7 =>
      'The app calculates this automatically based on your entered m², the number of coats, and the coverage of the selected product.';

  @override
  String get faqMuurSauzenQ8 => 'Can I use a brush instead of a roller?';

  @override
  String get faqMuurSauzenA8 =>
      'For large surfaces, a roller is faster and more even; use a brush for corners, edges and near the baseboard.';

  @override
  String get faqMuurSauzenQ9 => 'Should I let the paint dry between coats?';

  @override
  String get faqMuurSauzenA9 =>
      'Yes, always follow the drying and recoating time on the paint packaging.';

  @override
  String get faqMuurSauzenQ10 => 'Can I paint a wall without primer?';

  @override
  String get faqMuurSauzenA10 =>
      'On a well-bonding, non-absorbent surface it is sometimes possible, but primer improves adhesion and the result. Follow the product advice.';

  @override
  String get faqPlafondSauzenQ1 =>
      'Which latex should I use in a bathroom or kitchen?';

  @override
  String get faqPlafondSauzenA1 =>
      'Use moisture-resistant latex in a bathroom or kitchen. This is more resistant to moisture and mildew. Regular latex can start to peel or develop mildew more quickly in humid spaces.';

  @override
  String get faqPlafondSauzenQ2 => 'Do I need an extension pole?';

  @override
  String get faqPlafondSauzenA2 =>
      'An extension pole on the roller is recommended so you can reach the ceiling without a ladder or with less ladder work.';

  @override
  String get faqPlafondSauzenQ3 => 'Should I cover furniture and the floor?';

  @override
  String get faqPlafondSauzenA3 =>
      'Yes, cover the floor and furniture with dust sheets; ceiling work splashes more than wall work.';

  @override
  String get faqPlafondSauzenQ4 =>
      'How do I fill holes and cracks before painting?';

  @override
  String get faqPlafondSauzenA4 =>
      'Fill holes and cracks with wall filler or plaster, allow to dry, and sand smooth. This prevents imperfections remaining visible through the paint.';

  @override
  String get faqPlafondSauzenQ5 => 'How many coats are needed?';

  @override
  String get faqPlafondSauzenA5 =>
      'Here too, allow for at least two coats for an even, opaque finish.';

  @override
  String get faqPlafondSauzenQ6 =>
      'Which roller thickness is suitable for a ceiling?';

  @override
  String get faqPlafondSauzenA6 =>
      'A roller with short to medium pile works well on a smooth ceiling; for a rough or textured ceiling, choose a roller with longer pile.';

  @override
  String get faqPlafondSauzenQ7 => 'How do I prevent splashes and drips?';

  @override
  String get faqPlafondSauzenA7 =>
      'Work with a properly rolled-out roller (not too much paint) and roll in calm, overlapping passes.';

  @override
  String get faqPlafondSauzenQ8 => 'Should I prime first?';

  @override
  String get faqPlafondSauzenA8 =>
      'Yes, for a new or absorbent surface; for an already painted ceiling in good condition this is usually not necessary.';

  @override
  String get faqPlafondSauzenQ9 =>
      'What if there are stains, for example from water or nicotine?';

  @override
  String get faqPlafondSauzenA9 =>
      'Treat these first with a suitable stain-blocking primer, otherwise they may show through again after painting.';

  @override
  String get faqPlafondSauzenQ10 => 'Should I always paint a ceiling twice?';

  @override
  String get faqPlafondSauzenA10 =>
      'For an even result, two coats are almost always needed. For a heavily absorbent or dark surface, an extra coat may be required.';

  @override
  String get faqBehangenDoc4Q1 =>
      'Non-woven or paper wallpaper, what is the difference?';

  @override
  String get faqBehangenDoc4A1 =>
      'With non-woven wallpaper the adhesive goes on the wall and you hang the wallpaper dry; with paper wallpaper the adhesive goes on the wallpaper itself, which then needs to soak for a while.';

  @override
  String get faqBehangenDoc4Q2 => 'Should I level the wall first?';

  @override
  String get faqBehangenDoc4A2 =>
      'Yes, the wall must be flat and clean before wallpapering. Repair holes and cracks with wall filler or levelling compound, allow to dry, and sand smooth.';

  @override
  String get faqBehangenDoc4Q3 => 'Do I need a wallpaper table?';

  @override
  String get faqBehangenDoc4A3 =>
      'Only for traditional paper wallpaper, to paste and allow the wallpaper to soak. A wallpaper table is not needed for non-woven wallpaper.';

  @override
  String get faqBehangenDoc4Q4 => 'Which roll width should I choose?';

  @override
  String get faqBehangenDoc4A4 =>
      'Non-woven wallpaper is available in 53 cm and 70 cm widths. Choose based on wall height and pattern. Calculate using the actual roll width.';

  @override
  String get faqBehangenDoc4Q5 => 'What is pattern repeat waste?';

  @override
  String get faqBehangenDoc4A5 =>
      'With patterned wallpaper you must align each strip with the pattern, which means you need to trim pieces. Allow for approximately 10% extra material.';

  @override
  String get faqBehangenDoc4Q6 => 'Which adhesive should I use?';

  @override
  String get faqBehangenDoc4A6 =>
      'It depends on the wallpaper type and weight; follow the adhesive advice on the wallpaper roll or the adhesive packaging. Wear gloves during prolonged contact with adhesive.';

  @override
  String get faqBehangenDoc4Q7 =>
      'How do I deal with corners and electrical outlets?';

  @override
  String get faqBehangenDoc4A7 =>
      'For electrical outlets and switches, always turn off the power first, and work in corners with smaller, overlapping strips for a tight join.';

  @override
  String get faqBehangenDoc4Q8 => 'What should I do about drafts while drying?';

  @override
  String get faqBehangenDoc4A8 =>
      'Avoid strong drafts (open windows/doors) during drying; this can cause seams to lift or come loose.';

  @override
  String get faqBehangenDoc4Q9 => 'Can I simply wallpaper over old wallpaper?';

  @override
  String get faqBehangenDoc4A9 =>
      'This is not recommended; when removing suitable old wallpaper use a wallpaper steamer if applicable, and start with a clean, flat surface.';

  @override
  String get faqBehangenDoc4Q10 =>
      'How do I prevent air bubbles under the wallpaper?';

  @override
  String get faqBehangenDoc4A10 =>
      'Work in small sections, smooth the wallpaper well with a wallpaper brush or seam roller, and ensure the adhesive is applied evenly.';

  @override
  String get faqKozijnSchilderenQ1 => 'Should I degrease first?';

  @override
  String get faqKozijnSchilderenA1 =>
      'Yes, degreasing is the first step, especially for frames and doors that are frequently touched. Wear gloves while doing this.';

  @override
  String get faqKozijnSchilderenQ2 => 'When should I use primer?';

  @override
  String get faqKozijnSchilderenA2 =>
      'Use primer on bare wood, or when going from a dark to a light colour.';

  @override
  String get faqKozijnSchilderenQ3 =>
      'How do I recognize a lead-containing old paint layer?';

  @override
  String get faqKozijnSchilderenA3 =>
      'If uncertain about old woodwork: do not sand with a machine yourself while dry, but have the layer assessed or tested first. When working with old paint layers always wear a dust mask (FFP2/FFP3) and gloves in any case.';

  @override
  String get faqKozijnSchilderenQ4 => 'How many finish coats are needed?';

  @override
  String get faqKozijnSchilderenA4 =>
      'Allow for at least two finish coats after the primer for a durable result.';

  @override
  String get faqKozijnSchilderenQ5 => 'Should I sand between coats?';

  @override
  String get faqKozijnSchilderenA5 =>
      'Light intermediate sanding provides a smoother, more even final coat; follow the product advice. For larger areas, a sanding machine can speed up the work.';

  @override
  String get faqKozijnSchilderenQ6 =>
      'Can I use paint and varnish interchangeably?';

  @override
  String get faqKozijnSchilderenA6 =>
      'No, use one paint system from start to finish; mixing different systems can cause adhesion problems.';

  @override
  String get faqKozijnSchilderenQ7 => 'How do I repair holes with wood filler?';

  @override
  String get faqKozijnSchilderenA7 =>
      'Fill the hole or damage with wood filler, allow to dry according to the product instructions, then sand smooth before priming.';

  @override
  String get faqKozijnSchilderenQ8 =>
      'Must I take the door off its hinges to paint?';

  @override
  String get faqKozijnSchilderenA8 =>
      'It is not always necessary, but it can make the work easier. In any case, ensure a stable surface and sufficient space.';

  @override
  String get faqKozijnSchilderenQ9 => 'Can I paint outside in rain or cold?';

  @override
  String get faqKozijnSchilderenA9 =>
      'No, paint outside in dry weather and a temperature suitable for the paint system; moisture and cold affect drying and adhesion.';

  @override
  String get faqKozijnSchilderenQ10 =>
      'How long should I wait before using the door again?';

  @override
  String get faqKozijnSchilderenA10 =>
      'Follow the drying time of the final finish coat on the packaging before using the door intensively again.';

  @override
  String get faqRadiatorSchilderenQ1 => 'Must the radiator be cold?';

  @override
  String get faqRadiatorSchilderenA1 =>
      'Yes, allow the radiator to cool down completely and turn off the heating before starting.';

  @override
  String get faqRadiatorSchilderenQ2 => 'Should I degrease before painting?';

  @override
  String get faqRadiatorSchilderenA2 =>
      'Yes, degrease the radiator first, especially a surface that is often warm — grease and dust stick there more quickly. Wear gloves while doing this.';

  @override
  String get faqRadiatorSchilderenQ3 => 'What should I do about rust?';

  @override
  String get faqRadiatorSchilderenA3 =>
      'Treat rust spots before painting, for example with a suitable rust converter or rust inhibitor. Wear gloves while doing this and, when sanding rust, a dust mask.';

  @override
  String get faqRadiatorSchilderenQ4 => 'Which primer should I use?';

  @override
  String get faqRadiatorSchilderenA4 =>
      'Use a metal primer that matches the chosen paint system, especially on bare or rusted areas.';

  @override
  String get faqRadiatorSchilderenQ5 =>
      'Which paint is suitable for a radiator?';

  @override
  String get faqRadiatorSchilderenA5 =>
      'Use radiator paint; it is heat-resistant and yellows less quickly than ordinary wall paint or wood varnish.';

  @override
  String get faqRadiatorSchilderenQ6 => 'How many coats are needed?';

  @override
  String get faqRadiatorSchilderenA6 =>
      'Usually one coat of primer (where needed) and one to two coats of radiator paint are sufficient; follow the product advice.';

  @override
  String get faqRadiatorSchilderenQ7 =>
      'How long must the paint dry before I turn the heating back on?';

  @override
  String get faqRadiatorSchilderenA7 =>
      'Follow the drying time of the radiator paint as stated on the packaging before using the heating again.';

  @override
  String get faqRadiatorSchilderenQ8 =>
      'Can I paint the radiator without dismantling it?';

  @override
  String get faqRadiatorSchilderenA8 =>
      'Yes, that is possible with a radiator roller and brush behind the pipes; dismantling is usually not necessary.';

  @override
  String get faqRadiatorSchilderenQ9 => 'Should I cover the wall behind it?';

  @override
  String get faqRadiatorSchilderenA9 =>
      'Yes, cover the wall and floor behind and beneath the radiator with dust sheets and masking tape.';

  @override
  String get faqRadiatorSchilderenQ10 =>
      'Which brush should I use for the radiator?';

  @override
  String get faqRadiatorSchilderenA10 =>
      'A radiator roller for the large surfaces and a narrow brush for the hard-to-reach areas behind the pipes.';

  @override
  String get faqStopcontactQ1 =>
      'Do I need to turn off the power before I start?';

  @override
  String get faqStopcontactA1 =>
      'Yes, always switch off the relevant circuit at the fuse box and check with a voltage tester that the circuit is truly de-energized before you begin.';

  @override
  String get faqStopcontactQ2 =>
      'Which tools do I need for installing a power outlet?';

  @override
  String get faqStopcontactA2 =>
      'You need a screwdriver set, wire strippers, side cutters, voltage tester, spirit level, pencil and possibly a hammer drill (for fixing holes).';

  @override
  String get faqStopcontactQ3 => 'How do I connect the wires correctly?';

  @override
  String get faqStopcontactA3 =>
      'Follow the color coding: brown (live), blue (neutral) and yellow-green (earth). Check your local regulations (e.g. NEN 1010) and the outlet instructions.';

  @override
  String get faqStopcontactQ4 => 'Can I replace an outlet myself?';

  @override
  String get faqStopcontactA4 =>
      'Replacing an existing outlet is relatively simple if you have basic electrical knowledge and follow safety rules. For new installations, always work to the NEN 1010 standard.';

  @override
  String get faqStopcontactQ5 => 'How deep should the flush-mounting box be?';

  @override
  String get faqStopcontactA5 =>
      'A standard flush-mounting box for an outlet is about 40–50 mm deep. Use a dry-wall saw or masonry bit to cut the recess.';

  @override
  String get faqStopcontactQ6 => 'What should I do if there is no earth wire?';

  @override
  String get faqStopcontactA6 =>
      'In older installations there may be no earth wire. For safety, always have earthing added. Contact a certified electrician if necessary.';

  @override
  String get faqStopcontactQ7 => 'Can I install an outlet in the bathroom?';

  @override
  String get faqStopcontactA7 =>
      'Yes, but only outside the splash zones and with GFCI/RCD protection. Check your local wet-room regulations.';

  @override
  String get faqStopcontactQ8 => 'How do I test if the outlet works properly?';

  @override
  String get faqStopcontactA8 =>
      'After installation, switch the power back on and test the outlet with a socket tester or multimeter to check correct voltage and earthing.';

  @override
  String get faqStopcontactQ9 => 'What is the maximum load per circuit?';

  @override
  String get faqStopcontactA9 =>
      'A standard 16A circuit can handle approximately 3680W. Do not exceed the circuit capacity and spread heavy appliances across multiple circuits.';

  @override
  String get faqStopcontactQ10 => 'Can I do this as a beginner?';

  @override
  String get faqStopcontactA10 =>
      'Replacing an existing outlet is doable with good preparation. For new installations or complex wiring, consult a certified electrician.';

  @override
  String get faqVerlichtingQ1 => 'Should I turn off the power first?';

  @override
  String get faqVerlichtingA1 =>
      'Yes, always switch off the relevant circuit at the fuse box and check with a voltage tester that there is no voltage before you begin.';

  @override
  String get faqVerlichtingQ2 =>
      'What is the difference between a ceiling rose and a junction box?';

  @override
  String get faqVerlichtingA2 =>
      'A ceiling rose is visible and decorative; a junction box is concealed in the ceiling for the electrical connections.';

  @override
  String get faqVerlichtingQ3 => 'How do I connect a ceiling light?';

  @override
  String get faqVerlichtingA3 =>
      'Connect brown (live) to brown, blue (neutral) to blue and yellow-green (earth) to the earth terminal. Follow the light fitting instructions and local regulations.';

  @override
  String get faqVerlichtingQ4 => 'Can I install LED spotlights myself?';

  @override
  String get faqVerlichtingA4 =>
      'Yes, if you have basic electrical knowledge and follow the installation instructions. Ensure the transformer (if needed) matches the LED power rating.';

  @override
  String get faqVerlichtingQ5 =>
      'What should I do if the fixture is too heavy?';

  @override
  String get faqVerlichtingA5 =>
      'Use appropriate fixings (e.g. ceiling anchors or toggle bolts) or attach the light to a ceiling joist for safe installation.';

  @override
  String get faqVerlichtingQ6 => 'Do I need a dimmer switch for LED lights?';

  @override
  String get faqVerlichtingA6 =>
      'Only if the LEDs are dimmable. Use a compatible LED dimmer; standard dimmers may cause flickering.';

  @override
  String get faqVerlichtingQ7 => 'How do I connect multiple spots in series?';

  @override
  String get faqVerlichtingA7 =>
      'Connect the spots in parallel using a junction box, so each spot receives the full voltage. Do not daisy-chain in series.';

  @override
  String get faqVerlichtingQ8 => 'What cable thickness should I use?';

  @override
  String get faqVerlichtingA8 =>
      'For lighting circuits, 1.5 mm² cable is usually sufficient. For high-wattage or long runs, use 2.5 mm² as per NEN 1010.';

  @override
  String get faqVerlichtingQ9 => 'Can I install outdoor lighting myself?';

  @override
  String get faqVerlichtingA9 =>
      'Yes, provided you use weatherproof (IP-rated) fixtures and cables, and ensure GFCI/RCD protection on the circuit.';

  @override
  String get faqVerlichtingQ10 => 'How do I test if the light works correctly?';

  @override
  String get faqVerlichtingA10 =>
      'Switch the power back on, test the light switch, and check for proper operation and no flickering.';

  @override
  String get faqStroomleidingQ1 =>
      'Which cable should I use for power outlets?';

  @override
  String get faqStroomleidingA1 =>
      'For standard 16A power circuits use 2.5 mm² cable (3-core: live, neutral, earth). For heavier loads (cooker, etc.) use 4–6 mm².';

  @override
  String get faqStroomleidingQ2 => 'Should I lay cables in conduit?';

  @override
  String get faqStroomleidingA2 =>
      'Cables buried in walls or floors should be protected by conduit or trunking. Surface-mounted cables must also be protected.';

  @override
  String get faqStroomleidingQ3 => 'How deep should I bury cables in the wall?';

  @override
  String get faqStroomleidingA3 =>
      'Cables should be routed vertically or horizontally from outlets/switches and buried at least 50 mm deep to avoid accidental drilling.';

  @override
  String get faqStroomleidingQ4 => 'Can I extend an existing circuit?';

  @override
  String get faqStroomleidingA4 =>
      'Yes, provided the circuit is not overloaded and you follow the NEN 1010 standard. Use junction boxes for connections.';

  @override
  String get faqStroomleidingQ5 =>
      'What is the difference between single-core and multi-core cable?';

  @override
  String get faqStroomleidingA5 =>
      'Single-core cables are separate conductors (used in conduit); multi-core cables (e.g. 3-core) have all conductors in one sheath.';

  @override
  String get faqStroomleidingQ6 => 'How do I connect cables in a junction box?';

  @override
  String get faqStroomleidingA6 =>
      'Use connector blocks or WAGO connectors to join like colors: brown to brown, blue to blue, yellow-green to yellow-green.';

  @override
  String get faqStroomleidingQ7 =>
      'Should I test the circuit after installation?';

  @override
  String get faqStroomleidingA7 =>
      'Yes, always test for continuity, insulation resistance and correct earthing before energizing the circuit.';

  @override
  String get faqStroomleidingQ8 => 'Can I run cables through the attic?';

  @override
  String get faqStroomleidingA8 =>
      'Yes, but ensure cables are secured and protected from mechanical damage. Use conduit or trunking where required.';

  @override
  String get faqStroomleidingQ9 =>
      'What should I do if I hit an existing cable?';

  @override
  String get faqStroomleidingA9 =>
      'Switch off power immediately. Assess the damage. If the cable is nicked or cut, repair or replace the section. Never leave damaged cables live.';

  @override
  String get faqStroomleidingQ10 => 'Can I do this as a beginner?';

  @override
  String get faqStroomleidingA10 =>
      'Basic cable runs are manageable with proper planning and safety precautions. For complex installations or fuse box work, consult a certified electrician.';

  @override
  String get faqKabelgootQ1 => 'What is cable trunking used for?';

  @override
  String get faqKabelgootA1 =>
      'Cable trunking protects and conceals surface-mounted cables, keeping installations neat and safe from mechanical damage.';

  @override
  String get faqKabelgootQ2 => 'Which size trunking do I need?';

  @override
  String get faqKabelgootA2 =>
      'Choose a size that allows cables to fill no more than 60% of the trunking cross-section for heat dissipation and easy pulling.';

  @override
  String get faqKabelgootQ3 => 'Can I install trunking on any surface?';

  @override
  String get faqKabelgootA3 =>
      'Yes, trunking can be mounted on walls, skirting boards or ceilings using screws or adhesive, depending on the surface and trunking type.';

  @override
  String get faqKabelgootQ4 => 'How do I cut trunking to size?';

  @override
  String get faqKabelgootA4 =>
      'Use a fine-toothed saw or a sharp knife. Measure carefully, mark the cut line, and cut squarely for neat joints.';

  @override
  String get faqKabelgootQ5 => 'Should I use trunking for outdoor cables?';

  @override
  String get faqKabelgootA5 =>
      'Use weatherproof trunking (IP-rated) for outdoor installations to protect cables from moisture and UV damage.';

  @override
  String get faqKabelgootQ6 => 'How do I join trunking sections?';

  @override
  String get faqKabelgootA6 =>
      'Use coupling pieces or connectors supplied by the manufacturer for a secure, neat join between sections.';

  @override
  String get faqKabelgootQ7 => 'Can I paint cable trunking?';

  @override
  String get faqKabelgootA7 =>
      'Yes, most PVC trunking can be painted with suitable primer and paint to match your décor.';

  @override
  String get faqKabelgootQ8 => 'How do I route trunking around corners?';

  @override
  String get faqKabelgootA8 =>
      'Use corner pieces, bends or cut and miter the trunking at 45° for internal/external corners.';

  @override
  String get faqKabelgootQ9 =>
      'Should trunking be fixed horizontally or vertically?';

  @override
  String get faqKabelgootA9 =>
      'Follow the same rules as buried cables: run vertically or horizontally from outlets and switches for safety and ease of future work.';

  @override
  String get faqKabelgootQ10 => 'Can I do this as a beginner?';

  @override
  String get faqKabelgootA10 =>
      'Yes, installing trunking is straightforward with basic DIY skills. Measure carefully, cut neatly, and secure firmly.';

  @override
  String get faqRookmelderQ1 => 'Where should I install a smoke detector?';

  @override
  String get faqRookmelderA1 =>
      'Install smoke detectors on the ceiling or high on the wall (within 30 cm of the ceiling) in hallways, landings and bedrooms. Avoid kitchens and bathrooms.';

  @override
  String get faqRookmelderQ2 => 'How many smoke detectors do I need?';

  @override
  String get faqRookmelderA2 =>
      'At least one per floor and one in each bedroom. For larger homes, add more for complete coverage.';

  @override
  String get faqRookmelderQ3 =>
      'Should I use battery or mains-powered detectors?';

  @override
  String get faqRookmelderA3 =>
      'Mains-powered (230V) detectors with battery backup are most reliable. Battery-only detectors are easier to install but require regular battery changes.';

  @override
  String get faqRookmelderQ4 =>
      'How do I install a mains-powered smoke detector?';

  @override
  String get faqRookmelderA4 =>
      'Switch off the circuit, connect the detector to the lighting circuit (live, neutral, earth), secure the base to the ceiling and attach the detector head.';

  @override
  String get faqRookmelderQ5 => 'Can I interlink multiple smoke detectors?';

  @override
  String get faqRookmelderA5 =>
      'Yes, interlinked detectors (wired or wireless) sound all alarms when one detects smoke, providing better warning throughout the home.';

  @override
  String get faqRookmelderQ6 => 'How often should I test the smoke detector?';

  @override
  String get faqRookmelderA6 =>
      'Test monthly by pressing the test button. Replace batteries yearly (or when the low-battery warning sounds).';

  @override
  String get faqRookmelderQ7 =>
      'What is the difference between smoke and heat detectors?';

  @override
  String get faqRookmelderA7 =>
      'Smoke detectors sense smoke particles; heat detectors sense temperature rise. Use heat detectors in kitchens/garages where smoke detectors may false alarm.';

  @override
  String get faqRookmelderQ8 => 'How long do smoke detectors last?';

  @override
  String get faqRookmelderA8 =>
      'Most smoke detectors last 10 years. Check the manufacture date and replace expired units.';

  @override
  String get faqRookmelderQ9 => 'Can I paint or decorate a smoke detector?';

  @override
  String get faqRookmelderA9 =>
      'No, never paint or cover a smoke detector. This blocks the sensor and prevents it working correctly.';

  @override
  String get faqRookmelderQ10 => 'Can I do this as a beginner?';

  @override
  String get faqRookmelderA10 =>
      'Battery-powered detectors are easy to install. Mains-powered detectors require electrical knowledge; if unsure, consult a certified electrician.';

  @override
  String get faqVloertegelQ1 => 'Do I need to level, prime and degrease?';

  @override
  String get faqVloertegelA1 =>
      'Yes, check the flatness and load-bearing capacity of the substrate and level where needed. Use primer if the adhesive system or substrate requires it. Degrease greasy or contaminated substrates (e.g. kitchen floor) with a suitable degreaser/cleaner.';

  @override
  String get faqVloertegelQ2 =>
      'How do I calculate cutting loss and number of tiles?';

  @override
  String get faqVloertegelA2 =>
      'Calculate the surface area and divide by the area of one tile. As a guideline, allow approximately 10% cutting loss; for patterned or diagonal laying approximately 15% or more.';

  @override
  String get faqVloertegelQ3 => 'How do I get good adhesion with adhesive?';

  @override
  String get faqVloertegelA3 =>
      'Use the correct notched trowel and adhesive for the tile and substrate. Apply adhesive to a clean, dust-free substrate. For large tiles, apply back-buttering as per adhesive guidelines.';

  @override
  String get faqVloertegelQ4 => 'How long to let dry before grouting?';

  @override
  String get faqVloertegelA4 =>
      'Often a minimum of 24 hours; with large tiles, low temperatures or less absorbent substrates this can be longer. Always follow the product data sheet.';

  @override
  String get faqVloertegelQ5 => 'How do I prevent height differences?';

  @override
  String get faqVloertegelA5 =>
      'Use tile wedges or a levelling system and check regularly with a spirit level and straightedge.';

  @override
  String get faqVloertegelQ6 => 'What to do with a loose or broken tile?';

  @override
  String get faqVloertegelA6 =>
      'Carefully remove the tile, clear the substrate of loose adhesive and dust, and place a suitable new tile with appropriate adhesive.';

  @override
  String get faqVloertegelQ7 => 'How to clean after grouting?';

  @override
  String get faqVloertegelA7 =>
      'Remove grout residue at the right time with a suitable sponge and clean water, before the grout fully hardens.';

  @override
  String get faqVloertegelQ8 => 'How do I maintain a tile floor?';

  @override
  String get faqVloertegelA8 =>
      'Daily: pH-neutral tile cleaner or all-purpose cleaner. Periodically: lime/cement cleaner for stubborn deposits, but only if the tile type tolerates it. Avoid vinegar and acidic agents on natural stone, and abrasives on all tiles. Optional: impregnator on cement-based grout.';

  @override
  String get faqVloertegelQ9 => 'What safety measures when sawing?';

  @override
  String get faqVloertegelA9 =>
      'Where possible use a wet tile saw or source extraction (construction vacuum) to limit silica dust. Wear appropriate eye, ear and respiratory protection.';

  @override
  String get faqVloertegelQ10 =>
      'Do I need an expansion joint for large areas?';

  @override
  String get faqVloertegelA10 =>
      'For large areas or with underfloor heating, an expansion joint may be needed to accommodate movement. Follow the manufacturer\'s recommendations and applicable standards for maximum area without expansion.';

  @override
  String get faqWandtegelQ1 => 'Do I need to level, prime and degrease?';

  @override
  String get faqWandtegelA1 =>
      'Check that the wall is flat, clean, dry, load-bearing and grease-free. Level where needed and use primer if the substrate or adhesive system requires it. Degrease greasy or contaminated substrates (e.g. kitchen wall) with a suitable degreaser/cleaner.';

  @override
  String get faqWandtegelQ2 =>
      'How do I calculate the number of tiles and cutting loss?';

  @override
  String get faqWandtegelA2 =>
      'Calculate the wall surface area and divide by the area of one tile. As a guideline, allow approximately 10% extra; for patterned or diagonal laying approximately 15% or more.';

  @override
  String get faqWandtegelQ3 => 'How do I prevent loosening?';

  @override
  String get faqWandtegelA3 =>
      'Use the correct notched trowel and adhesive for the tile and substrate, don\'t work too much adhesive at once, and press the tiles firmly. For large tiles, back-buttering may be necessary.';

  @override
  String get faqWandtegelQ4 => 'How long to let dry before grouting?';

  @override
  String get faqWandtegelA4 =>
      'Often a minimum of 24 hours; with large tiles or unfavourable conditions this can be longer. Follow the product data sheet.';

  @override
  String get faqWandtegelQ5 => 'How do I saw tiles without breaking?';

  @override
  String get faqWandtegelA5 =>
      'Use a tile cutter for straight cuts and an angle grinder with diamond blade for cutouts. Work calmly and support the tile well.';

  @override
  String get faqWandtegelQ6 => 'What if the wall is not level?';

  @override
  String get faqWandtegelA6 =>
      'Repair or level the substrate where needed before tiling. Do not correct indefinitely with extra adhesive.';

  @override
  String get faqWandtegelQ7 => 'How do I deal with sloped walls?';

  @override
  String get faqWandtegelA7 =>
      'Measure the angle with a bevel square and cut tiles to size. Work from a square starting line and check regularly with a spirit level.';

  @override
  String get faqWandtegelQ8 => 'How to clean after grouting?';

  @override
  String get faqWandtegelA8 =>
      'Use a soft sponge and clean water at the right time before full hardening. Refresh the water regularly.';

  @override
  String get faqWandtegelQ9 => 'How do I maintain wall tiles?';

  @override
  String get faqWandtegelA9 =>
      'Daily: pH-neutral tile cleaner or mild all-purpose cleaner. For limescale: lime remover, only if the tile type tolerates it. Avoid abrasives and aggressive acids on vulnerable tiles or grout.';

  @override
  String get faqWandtegelQ10 => 'How do I work around outlets and switches?';

  @override
  String get faqWandtegelA10 =>
      'First switch off the power. Remove the cover frame, tile around the flush box to size and place the tile with a suitable cutout. Then remount the cover frame.';

  @override
  String get faqTegelReparerenQ1 =>
      'How do I remove an old tile without damaging the surrounding tiles?';

  @override
  String get faqTegelReparerenA1 =>
      'If necessary, first cut through the grout around the tile. Carefully drill several holes in the centre of the tile and break it out piece by piece using a chisel.';

  @override
  String get faqTegelReparerenQ2 => 'Which adhesive should I use for one tile?';

  @override
  String get faqTegelReparerenA2 =>
      'Use a tile adhesive or repair mortar suitable for the tile, substrate, and application. Only use fast-drying products according to the product data sheet.';

  @override
  String get faqTegelReparerenQ3 =>
      'How do I make sure the new tile sits level?';

  @override
  String get faqTegelReparerenA3 =>
      'Remove old adhesive without damaging the substrate. Check the flatness and use the correct notched trowel and amount of adhesive. Check with a straightedge and spirit level.';

  @override
  String get faqTegelReparerenQ4 => 'How long should I wait before grouting?';

  @override
  String get faqTegelReparerenA4 =>
      'This depends on the adhesive. Only grout after the drying and curing time specified on the product data sheet. For fast-drying adhesive, follow the explicit product instructions.';

  @override
  String get faqTegelReparerenQ5 =>
      'How do I make the repaired grout joint blend in?';

  @override
  String get faqTegelReparerenA5 =>
      'Use the same grout or demonstrably compatible grout in the same colour. Fill the joint completely and finish it according to the manufacturer\'s instructions.';

  @override
  String get faqTegelReparerenQ6 => 'What if the substrate is damaged?';

  @override
  String get faqTegelReparerenA6 =>
      'Repair the substrate first with a suitable repair or levelling compound. Allow it to cure sufficiently.';

  @override
  String get faqTegelReparerenQ7 => 'How do I prevent adhesive residue?';

  @override
  String get faqTegelReparerenA7 =>
      'Remove excess adhesive immediately using the method specified by the manufacturer, without damaging the tile or grout.';

  @override
  String get faqTegelReparerenQ8 => 'How do I maintain the repaired tile?';

  @override
  String get faqTegelReparerenA8 =>
      'Maintain it in the same way as the rest of the floor or wall, using a suitable cleaning product.';

  @override
  String get faqTegelReparerenQ9 => 'What safety measures are required?';

  @override
  String get faqTegelReparerenA9 =>
      'Control dust during drilling and grinding using source extraction with a construction vacuum cleaner or wet processing. Wear appropriate eye and respiratory protection.\n\n⚠️ If in doubt, consult a professional. Always check the instructions for the material being used and the current Dutch regulations.';

  @override
  String get faqTegelReparerenQ10 => 'How long does it take?';

  @override
  String get faqTegelReparerenA10 =>
      'Professional: 0.50 hours per tile. DIY: 1.25 hours per tile.';

  @override
  String get faqVoegenQ1 => 'Do the joints need to be clean and dry?';

  @override
  String get faqVoegenA1 =>
      'Yes. Remove adhesive residue and dirt from the joints. The joints must meet the drying and processing requirements of the selected grout.';

  @override
  String get faqVoegenQ2 => 'Which grout should I use indoors?';

  @override
  String get faqVoegenA2 =>
      'Choose based on the tile type, joint width, and application. Cement-based or epoxy grout may be suitable indoors. Follow the product data sheet.';

  @override
  String get faqVoegenQ3 => 'How do I mix grout?';

  @override
  String get faqVoegenA3 =>
      'Follow the exact mixing ratio and processing time stated on the packaging. Use clean water and a suitable mixer.';

  @override
  String get faqVoegenQ4 =>
      'How long should grout cure before the surface can be used?';

  @override
  String get faqVoegenA4 =>
      'This varies depending on the product, temperature, and application. Follow the waiting time for use and complete curing stated on the product data sheet.';

  @override
  String get faqVoegenQ5 =>
      'How do I prevent grout from drying out or cracking?';

  @override
  String get faqVoegenA5 =>
      'Work in small sections. Avoid drafts, direct sunlight, and excessively rapid drying. Only moisten the grout if the manufacturer specifically instructs you to do so.';

  @override
  String get faqVoegenQ6 => 'What should I do about uneven grout joints?';

  @override
  String get faqVoegenA6 =>
      'Finish the grout within the permitted processing time using the correct tools. After curing, repairs may remain visible. Follow the product instructions for repair.';

  @override
  String get faqVoegenQ7 => 'How do I clean tiles without damaging the grout?';

  @override
  String get faqVoegenA7 =>
      'Clean at the correct time with a suitable sponge and a limited amount of clean water. Do not wait until a hard cement haze has formed.';

  @override
  String get faqVoegenQ8 => 'How do I maintain grout?';

  @override
  String get faqVoegenA8 =>
      'Clean regularly with a product suitable for the type of grout. Impregnation may be appropriate for some cement-based grouts.';

  @override
  String get faqVoegenQ9 => 'What safety measures are required?';

  @override
  String get faqVoegenA9 =>
      'Wear suitable gloves and eye protection. Control dust when mixing powdered products and ensure adequate ventilation.\n\n⚠️ If in doubt, consult a professional. Always check the instructions for the material being used and the current Dutch regulations.';

  @override
  String get faqVoegenQ10 => 'How long does it take?';

  @override
  String get faqVoegenA10 =>
      'Professional: 0.10 hours per m². DIY: 0.25 hours per m².';

  @override
  String get faqKitAanbrengenQ1 => 'Do I need to degrease and dry the surface?';

  @override
  String get faqKitAanbrengenA1 =>
      'Yes. Clean the substrate and make sure it is free from grease and dust. Allow it to dry unless the product specifically states otherwise.';

  @override
  String get faqKitAanbrengenQ2 => 'Which sealant should I use?';

  @override
  String get faqKitAanbrengenA2 =>
      'Silicone sealant is suitable for many sanitary and wet-area joints. Acrylic sealant is often used for paintable joints indoors.';

  @override
  String get faqKitAanbrengenQ3 => 'How do I remove old sealant?';

  @override
  String get faqKitAanbrengenA3 =>
      'Carefully cut or scrape away the old sealant using a sealant scraper. If necessary, use a suitable sealant remover. Then clean the surface according to the instructions for the new sealant product.';

  @override
  String get faqKitAanbrengenQ4 => 'How do I apply sealant evenly?';

  @override
  String get faqKitAanbrengenA4 =>
      'Cut the nozzle diagonally to the desired joint width. Apply the sealant evenly. Smooth it with a rubber sealant finishing tool or suitable sealant spatula. Use a spray bottle with a finishing agent approved by the manufacturer.';

  @override
  String get faqKitAanbrengenQ5 =>
      'How long should I wait before the sealant can be exposed to load?';

  @override
  String get faqKitAanbrengenA5 =>
      'This depends on the sealant type, joint dimensions, and environmental conditions. Follow the skin-formation, curing, and load-bearing times stated on the packaging.';

  @override
  String get faqKitAanbrengenQ6 => 'How do I smooth sealant?';

  @override
  String get faqKitAanbrengenA6 =>
      'Use a rubber sealant finishing tool or suitable sealant spatula together with a finishing agent approved by the manufacturer. Do not automatically use dishwashing liquid.';

  @override
  String get faqKitAanbrengenQ7 => 'What if the sealant does not adhere?';

  @override
  String get faqKitAanbrengenA7 =>
      'Remove the sealant. Check whether the substrate is suitable. Clean and dry the surface again. If necessary, use the primer specified by the manufacturer.';

  @override
  String get faqKitAanbrengenQ8 => 'How do I maintain sealant joints?';

  @override
  String get faqKitAanbrengenA8 =>
      'Regularly check for detachment, cracks, mould, and discolouration. Repair or replace the sealant joint when the seal is no longer effective.';

  @override
  String get faqKitAanbrengenQ9 => 'What safety measures are required?';

  @override
  String get faqKitAanbrengenA9 =>
      'Ensure sufficient ventilation. Wear suitable gloves. Avoid contact with skin and eyes.\n\n⚠️ If in doubt, consult a professional. Always check the instructions for the material being used and the current Dutch regulations.';

  @override
  String get faqKitAanbrengenQ10 => 'How long does it take?';

  @override
  String get faqKitAanbrengenA10 =>
      'Professional: 0.05 hours per metre. DIY: 0.125 hours per metre.';

  @override
  String get faqPlumberQ1 => 'How do I fix a dripping faucet?';

  @override
  String get faqPlumberA1 =>
      'Usually by replacing the washer or cartridge inside the faucet.';

  @override
  String get faqPlumberQ2 => 'How do I unblock a drain?';

  @override
  String get faqPlumberA2 =>
      'Use a plunger, drain snake or suitable drain cleaner.';

  @override
  String get faqPlumberQ3 => 'What is PEX piping?';

  @override
  String get faqPlumberA3 =>
      'PEX is flexible plastic piping commonly used for water supply lines.';

  @override
  String get faqPlumberQ4 => 'How do I detect leaks?';

  @override
  String get faqPlumberA4 =>
      'Look for water stains, damp spots or unexpected increases in water bills.';

  @override
  String get faqPlumberQ5 => 'Should I use Teflon tape?';

  @override
  String get faqPlumberA5 => 'Yes, on threaded connections to improve sealing.';

  @override
  String get faqPlumberQ6 => 'Can I replace a toilet myself?';

  @override
  String get faqPlumberA6 =>
      'Yes, many homeowners can replace a toilet with basic tools.';

  @override
  String get faqPlumberQ7 => 'How much water pressure is normal?';

  @override
  String get faqPlumberA7 => 'Most homes operate between 2 and 5 bar.';

  @override
  String get faqPlumberQ8 => 'How do I prevent frozen pipes?';

  @override
  String get faqPlumberA8 =>
      'Insulate exposed pipes and maintain indoor temperatures.';

  @override
  String get faqPlumberQ9 => 'What are common plumbing mistakes?';

  @override
  String get faqPlumberA9 =>
      'Overtightening fittings and forgetting to check for leaks.';

  @override
  String get faqPlumberQ10 => 'How often should pipes be inspected?';

  @override
  String get faqPlumberA10 => 'A yearly inspection helps detect issues early.';

  @override
  String get faqPlumberQ11 => 'What tools are essential for beginners?';

  @override
  String get faqPlumberA11 =>
      'Adjustable wrench, pliers, pipe cutter and Teflon tape.';

  @override
  String get faqPlumberQ12 => 'Can I install a new sink myself?';

  @override
  String get faqPlumberA12 =>
      'Yes, if plumbing connections are straightforward.';

  @override
  String get faqPlumberQ13 => 'How do I reduce water consumption?';

  @override
  String get faqPlumberA13 =>
      'Install water-saving fixtures and repair leaks promptly.';

  @override
  String get faqPlumberQ14 => 'How long do plumbing repairs last?';

  @override
  String get faqPlumberA14 =>
      'Quality repairs can last many years when done correctly.';

  @override
  String get faqPlumberQ15 => 'When should I call a professional?';

  @override
  String get faqPlumberA15 =>
      'For gas lines, major leaks or extensive pipe replacements.';

  @override
  String get faqPlumberQ16 => 'How long does this job take?';

  @override
  String get faqPlumberA16 =>
      'Depending on the complexity, a plumbing job takes 1–8 hours. Replacing a simple faucet takes about 30 minutes; laying a pipe can take a day or more.';

  @override
  String get faqPlumberQ17 => 'What tools do I need?';

  @override
  String get faqPlumberA17 =>
      'Basic tools: water pump pliers, wrenches, pipe cutter, Teflon tape, soldering torch (for copper work) and a bucket.';

  @override
  String get faqPlumberQ18 => 'Do I need to shut off the water supply?';

  @override
  String get faqPlumberA18 =>
      'Yes, always shut off the water supply before starting. Use the main valve or a local shut-off valve and then open a tap to release the pressure.';

  @override
  String get faqPlumberQ19 => 'What type of pipe material should I choose?';

  @override
  String get faqPlumberA19 =>
      'Copper is durable but more expensive. PEX is flexible and easy to work with. PVC is widely used for drain pipes. Choose based on the application.';

  @override
  String get faqPlumberQ20 => 'Can I do this as a beginner?';

  @override
  String get faqPlumberA20 =>
      'Simple jobs like replacing a faucet or repairing a toilet are perfectly doable on your own. More complex work (gas, new pipework) is better left to a certified plumber.';

  @override
  String get faqElectricianQ1 => 'What is a circuit breaker?';

  @override
  String get faqElectricianA1 =>
      'A safety device that cuts power when overloads occur.';

  @override
  String get faqElectricianQ2 => 'How do I test a power outlet?';

  @override
  String get faqElectricianA2 => 'Use a socket tester or multimeter.';

  @override
  String get faqElectricianQ3 => 'Can I replace a light fixture myself?';

  @override
  String get faqElectricianA3 =>
      'Yes, after switching off power and following safety procedures.';

  @override
  String get faqElectricianQ4 => 'Why does a breaker trip?';

  @override
  String get faqElectricianA4 =>
      'Usually because of overloads, short circuits or faulty appliances.';

  @override
  String get faqElectricianQ5 => 'What is grounding?';

  @override
  String get faqElectricianA5 =>
      'Grounding provides a safe path for electrical faults.';

  @override
  String get faqElectricianQ6 => 'How do I identify wires?';

  @override
  String get faqElectricianA6 =>
      'Use local wiring color codes and verify with a tester.';

  @override
  String get faqElectricianQ7 => 'Can I add extra outlets?';

  @override
  String get faqElectricianA7 =>
      'Yes, provided the circuit can handle the load.';

  @override
  String get faqElectricianQ8 => 'What PPE should I wear?';

  @override
  String get faqElectricianA8 =>
      'Insulated gloves and safety glasses are recommended.';

  @override
  String get faqElectricianQ9 => 'How do I avoid electric shock?';

  @override
  String get faqElectricianA9 => 'Always isolate power before starting work.';

  @override
  String get faqElectricianQ10 => 'How long do electrical installations last?';

  @override
  String get faqElectricianA10 =>
      'Many installations last 20–40 years with proper maintenance.';

  @override
  String get faqElectricianQ11 => 'What is a GFCI/RCD?';

  @override
  String get faqElectricianA11 =>
      'A device that protects against electric shock.';

  @override
  String get faqElectricianQ12 => 'Can I install outdoor lighting?';

  @override
  String get faqElectricianA12 =>
      'Yes, using weatherproof fixtures and cables.';

  @override
  String get faqElectricianQ13 => 'What are common electrical mistakes?';

  @override
  String get faqElectricianA13 =>
      'Working live and using incorrect wire sizes.';

  @override
  String get faqElectricianQ14 => 'How do I calculate power consumption?';

  @override
  String get faqElectricianA14 =>
      'Multiply watts by hours of use and divide by 1000.';

  @override
  String get faqElectricianQ15 => 'When should I call an electrician?';

  @override
  String get faqElectricianA15 =>
      'For extensions to the fuse box, new wiring or complex installations, it is wise to call a certified electrician.';

  @override
  String get faqElectricianQ16 => 'How long does this job take?';

  @override
  String get faqElectricianA16 =>
      'Installing an outlet or switch takes 30–60 minutes. Larger projects such as adding a new circuit can take half to a full day.';

  @override
  String get faqElectricianQ17 => 'What tools do I need?';

  @override
  String get faqElectricianA17 =>
      'You need: a screwdriver set, wire puller, side cutters, multimeter, insulation tape and possibly a hammer drill.';

  @override
  String get faqElectricianQ18 => 'How do I work safely?';

  @override
  String get faqElectricianA18 =>
      'Always turn off the power via the fuse box and check with a voltage tester that the circuit is truly de-energized before starting.';

  @override
  String get faqElectricianQ19 => 'What wire thickness should I use?';

  @override
  String get faqElectricianA19 =>
      'For outlets and lighting: 2.5 mm² for normal circuits. For heavier appliances (hob, washing machine): 4–6 mm². Consult the NEN 1010 standard.';

  @override
  String get faqElectricianQ20 => 'Can I do this as a beginner?';

  @override
  String get faqElectricianA20 =>
      'Simple replacements (switch, outlet) can be done independently if you follow safety rules. Work on the fuse box or new circuits should be left to a certified electrician.';

  @override
  String get faqTilerQ1 => 'Which tile adhesive should I use?';

  @override
  String get faqTilerA1 =>
      'Choose adhesive based on the tile type and substrate. Flexible adhesive is recommended for most modern installations.';

  @override
  String get faqTilerQ2 => 'Do I need to waterproof the surface?';

  @override
  String get faqTilerA2 =>
      'Yes, bathrooms and wet areas should be waterproofed before tiling.';

  @override
  String get faqTilerQ3 => 'How do I keep tiles level?';

  @override
  String get faqTilerA3 =>
      'Use tile spacers and a leveling system to ensure an even surface.';

  @override
  String get faqTilerQ4 => 'When can I walk on newly laid tiles?';

  @override
  String get faqTilerA4 =>
      'Wait at least 24 hours after installation before walking on the tiles.';

  @override
  String get faqTilerQ5 => 'How long before grouting?';

  @override
  String get faqTilerA5 =>
      'Most tile adhesives require 24 hours of curing before grouting.';

  @override
  String get faqTilerQ6 => 'What grout color should I choose?';

  @override
  String get faqTilerA6 =>
      'Choose a grout color that complements your tile or creates the desired contrast.';

  @override
  String get faqTilerQ7 => 'How do I cut tiles accurately?';

  @override
  String get faqTilerA7 =>
      'Use a tile cutter for straight cuts and a wet saw for complex shapes.';

  @override
  String get faqTilerQ8 => 'Can I tile over existing tiles?';

  @override
  String get faqTilerA8 =>
      'Yes, if the existing tiles are stable, clean and properly prepared.';

  @override
  String get faqTilerQ9 => 'What are common tiling mistakes?';

  @override
  String get faqTilerA9 =>
      'Uneven adhesive application, poor spacing and insufficient surface preparation.';

  @override
  String get faqTilerQ10 => 'How do I clean grout haze?';

  @override
  String get faqTilerA10 =>
      'Use a damp sponge shortly after grouting and a grout haze remover if necessary.';

  @override
  String get faqTilerQ11 => 'How much grout do I need?';

  @override
  String get faqTilerA11 =>
      'The amount depends on tile size, thickness and joint width.';

  @override
  String get faqTilerQ12 => 'Should I seal grout?';

  @override
  String get faqTilerA12 =>
      'Sealing grout helps prevent stains and moisture penetration.';

  @override
  String get faqTilerQ13 => 'Can beginners tile a bathroom?';

  @override
  String get faqTilerA13 =>
      'Yes, but start with simple layouts and take time with preparation.';

  @override
  String get faqTilerQ14 => 'How do I replace a broken tile?';

  @override
  String get faqTilerA14 =>
      'Carefully remove the damaged tile and install a matching replacement.';

  @override
  String get faqTilerQ15 => 'How long do tiled surfaces last?';

  @override
  String get faqTilerA15 =>
      'Properly installed tiles can last several decades with minimal maintenance.';

  @override
  String get faqTilerQ16 => 'How long does tiling take?';

  @override
  String get faqTilerA16 =>
      'Tiling a bathroom takes an average of 1–3 days. Tiling a small floor or wall takes about 4–8 hours, depending on the complexity.';

  @override
  String get faqTilerQ17 => 'What tools do I need?';

  @override
  String get faqTilerA17 =>
      'You need: tile cutter, notched trowel, grout float, rubber mallet, spirit level, tape measure, sponge and tile spacers.';

  @override
  String get faqTilerQ18 => 'How do I prepare the substrate?';

  @override
  String get faqTilerA18 =>
      'The substrate must be dry, flat and clean. Check for height differences with a spirit level. Apply tile adhesive to an even substrate.';

  @override
  String get faqTilerQ19 => 'How many extra tiles do I need?';

  @override
  String get faqTilerA19 =>
      'Always order 10–15% extra. For diagonal or herringbone patterns, allow even 20% extra for cutting loss.';

  @override
  String get faqTilerQ20 => 'Can I do this as a beginner?';

  @override
  String get faqTilerA20 =>
      'Simple tiling can be done independently with the right preparation. Start with a straight wall or floor without many niches or obstacles.';

  @override
  String get faqSchuttingPlaatsenQ1 => 'Do I need a permit to install a fence?';

  @override
  String get faqSchuttingPlaatsenA1 =>
      'Check in advance via the Omgevingsloket and/or your local council whether a permit or notification is required for your location, height, boundary, and construction.';

  @override
  String get faqSchuttingPlaatsenQ2 =>
      'How many posts and what is the correct spacing?';

  @override
  String get faqSchuttingPlaatsenA2 =>
      'The number of posts and their spacing depend on the chosen system, panel width and wind load. Follow the manufacturer\'s specifications.';

  @override
  String get faqSchuttingPlaatsenQ3 => 'How deep do the posts need to go?';

  @override
  String get faqSchuttingPlaatsenA3 =>
      'As a general guideline, approximately 1/3 of the post length should be underground, but the required foundation depth depends on soil, post thickness, wind load and the chosen system. Always follow the specifications of the chosen system.';

  @override
  String get faqSchuttingPlaatsenQ4 => 'Which post thickness should I choose?';

  @override
  String get faqSchuttingPlaatsenA4 =>
      'Choose a thicker post for a robust appearance or in high wind areas. Follow the advice of the manufacturer or supplier.';

  @override
  String get faqSchuttingPlaatsenQ5 =>
      'How long must the concrete cure before loading the fence?';

  @override
  String get faqSchuttingPlaatsenA5 =>
      'Follow the specifications of the concrete product used. Curing time depends on temperature, moisture and product; 24 hours is not automatically sufficient for full load.';

  @override
  String get faqSchuttingPlaatsenQ6 => 'How do I ensure the fence is level?';

  @override
  String get faqSchuttingPlaatsenA6 =>
      'Use a spirit level and guide line, each post at equal height. Check regularly. Use a suitable and safe ladder or platform for placing the top panels.';

  @override
  String get faqSchuttingPlaatsenQ7 => 'What if the ground is too soft?';

  @override
  String get faqSchuttingPlaatsenA7 =>
      'Extra concrete or dig deeper. Consider a post holder. Follow the system advice.';

  @override
  String get faqSchuttingPlaatsenQ8 => 'How do I maintain the fence?';

  @override
  String get faqSchuttingPlaatsenA8 =>
      'Wood: check periodically and treat according to the maintenance advice for the wood type or manufacturer (e.g. wood stain or wood oil). Plastic: rinse with water.';

  @override
  String get faqSchuttingPlaatsenQ9 => 'What are the most common mistakes?';

  @override
  String get faqSchuttingPlaatsenA9 =>
      'Not deep enough, not level, too few posts or insufficient foundation, system specifications not followed.';

  @override
  String get faqSchuttingPlaatsenQ10 => 'Best tip for a sturdy fence?';

  @override
  String get faqSchuttingPlaatsenA10 =>
      'Posts in concrete according to the system, use stainless steel screws. Always follow the manufacturer\'s specifications.';

  @override
  String get faqBestratingAanleggenQ1 => 'Do I need to prepare the ground?';

  @override
  String get faqBestratingAanleggenA1 =>
      'Yes. Excavate to the required depth, remove old paving and level the surface. A weed control membrane is not always necessary; only use it if appropriate for your application.';

  @override
  String get faqBestratingAanleggenQ2 => 'How much material do I need?';

  @override
  String get faqBestratingAanleggenA2 =>
      'Calculate the area in m² and determine the quantity of gravel tiles based on 60 x 60 cm per tile. Allow for project-specific cutting waste; with a lot of sawing, more than 5% is needed.';

  @override
  String get faqBestratingAanleggenQ3 => 'How do I make a good sand bed?';

  @override
  String get faqBestratingAanleggenA3 =>
      'The required foundation and sand layer depend on the load, subsoil and type of paving. Apply the correct layer thickness, compact it well and ensure a stable base.';

  @override
  String get faqBestratingAanleggenQ4 => 'How do I lay the paving?';

  @override
  String get faqBestratingAanleggenA4 =>
      'Lay the blocks tightly against each other and tap them down with a rubber mallet. Check for height differences regularly.';

  @override
  String get faqBestratingAanleggenQ5 => 'How long should the sand bed rest?';

  @override
  String get faqBestratingAanleggenA5 =>
      'You can start laying immediately after compacting, provided the sand bed is well compacted. Work in small sections.';

  @override
  String get faqBestratingAanleggenQ6 => 'How do I fix a sunken area?';

  @override
  String get faqBestratingAanleggenA6 =>
      'Lift the sunken tiles, top up the sand bed, compact it again and replace the tiles level.';

  @override
  String get faqBestratingAanleggenQ7 => 'How do I maintain the paving?';

  @override
  String get faqBestratingAanleggenA7 =>
      'Sweep regularly, remove weeds between the joints and top up the jointing sand if necessary.';

  @override
  String get faqBestratingAanleggenQ8 => 'What safety precautions apply?';

  @override
  String get faqBestratingAanleggenA8 =>
      'Gloves and safety glasses. Wear a dust mask when dust is released, for example during dry sawing.';

  @override
  String get faqBestratingAanleggenQ9 => 'What are the most common mistakes?';

  @override
  String get faqBestratingAanleggenA9 =>
      'Insufficient foundation or compaction, incorrect drainage, wrong layer structure, insufficient slope.';

  @override
  String get faqBestratingAanleggenQ10 => 'Best tip for a sleek result?';

  @override
  String get faqBestratingAanleggenA10 =>
      'Maintain sufficient slope for good water drainage; the required gradient depends on the application and subsoil. Check with a spirit level.';

  @override
  String get faqSnoeienQ1 => 'When is the best time to prune?';

  @override
  String get faqSnoeienA1 =>
      'The correct pruning time and method differ per hydrangea species. First check which species you have. Then follow the advice for that specific species.';

  @override
  String get faqSnoeienQ2 => 'What tools do I need?';

  @override
  String get faqSnoeienA2 =>
      'Pruning shears for thin branches, loppers or pruning saw for thicker branches. Sharp tools.';

  @override
  String get faqSnoeienQ3 => 'How many branches should I remove?';

  @override
  String get faqSnoeienA3 =>
      'Do not prune too much at once. Remove dead, diseased or damaged branches and old flowers. The approach differs per species (mophead hydrangea versus panicle hydrangea).';

  @override
  String get faqSnoeienQ4 => 'How exactly should I prune?';

  @override
  String get faqSnoeienA4 =>
      'Cut just above a new green bud or growing point, at an angle away from the bud. Work from the inside out.';

  @override
  String get faqSnoeienQ5 => 'How do I repair damage from pruning?';

  @override
  String get faqSnoeienA5 =>
      'Prune damaged branches back to healthy wood. Let the plant rest.';

  @override
  String get faqSnoeienQ6 => 'How do I maintain plants after pruning?';

  @override
  String get faqSnoeienA6 =>
      'Water the plant after pruning only when necessary and apply fertiliser according to the hydrangea\'s needs. Remove pruning waste.';

  @override
  String get faqSnoeienQ7 => 'What safety precautions apply?';

  @override
  String get faqSnoeienA7 =>
      'Gloves, safety glasses, stable ladder for high work. Watch out for falling branches.';

  @override
  String get faqSnoeienQ8 => 'What are the most common mistakes?';

  @override
  String get faqSnoeienA8 =>
      'Wrong period, wrong pruning method for the species, blunt tools, not clearing waste.';

  @override
  String get faqSnoeienQ9 => 'Best tip for pruning?';

  @override
  String get faqSnoeienA9 =>
      'Preferably do not prune during frost or when severe frost is expected directly after pruning. First check which hydrangea species you have and follow the advice for that species.';

  @override
  String get faqSnoeienQ10 => 'Should I treat pruning wounds with a product?';

  @override
  String get faqSnoeienA10 =>
      'No, the use of wound sealants is not recommended as standard for hydrangeas. The plant heals best naturally after a clean, sharp cut.';

  @override
  String get faqOverkappingBouwenQ1 => 'Do I need a permit?';

  @override
  String get faqOverkappingBouwenA1 =>
      'Check beforehand with your local authority whether a permit or notification is required for the canopy. Also check any local association rules.';

  @override
  String get faqOverkappingBouwenQ2 =>
      'How many posts do I need and how heavy should they be?';

  @override
  String get faqOverkappingBouwenA2 =>
      'The number and dimensions of posts, beams and connections depend on the dimensions, span, roof load, wind load and foundation. Consult a structural engineer if in doubt.';

  @override
  String get faqOverkappingBouwenQ3 => 'How do I build a sturdy frame?';

  @override
  String get faqOverkappingBouwenA3 =>
      'Use the correct wood dimensions and connections according to the structural calculation. Ensure a level and stable frame. Consult a structural engineer if in doubt.';

  @override
  String get faqOverkappingBouwenQ4 => 'How long should the concrete dry?';

  @override
  String get faqOverkappingBouwenA4 =>
      'Follow the specifications of the concrete product used. Curing time depends on temperature, moisture and product; 24 hours is not automatically sufficient for full load.';

  @override
  String get faqOverkappingBouwenQ5 =>
      'How do I prevent the wood from rotting or discolouring?';

  @override
  String get faqOverkappingBouwenA5 =>
      'Choose a suitable wood type or another material (plastic/aluminium). Treat according to the manufacturer\'s maintenance advice.';

  @override
  String get faqOverkappingBouwenQ6 => 'How do I ensure good drainage?';

  @override
  String get faqOverkappingBouwenA6 =>
      'Maintain sufficient slope for good water drainage; the required gradient depends on application and roofing material. Follow the specifications of the roofing material.';

  @override
  String get faqOverkappingBouwenQ7 => 'How do I maintain the canopy?';

  @override
  String get faqOverkappingBouwenA7 =>
      'Check annually for damage and clean the roof. Treat woodwork according to the maintenance advice for the wood type or manufacturer.';

  @override
  String get faqOverkappingBouwenQ8 => 'What safety precautions apply?';

  @override
  String get faqOverkappingBouwenA8 =>
      'Helmet, gloves, scaffolding. Never work at height alone. Use a suitable and safe ladder or platform for lower work.';

  @override
  String get faqOverkappingBouwenQ9 => 'What are the most common mistakes?';

  @override
  String get faqOverkappingBouwenA9 =>
      'Insufficient or incorrectly executed structure, not level, wrong roof pitch, no good foundation, forgetting the permit.';

  @override
  String get faqOverkappingBouwenQ10 => 'Best tip for a good canopy?';

  @override
  String get faqOverkappingBouwenA10 =>
      'Maintain sufficient slope for rain drainage. Check everything level. Consult a structural engineer if in doubt.';

  @override
  String get faqGazonLeggenQ1 => 'Why choose artificial grass?';

  @override
  String get faqGazonLeggenA1 =>
      'Artificial grass generally requires less maintenance than natural grass and stays green all year round. Regular cleaning and brushing is still needed. Choose a quality that suits the usage.';

  @override
  String get faqGazonLeggenQ2 => 'Do I need to prepare the ground?';

  @override
  String get faqGazonLeggenA2 =>
      'Yes, level and compact. Remove old turf, weeds and unevenness. Apply a stable base layer.';

  @override
  String get faqGazonLeggenQ3 => 'How much artificial grass do I need?';

  @override
  String get faqGazonLeggenA3 =>
      'Area + cutting waste (minimum 5%, more with extensive cutting). Artificial grass is usually supplied on rolls with a fixed width.';

  @override
  String get faqGazonLeggenQ4 => 'How do I lay artificial grass?';

  @override
  String get faqGazonLeggenA4 =>
      'Roll out the artificial grass, let it acclimatise to the temperature, cut to size and lay the seams tightly together. Optionally use seam tape.';

  @override
  String get faqGazonLeggenQ5 => 'How do I maintain artificial grass?';

  @override
  String get faqGazonLeggenA5 =>
      'Brush regularly, remove leaves and rinse with water. Do not use aggressive products.';

  @override
  String get faqGazonLeggenQ6 =>
      'What should I do about puddles or poor drainage?';

  @override
  String get faqGazonLeggenA6 =>
      'Ensure a permeable base layer. A drainage system may be needed in heavy rain.';

  @override
  String get faqGazonLeggenQ7 => 'What safety precautions apply?';

  @override
  String get faqGazonLeggenA7 =>
      'Gloves when cutting. Watch out for heavy equipment. Work stably.';

  @override
  String get faqGazonLeggenQ8 => 'What are the most common mistakes?';

  @override
  String get faqGazonLeggenA8 =>
      'Insufficient levelling, no stable base layer, seams not tight, incorrect cutting technique.';

  @override
  String get faqGazonLeggenQ9 => 'What are the most common mistakes?';

  @override
  String get faqGazonLeggenA9 =>
      'Not levelling the ground properly, watering too little or irregularly, laying at the wrong time of year and not pressing the ground down enough.';

  @override
  String get faqGazonLeggenQ10 => 'Best tip for a beautiful lawn?';

  @override
  String get faqGazonLeggenA10 =>
      'Lay or sow the lawn in spring or early autumn for the best growth and rooting. Avoid laying during hot, dry summer months.';

  @override
  String get faqGardenerQ1 => 'How often should I water plants?';

  @override
  String get faqGardenerA1 =>
      'Most plants benefit from deep watering 1–3 times per week depending on weather conditions.';

  @override
  String get faqGardenerQ2 => 'What type of soil is best?';

  @override
  String get faqGardenerA2 =>
      'Well-draining soil enriched with compost is suitable for most garden plants.';

  @override
  String get faqGardenerQ3 => 'How do I improve soil quality?';

  @override
  String get faqGardenerA3 =>
      'Add compost, organic matter and mulch regularly.';

  @override
  String get faqGardenerQ4 => 'When should I fertilize?';

  @override
  String get faqGardenerA4 =>
      'Most plants benefit from fertilizing during the growing season.';

  @override
  String get faqGardenerQ5 => 'How do I control weeds?';

  @override
  String get faqGardenerA5 =>
      'Mulching and regular weeding are the most effective methods.';

  @override
  String get faqGardenerQ6 => 'Can I plant during summer?';

  @override
  String get faqGardenerA6 =>
      'Yes, but plants may require more frequent watering.';

  @override
  String get faqGardenerQ7 => 'What is mulch used for?';

  @override
  String get faqGardenerA7 =>
      'Mulch retains moisture, suppresses weeds and improves soil health.';

  @override
  String get faqGardenerQ8 => 'How do I prune shrubs correctly?';

  @override
  String get faqGardenerA8 =>
      'Remove dead or damaged branches and prune according to the plant type.';

  @override
  String get faqGardenerQ9 => 'How can I attract pollinators?';

  @override
  String get faqGardenerA9 =>
      'Plant flowering species that attract bees and butterflies.';

  @override
  String get faqGardenerQ10 => 'How do I prevent pests naturally?';

  @override
  String get faqGardenerA10 =>
      'Encourage beneficial insects and use organic pest control methods.';

  @override
  String get faqGardenerQ11 => 'When is the best time to mow the lawn?';

  @override
  String get faqGardenerA11 =>
      'Mow regularly during the growing season and avoid cutting too short.';

  @override
  String get faqGardenerQ12 => 'How do I start a vegetable garden?';

  @override
  String get faqGardenerA12 =>
      'Choose a sunny location, prepare the soil and select suitable crops.';

  @override
  String get faqGardenerQ13 => 'Can I garden in containers?';

  @override
  String get faqGardenerA13 =>
      'Yes, container gardening is ideal for patios and small spaces.';

  @override
  String get faqGardenerQ14 => 'How do I reduce garden maintenance?';

  @override
  String get faqGardenerA14 =>
      'Use mulch, drought-tolerant plants and automated irrigation where possible.';

  @override
  String get faqGardenerQ15 => 'What are common gardening mistakes?';

  @override
  String get faqGardenerA15 =>
      'Overwatering, poor plant spacing and neglecting soil preparation.';

  @override
  String get faqGardenerQ16 => 'How long does this garden job take?';

  @override
  String get faqGardenerA16 =>
      'This varies greatly per job. Laying a lawn takes half a day; laying a terrace can take 1–3 days, depending on the size.';

  @override
  String get faqGardenerQ17 => 'What tools do I need?';

  @override
  String get faqGardenerA17 =>
      'Basic tools: spade, rake, wheelbarrow, pruning shears and garden gloves. Specific jobs may require additional tools.';

  @override
  String get faqGardenerQ18 => 'When is the best time for garden work?';

  @override
  String get faqGardenerA18 =>
      'Spring and autumn are ideal times for planting and major work. Avoid extreme heat or frost.';

  @override
  String get faqGardenerQ19 => 'How do I check if my soil is good?';

  @override
  String get faqGardenerA19 =>
      'Take a soil sample and test the pH value. Most plants grow best at a pH of 6–7. Add compost to improve soil quality.';

  @override
  String get faqGardenerQ20 => 'Can I do this as a beginner?';

  @override
  String get faqGardenerA20 =>
      'Yes, most garden jobs can be done independently with the right tools and our step-by-step guide.';

  @override
  String get faqCarpenterQ1 => 'What type of wood should I choose?';

  @override
  String get faqCarpenterA1 =>
      'The best choice depends on the project. Pine is affordable, while hardwoods are more durable.';

  @override
  String get faqCarpenterQ2 => 'How do I measure accurately?';

  @override
  String get faqCarpenterA2 =>
      'Measure twice and cut once to avoid costly mistakes.';

  @override
  String get faqCarpenterQ3 => 'Should I pre-drill holes?';

  @override
  String get faqCarpenterA3 =>
      'Yes, pre-drilling helps prevent wood from splitting.';

  @override
  String get faqCarpenterQ4 => 'What screws should I use?';

  @override
  String get faqCarpenterA4 =>
      'Summary for the average DIYer:\nOutdoor = Stainless steel (RVS) with Torx, length is 2.5x timber thickness, and thickness is 6mm for rafters/battens and 8mm+ for heavy structural beams. Indoor = affordable galvanized screws with the same length rule.';

  @override
  String get faqCarpenterQ5 => 'How do I keep cuts straight?';

  @override
  String get faqCarpenterA5 =>
      'Use a guide rail, square or fence when cutting.';

  @override
  String get faqCarpenterQ6 => 'Can I use reclaimed wood?';

  @override
  String get faqCarpenterA6 =>
      'Yes, provided it is clean, dry and structurally sound.';

  @override
  String get faqCarpenterQ7 => 'How do I prevent wood from warping?';

  @override
  String get faqCarpenterA7 =>
      'Store wood flat in a dry environment before use.';

  @override
  String get faqCarpenterQ8 => 'What safety equipment should I wear?';

  @override
  String get faqCarpenterA8 =>
      'Safety glasses, hearing protection and dust masks are recommended.';

  @override
  String get faqCarpenterQ9 => 'How do I sand wood properly?';

  @override
  String get faqCarpenterA9 =>
      'Start with coarse grit and gradually move to finer grits.';

  @override
  String get faqCarpenterQ10 => 'When should I use wood glue?';

  @override
  String get faqCarpenterA10 =>
      'Wood glue strengthens joints and is recommended for most woodworking projects.';

  @override
  String get faqCarpenterQ11 => 'How do I finish wood surfaces?';

  @override
  String get faqCarpenterA11 =>
      'Apply stain, varnish, oil or paint depending on the desired appearance.';

  @override
  String get faqCarpenterQ12 => 'What are common carpentry mistakes?';

  @override
  String get faqCarpenterA12 =>
      'Incorrect measurements, poor alignment and rushing the assembly process.';

  @override
  String get faqCarpenterQ13 => 'How long does a woodworking project last?';

  @override
  String get faqCarpenterA13 =>
      'With proper materials and maintenance, woodworking projects can last decades.';

  @override
  String get faqCarpenterQ14 => 'How long does this job take?';

  @override
  String get faqCarpenterA14 =>
      'On average, allow half to a full day for a standard carpentry job. For larger projects this can run to several days.';

  @override
  String get faqCarpenterQ15 => 'What tools do I need?';

  @override
  String get faqCarpenterA15 =>
      'Basic tools: tape measure, spirit level, pencil, drill, screws, saw and hammer.';

  @override
  String get faqCarpenterQ16 => 'How do I prepare the substrate?';

  @override
  String get faqCarpenterA16 =>
      'Check that the floor or wall is flat and sturdy. Remove loose parts and ensure the surface is dry and clean.';

  @override
  String get faqCarpenterQ17 => 'How much extra material should I order?';

  @override
  String get faqCarpenterA17 =>
      'Always order 10% extra for cutting loss. Enable the \"cutting loss\" option in the app to calculate this automatically.';

  @override
  String get faqCarpenterQ18 => 'Can I do this as a beginner?';

  @override
  String get faqCarpenterA18 =>
      'Yes, with the right preparation and our step-by-step guide you can carry out this job independently.';

  @override
  String get faqCarpenterQ19 => 'Do I need a permit?';

  @override
  String get faqCarpenterA19 =>
      'A permit is not required for most DIY jobs indoors. For outdoor work or structural changes, consult your municipality.';

  @override
  String get faqCarpenterQ20 => 'Which DIY store do you recommend?';

  @override
  String get faqCarpenterA20 =>
      'For DIY homeowners, we recommend consumer home centers like Gamma and Hornbach (or Home Depot and Lowe\'s). For professional contractors and builders, trade wholesalers like Bouwmaat and Jongeneel (or Ferguson and White Cap) provide specialist construction materials and bulk supplies.';

  @override
  String get faqVloerleggenQ1 => 'Should I acclimatise the laminate flooring?';

  @override
  String get faqVloerleggenA1 =>
      'Follow the manufacturer\'s instructions; often 48 hours.';

  @override
  String get faqVloerleggenQ2 => 'What if the subfloor is not level?';

  @override
  String get faqVloerleggenA2 => 'Level it or use a suitable underlay.';

  @override
  String get faqVloerleggenQ3 => 'Do I need underlay?';

  @override
  String get faqVloerleggenA3 =>
      'Usually yes, for sound insulation and stability.';

  @override
  String get faqVloerleggenQ4 => 'How much space should I leave at the walls?';

  @override
  String get faqVloerleggenA4 =>
      'Maintain the edge clearance specified by the manufacturer.';

  @override
  String get faqVloerleggenQ5 =>
      'Do I need to wait before walking on the floor?';

  @override
  String get faqVloerleggenA5 =>
      'Follow the click-lock system\'s instructions; many systems can be walked on immediately.';

  @override
  String get faqVloerleggenQ6 => 'How do I prevent creaking?';

  @override
  String get faqVloerleggenA6 =>
      'Ensure a level subfloor and correct installation.';

  @override
  String get faqVloerleggenQ7 => 'What should I do if a plank is damaged?';

  @override
  String get faqVloerleggenA7 =>
      'Replace it according to the manufacturer\'s instructions.';

  @override
  String get faqVloerleggenQ8 => 'How do I maintain the floor?';

  @override
  String get faqVloerleggenA8 =>
      'Use a suitable cleaning product and do not make the floor too wet.';

  @override
  String get faqVloerleggenQ9 => 'What safety precautions are required?';

  @override
  String get faqVloerleggenA9 => 'Wear eye and hearing protection when sawing.';

  @override
  String get faqVloerleggenQ10 => 'Best tip?';

  @override
  String get faqVloerleggenA10 =>
      'Read the installation instructions and check the subfloor.';

  @override
  String get faqVloerleggenQ11 => 'How do I maintain the floor?';

  @override
  String get faqVloerleggenA11 =>
      'Use a suitable cleaning product and do not make the floor too wet.';

  @override
  String get faqDeurPlaatsenQ1 => 'Which type of interior door?';

  @override
  String get faqDeurPlaatsenA1 => 'Flush door or rebated door.';

  @override
  String get faqDeurPlaatsenQ2 => 'How do I measure the door and frame?';

  @override
  String get faqDeurPlaatsenA2 =>
      'Measure the structural opening and clearance according to the manufacturer\'s instructions.';

  @override
  String get faqDeurPlaatsenQ3 => 'Where should the hinges go?';

  @override
  String get faqDeurPlaatsenA3 => 'Follow the manufacturer\'s instructions.';

  @override
  String get faqDeurPlaatsenQ4 => 'How do I prevent the door from sticking?';

  @override
  String get faqDeurPlaatsenA4 => 'Ensure the correct clearance and alignment.';

  @override
  String get faqDeurPlaatsenQ5 => 'What if the door does not hang properly?';

  @override
  String get faqDeurPlaatsenA5 => 'Check the frame, hinges, and clearance.';

  @override
  String get faqDeurPlaatsenQ6 => 'Do I need to wait before painting?';

  @override
  String get faqDeurPlaatsenA6 =>
      'Follow the paint manufacturer\'s instructions.';

  @override
  String get faqDeurPlaatsenQ7 => 'How do I prevent warping?';

  @override
  String get faqDeurPlaatsenA7 => 'Apply proper primer and finishing.';

  @override
  String get faqDeurPlaatsenQ8 =>
      'How do I maintain the hinges and locking hardware?';

  @override
  String get faqDeurPlaatsenA8 => 'Follow the manufacturer\'s instructions.';

  @override
  String get faqDeurPlaatsenQ9 => 'What are the most common mistakes?';

  @override
  String get faqDeurPlaatsenA9 =>
      'Incorrect measurements, clearance, or hardware.';

  @override
  String get faqDeurPlaatsenQ10 => 'Best tip?';

  @override
  String get faqDeurPlaatsenA10 => 'Use a door lifter and work safely.';

  @override
  String get faqPlintenMonerenQ1 => 'Do I need to clean the wall and floor?';

  @override
  String get faqPlintenMonerenA1 =>
      'Yes. The surfaces must be clean, dry, and free from dust and grease for the selected fixing method.';

  @override
  String get faqPlintenMonerenQ2 => 'How do I make a 45-degree mitre cut?';

  @override
  String get faqPlintenMonerenA2 =>
      'Use a mitre box or mitre saw and determine the actual angle with a sliding bevel when the corner is not exactly 90 degrees.';

  @override
  String get faqPlintenMonerenQ3 =>
      'How many metres of skirting board do I need?';

  @override
  String get faqPlintenMonerenA3 =>
      'Measure the total length to be covered and generally add about 10% for cutting waste. More may be needed when there are many corners.';

  @override
  String get faqPlintenMonerenQ4 =>
      'How do I prevent the skirting board from coming loose?';

  @override
  String get faqPlintenMonerenA4 =>
      'Use the correct fixing method for the type of skirting board and substrate. Clean the substrate and follow the instructions for the adhesive or tape.';

  @override
  String get faqPlintenMonerenQ5 => 'How do I deal with uneven surfaces?';

  @override
  String get faqPlintenMonerenA5 =>
      'For continuous skirting boards, small gaps can be finished with suitable acrylic sealant. Large gaps require an appropriate solution; do not use sealant as a structural filler.';

  @override
  String get faqPlintenMonerenQ6 =>
      'How long does the skirting board need to dry?';

  @override
  String get faqPlintenMonerenA6 =>
      'Follow the drying and curing time of the adhesive or sealant being used. Tape/adhesive skirting systems may behave differently from glued or mechanically fixed skirting boards.';

  @override
  String get faqPlintenMonerenQ7 =>
      'What if the skirting board does not fit tightly?';

  @override
  String get faqPlintenMonerenA7 =>
      'Check the corner, floor, and wall. Small cosmetic gaps can be appropriately finished; larger deviations should be resolved first.';

  @override
  String get faqPlintenMonerenQ8 => 'How do I maintain skirting boards?';

  @override
  String get faqPlintenMonerenA8 =>
      'Clean them with a surface-appropriate damp cloth and repair any damage according to the manufacturer\'s instructions.';

  @override
  String get faqPlintenMonerenQ9 => 'What safety measures are needed?';

  @override
  String get faqPlintenMonerenA9 =>
      'Use eye protection when using power saws and appropriate respiratory protection when dust is produced. Keep your hands away from the cutting line.';

  @override
  String get faqPlintenMonerenQ10 =>
      'What is the best tip for non-square corners?';

  @override
  String get faqPlintenMonerenA10 =>
      'Measure the actual angle and first test it with a short test piece before cutting the final skirting board.';

  @override
  String get faqPlakplintQ1 => 'Should I clean the wall and floor?';

  @override
  String get faqPlakplintA1 => 'Yes, they must be clean, dry, and dust-free.';

  @override
  String get faqPlakplintQ2 => 'How do I cut a mitre?';

  @override
  String get faqPlakplintA2 =>
      'Use a mitre box or mitre saw and measure the angle.';

  @override
  String get faqPlakplintQ3 => 'How many metres of skirting do I need?';

  @override
  String get faqPlakplintA3 => 'Perimeter plus 10% for cutting waste.';

  @override
  String get faqPlakplintQ4 =>
      'How do I prevent the skirting from coming loose?';

  @override
  String get faqPlakplintA4 =>
      'Ensure the floor is clean and dry, and press firmly.';

  @override
  String get faqPlakplintQ5 => 'How do I hide uneven areas?';

  @override
  String get faqPlakplintA5 =>
      'Do not use sealant for this; ensure the floor is level.';

  @override
  String get faqPlakplintQ6 =>
      'Do I need to wait before putting pressure on the skirting?';

  @override
  String get faqPlakplintA6 =>
      'It is ready immediately; follow the adhesive or sealant instructions.';

  @override
  String get faqPlakplintQ7 => 'What if the skirting does not fit tightly?';

  @override
  String get faqPlakplintA7 => 'Check the floor; use filler for large gaps.';

  @override
  String get faqPlakplintQ8 => 'How do I maintain skirting boards?';

  @override
  String get faqPlakplintA8 => 'Wipe with a damp cloth.';

  @override
  String get faqPlakplintQ9 => 'What safety precautions are required?';

  @override
  String get faqPlakplintA9 => 'Wear eye and hearing protection when sawing.';

  @override
  String get faqPlakplintQ10 => 'Best tip?';

  @override
  String get faqPlakplintA10 => 'Test the corner with a sample piece first.';

  @override
  String get faqVoorzetplintQ1 =>
      'Do I need to degrease the wall before gluing?';

  @override
  String get faqVoorzetplintA1 =>
      'Yes, a degreased and dust-free surface is essential for good adhesion of the glue or mounting adhesive. Use a degreaser and allow the wall to dry completely.';

  @override
  String get faqVoorzetplintQ2 => 'How do I cut a 45-degree mitre?';

  @override
  String get faqVoorzetplintA2 =>
      'Use a mitre box or electric mitre saw. Saw with the decorative face up for a clean finish. Always dry-fit the corner before fixing it permanently.';

  @override
  String get faqVoorzetplintQ3 =>
      'How many metres of skirting board do I need?';

  @override
  String get faqVoorzetplintA3 =>
      'Measure the perimeter of the room and add 10% for cutting waste at corners.';

  @override
  String get faqVoorzetplintQ4 =>
      'How do I prevent the overlay skirting board from coming loose?';

  @override
  String get faqVoorzetplintA4 =>
      'Use the correct mounting adhesive or double-sided tape and ensure the wall is dust-free, grease-free, and dry. Screws provide extra security for heavy boards.';

  @override
  String get faqVoorzetplintQ5 => 'How do I fill gaps and unevenness?';

  @override
  String get faqVoorzetplintA5 =>
      'Seal the joints around the board with acrylic caulk and smooth it with a wet finger or finishing tool for a neat result.';

  @override
  String get faqVoorzetplintQ6 =>
      'How long must the caulk dry before painting?';

  @override
  String get faqVoorzetplintA6 =>
      'Acrylic caulk is usually touch-dry within 1 hour and fully cured after 24 hours. Follow the drying time stated on the product packaging.';

  @override
  String get faqVoorzetplintQ7 =>
      'What if the overlay board does not sit flush against the wall?';

  @override
  String get faqVoorzetplintA7 =>
      'Apply extra caulk or use a filler strip. For larger gaps, expanding foam or an additional wood strip is a better solution than caulk alone.';

  @override
  String get faqVoorzetplintQ8 => 'How do I maintain overlay skirting boards?';

  @override
  String get faqVoorzetplintA8 =>
      'Wipe regularly with a lightly damp cloth. For lacquered boards, touch up any damage with matching lacquer. Check the caulk joint annually.';

  @override
  String get faqVoorzetplintQ9 => 'What safety measures apply when sawing?';

  @override
  String get faqVoorzetplintA9 =>
      'Wear a dust mask and work gloves. Always use a sharp blade for a clean, dust-free cut.';

  @override
  String get faqVoorzetplintQ10 =>
      'What is the best tip for invisible corners?';

  @override
  String get faqVoorzetplintA10 =>
      'Saw with the decorative face up and use a fine-toothed blade. Always dry-fit the corner before fixing it permanently.';

  @override
  String get faqTrapRenoverenQ1 => 'Do I need to level the staircase?';

  @override
  String get faqTrapRenoverenA1 => 'Only if needed.';

  @override
  String get faqTrapRenoverenQ2 => 'How much material do I need?';

  @override
  String get faqTrapRenoverenA2 =>
      'Count the steps and measure the width, depth, and height. Allow for cutting waste.';

  @override
  String get faqTrapRenoverenQ3 => 'Which adhesive should I use?';

  @override
  String get faqTrapRenoverenA3 => 'An adhesive suitable for laminate.';

  @override
  String get faqTrapRenoverenQ4 => 'Do I need to wait before using the stairs?';

  @override
  String get faqTrapRenoverenA4 => 'Follow the adhesive manufacturer.';

  @override
  String get faqTrapRenoverenQ5 => 'How do I finish the edges?';

  @override
  String get faqTrapRenoverenA5 => 'With stair nosings and profiles.';

  @override
  String get faqTrapRenoverenQ6 => 'What if a step is damaged?';

  @override
  String get faqTrapRenoverenA6 => 'Repair or replace the step.';

  @override
  String get faqTrapRenoverenQ7 => 'How do I maintain the staircase?';

  @override
  String get faqTrapRenoverenA7 => 'Follow the maintenance advice.';

  @override
  String get faqTrapRenoverenQ8 => 'What safety precautions are required?';

  @override
  String get faqTrapRenoverenA8 =>
      'Stable access, ventilation, and personal protection.';

  @override
  String get faqTrapRenoverenQ9 => 'What are the most common mistakes?';

  @override
  String get faqTrapRenoverenA9 =>
      'Measuring, preparation, adhesive, and finishing.';

  @override
  String get faqTrapRenoverenQ10 => 'Best tip?';

  @override
  String get faqTrapRenoverenA10 => 'Finish one step first as a reference.';

  @override
  String get faqTrapRenoverenQ11 => 'How do I finish edges and corners?';

  @override
  String get faqTrapRenoverenA11 =>
      'Use stair nosings and profiles suitable for the chosen system. Follow the manufacturer\'s instructions for a neat finish.';

  @override
  String get faqWandPlaatsenQ1 => 'What is the correct stud spacing?';

  @override
  String get faqWandPlaatsenA1 =>
      'Follow the selected wall system and the manufacturer\'s instructions. A spacing of 600 mm is common in many Metal Stud systems, but it is not universally correct for every board, wall, or load.';

  @override
  String get faqWandPlaatsenQ2 => 'Do I need insulation?';

  @override
  String get faqWandPlaatsenA2 =>
      'Insulation depends on the purpose of the wall, such as thermal insulation or sound insulation. Choose a material and thickness suitable for the selected wall system.';

  @override
  String get faqWandPlaatsenQ3 => 'How do I build the frame level?';

  @override
  String get faqWandPlaatsenA3 =>
      'Mark out the wall, install the U-profiles according to the system, and check the floor, ceiling, and studs for alignment. Metal Stud U- and C-profiles are normally made from galvanized steel.';

  @override
  String get faqWandPlaatsenQ4 =>
      'How long should I wait before sealing/jointing?';

  @override
  String get faqWandPlaatsenA4 =>
      'There is no general mandatory 24-hour waiting period for the construction. Follow the processing times of the jointing compound, sealant, and other products used.';

  @override
  String get faqWandPlaatsenQ5 => 'How do I finish the joints and screw holes?';

  @override
  String get faqWandPlaatsenA5 =>
      'For plasterboard, use a suitable jointing/finishing system, such as joint compound and joint tape where required by the system. Follow the manufacturer\'s instructions.';

  @override
  String get faqWandPlaatsenQ6 => 'What if the wall or floor is not level?';

  @override
  String get faqWandPlaatsenA6 =>
      'Correctly align the frame using suitable, stable fixing and leveling materials. Do not use expanding foam as a general structural filler.';

  @override
  String get faqWandPlaatsenQ7 => 'How do I maintain the wall?';

  @override
  String get faqWandPlaatsenA7 =>
      'After proper finishing, maintain the wall according to the selected paint or finishing system. Follow the instructions from the paint and board manufacturer.';

  @override
  String get faqWandPlaatsenQ8 => 'What safety measures are required?';

  @override
  String get faqWandPlaatsenA8 =>
      'Use eye, hand, and respiratory protection where necessary. Be careful with sharp profile edges and work from a stable ladder or platform that is suitable for the situation.';

  @override
  String get faqWandPlaatsenQ9 => 'What are the most common mistakes?';

  @override
  String get faqWandPlaatsenA9 =>
      'Common mistakes include: incorrect system selection, incorrect centre-to-centre (h.o.h.) spacing, insufficient fixing, missing reinforcement, and incorrect joint finishing.';

  @override
  String get faqWandPlaatsenQ10 => 'What is the best tip for a strong wall?';

  @override
  String get faqWandPlaatsenA10 =>
      'Plan heavy attachment points in advance and install suitable backing/support or system reinforcement according to the wall manufacturer\'s instructions.';

  @override
  String get faqWandPlaatsenQ11 => 'How do I hang a heavy object on this wall?';

  @override
  String get faqWandPlaatsenA11 =>
      'Use special plasterboard screws or plugs for light objects. For heavy objects, a reinforced wooden block must be placed behind the plasterboard during construction of the wall.';

  @override
  String get faqVloertegelsBadkamerQ1 =>
      'Do I need to level, prime, and degrease?';

  @override
  String get faqVloertegelsBadkamerA1 =>
      'Yes. Check the flatness and load-bearing capacity of the substrate and level it where necessary. Use primer if required by the adhesive system or substrate. Degrease a greasy or contaminated surface, such as a kitchen floor, with a suitable degreaser/cleaner.';

  @override
  String get faqVloertegelsBadkamerQ2 =>
      'How do I calculate cutting waste and the number of tiles?';

  @override
  String get faqVloertegelsBadkamerA2 =>
      'Calculate the surface area and divide it by the area of one tile. As a guideline, allow approximately 10% cutting waste. For patterned or diagonal installation, allow approximately 15% or more.';

  @override
  String get faqVloertegelsBadkamerQ3 =>
      'How do I achieve good adhesion with tile adhesive?';

  @override
  String get faqVloertegelsBadkamerA3 =>
      'Use the correct notched trowel and adhesive for the tile and substrate. Apply the adhesive to a clean, dust-free surface. For large tiles, use back-buttering according to the adhesive manufacturer\'s instructions.';

  @override
  String get faqVloertegelsBadkamerQ4 =>
      'How long should I wait before grouting?';

  @override
  String get faqVloertegelsBadkamerA4 =>
      'Often at least 24 hours. Large tiles, low temperatures, or low-absorption substrates may require more time. Always follow the product data sheet.';

  @override
  String get faqVloertegelsBadkamerQ5 =>
      'How do I prevent differences in tile height?';

  @override
  String get faqVloertegelsBadkamerA5 =>
      'Use tile wedges or a tile levelling system. Regularly check with a spirit level and straightedge.';

  @override
  String get faqVloertegelsBadkamerQ6 =>
      'What should I do with a loose or broken tile?';

  @override
  String get faqVloertegelsBadkamerA6 =>
      'Carefully remove the tile. Remove loose adhesive and dust from the substrate. Install a suitable replacement tile using appropriate adhesive.';

  @override
  String get faqVloertegelsBadkamerQ7 => 'How do I clean after grouting?';

  @override
  String get faqVloertegelsBadkamerA7 =>
      'Remove grout residue at the correct time using a suitable sponge and clean water before the grout has completely hardened.';

  @override
  String get faqVloertegelsBadkamerQ8 => 'How do I maintain a tiled floor?';

  @override
  String get faqVloertegelsBadkamerA8 =>
      'Use a pH-neutral cleaning product suitable for the tile. Avoid abrasive cleaning products.';

  @override
  String get faqVloertegelsBadkamerQ9 =>
      'What safety measures are required when cutting?';

  @override
  String get faqVloertegelsBadkamerA9 =>
      'Where possible, use wet cutting or source extraction with a construction vacuum cleaner to reduce silica dust. Wear suitable eye, hearing, and respiratory protection.\n\n⚠️ If in doubt, consult a professional. Always check the instructions for the material being used and the current Dutch regulations.';

  @override
  String get faqVloertegelsBadkamerQ10 => 'How long does it take?';

  @override
  String get faqVloertegelsBadkamerA10 =>
      'Professional: 0.50 hours per m². DIY: 1.20 hours per m².';

  @override
  String get faqWandtegelsPlaatsenQ1 =>
      'Do I need to level, prime, and degrease?';

  @override
  String get faqWandtegelsPlaatsenA1 =>
      'Check that the wall is flat, clean, dry, load-bearing, and free from grease. Level it where necessary and use primer if required by the substrate or adhesive system. Degrease a greasy or contaminated surface, such as a kitchen wall, with a suitable degreaser/cleaner.';

  @override
  String get faqWandtegelsPlaatsenQ2 =>
      'How do I calculate the number of tiles and cutting waste?';

  @override
  String get faqWandtegelsPlaatsenA2 =>
      'Calculate the wall area and divide it by the area of one tile. As a guideline, allow approximately 10% extra. For patterned or diagonal installation, allow approximately 15% or more.';

  @override
  String get faqWandtegelsPlaatsenQ3 =>
      'How do I prevent tiles from coming loose?';

  @override
  String get faqWandtegelsPlaatsenA3 =>
      'Use the correct notched trowel and adhesive for the tile and substrate. Do not apply too much adhesive at once and press the tiles firmly into place. Back-buttering may be required for large tiles.';

  @override
  String get faqWandtegelsPlaatsenQ4 =>
      'How long should I wait before grouting?';

  @override
  String get faqWandtegelsPlaatsenA4 =>
      'Often at least 24 hours. Large tiles or unfavourable conditions may require longer. Follow the product data sheet.';

  @override
  String get faqWandtegelsPlaatsenQ5 =>
      'How do I cut tiles without breaking them?';

  @override
  String get faqWandtegelsPlaatsenA5 =>
      'Use a tile cutter for straight cuts. Use an angle grinder with a diamond blade for cut-outs. Work slowly and support the tile properly.';

  @override
  String get faqWandtegelsPlaatsenQ6 => 'What if the wall is not level?';

  @override
  String get faqWandtegelsPlaatsenA6 =>
      'Repair or level the substrate where necessary before tiling. Do not try to compensate indefinitely by applying extra adhesive.';

  @override
  String get faqWandtegelsPlaatsenQ7 => 'How do I deal with angled walls?';

  @override
  String get faqWandtegelsPlaatsenA7 =>
      'Measure the angle with a sliding bevel and cut the tiles to size. Start from a square reference line and regularly check with a spirit level.';

  @override
  String get faqWandtegelsPlaatsenQ8 => 'How do I clean after grouting?';

  @override
  String get faqWandtegelsPlaatsenA8 =>
      'Use a soft sponge and clean water at the correct time, before the grout has fully hardened. Change the water regularly.';

  @override
  String get faqWandtegelsPlaatsenQ9 => 'How do I maintain wall tiles?';

  @override
  String get faqWandtegelsPlaatsenA9 =>
      'Use a damp cloth and mild cleaning product. Avoid abrasive products.\n\n⚠️ If in doubt, consult a professional. Always check the instructions for the material being used and the current Dutch regulations.';

  @override
  String get faqWandtegelsPlaatsenQ10 => 'How long does it take?';

  @override
  String get faqWandtegelsPlaatsenA10 =>
      'Professional: 0.40 hours per m². DIY: 1.00 hour per m².';

  @override
  String get faqKraanVervangenQ1 => 'Must I shut off the water?';

  @override
  String get faqKraanVervangenA1 =>
      'Yes. Close the relevant shut-off valve or main tap and depressurize the pipe.';

  @override
  String get faqKraanVervangenQ2 => 'How do I remove the old tap?';

  @override
  String get faqKraanVervangenA2 =>
      'Use suitable tools and hold fixed connections steady. Do not force stuck or damaged connections.';

  @override
  String get faqKraanVervangenQ3 => 'How do I know which tap I need?';

  @override
  String get faqKraanVervangenA3 =>
      'Check whether it\'s countertop or wall mounting and measure the existing connection and available space.';

  @override
  String get faqKraanVervangenQ4 =>
      'What connection does a standard countertop tap have?';

  @override
  String get faqKraanVervangenA4 =>
      'Many kitchen taps are supplied with flexible connection hoses and a standard connection. Always check the specific product.';

  @override
  String get faqKraanVervangenQ5 => 'Must a wooden countertop be sealed?';

  @override
  String get faqKraanVervangenA5 =>
      'With a wooden countertop, sealing around the tap opening may be necessary to prevent moisture penetration. Follow the countertop and sealant specifications.';

  @override
  String get faqKraanVervangenQ6 => 'How do I check for leaks?';

  @override
  String get faqKraanVervangenA6 =>
      'Open the water supply gently and check all connections with a dry cloth.';

  @override
  String get faqKraanVervangenQ7 => 'What if the tap keeps leaking?';

  @override
  String get faqKraanVervangenA7 =>
      'Shut off the water and check the connection, seal, and mounting method. Do not overtighten connections indefinitely.';

  @override
  String get faqKraanVervangenQ8 =>
      'Can I always replace an old tap with a new one?';

  @override
  String get faqKraanVervangenA8 =>
      'Not without checking. Check connection, hole size, available space, and tap type.';

  @override
  String get faqKraanVervangenQ9 => 'Most common mistake?';

  @override
  String get faqKraanVervangenA9 =>
      'Wrong measurements or overtightening a connection.';

  @override
  String get faqKraanVervangenQ10 => 'Best tip?';

  @override
  String get faqKraanVervangenA10 =>
      'Take a photo before dismantling and compare all connections with the new tap.';

  @override
  String get faqLeidingOntstoppenQ1 => 'Which tool should I use first?';

  @override
  String get faqLeidingOntstoppenA1 =>
      'Start with a plunger for a light blockage.';

  @override
  String get faqLeidingOntstoppenQ2 => 'When do I use a drain snake?';

  @override
  String get faqLeidingOntstoppenA2 =>
      'When the plunger gives insufficient results and the blockage is accessible.';

  @override
  String get faqLeidingOntstoppenQ3 => 'Must I use chemical drain cleaner?';

  @override
  String get faqLeidingOntstoppenA3 =>
      'Not as standard. Mechanical unblocking is preferred. Use a chemical agent only when suitable for the application and follow the label exactly.';

  @override
  String get faqLeidingOntstoppenQ4 => 'May I mix different drain cleaners?';

  @override
  String get faqLeidingOntstoppenA4 =>
      'No. Never mix different chemical agents.';

  @override
  String get faqLeidingOntstoppenQ5 => 'Can I clean the siphon?';

  @override
  String get faqLeidingOntstoppenA5 =>
      'With an accessible siphon, it can be dismantled and cleaned, provided this is safe and appropriate.';

  @override
  String get faqLeidingOntstoppenQ6 => 'What if the blockage returns?';

  @override
  String get faqLeidingOntstoppenA6 =>
      'Have the cause investigated instead of repeatedly using agents.';

  @override
  String get faqLeidingOntstoppenQ7 => 'When to call a professional?';

  @override
  String get faqLeidingOntstoppenA7 =>
      'For a deep, stubborn, or recurring blockage or suspected pipe damage.';

  @override
  String get faqLeidingOntstoppenQ8 => 'What protection?';

  @override
  String get faqLeidingOntstoppenA8 =>
      'Gloves and eye protection. Extra caution when chemicals have been used previously.';

  @override
  String get faqLeidingOntstoppenQ9 => 'What is a common mistake?';

  @override
  String get faqLeidingOntstoppenA9 =>
      'Forcing too hard or mixing chemical agents.';

  @override
  String get faqLeidingOntstoppenQ10 => 'Best tip?';

  @override
  String get faqLeidingOntstoppenA10 =>
      'Start mechanically and investigate recurring blockages.';

  @override
  String get faqToiletInstallerenQ1 => 'Must the existing drain fit?';

  @override
  String get faqToiletInstallerenA1 =>
      'Yes. Check position, size, type, and connection options before purchase.';

  @override
  String get faqToiletInstallerenQ2 => 'Standard or raised toilet?';

  @override
  String get faqToiletInstallerenA2 =>
      'A standard toilet is the starting point. A raised toilet has a higher seat height; the exact height varies by model.';

  @override
  String get faqToiletInstallerenQ3 => 'Can every toilet fit every drain?';

  @override
  String get faqToiletInstallerenA3 =>
      'No. Check the connection dimensions and position.';

  @override
  String get faqToiletInstallerenQ4 => 'How do I fix the toilet?';

  @override
  String get faqToiletInstallerenA4 =>
      'Use the manufacturer\'s fixing and ensure the toilet is stable and level.';

  @override
  String get faqToiletInstallerenQ5 => 'What is sanitary sealant for?';

  @override
  String get faqToiletInstallerenA5 =>
      'For sealing where required by the system. Sealant is not a replacement for mechanical fixing.';

  @override
  String get faqToiletInstallerenQ6 => 'How do I check the connection?';

  @override
  String get faqToiletInstallerenA6 =>
      'After installation, flush gently and check all connections for leaks.';

  @override
  String get faqToiletInstallerenQ7 => 'What if there\'s a leaking connection?';

  @override
  String get faqToiletInstallerenA7 =>
      'Shut off the water and check the relevant connection again.';

  @override
  String get faqToiletInstallerenQ8 => 'What protection?';

  @override
  String get faqToiletInstallerenA8 =>
      'Gloves, safe lifting, and accounting for residual water.';

  @override
  String get faqToiletInstallerenQ9 => 'Most common mistakes?';

  @override
  String get faqToiletInstallerenA9 =>
      'Wrong drain size, wrong connection, or insufficient fixing.';

  @override
  String get faqToiletInstallerenQ10 => 'Best tip?';

  @override
  String get faqToiletInstallerenA10 =>
      'Measure all connection dimensions first before buying the toilet.';

  @override
  String get faqCvBijvullenQ1 => 'When must I refill?';

  @override
  String get faqCvBijvullenA1 =>
      'When the pressure is too low according to the appliance manual.';

  @override
  String get faqCvBijvullenQ2 => 'What value should I maintain?';

  @override
  String get faqCvBijvullenA2 =>
      'The specified value of the specific appliance is leading.';

  @override
  String get faqCvBijvullenQ3 => 'Must the installation be cooled?';

  @override
  String get faqCvBijvullenA3 => 'Follow the appliance manual for this.';

  @override
  String get faqCvBijvullenQ4 => 'How do I refill?';

  @override
  String get faqCvBijvullenA4 => 'Use only the prescribed refill procedure.';

  @override
  String get faqCvBijvullenQ5 => 'Must I bleed afterwards?';

  @override
  String get faqCvBijvullenA5 =>
      'Only when this is necessary according to the manual or the situation.';

  @override
  String get faqCvBijvullenQ6 => 'What if the pressure keeps dropping?';

  @override
  String get faqCvBijvullenA6 =>
      'Do not keep refilling. Recurring pressure loss may indicate a problem or leak.';

  @override
  String get faqCvBijvullenQ7 => 'May I repair the boiler myself?';

  @override
  String get faqCvBijvullenA7 =>
      'No. Work on gas combustion installations must be carried out by a certified company.';

  @override
  String get faqCvBijvullenQ8 => 'May I open gas-side components?';

  @override
  String get faqCvBijvullenA8 => 'No.';

  @override
  String get faqCvBijvullenQ9 => 'What is a common mistake?';

  @override
  String get faqCvBijvullenA9 =>
      'Refilling too much or too fast and ignoring recurring pressure loss.';

  @override
  String get faqCvBijvullenQ10 => 'Best tip?';

  @override
  String get faqCvBijvullenA10 =>
      'Keep the appliance manual and follow the specific refill procedure.';

  @override
  String get faqLeidingAanleggenQ1 =>
      'What material should I use for water or drainage?';

  @override
  String get faqLeidingAanleggenA1 =>
      'Use a system suitable for the application and the chosen water pipe purpose.';

  @override
  String get faqLeidingAanleggenQ2 => 'What diameter must I use?';

  @override
  String get faqLeidingAanleggenA2 =>
      'Not automatically 12 or 15 mm. The required diameter depends on application, pipe length, required flow rate, and the chosen system.';

  @override
  String get faqLeidingAanleggenQ3 => 'Must hot water pipe be insulated?';

  @override
  String get faqLeidingAanleggenA3 =>
      'Where heat loss must be limited, pipe insulation can be applied according to installation requirements.';

  @override
  String get faqLeidingAanleggenQ4 => 'How much pipe do I need?';

  @override
  String get faqLeidingAanleggenA4 =>
      'Measure the full route and account for bends, connections, and cutting waste.';

  @override
  String get faqLeidingAanleggenQ5 => 'How do I connect copper pipe?';

  @override
  String get faqLeidingAanleggenA5 =>
      'Use a suitable connection system and follow the manufacturer and installation specifications.';

  @override
  String get faqLeidingAanleggenQ6 => 'Can I use a pipe bender?';

  @override
  String get faqLeidingAanleggenA6 =>
      'Yes, when suitable for the chosen pipe and application.';

  @override
  String get faqLeidingAanleggenQ7 => 'How do I fix pipes?';

  @override
  String get faqLeidingAanleggenA7 =>
      'Use suitable fixing according to the chosen system, material, diameter, and temperature load.';

  @override
  String get faqLeidingAanleggenQ8 => 'May I just chase a wall?';

  @override
  String get faqLeidingAanleggenA8 =>
      'No. Check beforehand for existing pipes, cables, and building constraints.';

  @override
  String get faqLeidingAanleggenQ9 => 'How do I test the pipe?';

  @override
  String get faqLeidingAanleggenA9 =>
      'Test the installation according to the specifications of the chosen system before it is finally covered.';

  @override
  String get faqLeidingAanleggenQ10 => 'Best tip?';

  @override
  String get faqLeidingAanleggenA10 =>
      'Make a pipe plan beforehand with route, connection points, shut-off points, and material choice. ⚠️ For drinking water installations, suitable materials and applicable Dutch requirements must be followed, including NEN 1006 and the Water worksheets.';

  @override
  String get faqStopcontactPlaatsenQ1 =>
      'Should I use an earthed or unearthed socket?';

  @override
  String get faqStopcontactPlaatsenA1 =>
      'Earthed sockets are required for appliances with an earthed plug (washing machines, dishwashers, microwaves) and are mandatory in all wet areas such as bathrooms, kitchens, utility rooms, garages, and outdoors. An unearthed socket is only for double-insulated appliances and is no longer used in wet areas for new installations. When in doubt, or in a wet area, always choose an earthed socket.';

  @override
  String get faqStopcontactPlaatsenQ2 =>
      'Do I need to switch off the electricity?';

  @override
  String get faqStopcontactPlaatsenA2 =>
      'Yes. Switch off the circuit and use a two-pole voltage tester to confirm that the installation is de-energized. Never work on a live installation.';

  @override
  String get faqStopcontactPlaatsenQ3 =>
      'How many flush-mounted boxes do I need?';

  @override
  String get faqStopcontactPlaatsenA3 =>
      'One flush-mounted box per socket. For a double socket, use a double box or two single boxes.';

  @override
  String get faqStopcontactPlaatsenQ4 => 'How do I connect the socket?';

  @override
  String get faqStopcontactPlaatsenA4 =>
      'Connect the live, neutral, and protective earth conductors according to the product\'s wiring diagram and the applicable installation requirements. The wiring is usually already present in the wall. Use wire connectors or a terminal block. In wet areas, a 30 mA residual-current device (RCD) is mandatory.';

  @override
  String get faqStopcontactPlaatsenQ5 => 'How long does it take?';

  @override
  String get faqStopcontactPlaatsenA5 =>
      'Professional: 0.75 hours per socket. DIY: 1.9 hours per socket. Flush-mounted installation can take longer due to chiselling, drilling, and repair work.';

  @override
  String get faqStopcontactPlaatsenQ6 => 'What if the socket does not work?';

  @override
  String get faqStopcontactPlaatsenA6 =>
      'Switch off the power and check the connection, wiring, and protection. If in doubt, do not switch it back on. Consult a qualified person.';

  @override
  String get faqStopcontactPlaatsenQ7 => 'What safety measures are required?';

  @override
  String get faqStopcontactPlaatsenA7 =>
      'Never work on a live installation. Use suitable measuring equipment. Wear appropriate protective equipment. Use a safe working method. Use a cable/pipe detector before drilling.';

  @override
  String get faqStopcontactPlaatsenQ8 => 'What are the most common mistakes?';

  @override
  String get faqStopcontactPlaatsenA8 =>
      'Incorrect connection or component, forgetting the protective earth, failing to verify the circuit is de-energized, insufficient fixing, incorrect flush-mounted box, and installing an unearthed socket in a wet area where earthing is mandatory.';

  @override
  String get faqStopcontactPlaatsenQ9 => 'Can I do this myself?';

  @override
  String get faqStopcontactPlaatsenA9 =>
      'Yes, provided you switch off the electricity, use a voltage tester, and follow the connection instructions. If unsure about earthing or modifying the distribution board, consult a qualified electrician.';

  @override
  String get faqStopcontactPlaatsenQ10 => 'Best tip?';

  @override
  String get faqStopcontactPlaatsenA10 =>
      'If safe to do so, take a photo of the original situation before disconnecting anything. Never rely solely on the photograph — verify wiring with measuring equipment and the product wiring diagram. In wet areas, always use an earthed socket with an RCD. Consult a professional if in doubt. Always check current Dutch regulations, applicable installation requirements, and the technical product data sheet.';

  @override
  String get faqVerlichtingPlaatsenQ1 =>
      'What type of lamp or light fixture should I choose?';

  @override
  String get faqVerlichtingPlaatsenA1 =>
      'For indoor areas, a ceiling light, pendant light, or surface-mounted fixture is most common. In wet areas such as bathrooms and kitchens, use a moisture-resistant fixture with an appropriate IP rating, for example IP44 or higher.';

  @override
  String get faqVerlichtingPlaatsenQ2 =>
      'Do I need to switch off the electricity?';

  @override
  String get faqVerlichtingPlaatsenA2 =>
      'Yes. Switch off the circuit and use a two-pole voltage tester to confirm the installation is de-energized. Never work on a live installation.';

  @override
  String get faqVerlichtingPlaatsenQ3 => 'How many light points do I need?';

  @override
  String get faqVerlichtingPlaatsenA3 =>
      'This depends on the room, its function, and the desired light level. There is no universal number.';

  @override
  String get faqVerlichtingPlaatsenQ4 => 'How do I install the light fixture?';

  @override
  String get faqVerlichtingPlaatsenA4 =>
      'Install the mounting bracket according to the manufacturer\'s instructions. Connect the wiring using the wiring diagram and install the fixture. The wiring is usually already present in the ceiling. Use a terminal block or wire connectors. Only connect protective earth when required by the fixture or installation system.';

  @override
  String get faqVerlichtingPlaatsenQ5 => 'How long does it take?';

  @override
  String get faqVerlichtingPlaatsenA5 =>
      'Professional: 0.50 hours per light point. DIY: 1.25 hours per light point. Wet areas may require additional time for suitable sealing and installation.';

  @override
  String get faqVerlichtingPlaatsenQ6 => 'What if the light does not turn on?';

  @override
  String get faqVerlichtingPlaatsenA6 =>
      'First switch off the electricity. Check the connection, switch, and protection using a safe testing procedure. If in doubt, consult an electrician.';

  @override
  String get faqVerlichtingPlaatsenQ7 => 'What safety measures are required?';

  @override
  String get faqVerlichtingPlaatsenA7 =>
      'Never work on a live installation. Use a stable ladder and suitable eye and hand protection. Use a cable/pipe detector before drilling.';

  @override
  String get faqVerlichtingPlaatsenQ8 => 'What are the most common mistakes?';

  @override
  String get faqVerlichtingPlaatsenA8 =>
      'Incorrect fixture for a wet area, poor electrical connection, incorrect installation, and incorrect connection of the protective earth where required.';

  @override
  String get faqVerlichtingPlaatsenQ9 => 'What should I consider in wet areas?';

  @override
  String get faqVerlichtingPlaatsenA9 =>
      'Use a fixture with an appropriate IP rating, at least IP44 for bathrooms and kitchens. Ensure proper sealing and connect the protective earth correctly when required by the system.';

  @override
  String get faqVerlichtingPlaatsenQ10 => 'Best tip?';

  @override
  String get faqVerlichtingPlaatsenA10 =>
      'Choose a colour temperature and dimming capability appropriate for the room. Before purchasing, check that the dimmer, lamp, and fixture are compatible. In wet areas, always use an appropriate IP rating. Consult a professional if in doubt. Always check current Dutch regulations, applicable installation requirements, and the technical product data sheet.';

  @override
  String get faqStroomleidingLeggenQ1 => 'Which cable or wire should I choose?';

  @override
  String get faqStroomleidingLeggenA1 =>
      'The cable type and conductor cross-section depend on the application, installation method, protection, electrical load, and applicable installation requirements. VD wire is used in an appropriate conduit/system. Cable types such as XMVK have their own application requirements.';

  @override
  String get faqStroomleidingLeggenQ2 =>
      'Do I need to switch off the electricity?';

  @override
  String get faqStroomleidingLeggenA2 =>
      'Yes. Switch off the circuit and use suitable measuring equipment to verify the working area is de-energized.';

  @override
  String get faqStroomleidingLeggenQ3 => 'How many metres do I need?';

  @override
  String get faqStroomleidingLeggenA3 =>
      'Measure the complete route and allow extra length for bends and connection points. 10% extra is a practical guideline, although complex routes may require more.';

  @override
  String get faqStroomleidingLeggenQ4 => 'How do I install the cable?';

  @override
  String get faqStroomleidingLeggenA4 =>
      'Mark the route and check for existing cables and pipes with a cable/pipe detector. Use suitable equipment and dust extraction for chasing and drilling. The chase depth and installation method must suit the cable/conduit system, wall construction, and applicable requirements. Install the conduit or cable and pull the wires. Cut conduit to length using a hacksaw.';

  @override
  String get faqStroomleidingLeggenQ5 => 'How long does it take?';

  @override
  String get faqStroomleidingLeggenA5 =>
      'Professional: 0.10 hours per metre. DIY: 0.25 hours per metre. Preparation, routing, wall type, and finishing can affect total time.';

  @override
  String get faqStroomleidingLeggenQ6 => 'What if a cable is damaged?';

  @override
  String get faqStroomleidingLeggenA6 =>
      'Switch off the electricity. Damaged cables must not simply be covered up. Repair them using an appropriate and standards-compliant method.';

  @override
  String get faqStroomleidingLeggenQ7 => 'What safety measures are required?';

  @override
  String get faqStroomleidingLeggenA7 =>
      'Work with the power switched off. Check for existing cables and structural elements before starting. Wear appropriate protective equipment. Avoid unsafe deep or long chases in load-bearing walls — have structural concerns assessed by a qualified professional.';

  @override
  String get faqStroomleidingLeggenQ8 => 'What are the most common mistakes?';

  @override
  String get faqStroomleidingLeggenA8 =>
      'Incorrect cable or conductor size, bends that are too sharp, poor fixing, insufficient pulling provision, hitting existing cables, and failing to check the wall before chasing.';

  @override
  String get faqStroomleidingLeggenQ9 => 'Can I chase a load-bearing wall?';

  @override
  String get faqStroomleidingLeggenA9 =>
      'No. Deep or long horizontal chases in load-bearing walls can reduce structural strength. Always have structural questions assessed by a qualified professional.';

  @override
  String get faqStroomleidingLeggenQ10 => 'Best tip?';

  @override
  String get faqStroomleidingLeggenA10 =>
      'Plan the route carefully and document cables before closing the chases. For future modifications, only use provisions designed for the intended application. Consult a professional if in doubt. Always check current Dutch regulations, applicable installation requirements, and the technical product data sheet.';

  @override
  String get faqKabelgootMonterenQ1 =>
      'Which type of cable trunking should I use?';

  @override
  String get faqKabelgootMonterenA1 =>
      'Self-adhesive trunking is for lightweight cables on a smooth, clean surface. Screw-mounted trunking is for heavier cables, rougher surfaces, or outdoor use. A common indoor size is 20 × 12 mm to 25 × 16 mm.';

  @override
  String get faqKabelgootMonterenQ2 => 'Do I need to prepare the surface?';

  @override
  String get faqKabelgootMonterenA2 =>
      'Yes. Clean the surface and make sure it is grease-free and dry when required by the manufacturer. Self-adhesive systems require particular attention to surface preparation.';

  @override
  String get faqKabelgootMonterenQ3 => 'How many metres do I need?';

  @override
  String get faqKabelgootMonterenA3 =>
      'Measure the route and allow extra material for corners, connections, and cutting waste. 10% extra is a practical guideline.';

  @override
  String get faqKabelgootMonterenQ4 => 'How do I install the cable trunking?';

  @override
  String get faqKabelgootMonterenA4 =>
      'Follow the installation instructions for the selected system. Cut it straight to size using a hacksaw. For corners, use suitable accessories or a neat mitre joint. Use a stable ladder when working at height.';

  @override
  String get faqKabelgootMonterenQ5 => 'How long does it take?';

  @override
  String get faqKabelgootMonterenA5 =>
      'Professional: 0.07 hours per metre. DIY: 0.17 hours per metre. Drilling into hard surfaces can require additional time.';

  @override
  String get faqKabelgootMonterenQ6 =>
      'What if the cable trunking comes loose?';

  @override
  String get faqKabelgootMonterenA6 =>
      'Remove the loose material, clean the surface, and repair it according to the manufacturer\'s recommended fixing method. For heavier loads, use suitable mechanical fixing.';

  @override
  String get faqKabelgootMonterenQ7 => 'What safety measures are required?';

  @override
  String get faqKabelgootMonterenA7 =>
      'Wear gloves and eye protection. Watch out for sharp edges. Use a cable/pipe detector before drilling.';

  @override
  String get faqKabelgootMonterenQ8 => 'What are the most common mistakes?';

  @override
  String get faqKabelgootMonterenA8 =>
      'Not cleaning the surface, incorrect fixing method for the surface, not marking the route straight, incorrect size, and insufficient fixing points.';

  @override
  String get faqKabelgootMonterenQ9 => 'Can I use cable trunking outdoors?';

  @override
  String get faqKabelgootMonterenA9 =>
      'Only if the cable trunking is specifically suitable for outdoor use. Preferably use screw mounting rather than self-adhesive mounting.';

  @override
  String get faqKabelgootMonterenQ10 => 'Best tip?';

  @override
  String get faqKabelgootMonterenA10 =>
      'For corners, use suitable accessories or a neat mitre joint. Install the cable trunking straight and tightly. Consult a professional if in doubt. Always check current Dutch regulations, applicable installation requirements, and the technical product data sheet.';

  @override
  String get faqRookmelderPlaatsenQ1 =>
      'Which type of smoke detector should I use?';

  @override
  String get faqRookmelderPlaatsenA1 =>
      'An optical smoke detector is a common choice for many residential rooms. In a kitchen, a heat detector may be more suitable. Choose a product that meets the relevant requirements.';

  @override
  String get faqRookmelderPlaatsenQ2 => 'Where should I install the detector?';

  @override
  String get faqRookmelderPlaatsenA2 =>
      'The Dutch government recommends installing smoke detectors on the ceiling, preferably in the hallway, at least 50 cm from a wall or corner and at least 30 cm from a light fixture. Do not place the detector directly next to ventilation openings or heating. Always follow the manufacturer\'s instructions.';

  @override
  String get faqRookmelderPlaatsenQ3 => 'How many detectors do I need?';

  @override
  String get faqRookmelderPlaatsenA3 =>
      'In the Netherlands, a smoke detector is mandatory on every residential floor. The exact number and best locations depend on the property. Follow current legal requirements and the manufacturer\'s instructions.';

  @override
  String get faqRookmelderPlaatsenQ4 => 'How do I install the detector?';

  @override
  String get faqRookmelderPlaatsenA4 =>
      'Install the mounting bracket according to the manufacturer\'s instructions. Attach the detector and test it after installation. Use appropriate wall plugs and screws when mechanical fixing is required.';

  @override
  String get faqRookmelderPlaatsenQ5 => 'How long does it take?';

  @override
  String get faqRookmelderPlaatsenA5 =>
      'Professional: 0.25 hours per detector. DIY: 0.60 hours per detector. Drilling, accessibility, and ceiling type can require additional time.';

  @override
  String get faqRookmelderPlaatsenQ6 =>
      'What should I do if there are false alarms?';

  @override
  String get faqRookmelderPlaatsenA6 =>
      'First determine the cause. Clean dust according to the manufacturer\'s instructions and check the detector\'s location, ventilation, and moisture conditions. Only move the detector if the new location meets the applicable requirements.';

  @override
  String get faqRookmelderPlaatsenQ7 => 'What safety measures are required?';

  @override
  String get faqRookmelderPlaatsenA7 =>
      'Use a stable ladder and work safely. Test the detector after installation and follow the manufacturer\'s instructions. Use a cable/pipe detector before drilling into the ceiling.';

  @override
  String get faqRookmelderPlaatsenQ8 => 'What are the most common mistakes?';

  @override
  String get faqRookmelderPlaatsenA8 =>
      'Incorrect positioning, not testing the detector, empty or missing battery, dirt/contamination, and not replacing the detector when the manufacturer specifies the end of its service life.';

  @override
  String get faqRookmelderPlaatsenQ9 => 'How do I test the detector?';

  @override
  String get faqRookmelderPlaatsenA9 =>
      'Test it regularly using the test button according to the manufacturer\'s instructions. Keep the detector free of dust and follow the maintenance and replacement instructions for the specific model.';

  @override
  String get faqRookmelderPlaatsenQ10 => 'Best tip?';

  @override
  String get faqRookmelderPlaatsenA10 =>
      'Use the test button regularly and replace the battery or complete detector according to the manufacturer\'s instructions. Take the legal positioning requirements into account. Consult a professional if in doubt. Always check current Dutch regulations, applicable installation requirements, and the technical product data sheet.';

  @override
  String get jobCarpenter01 => 'Floor laying – laminate';

  @override
  String get jobCarpenter02 => 'Door installation – interior door (solid)';

  @override
  String get jobCarpenter03 =>
      'Skirting board installation – adhesive skirting';

  @override
  String get jobCarpenter04 => 'Stair renovation – laminate';

  @override
  String get jobCarpenter05 =>
      'Wall installation – plasterboard with metal studs';

  @override
  String get jobPlumber01 => 'Kitchen tap replacement';

  @override
  String get jobPlumber02 => 'Drain unblocking';

  @override
  String get jobPlumber03 => 'Toilet installation';

  @override
  String get jobPlumber04 => 'Central heating refill';

  @override
  String get jobPlumber05 => 'Water pipe installation (copper)';

  @override
  String get jobPainter01 => 'Paint walls';

  @override
  String get jobPainter02 => 'Paint ceilings';

  @override
  String get jobPainter03 => 'Wallpapering';

  @override
  String get jobPainter04 => 'Window frame/door painting';

  @override
  String get jobPainter05 => 'Radiator painting';

  @override
  String get jobGardener01 => 'Fence installation';

  @override
  String get jobGardener02 => 'Paving installation';

  @override
  String get jobGardener03 => 'Pruning';

  @override
  String get jobGardener04 => 'Canopy construction';

  @override
  String get jobGardener05 => 'Lawn laying';

  @override
  String get jobElectrician01 => 'Outlet installation';

  @override
  String get jobElectrician02 => 'Lighting installation';

  @override
  String get jobElectrician03 => 'Cable laying';

  @override
  String get jobElectrician04 => 'Cable trunking installation';

  @override
  String get jobElectrician05 => 'Smoke detector installation';

  @override
  String get jobTiler01 => 'Laying floor tiles';

  @override
  String get jobTiler02 => 'Installing wall tiles';

  @override
  String get jobTiler03 => 'Repairing tiles';

  @override
  String get jobTiler04 => 'Grouting';

  @override
  String get jobTiler05 => 'Applying sealant';

  @override
  String get checklistBehangtafel => 'Wallpaper table';

  @override
  String get checklistBehangborstel => 'Wallpaper brush';

  @override
  String get checklistBehanglijmRoller => 'Paste roller';

  @override
  String get checklistMeetlint => 'Tape measure';

  @override
  String get checklistWaterpas => 'Spirit level';

  @override
  String get checklistPotlood => 'Pencil';

  @override
  String get checklistSchaarBehangmes => 'Scissors / Wallpaper knife';

  @override
  String get checklistSponzen => 'Sponges';

  @override
  String get checklistEmmerVoorLijm => 'Bucket (for paste)';

  @override
  String get checklistTrapLadder => 'Stepladder / Ladder';

  @override
  String get checklistStucloperAfdekfolie => 'Protective cover / dust sheet';

  @override
  String get checklistSponsDoek => 'Sponge / cloth';

  @override
  String get checklistLoodlijn => 'Plumb line';

  @override
  String get checklistPlamuurmes => 'Filling knife';

  @override
  String get checklistBehangnaadroller => 'Seam roller (optional)';

  @override
  String get checklistVerfroller => 'Paint roller';

  @override
  String get checklistKwast => 'Paintbrush';

  @override
  String get checklistVerfbak => 'Paint tray';

  @override
  String get checklistAfplaktape => 'Masking tape';

  @override
  String get checklistSchuurpapier => 'Sandpaper';

  @override
  String get checklistStofzuigerStofdoek => 'Vacuum / Dust cloth';

  @override
  String get checklistLadderTrap => 'Ladder / Step ladder';

  @override
  String get checklistDekkleed => 'Dust sheet';

  @override
  String get checklistDecoupeerzaag => 'Jigsaw';

  @override
  String get checklistRolmaat => 'Tape measure (roll)';

  @override
  String get checklistPlintenknipper => 'Skirting board cutter';

  @override
  String get checklistHamer => 'Hammer';

  @override
  String get checklistAccuboormachine => 'Cordless drill';

  @override
  String get checklistSchroevendraaier => 'Screwdriver';

  @override
  String get checklistKitpistool => 'Caulking gun';

  @override
  String get checklistWaterpomptang => 'Water pump pliers';

  @override
  String get checklistTeflonTape => 'Teflon tape';

  @override
  String get checklistSleutelset => 'Wrench set';

  @override
  String get checklistPijpsnijder => 'Pipe cutter';

  @override
  String get checklistIJzerzaag => 'Hacksaw';

  @override
  String get checklistOntluchtingssleutel => 'Bleeding key';

  @override
  String get checklistSoldeerbrander => 'Soldering torch';

  @override
  String get checklistAfsluiters => 'Shut-off valves';

  @override
  String get checklistEmmer => 'Bucket';

  @override
  String get checklistSchroevendraaierSet => 'Screwdriver set';

  @override
  String get checklistTrekkerDraadtrekker => 'Cable puller / Wire puller';

  @override
  String get checklistKrimpkous => 'Heat shrink tubing';

  @override
  String get checklistMultimeter => 'Multimeter';

  @override
  String get checklistKnijtang => 'Side cutters';

  @override
  String get checklistBoorhamers => 'Hammer drill';

  @override
  String get checklistIsolatietape => 'Insulation tape';

  @override
  String get checklistNulschakelaar => 'Isolator switch';

  @override
  String get checklistTegelsnijder => 'Tile cutter';

  @override
  String get checklistTandspaan => 'Notched trowel';

  @override
  String get checklistVoegspuit => 'Grout float';

  @override
  String get checklistSpons => 'Sponge';

  @override
  String get checklistRubberHamer => 'Rubber mallet';

  @override
  String get checklistSchop => 'Spade';

  @override
  String get checklistHark => 'Rake';

  @override
  String get checklistSnoeischaar => 'Pruning shears';

  @override
  String get checklistKruiwagen => 'Wheelbarrow';

  @override
  String get checklistTuinhandschoenen => 'Garden gloves';

  @override
  String get checklistGraafmachine => 'Excavator';

  @override
  String get checklistGieter => 'Watering can';

  @override
  String get checklistBeitel => 'Chisel';

  @override
  String get checklistMontageschuimpistool => 'Foam gun';

  @override
  String get checklistBlokhaak => 'Try square';

  @override
  String get checklistBreekijzer => 'Crowbar';

  @override
  String get checklistLijmtang => 'Clamp';

  @override
  String get checklistSpeedboor => 'Spade bit (for lock hole)';

  @override
  String get checklistStofmasker => 'Dust mask';

  @override
  String get checklistVeiligheidsbril => 'Safety goggles';

  @override
  String get checklistVerlengkabel => 'Extension cord';

  @override
  String get checklistTrapje => 'Step stool';

  @override
  String get checklistFreesmachine => 'Router (optional)';

  @override
  String get checklistSchuurmachine => 'Sanding machine';

  @override
  String get checklistSchaafmachine => 'Electric planer';

  @override
  String get checklistAfkortzaag => 'Cross-cut / Miter saw';

  @override
  String get checklistStofdoek => 'Dust cloth';

  @override
  String get checklistKniebeschermers => 'Knee pads';

  @override
  String get checklistStanleymes => 'Utility knife';

  @override
  String get checklistGatenzaag => 'Hole saw (for cutouts)';

  @override
  String get checklistLijmklemmen => 'Clamps';

  @override
  String get checklistWerkhandschoenen => 'Work gloves';

  @override
  String get checklistCirkelzaag => 'Circular / Plunge saw';

  @override
  String get checklistGipsschaar => 'Drywall scissors';

  @override
  String get checklistSteiger => 'Step stool / Scaffolding';

  @override
  String get checklistBehangafstomer => 'Wallpaper steamer (hire)';

  @override
  String get checklistGrondboor => 'Post hole digger';

  @override
  String get checklistVerstekbak => 'Miter box';

  @override
  String get checklistLijnlaser => 'Line laser (optional)';

  @override
  String get checklistTroffel => 'Trowel';

  @override
  String get checklistVoegrubber => 'Grout float';

  @override
  String get checklistBezem => 'Broom';

  @override
  String get checklistGrasrol => 'Lawn roller';

  @override
  String get checklistTakkenschaar => 'Loppers';

  @override
  String get checklistHeggenschaar => 'Hedge shears';

  @override
  String get checklistSnoeizaag => 'Pruning saw';

  @override
  String get checklistKettingzaag =>
      'Chainsaw (hire, only for safe & appropriate use)';

  @override
  String get checklistBitset => 'Bit set';

  @override
  String get checklistZaag => 'Hand saw';

  @override
  String get checklistBorstel => 'Brush';

  @override
  String get checklistSpade => 'Spade';

  @override
  String get checklistBladhark => 'Leaf rake';

  @override
  String get checklistBladblazer => 'Leaf blower (optional)';

  @override
  String get checklistSlijpsteen => 'Pruning shear sharpener / Whetstone';

  @override
  String get checklistStaalborstel => 'Wire brush';

  @override
  String get checklistGereedschapsolie => 'Tool oil / Linseed oil (WD-40)';

  @override
  String get checklistVoegenborstel => 'Grout brush';

  @override
  String get checklistHogedrukreiniger => 'Pressure washer (optional)';

  @override
  String get checklistGaskantenknipper => 'Lawn edger';

  @override
  String get checklistZwaaihaak => 'Adjustable bevel / T-bevel';

  @override
  String get checklistTacker => 'Staple gun (heavy-duty)';

  @override
  String get checklistTrapspin => 'Stair square / Stair gauge';

  @override
  String get checklistLijmkam => 'Glue spreader / Glue roller';

  @override
  String get checklistTrekijzer => 'Pull bar';

  @override
  String get checklistSlagblok => 'Tapping block';

  @override
  String get checklistVloerwals => 'Heavy roller (for pressing down)';

  @override
  String get checklistTrilplaat => 'Vibrating plate compactor (hire)';

  @override
  String get checklistKitschraper => 'Sealant scraper / caulk remover';

  @override
  String get checklistPlantenspuit => 'Spray bottle with washing-up liquid';

  @override
  String get checklistKeukenpapier => 'Kitchen paper / paper towels';

  @override
  String get checklistBouwstofzuiger =>
      'Construction vacuum cleaner (dust extraction when dry cutting/grinding)';

  @override
  String get checklistVoegkrabber => 'Grout rake';

  @override
  String get checklistGlijhoek => 'Sliding bevel (for angled walls)';

  @override
  String get checklistRubbereKitspatel => 'Rubber sealant finishing tool';

  @override
  String get checklistLiniaal => 'Ruler / Steel ruler';

  @override
  String get checklistCentrumbits => 'Centering bit / Hinge bit';

  @override
  String get checklistWiggen => 'Wedges / Spacers';

  @override
  String get checklistGroteVerfroller => 'Large paint roller';

  @override
  String get checklistKleineVerfroller => 'Small paint roller';

  @override
  String get checklistVerlengstok => 'Extension pole';

  @override
  String get checklistKwasten => 'Paint brushes';

  @override
  String get checklistRadiatorroller => 'Radiator roller';

  @override
  String get checklistStofzuiger => 'Vacuum cleaner';

  @override
  String get checklistSchroefboormachine => 'Cordless drill / driver';

  @override
  String get checklistBoormachine => 'Drill';

  @override
  String get checklistBuigtang => 'Pipe bender';

  @override
  String get checklistMoersleutel => 'Wrench / Adjustable wrench';

  @override
  String get checklistOntbraker => 'Deburring tool';

  @override
  String get checklistLeidingzoeker => 'Pipe & cable detector';

  @override
  String get checklistSteeksleutel => 'Open-end spanner';

  @override
  String get checklistInbussleutel => 'Allen key';

  @override
  String get checklistFrees => 'Wall chaser / Router';

  @override
  String get checklistOntstoppingsveer => 'Drain auger / snake';

  @override
  String get checklistOntstoppingsmachine =>
      'Electric drain unblocking machine (hire)';

  @override
  String get checklistRioolkabel => 'Sewer cable';

  @override
  String get checklistHandschoenen => 'Work gloves';

  @override
  String get checklistDoek => 'Cleaning cloth';

  @override
  String get checklistIsolatiemes => 'Insulation knife';

  @override
  String get checklistSpanningstester => 'Voltage tester';

  @override
  String get checklistStriptang => 'Wire stripper';

  @override
  String get checklistKabelknipper => 'Cable cutter';

  @override
  String get checklistGeisoleerGereedschap => 'Insulated tools';

  @override
  String get checklistMeetTestgereedschap => 'Measuring and testing equipment';

  @override
  String get checklistMomentsleutel => 'Torque wrench';

  @override
  String get checklistTrapjeOfSteiger => 'Stepladder or scaffold';

  @override
  String get checklistTrekveer => 'Fish tape / Cable puller';

  @override
  String get checklistBuisbuiger => 'Conduit bender';

  @override
  String get checklistZeskantsleutel => 'Hex key';

  @override
  String get checklistSlijptol => 'Angle grinder';

  @override
  String get checklistViltstift => 'Marker / Felt-tip pen';

  @override
  String get checklistRubbereHamer => 'Rubber mallet';

  @override
  String get checklistVoegspijker => 'Jointing trowel';

  @override
  String get checklistZuignap => 'Tile suction cup';

  @override
  String get checklistDoekOfLap => 'Cleaning rag';

  @override
  String get checklistBoorhamer => 'Rotary hammer drill';

  @override
  String get checklistStofferEnBlik => 'Dustpan and brush (for clean up)';

  @override
  String get checklistLaarzen => 'Rubber boots / Waders';

  @override
  String get checklistSchepnet => 'Landing net / Scoop net';

  @override
  String get checklistTrimmer => 'String trimmer / Grass trimmer';

  @override
  String get calcStatusPreparationExcluded => 'Preparation excluded';

  @override
  String get calcStatusMaterialWaitExcluded => 'Material waiting time excluded';

  @override
  String get calcStatusDryingCuringExcluded => 'Drying/curing time excluded';

  @override
  String get calcStatusIndicative => 'Times are indicative';

  @override
  String get calcStatusProjectSpecific =>
      'Project-specific circumstances excluded';

  @override
  String get calcStatusPipeInstallNote =>
      'For water pipe installation, the time per metre is a calculation basis only. Bends, fittings, wall penetrations, fastening, testing, and accessibility can significantly increase actual working time.';

  @override
  String get safetyLoadBearingTitle => 'Easy4DIY Safety Restriction';

  @override
  String get safetyLoadBearingBody =>
      'Easy4DIY does not cover the removal or modification of load-bearing structures. If there is any doubt, or if a wall may be load-bearing, it must first be assessed by a qualified professional. Modifications to load-bearing structures may require a building permit.';

  @override
  String get onboardingSafetyTitle => 'Safety check';

  @override
  String get onboardingSafetyIntro =>
      'Before continuing, select every condition below that applies to this job. Always use suitable protective equipment and follow the manufacturer\'s instructions.';

  @override
  String get onboardingSafetyStopMessage =>
      'Stop here. This job is outside Easy4DIY\'s safe scope. Do not continue with the calculation; contact a qualified professional.';

  @override
  String get safetyStopUnknownServices =>
      'Are there unknown pipes or cables inside the structure where you will work?';

  @override
  String get safetyStopAsbestos =>
      'Do you suspect that any material contains asbestos?';

  @override
  String get safetyStopPermit => 'Does this work require a permit?';

  @override
  String get safetyStopHeight =>
      'Would you need to work at height without suitable safety equipment?';

  @override
  String get safetyStopLoadBearing =>
      'Could this job remove or modify a load-bearing structure, or is its structural safety uncertain?';

  @override
  String get safetyStopGas =>
      'Does this work involve gas pipes or a gas-burning appliance or installation?';

  @override
  String get safetyStopFlue => 'Does this work involve a flue-gas system?';

  @override
  String get safetyStopBoiler => 'Does this work involve repairing a boiler?';

  @override
  String get safetyStopSeriousLeak => 'Is there a serious or unexplained leak?';

  @override
  String get safetyStopPressureLoss =>
      'Is the central-heating system repeatedly losing pressure?';

  @override
  String get safetyStopBlockage =>
      'Is the blockage complex, recurring, or possibly caused by pipe damage?';

  @override
  String get safetyStopDrinkingWater =>
      'Is there any doubt about drinking-water safety?';

  @override
  String get safetyStopLeadPaint => 'Could the existing paint contain lead?';

  @override
  String get safetyStopMoisture =>
      'Is there severe moisture damage or an unresolved moisture problem?';

  @override
  String get safetyStopSubstrate =>
      'Are you unsure whether the substrate is suitable or sound?';

  @override
  String get safetyStopWiring =>
      'Is the existing wiring damaged or its condition unknown?';

  @override
  String get safetyStopEarthing =>
      'Is the earthing missing or uncertain where it is required?';

  @override
  String get safetyStopCircuit =>
      'Are you uncertain about the fuse or circuit breaker?';

  @override
  String get safetyStopHeavyEquipment =>
      'Would this require heavy equipment you are not trained to use?';

  @override
  String get safetyStopPesticide =>
      'Would this involve pesticides that require special training or handling?';

  @override
  String get checklistContourmal => 'Contour gauge';

  @override
  String get checklistDeken => 'Blanket (protection)';

  @override
  String get checklistDeurheffer => 'Door lifter';

  @override
  String get checklistFijngetandeZaag => 'Fine-toothed saw or laminate shears';

  @override
  String get checklistVerstekzaag => 'Mitre saw';

  @override
  String get doc5HourlyRateCarpenter => 'Carpenter hourly rate: €45/hr';

  @override
  String get doc5HourIndicationTitle => 'Time Indication & Savings';

  @override
  String get doc5HourIndicationDisclaimer =>
      'The times are app calculation values, not a guarantee for every situation. They assume a normal, easily accessible situation. Extra work due to preparation, substrate, customisation, accessibility or material choice is assessed separately.';

  @override
  String get doc5ProTime => 'Pro time';

  @override
  String get doc5DiyTime => 'DIY time';

  @override
  String get doc5IndicativeSaving => 'Indicative saving';

  @override
  String get doc5SavingDisclaimer =>
      'This is purely a calculation basis. In practice, additional materials, reinforcement, finishing, bends, penetrations or unforeseen circumstances may cause extra costs and time.';

  @override
  String get doc5AppLogicTitle => 'App logic – Fixed rules';

  @override
  String get doc5RuleMostCommonMaterial => 'Most common material first';

  @override
  String get doc5RuleMostCommonMaterialDesc =>
      'The app defaults to the most common material/product type for each job.';

  @override
  String get doc5RuleAveragePrice => 'Average guide price';

  @override
  String get doc5RuleAveragePriceDesc =>
      'The app uses one average guide price for each standard material.';

  @override
  String get doc5RuleNoUnnecessaryMaterials =>
      'No unnecessary material additions';

  @override
  String get doc5RuleNoUnnecessaryMaterialsDesc =>
      'Components included as standard with a product are not counted again as separate materials.';

  @override
  String get doc5RuleOptionalMaterials => 'Optional materials';

  @override
  String get doc5RuleOptionalMaterialsDesc =>
      'Additional materials are only added when the situation or product choice requires it.';

  @override
  String get doc5RuleManufacturerFirst => 'Manufacturer first';

  @override
  String get doc5RuleManufacturerFirstDesc =>
      'Manufacturer instructions always take precedence over general calculation values.';

  @override
  String get doc5RuleSituationCheck => 'Situation check';

  @override
  String get doc5RuleSituationCheckDesc =>
      'Before starting, confirm the job type, dimensions, material, substrate, accessibility and desired finish. Do not proceed if the actual situation falls outside these assumptions.';

  @override
  String get doc5RuleStructuralSafety => 'Structural safety';

  @override
  String get doc5RuleStructuralSafetyDesc =>
      'No load-bearing structures may be removed or modified. If in doubt or if a wall may be load-bearing: have it assessed by a professional first.';

  @override
  String get doc5StopMomentTitle => 'Stop moments';

  @override
  String get doc5StopMomentLoadBearing => 'Load-bearing structures';

  @override
  String get doc5StopMomentAsbestos => 'Suspected asbestos materials';

  @override
  String get doc5StopMomentMoisture => 'Moisture or leakage problems';

  @override
  String get doc5StopMomentUnknownWiring =>
      'Unknown pipes or cables in structures';

  @override
  String get doc5StopMomentPermit => 'Work requiring a permit';

  @override
  String get doc5StopMomentComplex => 'Complex structures';

  @override
  String get doc5TestTitle => 'Post-work testing';

  @override
  String get doc5TestLevel => 'Level and stable result';

  @override
  String get doc5TestSecure => 'Secure fastening';

  @override
  String get doc5TestFunction => 'Correct functioning';

  @override
  String get doc5TestFinish => 'Neat finish';

  @override
  String get doc5CostNote =>
      'The app shows an average guide price. The live app can later retrieve current product prices.';

  @override
  String get doc5HoursNote =>
      'The app shows a calculated installation time and clearly states what is and is not included.';

  @override
  String get doc5SafetyNote =>
      'Use appropriate personal protection and work according to the instructions for materials, tools and installation.';

  @override
  String get doc5GuidanceTitle => 'Important assumptions and safety checks';

  @override
  String get doc5GuidanceCarpenter =>
      'Do not remove or modify load-bearing structures. Have uncertain structures assessed by a qualified professional. Check that installed items are secure, level and stable.';

  @override
  String get doc5GuidancePainter =>
      'Follow the paint and primer instructions. Use suitable protection when sanding or handling chemicals. Stop if lead paint, asbestos, severe moisture or an unsuitable substrate is suspected. Drying and curing time is not included; check the finished surface for runs and defects.';

  @override
  String get doc5GuidancePlumber =>
      'Follow product instructions and use materials suitable for drinking-water systems. Stop for gas, flues, boiler repairs, unexplained leaks, recurring pressure loss, serious blockages or uncertainty about water safety. Check for leaks and correct operation before covering pipework.';

  @override
  String get doc5GuidanceGardener =>
      'Follow instructions for machinery, treatments and materials; wear suitable protective equipment. Stop if structural stability, working at height, heavy equipment, pesticides or permits are uncertain. Check structural stability and drainage after the work.';

  @override
  String get doc5GuidanceElectrician =>
      'Never work on a live installation. If you cannot safely isolate and verify the circuit, or are unsure about wiring, earthing or circuit protection, stop and use a qualified electrician. Follow product instructions and applicable electrical standards; verify correct operation and earthing before use.';

  @override
  String get doc5GuidanceTiler =>
      'Follow product instructions for adhesive, grout and sealant. Control silica dust during cutting and use suitable eye, hearing and respiratory protection. Stop for suspected asbestos, structural concerns, severe moisture or an unsuitable substrate. Check tile adhesion, grout and surface level after the work.';

  @override
  String get safetyPlumberTitle => 'Easy4DIY Safety Restriction – Plumber';

  @override
  String get safetyPlumberBody =>
      'Easy4DIY does not cover gas lines, work on gas appliances, flue gas exhaust, boiler repairs or boiler maintenance. If in doubt, in case of leakage, structural problems or work beyond the simple job: stop and refer to a qualified/certified installer.';
}
