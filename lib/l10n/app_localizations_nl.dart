// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class AppLocalizationsNl extends AppLocalizations {
  AppLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get settingsAccount => 'Account';

  @override
  String get settingsAccountSubtitle => 'Beheer uw accountgegevens.';

  @override
  String get settingsName => 'Naam';

  @override
  String get settingsEmailAddress => 'E-mailadres';

  @override
  String get settingsLanguage => 'Taal';

  @override
  String get settingsLanguageSubtitle => 'Kies uw voorkeurstaal.';

  @override
  String get settingsUnits => 'Eenheden';

  @override
  String get settingsUnitsSubtitle => 'Kies de maateenheden.';

  @override
  String get settingsMeters => 'Meter (m)';

  @override
  String get settingsInches => 'Inch (in)';

  @override
  String get settingsOther => 'Overig';

  @override
  String get settingsPrivacyPolicy => 'Privacybeleid';

  @override
  String get settingsTermsConditions => 'Algemene voorwaarden';

  @override
  String get settingsHelpSupport => 'Hulp & Ondersteuning';

  @override
  String get settingsAbout => 'Over Easy4DIY';

  @override
  String get settingsLogout => 'Uitloggen';

  @override
  String get dashboardTitle => 'Dashboard';

  @override
  String get dashboardWelcome =>
      'Welkom terug! Hier is een overzicht van al je klussen, besparingen en prestaties.';

  @override
  String get dashboardTotalJobs => 'Totaal klussen';

  @override
  String get dashboardAllTime => 'Alle tijd';

  @override
  String get dashboardCompletedJobs => 'Voltooide klussen';

  @override
  String get dashboardCompleted => 'voltooid';

  @override
  String get dashboardTotalSavings => 'Totale besparing';

  @override
  String get dashboardAllJobs => 'Alle klussen';

  @override
  String get dashboardMoneySaved => 'Geld bespaard';

  @override
  String get dashboardThisMonth => 'Deze maand';

  @override
  String get dashboardSavingsOverview => 'Besparingen overzicht';

  @override
  String get dashboardViewAll => 'Bekijk alle';

  @override
  String get dashboardDoItYourself => 'Zelf doen';

  @override
  String get dashboardToolsRental => 'Gereedschap (huur)';

  @override
  String get dashboardTotal => 'Totaal';

  @override
  String get dashboardHireProfessional => 'Vakman inschakelen';

  @override
  String get dashboardTimeEstimate => 'Tijdsindicatie';

  @override
  String get dashboardHours => 'uur';

  @override
  String get dashboardYouSave => 'Jij bespaart';

  @override
  String get dashboardSmartDiy => 'Dat is slim klussen!';

  @override
  String get dashboardCostOverview => 'Kosten overzicht';

  @override
  String get dashboardThisYear => 'Dit jaar';

  @override
  String get dashboardTotalCosts => 'Totaal kosten';

  @override
  String get dashboardMaterials => 'Materialen';

  @override
  String get dashboardTools => 'Gereedschap';

  @override
  String get dashboardSubscriptions => 'Abonnementen';

  @override
  String get dashboardOther => 'Overig';

  @override
  String get dashboardRecentActivities => 'Recente activiteiten';

  @override
  String get dashboardNoRecentJobs =>
      'Nog geen recente klussen. Start je eerste klus!';

  @override
  String dashboardJobCompleted(String jobName, String savings) {
    return '$jobName voltooid! € $savings bespaard.';
  }

  @override
  String get dashboardHoursAgo => 'uur geleden';

  @override
  String get dashboardDayAgo => 'dag geleden';

  @override
  String get dashboardDaysAgo => 'dagen geleden';

  @override
  String get dashboardWeekAgo => 'week geleden';

  @override
  String get dashboardViewAllActivities => 'Bekijk alle activiteiten';

  @override
  String get dashboardQuickAccess => 'Snelle toegang';

  @override
  String get dashboardNewJob => 'Nieuwe klus';

  @override
  String get rootDashboard => 'Dashboard';

  @override
  String get rootSettings => 'Instellingen';

  @override
  String get rootMyJobs => 'Mijn Klussen';

  @override
  String get rootTasks => 'Taken';

  @override
  String get rootSizesCalculations => 'Maten & Berekeningen';

  @override
  String get rootMaterials => 'Materialen';

  @override
  String get rootCostsSavings => 'Kosten & Besparing';

  @override
  String get rootSubscriptions => 'Abonnementen';

  @override
  String get rootToolChecklist => 'Gereedschap Checklist';

  @override
  String get rootFaq => 'Veelgestelde Vragen';

  @override
  String get rootPreferences => 'Instellingen';

  @override
  String get rootStepByStep => 'STAP VOOR STAP';

  @override
  String get rootGoPremium => 'Kies jouw pakket';

  @override
  String get rootUnlockPremium =>
      'Ontgrendel meer klussen\nen premium functies.';

  @override
  String get rootUpgradeNow => 'Abonneer nu';

  @override
  String onboardingStep(int current, int total) {
    return 'Stap $current van $total';
  }

  @override
  String get onboardingWelcomeTitle => 'Welkom bij Easy4DIY!';

  @override
  String get onboardingWelcomeDesc =>
      'Meten is weten! Bereken snel en eenvoudig de vierkante meters, materialen, kosten en gereedschappen voor elk project. In een paar stappen heb je een compleet overzicht. Je eerste klus is helemaal gratis. We blijven groeien met nieuwe functies en klussen. Ons doel? De grootste en beste doe-het-zelf-app ter wereld worden. Bouw jij met ons mee?';

  @override
  String get onboardingChooseJob => 'Welk vakgebied?';

  @override
  String get onboardingWhatWork => 'Selecteer het beroep voor jouw klus';

  @override
  String get onboardingSelectJob => 'Selecteer je klus';

  @override
  String get onboardingJobCarpenter => 'Timmerman';

  @override
  String get onboardingJobPlumber => 'Loodgieter';

  @override
  String get onboardingJobPainter => 'Schilder';

  @override
  String get onboardingJobGardener => 'Tuinier';

  @override
  String get onboardingJobElectrician => 'Elektricien';

  @override
  String get onboardingJobTiler => 'Tegelzetter';

  @override
  String get onboardingFillSizes => 'Vul de maten in';

  @override
  String get onboardingRoomDimensions => 'Geef de afmetingen van je ruimte op';

  @override
  String get onboardingMeasureHeader =>
      'In de Easy4DIY-app werkt het opmeten zo:';

  @override
  String get onboardingMeasureStep1 =>
      'Je kiest eerst het oppervlak: vloer, muur of plafond.';

  @override
  String get onboardingMeasureExampleTitle => 'Voorbeeld:';

  @override
  String get onboardingMeasureExampleDesc =>
      'Een vloer van 5,00 m lang en 4,00 m breed → 5,00 × 4,00 = 20,00 m².';

  @override
  String get onboardingMeasureFormulaFloor => 'Vloer: lengte × breedte';

  @override
  String get onboardingMeasureFormulaWall => 'Muur: lengte × hoogte';

  @override
  String get onboardingMeasureFormulaCeiling => 'Plafond: lengte × breedte';

  @override
  String get onboardingMeasureFooter =>
      'Vul alles in in meters – de app doet de rest.';

  @override
  String get onboardingTypeFloor => 'Vloer (lxb)';

  @override
  String get onboardingTypeWall => 'Muur (lxh)';

  @override
  String get onboardingTypeCeiling => 'Plafond (lxb)';

  @override
  String get onboardingLength => 'Lengte (m)';

  @override
  String get onboardingWidth => 'Breedte (m)';

  @override
  String get onboardingHeight => 'Hoogte (m)';

  @override
  String get onboardingTotalArea => 'Totale oppervlakte (m²)';

  @override
  String get onboardingCuttingLoss => '+10% snijverlies (aanbevolen)';

  @override
  String onboardingTotalWithLoss(String area) {
    return 'Totaal met snijverlies: $area m²';
  }

  @override
  String get onboardingHowLong => 'Hoe lang duurt deze klus ongeveer?';

  @override
  String get onboardingChooseIndication => 'Kies een indicatie';

  @override
  String get onboardingMaterialsOverview => 'Materialen overzicht';

  @override
  String get onboardingMaterial => 'Materiaal';

  @override
  String get onboardingQty => 'Hoe.';

  @override
  String get onboardingPrice => 'Prijs';

  @override
  String onboardingBasedOnArea(String area) {
    return 'Op basis van $area m²\n(incl. 10% snijverlies)';
  }

  @override
  String get onboardingToolsCheck => 'Gereedschapscheck';

  @override
  String get onboardingHaveRightTools =>
      'Heb je al het juiste gereedschap in huis?';

  @override
  String get onboardingFaqTitle => 'Meest gestelde vragen\nover jouw klus';

  @override
  String get onboardingCostOverview => 'Kostenoverzicht';

  @override
  String get onboardingCostDiy => 'Wat kost het als je het zelf doet?';

  @override
  String get onboardingDoItYourself => 'ZELF DOEN';

  @override
  String get onboardingHireProfessional => 'VAKMAN INSCHAKELEN';

  @override
  String get onboardingYouSave => 'JIJ BESPAART';

  @override
  String get onboardingSmartDiy => 'Dat is slim klussen!';

  @override
  String get onboardingPrev => 'Vorige';

  @override
  String get onboardingNext => 'Volgende';

  @override
  String get onboardingFinish => 'Afronden';

  @override
  String get onboardingChoosePlan => 'Kies jouw pakket';

  @override
  String get onboardingUnlockFeatures => 'Ontgrendel alle functies';

  @override
  String get onboardingPlanEssential => 'Essentieel';

  @override
  String get onboardingPlanEverything => 'Alles wat je nodig hebt';

  @override
  String get onboardingPlanDemanding => 'Voor de veeleisende klusser';

  @override
  String get onboardingPlanMostChosen => 'MEEST GEKOZEN';

  @override
  String get onboardingStartFreeTrial => 'EERSTE KEER GRATIS';

  @override
  String get onboardingCalculateArea => 'BEREKEN m²';

  @override
  String get onboardingBack => 'TERUG';

  @override
  String get onboardingSafe => 'Veilig';

  @override
  String get onboardingReliable => 'Betrouwbaar';

  @override
  String get onboardingEveryJob => 'Voor elke klus';

  @override
  String get onboardingBannerHint => 'Uitleg hoe je de maten invult';

  @override
  String get onboardingJobBannerHint => 'Selecteer het beroep voor jouw klus';

  @override
  String get onboardingDurationHalfDay => 'Halve dag (2–4 uur)';

  @override
  String get onboardingDurationOneDay => '1 dag';

  @override
  String get onboardingDurationTwoDays => '2–3 dagen';

  @override
  String get onboardingDurationOneWeek => '1 week';

  @override
  String get onboardingDurationMultipleWeeks => 'Meerdere weken';

  @override
  String onboardingDurationSelected(String duration) {
    return 'Geschatte duur: $duration';
  }

  @override
  String get authLogin => 'Inloggen';

  @override
  String get authWelcomeMessage =>
      'Welkom bij Easy4DIY, fijn dat je er bent. Vul hier je gegevens in en ontdek nog veel meer.';

  @override
  String get authEmail => 'E-mailadres';

  @override
  String get authEmailHint => 'vul je e-mailadres in';

  @override
  String get authPassword => 'Wachtwoord';

  @override
  String get authPasswordHint => 'vul je wachtwoord in';

  @override
  String get authForgotPassword => 'Wachtwoord vergeten?';

  @override
  String get authNoAccount => 'Nog geen account? ';

  @override
  String get authCreateOne => 'Maak er één aan';

  @override
  String get authCreateAccount => 'Account aanmaken';

  @override
  String get authWelcomeSignup => 'Welkom! Vul je gegevens in om te beginnen.';

  @override
  String get authFullName => 'Volledige naam';

  @override
  String get authFullNameHint => 'Vul je volledige naam in';

  @override
  String get authPhone => 'Telefoonnummer';

  @override
  String get authPhoneHint => 'Vul je telefoonnummer in';

  @override
  String get authChoosePassword => 'Kies een wachtwoord';

  @override
  String get authConfirmPassword => 'Bevestig wachtwoord';

  @override
  String get authConfirmPasswordHint => 'Bevestig je wachtwoord';

  @override
  String get authOr => 'OF';

  @override
  String get authAlreadyHaveAccount => 'Heb je al een account? ';

  @override
  String get authUserNotFound => 'Geen account gevonden. Maak een account aan.';

  @override
  String get authWrongPassword => 'Onjuist wachtwoord. Probeer opnieuw.';

  @override
  String get authForgotPasswordTitle => 'Wachtwoord vergeten';

  @override
  String get authForgotPasswordDesc =>
      'Voer uw e-mailadres in om uw wachtwoord te resetten.';

  @override
  String get authEmailHintShort => 'uw@email.nl';

  @override
  String get authEmailRequired => 'Vul uw e-mailadres in';

  @override
  String get authEmailInvalid => 'Ongeldig e-mailadres';

  @override
  String get authNoAccountFound => 'Geen account gevonden met dit e-mailadres.';

  @override
  String get authCancel => 'Annuleren';

  @override
  String get authContinue => 'Doorgaan';

  @override
  String get authNewPasswordTitle => 'Nieuw wachtwoord';

  @override
  String get authNewPasswordLabel => 'Nieuw wachtwoord';

  @override
  String get authPasswordRequired => 'Vul een wachtwoord in';

  @override
  String get authPasswordMinLength => 'Minimaal 6 tekens vereist';

  @override
  String get authConfirmPasswordLabel => 'Bevestig wachtwoord';

  @override
  String get authConfirmPasswordRequired => 'Bevestig uw wachtwoord';

  @override
  String get authPasswordMismatch => 'Wachtwoorden komen niet overeen';

  @override
  String get authSave => 'Opslaan';

  @override
  String get authPasswordChanged => 'Wachtwoord succesvol gewijzigd!';

  @override
  String get onboardingPlayVideo => 'Instructievideo afspelen';

  @override
  String get onboardingPlanFree => '1X GRATIS GEBRUIKEN';

  @override
  String get onboardingHowItWorks => 'HOE HET WERKT';

  @override
  String get onboardingFreeStep1 => 'Log in met Google of e-mail';

  @override
  String get onboardingFreeStep2 => 'Bekijk 2 korte advertenties';

  @override
  String get onboardingFreeStep3 => 'Start als 1 klus gratis';

  @override
  String get onboardingEasyToUse => 'EENVOUDIG TE GEBRUIKEN';

  @override
  String get onboardingDownloadApp =>
      'download de app op smartphone of website';

  @override
  String get onboardingPlanPremium => 'MAANDELIJKS';

  @override
  String get onboardingPlanYearly => 'JAARLIJKS';

  @override
  String get onboardingBestChoice => 'BESTE KEUZE';

  @override
  String get onboardingUnlimitedJobs => 'Onbeperkte klussen';

  @override
  String get onboardingAllFeatures => 'Alle functies';

  @override
  String get onboardingNoAds => 'Geen advertenties';

  @override
  String get onboardingPremiumSupport => 'Meertalig';

  @override
  String get onboardingUpdateNewJobs => 'Update & nieuwe klussen';

  @override
  String get onboardingChoosePremium => 'KIES MAANDELIJKS';

  @override
  String get onboardingChooseYearly => 'KIES JAARLIJKS';

  @override
  String get onboardingSave17 => 'BESPAAR 44%';

  @override
  String get onboardingSubscriptionChoice => 'Abonnement keuze';

  @override
  String get onboardingIndicativePrices => 'Prijzen zijn richtprijzen';

  @override
  String get onboardingIndicativeCalculation =>
      'Let op: dit is een indicatieve berekening.';

  @override
  String get subscriptionChoosePlan => 'Kies jouw pakket';

  @override
  String get subscriptionMonthlyPlan => 'Maandelijks abonnement';

  @override
  String get subscriptionYearlyPlan => 'Jaarlijks abonnement';

  @override
  String get subscriptionRecurring => 'Terugkerend abonnement';

  @override
  String get subscriptionPerMonth => 'Per maand';

  @override
  String get subscriptionPerYear => 'Per jaar';

  @override
  String get subscriptionMostPopular => 'Meest populair';

  @override
  String get subscriptionBestValue => 'Beste waarde';

  @override
  String get subscriptionTwoMonthsFree => '5 maanden gratis';

  @override
  String get subscriptionEverythingIncluded => 'Alles inbegrepen';

  @override
  String get subscriptionPremiumActivated =>
      'Premium geactiveerd! Bedankt voor je aankoop.';

  @override
  String get subscriptionVerifying => 'Verifiëren...';

  @override
  String get subscriptionProcessing => 'Verwerken...';

  @override
  String subscriptionSubscribeWithPrice(String price) {
    return 'Abonneer nu — $price';
  }

  @override
  String get subscriptionSubscribe => 'Abonneer nu';

  @override
  String get subscriptionRestoring => 'Herstellen...';

  @override
  String get subscriptionRestorePurchases => 'Aankopen herstellen';

  @override
  String get subscriptionManageSubscription => 'Abonnement beheren';

  @override
  String get subscriptionPlansNotLoaded =>
      'Abonnementplannen konden niet worden geladen.';

  @override
  String get subscriptionLoading => 'Laden…';

  @override
  String get subscriptionRetry => 'Opnieuw proberen';

  @override
  String get onboardingClose => 'Sluiten';

  @override
  String get onboardingAveragePrice => 'Gemiddelde prijs';

  @override
  String get onboardingPerMonth => '/MAAND';

  @override
  String get onboardingPerYear => '/JAAR';

  @override
  String get onboardingMeasurementTipFloor => 'Vloer (l x b)';

  @override
  String get onboardingMeasurementTipFloorDesc =>
      'Meet voor een vloer de lengte en breedte (l x b).';

  @override
  String get onboardingMeasurementTipWall => 'Muur (l x h)';

  @override
  String get onboardingMeasurementTipWallDesc =>
      'Meet voor een muur de lengte en hoogte (l x h).';

  @override
  String get onboardingMeasurementTipCeiling => 'Plafond (l x b)';

  @override
  String get onboardingMeasurementTipCeilingDesc =>
      'Meet voor een plafond de lengte en breedte (l x b).';

  @override
  String get onboardingMeasurementTipNote =>
      'Vul de maten in meters in en de app berekent automatisch de oppervlakte in m².';

  @override
  String get faqBehangenQ1 => 'Hoe lang duurt behangen gemiddeld?';

  @override
  String get faqBehangenA1 =>
      'Het behangen van een kamer duurt gemiddeld een halve tot een hele dag, afhankelijk van de grootte van de ruimte en het aantal hoeken en nissen.';

  @override
  String get faqBehangenQ2 => 'Hoeveel behang rollen heb ik nodig?';

  @override
  String get faqBehangenA2 =>
      'Bereken de omtrek van de kamer (in meters) vermenigvuldigd met de hoogte. Een standaard behangrol dekt circa 5 m². Vergeet niet 10% extra te bestellen voor snijverlies.';

  @override
  String get faqBehangenQ3 => 'Welk gereedschap heb ik nodig?';

  @override
  String get faqBehangenA3 =>
      'Voor behangen heeft u nodig: een behangtafel, behangborstel, behanglijm roller, meetlint, waterpas, potlood, schaar of behangmes en sponzen om overtollig lijm weg te vegen.';

  @override
  String get faqBehangenQ4 => 'Welk behangplaksel moet ik gebruiken?';

  @override
  String get faqBehangenA4 =>
      'Dit hangt af van het type behang. Voor vliesbehang gebruikt u een speciale vliesbehanglijm; voor gewoon behang een universeel behangplaksel. Controleer altijd de verpakking.';

  @override
  String get faqBehangenQ5 => 'Hoe bereid ik de muur voor?';

  @override
  String get faqBehangenA5 =>
      'Verwijder oud behang grondig en maak de muur schoon. Laat de muur volledig drogen. Breng daarna een laag behanggrond (primer) aan voor een betere hechting.';

  @override
  String get faqBehangenQ6 => 'Hoe start ik in de kamer?';

  @override
  String get faqBehangenA6 =>
      'Begin altijd naast een raam of deur. Zet een verticale lijn met een waterpas als startpunt om scheve banen te voorkomen.';

  @override
  String get faqBehangenQ7 => 'Hoe doe ik hoeken correct?';

  @override
  String get faqBehangenA7 =>
      'Bij binnenhoeken laat u de baan 1–2 cm om de hoek doorlopen. Bij buitenhoeken knijpt u de baan minimaal 2 cm om de hoek.';

  @override
  String get faqBehangenQ8 => 'Kan ik dit als beginner doen?';

  @override
  String get faqBehangenA8 =>
      'Ja, met de juiste voorbereiding is behangen prima zelfstandig te doen. Begin met een eenvoudig effen behang zonder grote patronen.';

  @override
  String get faqBehangenQ9 => 'Hoe voorkom ik luchtbellen?';

  @override
  String get faqBehangenA9 =>
      'Strijk het behang direct na het aanbrengen van boven naar beneden glad met een behangborstel. Werk eventuele bellen naar de randen toe.';

  @override
  String get faqBehangenQ10 =>
      'Hoe lang wachten voordat de kamer in gebruik kan?';

  @override
  String get faqBehangenA10 =>
      'Laat het behang minimaal 24 uur drogen. Zorg voor voldoende ventilatie maar vermijd direct tocht.';

  @override
  String get faqBehangenQ11 => 'Wat zijn veelgemaakte fouten bij behangen?';

  @override
  String get faqBehangenA11 =>
      'De meest voorkomende fouten zijn: de muur niet goed voorbereiden, behang te nat maken, en luchtbellen niet uitstrijken.';

  @override
  String get faqBehangenQ12 => 'Hoeveel extra behang moet ik bestellen?';

  @override
  String get faqBehangenA12 =>
      'Bestel altijd 10–15% extra. Bij patronen moet u extra rekening houden met de patroonherhaling (rapporthoogte).';

  @override
  String get faqBehangenQ13 => 'Wat doe ik als het behang loslaat?';

  @override
  String get faqBehangenA13 =>
      'Druk de losse rand omhoog, breng verse behanglijm aan met een kwastje en veeg overtollige lijm weg met een vochtige spons.';

  @override
  String get faqBehangenQ14 => 'Welke bouwmarkt raadt u aan?';

  @override
  String get faqBehangenA14 =>
      'Voor particulieren raden wij Gamma en Hornbach aan voor een ruim aanbod behang en toebehoren. Professionele vakmannen kunnen terecht bij groothandels zoals Bouwmaat en Jongeneel.';

  @override
  String get faqBehangenQ15 =>
      'Moet ik oude verf verwijderen voordat ik ga behangen?';

  @override
  String get faqBehangenA15 =>
      'Niet altijd. Zorg ervoor dat de verflaag stevig vastzit, schoon en vetvrij is. Loszittende verf moet wel worden verwijderd.';

  @override
  String get faqBehangenQ16 => 'Kan ik over bestaand behang heen behangen?';

  @override
  String get faqBehangenA16 =>
      'Dit wordt meestal afgeraden. Verwijder oud behang voor het beste resultaat en een goede hechting van het nieuwe behang.';

  @override
  String get faqBehangenQ17 => 'Welke temperatuur is ideaal voor behangen?';

  @override
  String get faqBehangenA17 =>
      'De ideale kamertemperatuur ligt tussen 18°C en 22°C. Vermijd extreme kou, hitte en tocht tijdens het drogen.';

  @override
  String get faqBehangenQ18 => 'Hoe snijd ik behang netjes af?';

  @override
  String get faqBehangenA18 =>
      'Gebruik een scherp behangmes en een liniaal of spatel als geleider. Vervang het mes regelmatig voor strakke sneden.';

  @override
  String get faqBehangenQ19 => 'Hoe maak ik behang schoon?';

  @override
  String get faqBehangenA19 =>
      'Afwasbaar behang kan voorzichtig worden gereinigd met een vochtige doek. Controleer altijd eerst de onderhoudsinstructies van de fabrikant.';

  @override
  String get faqBehangenQ20 => 'Hoe lang gaat behang gemiddeld mee?';

  @override
  String get faqBehangenA20 =>
      'Kwaliteitsbehang kan bij normaal gebruik 10 tot 15 jaar meegaan, afhankelijk van de ruimte en de onderhoudsomstandigheden.';

  @override
  String get faqPainterQ1 => 'Hoe lang duurt het verven gemiddeld?';

  @override
  String get faqPainterA1 =>
      'Een gemiddelde kamer verven (muren + plafond) duurt 4–8 uur, inclusief voorbereiding. Rekening houdend met droogtijd tussenlagen kan het 1–2 dagen duren.';

  @override
  String get faqPainterQ2 => 'Hoeveel verf heb ik nodig?';

  @override
  String get faqPainterA2 =>
      'Een liter verf dekt gemiddeld 10–12 m² per laag. Meet het te verven oppervlak en reken op 2 lagen. Bestel 10% extra als reserve.';

  @override
  String get faqPainterQ3 => 'Welk gereedschap heb ik nodig?';

  @override
  String get faqPainterA3 =>
      'U heeft nodig: verfroller(s), kwast(en), verfbak, afplaktape, schuurpapier, dekkleed en eventueel een ladder.';

  @override
  String get faqPainterQ4 => 'Hoe bereid ik de muur voor?';

  @override
  String get faqPainterA4 =>
      'Plamuur eventuele scheuren en gaatjes, schuur ruw, verwijder stof en breng een laag primer aan op nieuwe of erg absorberende muren.';

  @override
  String get faqPainterQ5 => 'Hoe lang moet ik wachten tussen lagen?';

  @override
  String get faqPainterA5 =>
      'Wacht minimaal 2–4 uur tussen lagen (zie droogtijd op de verpakking). Volledige uitharding duurt 24–48 uur.';

  @override
  String get faqPainterQ6 => 'Kan ik dit als beginner doen?';

  @override
  String get faqPainterA6 =>
      'Ja, verven is goed zelfstandig te doen. Neem de tijd voor goede voorbereiding en afplakken, dan is het resultaat uitstekend.';

  @override
  String get faqPainterQ7 => 'Welke verf kies ik voor binnenmuren?';

  @override
  String get faqPainterA7 =>
      'Kies muurverf op waterbasis voor binnenmuren. Let op de afwasbaarheidscategorie (1–5 sterren). Voor vochtige ruimten kiest u badkamerverf.';

  @override
  String get faqPainterQ8 => 'Wat zijn veelgemaakte fouten bij verven?';

  @override
  String get faqPainterA8 =>
      'Te dunne lagen aanbrengen, onvoldoende drogen tussen lagen, slecht afplakken en de ondergrond niet schoonmaken zijn de meest voorkomende fouten.';

  @override
  String get faqPainterQ9 => 'Moet ik primer gebruiken?';

  @override
  String get faqPainterA9 =>
      'Primer verbetert de hechting en zorgt voor een gelijkmatigere afwerking, vooral op nieuwe of gerepareerde oppervlakken.';

  @override
  String get faqPainterQ10 => 'Kan ik over oude verf verven?';

  @override
  String get faqPainterA10 =>
      'Ja, als de oude verf in goede staat is. Reinig en schuur het oppervlak licht eerst.';

  @override
  String get faqPainterQ11 => 'Welke temperatuur is het beste voor verven?';

  @override
  String get faqPainterA11 =>
      'De meeste verven werken het beste tussen 10°C en 25°C.';

  @override
  String get faqPainterQ12 => 'Hoe voorkom ik rolsporen?';

  @override
  String get faqPainterA12 =>
      'Gebruik gelijkmatige druk en houd een natte rand aan tijdens het verven.';

  @override
  String get faqPainterQ13 => 'Moet ik meubilair verwijderen?';

  @override
  String get faqPainterA13 =>
      'Schuif meubilair weg van de muren en dek het af met beschermende doeken.';

  @override
  String get faqPainterQ14 => 'Hoe maak ik verfkwasten schoon?';

  @override
  String get faqPainterA14 =>
      'Verf op waterbasis kan worden gereinigd met water. Verf op oplosmiddelbasis vereist verfverdunner.';

  @override
  String get faqPainterQ15 => 'Kan ik schilderen bij vochtige omstandigheden?';

  @override
  String get faqPainterA15 =>
      'Hoge luchtvochtigheid kan het drogen vertragen en de afwerking beïnvloeden. Ventileer de kamer goed.';

  @override
  String get faqPainterQ16 => 'Hoeveel lagen worden aanbevolen?';

  @override
  String get faqPainterA16 =>
      'Twee lagen bieden de beste dekking en duurzaamheid.';

  @override
  String get faqPainterQ17 => 'Welke afwerking moet ik kiezen?';

  @override
  String get faqPainterA17 =>
      'Mat verbergt onvolkomenheden, satijn is duurzaam en glans is zeer goed afwasbaar.';

  @override
  String get faqPainterQ18 => 'Hoe lang gaat verf mee?';

  @override
  String get faqPainterA18 =>
      'Ongeopende verf kan meerdere jaren meegaan bij goede bewaring.';

  @override
  String get faqPainterQ19 => 'Kan ik eerst het plafond schilderen?';

  @override
  String get faqPainterA19 =>
      'Ja, schilder altijd het plafond voor de muren om spatten te voorkomen.';

  @override
  String get faqPainterQ20 => 'Hoe bereken ik schilderkosten?';

  @override
  String get faqPainterA20 =>
      'Vermenigvuldig het wandoppervlak met de verfdekkende werking en materiaalkosten.';

  @override
  String get faqMuurSauzenQ1 =>
      'Welke latex gebruik ik in een badkamer of keuken?';

  @override
  String get faqMuurSauzenA1 =>
      'Gebruik in een badkamer of keuken vochtwerend latex. Deze is beter bestand tegen vocht en schimmel. Gewone latex kan in vochtige ruimtes sneller gaan bladderen of schimmelen.';

  @override
  String get faqMuurSauzenQ2 => 'Moet ik de muur eerst ontvetten?';

  @override
  String get faqMuurSauzenA2 =>
      'Ja, bij vette of vuile plekken (bijvoorbeeld in een keuken) eerst reinigen met allesreiniger/ontvetter — draag daarbij handschoenen — daarna laten drogen voor je gaat schilderen.';

  @override
  String get faqMuurSauzenQ3 => 'Wanneer gebruik ik voorstrijk?';

  @override
  String get faqMuurSauzenA3 =>
      'Gebruik voorstrijk op een zuigende, nieuwe of sterk gerepareerde ondergrond, zodat de verf gelijkmatig dekt en minder snel vlekt.';

  @override
  String get faqMuurSauzenQ4 =>
      'Hoe werk ik gaten en scheuren weg voor het schilderen?';

  @override
  String get faqMuurSauzenA4 =>
      'Vul gaten en scheuren met muurvuller of plamuur, laat drogen en schuur glad. Kit kleine kieren af met acrylaatkit. Zo voorkom je dat oneffenheden door de verf zichtbaar blijven.';

  @override
  String get faqMuurSauzenQ5 => 'Hoeveel deklagen zijn nodig?';

  @override
  String get faqMuurSauzenA5 =>
      'Reken op minimaal twee deklagen voor een egaal resultaat; bij een kleurwisseling (bijvoorbeeld van donker naar licht) kan een derde laag nodig zijn.';

  @override
  String get faqMuurSauzenQ6 => 'Moet ik schuren voor het schilderen?';

  @override
  String get faqMuurSauzenA6 =>
      'Licht schuren is onderdeel van de voorbereiding, vooral bij een oneffen of glanzende ondergrond, zodat de verf beter hecht. Draag hierbij een stofmasker. Bij grotere oppervlakken kan een schuurmachine het werk versnellen.';

  @override
  String get faqMuurSauzenQ7 =>
      'Hoe bereken ik hoeveel liter verf ik nodig heb?';

  @override
  String get faqMuurSauzenA7 =>
      'De app berekent dit automatisch op basis van je ingevoerde m², het aantal deklagen en het dekkend vermogen van het gekozen product.';

  @override
  String get faqMuurSauzenQ8 =>
      'Kan ik een kwast gebruiken in plaats van een roller?';

  @override
  String get faqMuurSauzenA8 =>
      'Voor grote vlakken is een roller sneller en gelijkmatiger; een kwast gebruik je voor hoeken, randen en bij de plint.';

  @override
  String get faqMuurSauzenQ9 => 'Moet ik de verf laten drogen tussen de lagen?';

  @override
  String get faqMuurSauzenA9 =>
      'Ja, volg altijd de droog- en overschildertijd op de verpakking van de gebruikte verf.';

  @override
  String get faqMuurSauzenQ10 => 'Kan ik een muur sauzen zonder voorstrijk?';

  @override
  String get faqMuurSauzenA10 =>
      'Op een goed hechtende, niet zuigende ondergrond kan het soms zonder, maar voorstrijk verbetert de hechting en het resultaat. Volg het productadvies.';

  @override
  String get faqPlafondSauzenQ1 =>
      'Welke latex gebruik ik in een badkamer of keuken?';

  @override
  String get faqPlafondSauzenA1 =>
      'Gebruik in een badkamer of keuken vochtwerend latex. Deze is beter bestand tegen vocht en schimmel. Gewone latex kan in vochtige ruimtes sneller gaan bladderen of schimmelen.';

  @override
  String get faqPlafondSauzenQ2 => 'Heb ik een verlengsteel nodig?';

  @override
  String get faqPlafondSauzenA2 =>
      'Een verlengsteel op de roller is aan te raden zodat je het plafond zonder trap of met minder traplopen kunt bereiken.';

  @override
  String get faqPlafondSauzenQ3 => 'Moet ik meubels en vloer afdekken?';

  @override
  String get faqPlafondSauzenA3 =>
      'Ja, dek de vloer en meubels af met afdekfolie; plafondwerk spat sneller dan muurwerk.';

  @override
  String get faqPlafondSauzenQ4 =>
      'Hoe werk ik gaten en scheuren weg voor het schilderen?';

  @override
  String get faqPlafondSauzenA4 =>
      'Vul gaten en scheuren met muurvuller of plamuur, laat drogen en schuur glad. Zo voorkom je dat oneffenheden door de verf zichtbaar blijven.';

  @override
  String get faqPlafondSauzenQ5 => 'Hoeveel deklagen zijn nodig?';

  @override
  String get faqPlafondSauzenA5 =>
      'Ook hier reken je op minimaal twee deklagen voor een egale, dekkende afwerking.';

  @override
  String get faqPlafondSauzenQ6 =>
      'Welke rollerdikte is geschikt voor een plafond?';

  @override
  String get faqPlafondSauzenA6 =>
      'Een roller met korte tot middellange vacht werkt goed op een glad plafond; bij een ruw of structuurplafond kies je een roller met langere vacht.';

  @override
  String get faqPlafondSauzenQ7 => 'Hoe voorkom ik spatten en druppels?';

  @override
  String get faqPlafondSauzenA7 =>
      'Werk met een goed uitgerolde roller (niet te veel verf) en rol in rustige, overlappende banen.';

  @override
  String get faqPlafondSauzenQ8 => 'Moet ik eerst voorstrijken?';

  @override
  String get faqPlafondSauzenA8 =>
      'Bij een nieuwe of zuigende ondergrond wel; bij een al geschilderd plafond in goede staat is dit meestal niet nodig.';

  @override
  String get faqPlafondSauzenQ9 =>
      'Wat als er vlekken zitten, bijvoorbeeld van water of nicotine?';

  @override
  String get faqPlafondSauzenA9 =>
      'Behandel deze eerst met een geschikte isolerende grondverf, anders kunnen ze na het schilderen weer doorschijnen.';

  @override
  String get faqPlafondSauzenQ10 =>
      'Moet ik een plafond altijd twee keer sauzen?';

  @override
  String get faqPlafondSauzenA10 =>
      'Voor een egaal resultaat zijn twee lagen vrijwel altijd nodig. Bij een sterk zuigende of donkere ondergrond kan een extra laag nodig zijn.';

  @override
  String get faqBehangenDoc4Q1 =>
      'Vlies- of papierbehang, wat is het verschil?';

  @override
  String get faqBehangenDoc4A1 =>
      'Bij vliesbehang gaat de lijm op de muur en hang je het behang droog op; bij papierbehang gaat de lijm op het behang zelf, dat dan nog even moet intrekken.';

  @override
  String get faqBehangenDoc4Q2 => 'Moet ik de muur eerst egaliseren?';

  @override
  String get faqBehangenDoc4A2 =>
      'Ja, de muur moet egaal en schoon zijn voordat je gaat behangen. Werk gaten en scheuren weg met muurvuller of egalisatiemiddel, laat drogen en schuur glad.';

  @override
  String get faqBehangenDoc4Q3 => 'Heb ik een behangtafel nodig?';

  @override
  String get faqBehangenDoc4A3 =>
      'Alleen bij traditioneel papierbehang, om het behang in te smeren en te laten intrekken. Bij vliesbehang is een behangtafel niet nodig.';

  @override
  String get faqBehangenDoc4Q4 => 'Welke rolbreedte kies ik?';

  @override
  String get faqBehangenDoc4A4 =>
      'Vliesbehang is er in 53 cm en 70 cm breed. Kies op basis van de muurhoogte en het patroon. Reken met de werkelijke rolbreedte.';

  @override
  String get faqBehangenDoc4Q5 => 'Wat is rapportverlies bij patroonbehang?';

  @override
  String get faqBehangenDoc4A5 =>
      'Bij patroonbehang moet je elke baan uitlijnen op het patroon, waardoor je stukken moet bijknippen. Reken op circa 10% extra materiaal.';

  @override
  String get faqBehangenDoc4Q6 => 'Welke lijm gebruik ik?';

  @override
  String get faqBehangenDoc4A6 =>
      'Dat hangt af van het behangtype en gewicht; volg het lijmadvies op de rol behang of de verpakking van de lijm. Gebruik handschoenen bij langdurig contact met lijm.';

  @override
  String get faqBehangenDoc4Q7 => 'Hoe ga ik om met hoeken en stopcontacten?';

  @override
  String get faqBehangenDoc4A7 =>
      'Schakel bij stopcontacten en schakelaars altijd eerst de stroom uit, en werk in hoeken met kleinere, overlappende stroken voor een strakke aansluiting.';

  @override
  String get faqBehangenDoc4Q8 => 'Wat doe ik bij tocht tijdens het drogen?';

  @override
  String get faqBehangenDoc4A8 =>
      'Vermijd sterke tocht (open ramen/deuren) tijdens het drogen; dat kan naden laten opstaan of loslaten.';

  @override
  String get faqBehangenDoc4Q9 => 'Kan ik oud behang gewoon overbehangen?';

  @override
  String get faqBehangenDoc4A9 =>
      'Dat wordt afgeraden; gebruik bij het verwijderen van geschikt oud behang eventueel een behangafstomer en start met een schone, vlakke ondergrond.';

  @override
  String get faqBehangenDoc4Q10 =>
      'Hoe voorkom ik luchtbellen onder het behang?';

  @override
  String get faqBehangenDoc4A10 =>
      'Werk in kleine stukken, strijk het behang goed aan met een behangborstel of naadroller en zorg dat de lijm gelijkmatig is aangebracht.';

  @override
  String get faqKozijnSchilderenQ1 => 'Moet ik eerst ontvetten?';

  @override
  String get faqKozijnSchilderenA1 =>
      'Ja, ontvetten is de eerste stap, zeker bij kozijnen en deuren die vaak worden aangeraakt. Draag hierbij handschoenen.';

  @override
  String get faqKozijnSchilderenQ2 => 'Wanneer gebruik ik grondverf?';

  @override
  String get faqKozijnSchilderenA2 =>
      'Gebruik grondverf op kaal hout, of wanneer je van een donkere naar een lichte kleur gaat.';

  @override
  String get faqKozijnSchilderenQ3 =>
      'Hoe herken ik een loodhoudende oude verflaag?';

  @override
  String get faqKozijnSchilderenA3 =>
      'Bij twijfel over oud houtwerk: ga niet zelf droog machinaal schuren, maar laat de laag eerst beoordelen of testen. Draag bij het werken met oude verflagen sowieso een stofmasker (FFP2/FFP3) en handschoenen.';

  @override
  String get faqKozijnSchilderenQ4 => 'Hoeveel afwerklagen zijn nodig?';

  @override
  String get faqKozijnSchilderenA4 =>
      'Reken op minimaal twee afwerklagen na de grondverf voor een duurzaam resultaat.';

  @override
  String get faqKozijnSchilderenQ5 => 'Moet ik schuren tussen de lagen?';

  @override
  String get faqKozijnSchilderenA5 =>
      'Licht tussentijds schuren zorgt voor een gladdere, egalere eindlaag; volg hierbij het productadvies. Bij grotere oppervlakken kan een schuurmachine het werk versnellen.';

  @override
  String get faqKozijnSchilderenQ6 =>
      'Kan ik verf en lak door elkaar gebruiken?';

  @override
  String get faqKozijnSchilderenA6 =>
      'Nee, gebruik één verfsysteem van begin tot eind; het mengen van verschillende systemen kan hechtingsproblemen geven.';

  @override
  String get faqKozijnSchilderenQ7 => 'Hoe repareer ik gaten met houtvuller?';

  @override
  String get faqKozijnSchilderenA7 =>
      'Vul het gat of de beschadiging met houtvuller, laat drogen volgens het productvoorschrift en schuur daarna glad voor je grondt.';

  @override
  String get faqKozijnSchilderenQ8 =>
      'Moet ik de deur uit de scharnieren halen om te schilderen?';

  @override
  String get faqKozijnSchilderenA8 =>
      'Dat is niet altijd nodig, maar het kan het werk wel makkelijker maken. Zorg in ieder geval voor een stabiele ondergrond en voldoende ruimte.';

  @override
  String get faqKozijnSchilderenQ9 =>
      'Kan ik buiten schilderen bij regen of kou?';

  @override
  String get faqKozijnSchilderenA9 =>
      'Nee, schilder buiten bij droog weer en een temperatuur die past bij het verfsysteem; vocht en kou beïnvloeden het drogen en de hechting.';

  @override
  String get faqKozijnSchilderenQ10 =>
      'Hoe lang moet ik wachten voor ik de deur weer gebruik?';

  @override
  String get faqKozijnSchilderenA10 =>
      'Volg de droogtijd van de laatste afwerklaag op de verpakking voordat je de deur weer intensief gebruikt.';

  @override
  String get faqRadiatorSchilderenQ1 => 'Moet de radiator koud zijn?';

  @override
  String get faqRadiatorSchilderenA1 =>
      'Ja, laat de radiator volledig afkoelen en de verwarming uit voordat je begint.';

  @override
  String get faqRadiatorSchilderenQ2 =>
      'Moet ik ontvetten voor het schilderen?';

  @override
  String get faqRadiatorSchilderenA2 =>
      'Ja, ontvet de radiator eerst, zeker bij een laag die vaak warm wordt — vet en stof hechten daar sneller. Draag hierbij handschoenen.';

  @override
  String get faqRadiatorSchilderenQ3 => 'Wat doe ik bij roest?';

  @override
  String get faqRadiatorSchilderenA3 =>
      'Behandel roestplekken voordat je verft, bijvoorbeeld met een geschikt roestomzettend of -werend middel. Draag hierbij handschoenen en, bij het schuren van roest, een stofmasker.';

  @override
  String get faqRadiatorSchilderenQ4 => 'Welke grondverf (primer) gebruik ik?';

  @override
  String get faqRadiatorSchilderenA4 =>
      'Gebruik een grondverf (primer) voor metaal die past bij het gekozen verfsysteem, vooral op kale of geroeste plekken.';

  @override
  String get faqRadiatorSchilderenQ5 =>
      'Welke lak is geschikt voor een radiator?';

  @override
  String get faqRadiatorSchilderenA5 =>
      'Gebruik radiatorlak; deze is hittebestendig en vergeelt minder snel dan gewone muurverf of houtlak.';

  @override
  String get faqRadiatorSchilderenQ6 => 'Hoeveel lagen zijn nodig?';

  @override
  String get faqRadiatorSchilderenA6 =>
      'Meestal is één laag grondverf (waar nodig) en één tot twee lagen radiatorlak voldoende; volg het productadvies.';

  @override
  String get faqRadiatorSchilderenQ7 =>
      'Hoe lang moet de verf drogen voor ik de verwarming weer aanzet?';

  @override
  String get faqRadiatorSchilderenA7 =>
      'Houd de droogtijd van de radiatorlak aan zoals vermeld op de verpakking voordat je de verwarming weer gebruikt.';

  @override
  String get faqRadiatorSchilderenQ8 =>
      'Kan ik de radiator schilderen zonder hem te demonteren?';

  @override
  String get faqRadiatorSchilderenA8 =>
      'Ja, dat kan met een radiatorroller en -kwast achter de leidingen; demonteren is meestal niet nodig.';

  @override
  String get faqRadiatorSchilderenQ9 => 'Moet ik de muur erachter afdekken?';

  @override
  String get faqRadiatorSchilderenA9 =>
      'Ja, dek de muur en vloer achter en onder de radiator af met afdekfolie en afplaktape.';

  @override
  String get faqRadiatorSchilderenQ10 =>
      'Welke kwast gebruik ik voor de radiator?';

  @override
  String get faqRadiatorSchilderenA10 =>
      'Een radiatorroller voor de grote vlakken en een smalle kwast voor de moeilijk bereikbare plekken achter de leidingen.';

  @override
  String get faqStopcontactQ1 => 'Geaard of ongeaard stopcontact?';

  @override
  String get faqStopcontactA1 =>
      'Geaard: randaarde, nodig voor apparaten met geaarde stekker (wasmachine, vaatwasser, magnetron). In natte ruimtes (badkamer, keuken, washok, garage, buiten) is aarding verplicht. Ongeaard: geen randaarde, alleen voor dubbel geïsoleerde apparaten. Kies altijd geaard als je twijfelt of als de ruimte vochtig is.';

  @override
  String get faqStopcontactQ2 => 'Moet ik de stroom uitzetten?';

  @override
  String get faqStopcontactA2 =>
      'Ja. Schakel de groep uit en controleer met een tweepolige spanningstester of de installatie echt spanningsloos is. Werk nooit onder spanning.';

  @override
  String get faqStopcontactQ3 => 'Hoeveel inbouwdozen heb ik nodig?';

  @override
  String get faqStopcontactA3 =>
      '1 inbouwdoos per stopcontact. Dubbel: dubbele doos of twee enkele.';

  @override
  String get faqStopcontactQ4 => 'Hoe sluit ik het stopcontact aan?';

  @override
  String get faqStopcontactA4 =>
      'Sluit fase, nul en beschermingsleiding aan volgens het aansluitschema van het product en de geldende installatievoorschriften. De bedrading is meestal al aanwezig in de muur. Gebruik lasklemmen of kroonsteen voor de verbinding. In vochtige ruimtes is een aardlekschakelaar (30 mA) verplicht.';

  @override
  String get faqStopcontactQ5 =>
      'Kan ik een stopcontact plaatsen op een bestaande groep?';

  @override
  String get faqStopcontactA5 =>
      'Ja, mits de groep niet overbelast raakt. Controleer de totale belasting van de groep en schakel bij twijfel een installateur in.';

  @override
  String get faqStopcontactQ6 => 'Wat als het stopcontact niet werkt?';

  @override
  String get faqStopcontactA6 =>
      'Schakel spanningsloos en controleer aansluiting, bedrading en beveiliging. Bij twijfel niet opnieuw inschakelen, maar een vakbekwaam persoon inschakelen.';

  @override
  String get faqStopcontactQ7 => 'Welke veiligheidsmaatregelen?';

  @override
  String get faqStopcontactA7 =>
      'Nooit onder spanning werken. Gebruik geschikt meetgereedschap, passende bescherming en een veilige werkmethode. Gebruik een leidingzoeker voordat je boort.';

  @override
  String get faqStopcontactQ8 => 'Meest voorkomende fouten?';

  @override
  String get faqStopcontactA8 =>
      'Verkeerde aansluiting of component, beschermingsleiding vergeten, niet controleren op spanningsloosheid, onvoldoende bevestiging of onjuiste doos. In vochtige ruimtes: ongeaard stopcontact plaatsen terwijl aarding verplicht is.';

  @override
  String get faqStopcontactQ9 => 'Mag ik dit zelf doen?';

  @override
  String get faqStopcontactA9 =>
      'Ja, mits je de stroom uitschakelt, een spanningstester gebruikt en de aansluitvoorschriften volgt. Bij twijfel over aarding of bij aanpassingen aan de groepenkast: schakel een erkend installateur in.';

  @override
  String get faqStopcontactQ10 => 'Beste tip?';

  @override
  String get faqStopcontactA10 =>
      'Maak alleen wanneer veilig een foto of markering van de oorspronkelijke situatie. Vertrouw nooit uitsluitend op de foto; controleer de bedrading met meetgereedschap en het aansluitschema. Gebruik in vochtige ruimtes altijd een geaard stopcontact met aardlekschakelaar.';

  @override
  String get faqVerlichtingQ1 => 'Welk type lamp of armatuur?';

  @override
  String get faqVerlichtingA1 =>
      'Binnen is een plafondlamp (hanglamp of opbouw) de meest voorkomende keuze. In vochtige ruimtes zoals badkamer en keuken is een vochtbestendige armatuur met een passende IP-waarde nodig (bijvoorbeeld IP44 of hoger).';

  @override
  String get faqVerlichtingQ2 => 'Moet ik de stroom uitzetten?';

  @override
  String get faqVerlichtingA2 =>
      'Ja. Schakel de groep uit en controleer met een tweepolige spanningstester of de installatie spanningsloos is.';

  @override
  String get faqVerlichtingQ3 => 'Hoeveel lichtpunten heb ik nodig?';

  @override
  String get faqVerlichtingA3 =>
      'Dat hangt af van ruimte, functie en gewenste lichtsterkte. Er is geen universeel aantal.';

  @override
  String get faqVerlichtingQ4 => 'Hoe monteer ik het armatuur?';

  @override
  String get faqVerlichtingA4 =>
      'Bevestig de montagebeugel volgens fabrikant, sluit de bedrading volgens schema aan en monteer het armatuur. De bedrading is meestal al aanwezig in het plafond. Gebruik kroonsteen of lasklemmen voor de verbinding. Aarding alleen aansluiten wanneer het armatuur of installatiesysteem dit vereist.';

  @override
  String get faqVerlichtingQ5 =>
      'Hoe kies ik de juiste kleurtemperatuur voor mijn ruimte?';

  @override
  String get faqVerlichtingA5 =>
      'Kies een warme kleur (2700-3000K) voor woon- en slaapkamers, en een koelere kleur (4000K of hoger) voor werkruimtes zoals keuken en badkamer. Volg de aanbevelingen van de fabrikant.';

  @override
  String get faqVerlichtingQ6 => 'Wat als de lamp niet brandt?';

  @override
  String get faqVerlichtingA6 =>
      'Schakel eerst spanningsloos. Controleer aansluiting, schakelaar en beveiliging volgens een veilige meetprocedure. Bij twijfel een installateur inschakelen.';

  @override
  String get faqVerlichtingQ7 => 'Welke veiligheidsmaatregelen?';

  @override
  String get faqVerlichtingA7 =>
      'Nooit onder spanning werken. Gebruik een stabiele trap en passende oog- en handbescherming. Gebruik een leidingzoeker voordat je boort.';

  @override
  String get faqVerlichtingQ8 => 'Meest voorkomende fouten?';

  @override
  String get faqVerlichtingA8 =>
      'Verkeerde armatuur voor vochtige ruimte, slechte verbinding, onjuiste montage of een beschermingsleiding niet correct aansluiten wanneer die vereist is.';

  @override
  String get faqVerlichtingQ9 => 'Waar moet ik op letten in vochtige ruimtes?';

  @override
  String get faqVerlichtingA9 =>
      'Gebruik een armatuur met passende IP-waarde (minimaal IP44 voor badkamer en keuken). Zorg voor een goede afdichting en sluit de aarding correct aan wanneer het systeem dat vereist.';

  @override
  String get faqVerlichtingQ10 => 'Beste tip?';

  @override
  String get faqVerlichtingA10 =>
      'Kies lichtkleur en dimbaarheid passend bij de ruimte. Controleer voor aankoop of dimmer, lamp en armatuur compatibel zijn. Gebruik in vochtige ruimtes altijd een passende IP-waarde.';

  @override
  String get faqStroomleidingQ1 => 'Welke kabel of draad kiezen?';

  @override
  String get faqStroomleidingA1 =>
      'Het leidingtype en de aderdoorsnede hangen af van toepassing, aanlegwijze, beveiliging, belasting en de geldende installatievoorschriften. VD-draad wordt in een daarvoor geschikt leidingsysteem toegepast; kabeltypen zoals XMVK hebben hun eigen toepassingsvoorwaarden.';

  @override
  String get faqStroomleidingQ2 => 'Moet ik de stroom uitzetten?';

  @override
  String get faqStroomleidingA2 =>
      'Ja. Schakel de groep uit en controleer met geschikte meetapparatuur of het werkgebied spanningsloos is.';

  @override
  String get faqStroomleidingQ3 => 'Hoeveel meter heb ik nodig?';

  @override
  String get faqStroomleidingA3 =>
      'Meet de volledige route en houd extra lengte voor bochten en aansluitpunten. 10% extra is een praktische richtwaarde, maar complexe routes kunnen meer vragen.';

  @override
  String get faqStroomleidingQ4 => 'Hoe leg ik de leiding aan?';

  @override
  String get faqStroomleidingA4 =>
      'Teken de route af en controleer eerst op bestaande leidingen met een leidingzoeker. Gebruik voor frezen en boren geschikte apparatuur en stofafzuiging. De exacte sleufdiepte en uitvoering moeten passen bij het leidingsysteem, de wandconstructie en de voorschriften. Plaats buis of leiding en trek draden volgens het gekozen systeem. Zaag buis op maat met een ijzerzaag.';

  @override
  String get faqStroomleidingQ5 =>
      'Wat is het verschil tussen VD-draad en XMVK-kabel?';

  @override
  String get faqStroomleidingA5 =>
      'VD-draad is een losse ader die in een buis of goot wordt gelegd. XMVK-kabel is een complete kabel met aders en isolatie, geschikt voor directe installatie in droge ruimtes. Volg de installatievoorschriften voor de juiste toepassing.';

  @override
  String get faqStroomleidingQ6 => 'Wat als een leiding beschadigd raakt?';

  @override
  String get faqStroomleidingA6 =>
      'Schakel spanningsloos. Beschadigde leidingen mogen niet zomaar worden weggewerkt; herstel volgens een passende en normconforme methode.';

  @override
  String get faqStroomleidingQ7 => 'Welke veiligheidsmaatregelen?';

  @override
  String get faqStroomleidingA7 =>
      'Werk spanningsloos, controleer vooraf op bestaande leidingen en constructiedelen met een leidingzoeker en draag passende bescherming. Vermijd onveilige diepe of lange sleuven in dragende wanden; laat constructieve twijfel beoordelen.';

  @override
  String get faqStroomleidingQ8 => 'Meest voorkomende fouten?';

  @override
  String get faqStroomleidingA8 =>
      'Verkeerde leiding of aderdoorsnede, te scherpe bochten, slechte bevestiging, onvoldoende trekvoorziening, bestaande leidingen raken en onvoldoende controle voor het frezen.';

  @override
  String get faqStroomleidingQ9 => 'Mag ik in een dragende muur frezen?';

  @override
  String get faqStroomleidingA9 =>
      'Nee, diepe of lange horizontale sleuven in dragende wanden verminderen de constructieve sterkte. Laat een constructieve vraag altijd beoordelen door een deskundige.';

  @override
  String get faqStroomleidingQ10 => 'Beste tip?';

  @override
  String get faqStroomleidingA10 =>
      'Plan de route zorgvuldig en documenteer leidingen voordat je sleuven dichtzet. Gebruik bij toekomstige aanpassingen alleen voorzieningen die voor die toepassing zijn ontworpen.';

  @override
  String get faqKabelgootQ1 => 'Welk type kabelgoot?';

  @override
  String get faqKabelgootA1 =>
      'Zelfklevend: voor lichte kabels op een gladde, schone ondergrond. Met schroeven: voor zwaardere kabels, ruwere ondergronden of buitengebruik. Meest voorkomende maat binnenshuis: 20 × 12 mm tot 25 × 16 mm.';

  @override
  String get faqKabelgootQ2 => 'Moet ik de ondergrond voorbehandelen?';

  @override
  String get faqKabelgootA2 =>
      'Ja. Maak de ondergrond schoon, vetvrij en droog wanneer de fabrikant dat voorschrijft. Zelfklevende systemen vragen extra aandacht voor de ondergrond.';

  @override
  String get faqKabelgootQ3 => 'Hoeveel meter heb ik nodig?';

  @override
  String get faqKabelgootA3 =>
      'Meet de route en houd extra materiaal voor bochten, aansluitingen en zaagverlies. 10% extra is een praktische richtwaarde.';

  @override
  String get faqKabelgootQ4 => 'Hoe monteer ik de kabelgoot?';

  @override
  String get faqKabelgootA4 =>
      'Volg de montage-instructies van het systeem. Zaag recht en veilig op maat met een ijzerzaag en gebruik voor hoeken passende hulpstukken of een nette verstekmethode. Gebruik een stabiele trap bij werk op hoogte.';

  @override
  String get faqKabelgootQ5 => 'Hoeveel kabels mag ik in één kabelgoot leggen?';

  @override
  String get faqKabelgootA5 =>
      'Vul de kabelgoot niet te vol; houd ongeveer 40% vrije ruimte aan voor warmteafvoer en toekomstige kabels. Volg de fabrikantinstructies voor de maximale vulling.';

  @override
  String get faqKabelgootQ6 => 'Wat als de kabelgoot loslaat?';

  @override
  String get faqKabelgootA6 =>
      'Verwijder loszittend materiaal, reinig de ondergrond en herstel volgens de bevestigingsmethode van de fabrikant. Gebruik bij zwaardere belasting passende mechanische bevestiging.';

  @override
  String get faqKabelgootQ7 => 'Welke veiligheidsmaatregelen?';

  @override
  String get faqKabelgootA7 =>
      'Draag handschoenen en oogbescherming. Let op scherpe randen en gebruik een leidingzoeker voordat je boort.';

  @override
  String get faqKabelgootQ8 => 'Meest voorkomende fouten?';

  @override
  String get faqKabelgootA8 =>
      'Niet reinigen, verkeerde bevestiging voor de ondergrond, niet recht uitzetten, verkeerde maat en onvoldoende bevestigingspunten.';

  @override
  String get faqKabelgootQ9 => 'Kan ik de kabelgoot buiten gebruiken?';

  @override
  String get faqKabelgootA9 =>
      'Alleen als de kabelgoot geschikt is voor buitengebruik. Gebruik bij voorkeur schroefmontage in plaats van zelfklevend.';

  @override
  String get faqKabelgootQ10 => 'Beste tip?';

  @override
  String get faqKabelgootA10 =>
      'Gebruik bij hoeken passende hulpstukken of een nette verstekverbinding en werk de kabelgoot strak en recht uit.';

  @override
  String get faqRookmelderQ1 => 'Welk type rookmelder?';

  @override
  String get faqRookmelderA1 =>
      'Een optische rookmelder is voor veel woonruimtes een gangbare keuze. In een keuken kan een hittemelder geschikter zijn. Kies een product dat aan de relevante eisen voldoet.';

  @override
  String get faqRookmelderQ2 => 'Waar plaats ik de melder?';

  @override
  String get faqRookmelderA2 =>
      'Rijksoverheid adviseert rookmelders aan het plafond, bij voorkeur in de hal, minimaal 50 cm van muur of hoek en minimaal 30 cm van een lamp. Plaats niet vlak bij ventilatieopeningen of verwarming en volg de fabrikant.';

  @override
  String get faqRookmelderQ3 => 'Hoeveel melders heb ik nodig?';

  @override
  String get faqRookmelderA3 =>
      'In Nederland is op iedere woonverdieping een rookmelder verplicht. Het precieze aantal en de beste posities hangen af van de woning; volg de actuele wettelijke eisen en fabrikantvoorschriften.';

  @override
  String get faqRookmelderQ4 => 'Hoe monteer ik de melder?';

  @override
  String get faqRookmelderA4 =>
      'Bevestig de houder volgens de fabrikant, plaats de melder en test hem na montage. Gebruik passende pluggen en schroeven wanneer mechanische bevestiging nodig is.';

  @override
  String get faqRookmelderQ5 =>
      'Mag ik een rookmelder op een schuine wand of het plafond plaatsen?';

  @override
  String get faqRookmelderA5 =>
      'Volg de plaatsingsvoorschriften van de fabrikant en de wettelijke eisen. Bij een schuin plafond moet de melder op het hoogste punt worden geplaatst, tenzij de fabrikant anders aangeeft. Vermijd plaatsing in dode hoeken.';

  @override
  String get faqRookmelderQ6 => 'Wat bij valse meldingen?';

  @override
  String get faqRookmelderA6 =>
      'Controleer eerst de oorzaak. Reinig stof volgens de fabrikant en controleer plaatsing, ventilatie en vocht. Verplaats de melder alleen wanneer de nieuwe plaats aan de eisen voldoet.';

  @override
  String get faqRookmelderQ7 => 'Welke veiligheidsmaatregelen?';

  @override
  String get faqRookmelderA7 =>
      'Gebruik een stabiele trap en werk veilig. Test de melder na montage en volg de fabrikant. Gebruik een leidingzoeker voordat je in het plafond boort.';

  @override
  String get faqRookmelderQ8 => 'Meest voorkomende fouten?';

  @override
  String get faqRookmelderA8 =>
      'Verkeerde plaatsing, niet testen, lege of ontbrekende batterij, vervuiling en de melder niet vervangen wanneer de fabrikant het einde van de levensduur aangeeft.';

  @override
  String get faqRookmelderQ9 => 'Hoe test ik de melder?';

  @override
  String get faqRookmelderA9 =>
      'Test regelmatig met de testknop volgens de fabrikant, houd de melder stofvrij en volg de onderhouds- en vervangingsinstructies van het model.';

  @override
  String get faqRookmelderQ10 => 'Beste tip?';

  @override
  String get faqRookmelderA10 =>
      'Gebruik de testknop regelmatig en vervang batterij of volledige melder volgens de fabrikant. Houd rekening met de wettelijke plaatsingseisen.';

  @override
  String get faqVloertegelQ1 =>
      'Moet ik egaliseren, voorstrijken en ontvetten?';

  @override
  String get faqVloertegelA1 =>
      'Ja, controleer de vlakheid en draagkracht van de ondergrond en egaliseer waar nodig. Gebruik voorstrijk als het lijmsysteem of de ondergrond dit vereist. Ontvet bij een vette of vervuilde ondergrond (bijvoorbeeld een keukenvloer) met een geschikte ontvetter/cleaner.';

  @override
  String get faqVloertegelQ2 => 'Hoe bereken ik snijverlies en aantal tegels?';

  @override
  String get faqVloertegelA2 =>
      'Bereken de oppervlakte en deel deze door de oppervlakte van een tegel. Reken als richtlijn circa 10% snijverlies; bij patroon of diagonale plaatsing circa 15% of meer.';

  @override
  String get faqVloertegelQ3 => 'Hoe krijg ik goede hechting met lijm?';

  @override
  String get faqVloertegelA3 =>
      'Gebruik de juiste lijmkam en lijm voor tegel en ondergrond. Breng de lijm aan op een schone, stofvrije ondergrond. Pas bij grote tegels back-buttering toe volgens het lijmadvies.';

  @override
  String get faqVloertegelQ4 => 'Hoe lang laten drogen voor voegen?';

  @override
  String get faqVloertegelA4 =>
      'Vaak minimaal 24 uur; bij grote tegels, lage temperaturen of weinig absorberende ondergronden kan dit langer zijn. Volg altijd het productblad.';

  @override
  String get faqVloertegelQ5 => 'Hoe voorkom ik hoogteverschillen?';

  @override
  String get faqVloertegelA5 =>
      'Gebruik tegelwiggen of een niveleersysteem en controleer regelmatig met waterpas en rei.';

  @override
  String get faqVloertegelQ6 => 'Wat bij een losse of gebroken tegel?';

  @override
  String get faqVloertegelA6 =>
      'Verwijder de tegel voorzichtig, maak de ondergrond vrij van losse lijm en stof en plaats een passende nieuwe tegel met geschikte lijm.';

  @override
  String get faqVloertegelQ7 => 'Hoe schoonmaken na voegen?';

  @override
  String get faqVloertegelA7 =>
      'Verwijder voegresten op het juiste moment met een geschikte spons en schoon water, voordat het voegmiddel volledig uithardt.';

  @override
  String get faqVloertegelQ8 => 'Hoe onderhoud ik een tegelvloer?';

  @override
  String get faqVloertegelA8 =>
      'Dagelijks: pH-neutrale tegelreiniger of allesreiniger. Periodiek: kalk-/cementreiniger bij hardnekkige aanslag, maar alleen als de tegelsoort dat verdraagt. Vermijd azijn en zure middelen bij natuursteen, en schuurmiddelen bij alle tegels. Optioneel: impregneermiddel op cementgebonden voegen.';

  @override
  String get faqVloertegelQ9 => 'Welke veiligheidsmaatregelen bij zagen?';

  @override
  String get faqVloertegelA9 =>
      'Gebruik waar mogelijk een natzaagtafel of bronafzuiging (bouwstofzuiger) om kwartsstof te beperken. Draag passende oog-, gehoor- en adembescherming.';

  @override
  String get faqVloertegelQ10 =>
      'Moet ik een dilatatievoeg aanhouden bij grote oppervlakken?';

  @override
  String get faqVloertegelA10 =>
      'Bij grote oppervlakken of bij vloerverwarming kan een dilatatievoeg nodig zijn om werking op te vangen. Volg het advies van de fabrikant en de geldende normen voor de maximale oppervlakte zonder dilatatie.';

  @override
  String get faqWandtegelQ1 => 'Moet ik egaliseren, voorstrijken en ontvetten?';

  @override
  String get faqWandtegelA1 =>
      'Controleer of de wand vlak, schoon, droog, draagkrachtig en vetvrij is. Egaliseer waar nodig en gebruik voorstrijk als de ondergrond of het lijmsysteem dit voorschrijft. Ontvet bij een vette of vervuilde ondergrond (bijvoorbeeld een keukenwand) met een geschikte ontvetter/cleaner.';

  @override
  String get faqWandtegelQ2 =>
      'Hoe bereken ik het aantal tegels en snijverlies?';

  @override
  String get faqWandtegelA2 =>
      'Bereken de wandoppervlakte en deel deze door de oppervlakte van een tegel. Reken als richtlijn circa 10% extra; bij patroon of diagonale plaatsing circa 15% of meer.';

  @override
  String get faqWandtegelQ3 => 'Hoe voorkom ik loslaten?';

  @override
  String get faqWandtegelA3 =>
      'Gebruik de juiste lijmkam en lijm voor tegel en ondergrond, verwerk niet te veel lijm tegelijk en druk de tegels goed aan. Bij grote tegels kan back-buttering nodig zijn.';

  @override
  String get faqWandtegelQ4 => 'Hoe lang laten drogen voor voegen?';

  @override
  String get faqWandtegelA4 =>
      'Vaak minimaal 24 uur; bij grote tegels of ongunstige omstandigheden kan dit langer zijn. Volg het productblad.';

  @override
  String get faqWandtegelQ5 => 'Hoe zaag ik tegels zonder breken?';

  @override
  String get faqWandtegelA5 =>
      'Gebruik een tegelsnijder voor rechte sneden en een haakse slijper met diamantblad voor uitsparingen. Werk rustig en ondersteun de tegel goed.';

  @override
  String get faqWandtegelQ6 => 'Wat als de muur niet waterpas is?';

  @override
  String get faqWandtegelA6 =>
      'Herstel of egaliseer de ondergrond waar nodig vóór het tegelen. Corrigeer niet onbeperkt met extra lijm.';

  @override
  String get faqWandtegelQ7 => 'Hoe ga ik om met schuine muren?';

  @override
  String get faqWandtegelA7 =>
      'Meet de hoek met een zweihaak en zaag de tegels op maat. Werk vanuit een haakse startlijn en controleer regelmatig met waterpas.';

  @override
  String get faqWandtegelQ8 => 'Hoe schoonmaken na voegen?';

  @override
  String get faqWandtegelA8 =>
      'Gebruik een zachte spons en schoon water op het juiste moment vóór volledige uitharding. Ververs het water regelmatig.';

  @override
  String get faqWandtegelQ9 => 'Hoe onderhoud ik wandtegels?';

  @override
  String get faqWandtegelA9 =>
      'Dagelijks: pH-neutrale tegelreiniger of milde allesreiniger. Bij kalkaanslag: kalkreiniger, alleen als de tegelsoort dat verdraagt. Vermijd schuurmiddelen en agressieve zuren op kwetsbare tegels of voegen.';

  @override
  String get faqWandtegelQ10 =>
      'Hoe werk ik rond stopcontacten en schakelaars?';

  @override
  String get faqWandtegelA10 =>
      'Schakel eerst de stroom uit. Verwijder het afdekraam, tegel rondom de inbouwdoos op maat en plaats de tegel met een passende uitsparing. Monteer daarna het afdekraam weer.';

  @override
  String get faqTegelReparerenQ1 =>
      'Hoe verwijder ik een oude tegel zonder de omliggende tegels te beschadigen?';

  @override
  String get faqTegelReparerenA1 =>
      'Snijd indien nodig eerst de voeg rondom de tegel door. Boor voorzichtig meerdere gaatjes in het midden van de tegel en breek hem stukje voor stukje met een beitel.';

  @override
  String get faqTegelReparerenQ2 => 'Welke lijm gebruik ik voor één tegel?';

  @override
  String get faqTegelReparerenA2 =>
      'Gebruik een tegellijm of reparatiemortel die geschikt is voor de tegel, ondergrond en toepassing. Gebruik sneldrogende producten alleen volgens het productdatasheet.';

  @override
  String get faqTegelReparerenQ3 =>
      'Hoe zorg ik dat de nieuwe tegel gelijk ligt?';

  @override
  String get faqTegelReparerenA3 =>
      'Verwijder oude lijm zonder de ondergrond te beschadigen. Controleer de vlakheid en gebruik de juiste getande spaan en hoeveelheid lijm. Controleer met een rei en waterpas.';

  @override
  String get faqTegelReparerenQ4 => 'Hoe lang wachten voor het voegen?';

  @override
  String get faqTegelReparerenA4 =>
      'Dit hangt af van de lijm. Voeg pas na de op het productdatasheet vermelde droog- en uithardingstijd. Volg bij sneldrogende lijm de expliciete productinstructies.';

  @override
  String get faqTegelReparerenQ5 =>
      'Hoe laat ik de gerepareerde voegnaad opgaan in de rest?';

  @override
  String get faqTegelReparerenA5 =>
      'Gebruik hetzelfde voegmiddel of aantoonbaar compatibel voegmiddel in dezelfde kleur. Vul de naad volledig en werk af volgens de aanwijzingen van de fabrikant.';

  @override
  String get faqTegelReparerenQ6 => 'Wat als de ondergrond beschadigd is?';

  @override
  String get faqTegelReparerenA6 =>
      'Herstel de ondergrond eerst met een geschikt reparatie- of eegaliseringsproduct. Laat het voldoende uitharden.';

  @override
  String get faqTegelReparerenQ7 => 'Hoe voorkom ik lijmresten?';

  @override
  String get faqTegelReparerenA7 =>
      'Verwijder overtollige lijm direct op de door de fabrikant aangegeven manier, zonder de tegel of voeg te beschadigen.';

  @override
  String get faqTegelReparerenQ8 => 'Hoe onderhoud ik de gerepareerde tegel?';

  @override
  String get faqTegelReparerenA8 =>
      'Onderhoud deze op dezelfde wijze als de rest van de vloer of wand, met een geschikt reinigingsmiddel.';

  @override
  String get faqTegelReparerenQ9 => 'Welke veiligheidsmaatregelen gelden?';

  @override
  String get faqTegelReparerenA9 =>
      'Beheers stof bij het boren en slijpen via bronafzuiging met een bouwstofzuiger of natte verwerking. Draag geschikte oog- en ademhaling bescherming.\n\n⚠️ Raadpleeg bij twijfel een vakman. Controleer altijd de aanwijzingen van het te gebruiken materiaal en de geldende Nederlandse regelgeving.';

  @override
  String get faqTegelReparerenQ10 => 'Hoe lang duurt het?';

  @override
  String get faqTegelReparerenA10 =>
      'Vakman: 0,50 uur per tegel. Zelfklus: 1,25 uur per tegel.';

  @override
  String get faqVoegenQ1 => 'Moeten de naden schoon en droog zijn?';

  @override
  String get faqVoegenA1 =>
      'Ja. Verwijder lijmresten en vuil uit de naden. De naden moeten voldoen aan de droog- en verwerkingseisen van het gekozen voegmiddel.';

  @override
  String get faqVoegenQ2 => 'Welk voegmiddel gebruik ik binnenshuis?';

  @override
  String get faqVoegenA2 =>
      'Kies op basis van het tegeltype, de naaddikte en de toepassing. Cementgebonden of epoxy voegmiddel kan binnenshuis geschikt zijn. Volg het productdatasheet.';

  @override
  String get faqVoegenQ3 => 'Hoe meng ik voegmiddel?';

  @override
  String get faqVoegenA3 =>
      'Volg de exacte mengverhouding en verwerkingstijd op de verpakking. Gebruik schoon water en een geschikte menger.';

  @override
  String get faqVoegenQ4 => 'Hoe lang uitharden voor belasten?';

  @override
  String get faqVoegenA4 =>
      'Dit verschilt per product, temperatuur en toepassing. Volg de gebruiksklaar- en volledige uithardingstijd op het productdatasheet.';

  @override
  String get faqVoegenQ5 => 'Hoe voorkom ik uitdroging of scheuren?';

  @override
  String get faqVoegenA5 =>
      'Werk in kleine vakken. Vermijd tocht, directe zon en te snelle droging. Bevochtig de voeg alleen als de fabrikant dat uitdrukkelijk aangeeft.';

  @override
  String get faqVoegenQ6 => 'Wat doe ik bij oneffenheden in de voeg?';

  @override
  String get faqVoegenA6 =>
      'Werk de voeg af binnen de toegestane verwerkingstijd met het juiste gereedschap. Na uitharding kunnen reparaties zichtbaar blijven. Volg de productinstructies voor herstel.';

  @override
  String get faqVoegenQ7 =>
      'Hoe maak ik tegels schoon zonder de voeg te beschadigen?';

  @override
  String get faqVoegenA7 =>
      'Reinig op het juiste moment met een geschikte spons en beperkte hoeveelheid schoon water. Wacht niet tot er een harde cementnevel is gevormd.';

  @override
  String get faqVoegenQ8 => 'Hoe onderhoud ik voegen?';

  @override
  String get faqVoegenA8 =>
      'Reinig regelmatig met een voor het voegtype geschikt reinigingsmiddel. Impregneren kan bij bepaalde cementgebonden voegen zinvol zijn.';

  @override
  String get faqVoegenQ9 => 'Welke veiligheidsmaatregelen gelden?';

  @override
  String get faqVoegenA9 =>
      'Draag geschikte handschoenen en een veiligheidsbril. Beheers stof bij het mengen van poederproducten en zorg voor voldoende ventilatie.\n\n⚠️ Raadpleeg bij twijfel een vakman. Controleer altijd de aanwijzingen van het te gebruiken materiaal en de geldende Nederlandse regelgeving.';

  @override
  String get faqVoegenQ10 => 'Hoe lang duurt het?';

  @override
  String get faqVoegenA10 =>
      'Vakman: 0,10 uur per m². Zelfklus: 0,25 uur per m².';

  @override
  String get faqKitAanbrengenQ1 =>
      'Moet ik de ondergrond ontvetten en laten drogen?';

  @override
  String get faqKitAanbrengenA1 =>
      'Ja. Reinig de ondergrond en zorg dat deze vrij is van vet en stof. Laat drogen tenzij het product uitdrukkelijk anders aangeeft.';

  @override
  String get faqKitAanbrengenQ2 => 'Welke kit gebruik ik?';

  @override
  String get faqKitAanbrengenA2 =>
      'Siliconenkit is geschikt voor veel sanitaire en natte naden. Acrylaatkit wordt vaak gebruikt voor overschilderbare naden binnenshuis.';

  @override
  String get faqKitAanbrengenQ3 => 'Hoe verwijder ik oude kit?';

  @override
  String get faqKitAanbrengenA3 =>
      'Snijd of schraap de oude kit voorzichtig weg met een kitschraper. Gebruik indien nodig een geschikte kitverwijderaar. Reinig daarna het oppervlak volgens de aanwijzingen van het nieuwe kitproduct.';

  @override
  String get faqKitAanbrengenQ4 => 'Hoe breng ik kit gelijkmatig aan?';

  @override
  String get faqKitAanbrengenA4 =>
      'Snijd de tuit diagonaal op de gewenste naaddikte. Breng de kit gelijkmatig aan. Strijk glad met een rubberen kitspatel of geschikte kitspatel. Gebruik een plantenspuit met een door de fabrikant goedgekeurd afwerkmiddel.';

  @override
  String get faqKitAanbrengenQ5 => 'Hoe lang wachten voor belasten?';

  @override
  String get faqKitAanbrengenA5 =>
      'Dit hangt af van het type kit, de naadafmetingen en de omgevingsomstandigheden. Volg de huidvormings-, uithardings- en belastingstijd op de verpakking.';

  @override
  String get faqKitAanbrengenQ6 => 'Hoe strijk ik kit glad?';

  @override
  String get faqKitAanbrengenA6 =>
      'Gebruik een rubberen kitspatel of geschikte kitspatel samen met een door de fabrikant goedgekeurd afwerkmiddel. Gebruik niet automatisch afwasmiddel.';

  @override
  String get faqKitAanbrengenQ7 => 'Wat als de kit niet hecht?';

  @override
  String get faqKitAanbrengenA7 =>
      'Verwijder de kit. Controleer of de ondergrond geschikt is. Reinig en droog het oppervlak opnieuw. Gebruik indien nodig de door de fabrikant voorgeschreven primer.';

  @override
  String get faqKitAanbrengenQ8 => 'Hoe onderhoud ik kitnaden?';

  @override
  String get faqKitAanbrengenA8 =>
      'Controleer regelmatig op loslaten, scheuren, schimmel en verkleuring. Herstel of vervang de kitnaad wanneer de afdichting niet meer effectief is.';

  @override
  String get faqKitAanbrengenQ9 => 'Welke veiligheidsmaatregelen gelden?';

  @override
  String get faqKitAanbrengenA9 =>
      'Zorg voor voldoende ventilatie. Draag geschikte handschoenen. Vermijd contact met huid en ogen.\n\n⚠️ Raadpleeg bij twijfel een vakman. Controleer altijd de aanwijzingen van het te gebruiken materiaal en de geldende Nederlandse regelgeving.';

  @override
  String get faqKitAanbrengenQ10 => 'Hoe lang duurt het?';

  @override
  String get faqKitAanbrengenA10 =>
      'Vakman: 0,05 uur per meter. Zelfklus: 0,125 uur per meter.';

  @override
  String get faqPlumberQ1 => 'Hoe repareer ik een lekkende kraan?';

  @override
  String get faqPlumberA1 =>
      'Meestal door de pakking of cartridge in de kraan te vervangen.';

  @override
  String get faqPlumberQ2 => 'Hoe maak ik een afvoer ontstopt?';

  @override
  String get faqPlumberA2 =>
      'Gebruik een ontstopper, afvoerveer of geschikt afvoerreiniger.';

  @override
  String get faqPlumberQ3 => 'Wat is PEX-leiding?';

  @override
  String get faqPlumberA3 =>
      'PEX is flexibele kunststofleiding die veel wordt gebruikt voor watertoevoerleidingen.';

  @override
  String get faqPlumberQ4 => 'Hoe spoor ik lekkages op?';

  @override
  String get faqPlumberA4 =>
      'Let op watervlekken, vochtige plekken of onverwachte stijgingen van de waterrekening.';

  @override
  String get faqPlumberQ5 => 'Moet ik teflontape gebruiken?';

  @override
  String get faqPlumberA5 =>
      'Ja, op schroefdraadverbindingen om de afdichting te verbeteren.';

  @override
  String get faqPlumberQ6 => 'Kan ik een toilet zelf vervangen?';

  @override
  String get faqPlumberA6 =>
      'Ja, veel huiseigenaren kunnen een toilet vervangen met eenvoudig gereedschap.';

  @override
  String get faqPlumberQ7 => 'Hoeveel waterdruk is normaal?';

  @override
  String get faqPlumberA7 => 'De meeste woningen werken tussen 2 en 5 bar.';

  @override
  String get faqPlumberQ8 => 'Hoe voorkom ik bevroren leidingen?';

  @override
  String get faqPlumberA8 =>
      'Isoleer blootgestelde leidingen en handhaaf binnentemperaturen.';

  @override
  String get faqPlumberQ9 => 'Wat zijn veelgemaakte loodgieterfouten?';

  @override
  String get faqPlumberA9 =>
      'Te hard aandraaien van verbindingen en vergeten te controleren op lekkages.';

  @override
  String get faqPlumberQ10 => 'Hoe vaak moeten leidingen worden geïnspecteerd?';

  @override
  String get faqPlumberA10 =>
      'Een jaarlijkse inspectie helpt problemen vroegtijdig op te sporen.';

  @override
  String get faqPlumberQ11 => 'Welk gereedschap is essentieel voor beginners?';

  @override
  String get faqPlumberA11 =>
      'Verstelbare sleutel, tang, pijpsnijder en teflontape.';

  @override
  String get faqPlumberQ12 => 'Kan ik zelf een nieuwe gootsteen installeren?';

  @override
  String get faqPlumberA12 =>
      'Ja, als de loodgieterverbindingen eenvoudig zijn.';

  @override
  String get faqPlumberQ13 => 'Hoe verlaag ik mijn waterverbruik?';

  @override
  String get faqPlumberA13 =>
      'Installeer waterbesparende armaturen en repareer lekkages snel.';

  @override
  String get faqPlumberQ14 => 'Hoe lang duren loodgieterreparaties?';

  @override
  String get faqPlumberA14 =>
      'Kwaliteitsreparaties kunnen vele jaren meegaan als ze correct worden uitgevoerd.';

  @override
  String get faqPlumberQ15 => 'Wanneer moet ik een professional bellen?';

  @override
  String get faqPlumberA15 =>
      'Voor gasleidingen, grote lekkages of uitgebreide leidingvervanging.';

  @override
  String get faqPlumberQ16 => 'Hoe lang duurt deze klus?';

  @override
  String get faqPlumberA16 =>
      'Afhankelijk van de complexiteit duurt een loodgieterklus 1–8 uur. Een eenvoudige kraan vervangen duurt ca. 30 minuten; een leiding leggen kan een dag of meer kosten.';

  @override
  String get faqPlumberQ17 => 'Welk gereedschap heb ik nodig?';

  @override
  String get faqPlumberA17 =>
      'Basisgereedschap bestaat uit: waterpomptang, moersleutels, pijpsnijder, Teflon tape, soldeerbrander (bij koperwerk) en een emmer.';

  @override
  String get faqPlumberQ18 => 'Moet ik de watertoevoer afsluiten?';

  @override
  String get faqPlumberA18 =>
      'Ja, sluit altijd de watertoevoer af voordat u begint. Gebruik de hoofdkraan of een lokale afsluitkraan en open daarna een kraan om de druk te verminderen.';

  @override
  String get faqPlumberQ19 => 'Welk type leidingmateriaal kies ik?';

  @override
  String get faqPlumberA19 =>
      'Koper is duurzaam maar duurder. PEX is flexibel en eenvoudig te verwerken. PVC wordt veel gebruikt voor afvoerleidingen. Kies op basis van de toepassing.';

  @override
  String get faqPlumberQ20 => 'Kan ik dit als beginner doen?';

  @override
  String get faqPlumberA20 =>
      'Eenvoudige klussen zoals een kraan vervangen of toilet repareren zijn goed zelfstandig te doen. Complexer werk (gas, nieuw leidingwerk) laat u beter over aan een erkende loodgieter.';

  @override
  String get faqElectricianQ1 => 'Wat is een zekeringautomaat?';

  @override
  String get faqElectricianA1 =>
      'Een beveiligingsapparaat dat de stroom uitschakelt bij overbelasting.';

  @override
  String get faqElectricianQ2 => 'Hoe test ik een stopcontact?';

  @override
  String get faqElectricianA2 => 'Gebruik een stopcontacttester of multimeter.';

  @override
  String get faqElectricianQ3 => 'Kan ik zelf een lamp vervangen?';

  @override
  String get faqElectricianA3 =>
      'Ja, na het uitschakelen van de stroom en het volgen van veiligheidsprocedures.';

  @override
  String get faqElectricianQ4 => 'Waarom slaat een zekering door?';

  @override
  String get faqElectricianA4 =>
      'Meestal door overbelasting, kortsluiting of defecte apparaten.';

  @override
  String get faqElectricianQ5 => 'Wat is aarding?';

  @override
  String get faqElectricianA5 =>
      'Aarding biedt een veilig pad voor elektrische storingen.';

  @override
  String get faqElectricianQ6 => 'Hoe herken ik draden?';

  @override
  String get faqElectricianA6 =>
      'Gebruik lokale kleurcodering voor bedrading en controleer met een tester.';

  @override
  String get faqElectricianQ7 => 'Kan ik extra stopcontacten toevoegen?';

  @override
  String get faqElectricianA7 => 'Ja, mits het circuit de belasting aankan.';

  @override
  String get faqElectricianQ8 => 'Welke beschermingsmiddelen moet ik dragen?';

  @override
  String get faqElectricianA8 =>
      'Geïsoleerde handschoenen en veiligheidsbril worden aanbevolen.';

  @override
  String get faqElectricianQ9 => 'Hoe voorkom ik elektrische schokken?';

  @override
  String get faqElectricianA9 => 'Zet altijd de stroom uit voordat u begint.';

  @override
  String get faqElectricianQ10 => 'Hoe lang gaan elektrische installaties mee?';

  @override
  String get faqElectricianA10 =>
      'Veel installaties gaan 20–40 jaar mee bij goed onderhoud.';

  @override
  String get faqElectricianQ11 => 'Wat is een aardlekschakelaar?';

  @override
  String get faqElectricianA11 =>
      'Een apparaat dat beschermt tegen elektrische schokken.';

  @override
  String get faqElectricianQ12 => 'Kan ik buitenverlichting installeren?';

  @override
  String get faqElectricianA12 => 'Ja, met weerbestendige armaturen en kabels.';

  @override
  String get faqElectricianQ13 => 'Wat zijn veelgemaakte elektrische fouten?';

  @override
  String get faqElectricianA13 =>
      'Werken onder spanning en gebruik van verkeerde draaddikte.';

  @override
  String get faqElectricianQ14 => 'Hoe bereken ik energieverbruik?';

  @override
  String get faqElectricianA14 =>
      'Vermenigvuldig watt met gebruiksuren en deel door 1000.';

  @override
  String get faqElectricianQ15 => 'Wanneer schakel ik een elektricien in?';

  @override
  String get faqElectricianA15 =>
      'Bij uitbreidingen van de groepenkast, nieuw bedrading of complexe installaties is het verstandig een erkend elektricien in te schakelen.';

  @override
  String get faqElectricianQ16 => 'Hoe lang duurt deze klus?';

  @override
  String get faqElectricianA16 =>
      'Het installeren van een stopcontact of schakelaar duurt 30–60 minuten. Grotere projecten zoals een nieuwe groep aanleggen kunnen een halve tot hele dag kosten.';

  @override
  String get faqElectricianQ17 => 'Welk gereedschap heb ik nodig?';

  @override
  String get faqElectricianA17 =>
      'U heeft nodig: schroevendraaier set, trekker/draadtrekker, knijtang, multimeter, isolatietape en eventueel een boorhamers.';

  @override
  String get faqElectricianQ18 => 'Hoe ga ik veilig te werk?';

  @override
  String get faqElectricianA18 =>
      'Schakel altijd de spanning uit via de groepenkast en controleer met een spanningzoeker of de stroomkring echt spanningsloos is voordat u begint.';

  @override
  String get faqElectricianQ19 => 'Welk snoerdikte moet ik gebruiken?';

  @override
  String get faqElectricianA19 =>
      'Voor stopcontacten en verlichting: 2,5 mm² voor normale groepen. Voor zwaardere apparatuur (kookplaat, wasmachine): 4–6 mm². Raadpleeg de NEN 1010 norm.';

  @override
  String get faqElectricianQ20 => 'Kan ik dit als beginner doen?';

  @override
  String get faqElectricianA20 =>
      'Eenvoudige vervangingen (schakelaar, stopcontact) zijn zelfstandig te doen als u veiligheidsregels volgt. Werk aan de groepenkast of nieuwe groepen laat u over aan een erkend elektricien.';

  @override
  String get faqTilerQ1 => 'Welke tegellijm moet ik gebruiken?';

  @override
  String get faqTilerA1 =>
      'Kies lijm op basis van het tegeltype en de ondergrond. Flexibele lijm wordt aanbevolen voor de meeste moderne installaties.';

  @override
  String get faqTilerQ2 => 'Moet ik het oppervlak waterdicht maken?';

  @override
  String get faqTilerA2 =>
      'Ja, badkamers en natte ruimten moeten waterdicht worden gemaakt voor het betegelen.';

  @override
  String get faqTilerQ3 => 'Hoe leg ik tegels waterpas?';

  @override
  String get faqTilerA3 =>
      'Gebruik tegelkruisjes en een nivelleersysteem voor een egaal oppervlak.';

  @override
  String get faqTilerQ4 => 'Wanneer kan ik op nieuw gelegde tegels lopen?';

  @override
  String get faqTilerA4 =>
      'Wacht minimaal 24 uur na het leggen voor u op de tegels loopt.';

  @override
  String get faqTilerQ5 => 'Hoe lang voor het voegen?';

  @override
  String get faqTilerA5 =>
      'De meeste tegellijmen vereisen 24 uur uitharding voor het voegen.';

  @override
  String get faqTilerQ6 => 'Welke voegkleur moet ik kiezen?';

  @override
  String get faqTilerA6 =>
      'Kies een voegkleur die bij uw tegels past of het gewenste contrast creëert.';

  @override
  String get faqTilerQ7 => 'Hoe snijd ik tegels nauwkeurig?';

  @override
  String get faqTilerA7 =>
      'Gebruik een tegelsnijder voor rechte sneden en een natsnijder voor complexe vormen.';

  @override
  String get faqTilerQ8 => 'Kan ik over bestaande tegels betegelen?';

  @override
  String get faqTilerA8 =>
      'Ja, als de bestaande tegels stabiel, schoon en goed voorbereid zijn.';

  @override
  String get faqTilerQ9 => 'Wat zijn veelgemaakte tegelfouten?';

  @override
  String get faqTilerA9 =>
      'Ongelijkmatige lijmopbrenging, slechte afstand en onvoldoende oppervlaktepreparatie.';

  @override
  String get faqTilerQ10 => 'Hoe verwijder ik voegwaas?';

  @override
  String get faqTilerA10 =>
      'Gebruik een vochtige spons kort na het voegen en indien nodig een voegwaasverwijderaar.';

  @override
  String get faqTilerQ11 => 'Hoeveel voeg heb ik nodig?';

  @override
  String get faqTilerA11 =>
      'De hoeveelheid hangt af van tegelformaat, dikte en voegbreedte.';

  @override
  String get faqTilerQ12 => 'Moet ik voeg impregneren?';

  @override
  String get faqTilerA12 =>
      'Voeg impregneren helpt vlekken en vochtindringing te voorkomen.';

  @override
  String get faqTilerQ13 => 'Kunnen beginners een badkamer betegelen?';

  @override
  String get faqTilerA13 =>
      'Ja, maar begin met eenvoudige patronen en neem de tijd voor voorbereiding.';

  @override
  String get faqTilerQ14 => 'Hoe vervang ik een gebroken tegel?';

  @override
  String get faqTilerA14 =>
      'Verwijder de beschadigde tegel voorzichtig en installeer een passende vervanger.';

  @override
  String get faqTilerQ15 => 'Hoe lang gaan betegelde oppervlakken mee?';

  @override
  String get faqTilerA15 =>
      'Correct gelegde tegels kunnen tientallen jaren meegaan met minimaal onderhoud.';

  @override
  String get faqTilerQ16 => 'Hoe lang duurt tegels leggen?';

  @override
  String get faqTilerA16 =>
      'Een badkamer betegelen duurt gemiddeld 1–3 dagen. Een kleine vloer of wand betegelen ca. 4–8 uur, afhankelijk van de complexiteit.';

  @override
  String get faqTilerQ17 => 'Welk gereedschap heb ik nodig?';

  @override
  String get faqTilerA17 =>
      'U heeft nodig: tegelsnijder, tandspaan, voegspuit, rubber hamer, waterpas, meetlint, spons en tegelkruisjes.';

  @override
  String get faqTilerQ18 => 'Hoe bereid ik de ondergrond voor?';

  @override
  String get faqTilerA18 =>
      'De ondergrond moet droog, vlak en schoon zijn. Controleer met een waterpas op hoogteverschillen. Breng tegellijm aan op een egale ondergrond.';

  @override
  String get faqTilerQ19 => 'Hoeveel tegels heb ik extra nodig?';

  @override
  String get faqTilerA19 =>
      'Bestel altijd 10–15% extra. Bij diagonale of visgraat patronen rekent u zelfs 20% extra voor snijverlies.';

  @override
  String get faqTilerQ20 => 'Kan ik dit als beginner doen?';

  @override
  String get faqTilerA20 =>
      'Eenvoudig tegelen is zelfstandig te doen met de juiste voorbereiding. Begin met een rechte wand of vloer zonder veel nissen of obstakels.';

  @override
  String get faqSchuttingPlaatsenQ1 =>
      'Heb ik een vergunning nodig voor het plaatsen van een schutting?';

  @override
  String get faqSchuttingPlaatsenA1 =>
      'Controleer vooraf via het Omgevingsloket en/of de gemeente of voor jouw locatie, hoogte, erfgrens en uitvoering een vergunning of melding nodig is.';

  @override
  String get faqSchuttingPlaatsenQ2 =>
      'Hoeveel palen en wat is de juiste afstand?';

  @override
  String get faqSchuttingPlaatsenA2 =>
      'Het aantal palen en de onderlinge afstand hangen af van het gekozen systeem, de paneelbreedte en de windbelasting. Volg het voorschrift van de fabrikant.';

  @override
  String get faqSchuttingPlaatsenQ3 => 'Hoe diep moeten de palen in de grond?';

  @override
  String get faqSchuttingPlaatsenA3 =>
      'Als globale richtlijn kan circa 1/3 van de paallengte ondergronds zijn, maar de benodigde funderingsdiepte hangt af van bodem, paaldikte, windbelasting en het gekozen systeem. Volg altijd het voorschrift van het gekozen systeem.';

  @override
  String get faqSchuttingPlaatsenQ4 => 'Welke paaldikte moet ik kiezen?';

  @override
  String get faqSchuttingPlaatsenA4 =>
      'Kies bij een robuuste uitstraling of bij veel windbelasting voor een dikkere paal. Volg het advies van de fabrikant of leverancier.';

  @override
  String get faqSchuttingPlaatsenQ5 =>
      'Hoe lang moet het beton drogen voor ik de schutting mag belasten?';

  @override
  String get faqSchuttingPlaatsenA5 =>
      'Volg het voorschrift van het gebruikte betonproduct. De uithardingstijd hangt af van temperatuur, vocht en product; 24 uur is niet automatisch voldoende voor volledige belasting.';

  @override
  String get faqSchuttingPlaatsenQ6 =>
      'Hoe zorg ik dat de schutting waterpas staat?';

  @override
  String get faqSchuttingPlaatsenA6 =>
      'Waterpas en richtlijn gebruiken, elke paal gelijke hoogte. Regelmatig controleren. Gebruik een geschikte en veilige trap of werkvoorziening voor het plaatsen van de bovenste panelen.';

  @override
  String get faqSchuttingPlaatsenQ7 => 'Wat doe ik als de grond te zacht is?';

  @override
  String get faqSchuttingPlaatsenA7 =>
      'Extra beton of dieper in de grond. Overweeg een paalhouder. Volg het systeemadvies.';

  @override
  String get faqSchuttingPlaatsenQ8 => 'Hoe onderhoud ik de schutting?';

  @override
  String get faqSchuttingPlaatsenA8 =>
      'Hout: controleer periodiek en behandel volgens het onderhoudsadvies van het houttype of de fabrikant (bijvoorbeeld houtbeits of houtolie). Kunststof: afspoelen met water.';

  @override
  String get faqSchuttingPlaatsenQ9 => 'Wat zijn de meest voorkomende fouten?';

  @override
  String get faqSchuttingPlaatsenA9 =>
      'Niet diep genoeg, niet waterpas, te weinig palen of onvoldoende fundering, voorschrift van het systeem niet gevolgd.';

  @override
  String get faqSchuttingPlaatsenQ10 =>
      'Wat is de beste tip voor een stevige schutting?';

  @override
  String get faqSchuttingPlaatsenA10 =>
      'Palen in beton volgens het systeem, RVS-schroeven gebruiken. Volg altijd het fabrikantvoorschrift.';

  @override
  String get faqBestratingAanleggenQ1 => 'Moet ik de grond voorbereiden?';

  @override
  String get faqBestratingAanleggenA1 =>
      'Ja. Graaf tot de benodigde diepte af, verwijder oude bestrating en egaliseer. Een worteldoek is niet in iedere situatie nodig; gebruik het alleen als dit voor de gekozen toepassing passend is.';

  @override
  String get faqBestratingAanleggenQ2 => 'Hoeveel materiaal heb ik nodig?';

  @override
  String get faqBestratingAanleggenA2 =>
      'Bereken de oppervlakte in m² en bepaal de hoeveelheid grindtegels op basis van 60 x 60 cm per tegel. Houd rekening met projectspecifiek snijverlies; bij veel zaagwerk is meer nodig dan 5%.';

  @override
  String get faqBestratingAanleggenQ3 => 'Hoe maak ik een goed zandbed?';

  @override
  String get faqBestratingAanleggenA3 =>
      'De benodigde funderings- en zandlaag hangt af van belasting, ondergrond en type bestrating. Breng de juiste laagdikte aan, verdicht deze goed en zorg voor een stabiele ondergrond.';

  @override
  String get faqBestratingAanleggenQ4 => 'Hoe leg ik de bestrating?';

  @override
  String get faqBestratingAanleggenA4 =>
      'Leg de stenen strak tegen elkaar en klop ze aan met een rubberen hamer. Controleer regelmatig op hoogteverschillen.';

  @override
  String get faqBestratingAanleggenQ5 => 'Hoe lang moet het zandbed rusten?';

  @override
  String get faqBestratingAanleggenA5 =>
      'Je kunt direct na het verdichten beginnen met leggen, mits het zandbed goed is verdicht. Werk in kleine stukken.';

  @override
  String get faqBestratingAanleggenQ6 => 'Hoe herstel ik een verzakking?';

  @override
  String get faqBestratingAanleggenA6 =>
      'Licht de verzakte tegels op, vul het zandbed bij, verdicht dit opnieuw en leg de tegels weer waterpas terug.';

  @override
  String get faqBestratingAanleggenQ7 => 'Hoe onderhoud ik de bestrating?';

  @override
  String get faqBestratingAanleggenA7 =>
      'Veeg regelmatig, verwijder onkruid tussen de voegen en vul indien nodig het voegzand bij.';

  @override
  String get faqBestratingAanleggenQ8 =>
      'Welke veiligheidsmaatregelen gelden er?';

  @override
  String get faqBestratingAanleggenA8 =>
      'Handschoenen en veiligheidsbril. Draag een stofmasker wanneer stof vrijkomt, bijvoorbeeld bij droog zagen.';

  @override
  String get faqBestratingAanleggenQ9 =>
      'Wat zijn de meest voorkomende fouten?';

  @override
  String get faqBestratingAanleggenA9 =>
      'Onvoldoende fundering of verdichting, verkeerde afwatering, verkeerde laagopbouw, onvoldoende afschot.';

  @override
  String get faqBestratingAanleggenQ10 =>
      'Wat is de beste tip voor een strak resultaat?';

  @override
  String get faqBestratingAanleggenA10 =>
      'Houd voldoende afschot aan voor een goede waterafvoer; de benodigde helling hangt af van toepassing en ondergrond. Waterpas controleren.';

  @override
  String get faqSnoeienQ1 => 'Wanneer kan ik het beste snoeien?';

  @override
  String get faqSnoeienA1 =>
      'Het juiste snoeimoment en de manier van snoeien verschillen per hortensiasoort. Controleer eerst welke soort je hebt. Volg daarna het advies voor die specifieke soort.';

  @override
  String get faqSnoeienQ2 => 'Welk gereedschap heb ik nodig?';

  @override
  String get faqSnoeienA2 =>
      'Snoeischaar voor dunne takken, takkenschaar of snoeizaag voor dikkere takken. Scherp gereedschap.';

  @override
  String get faqSnoeienQ3 => 'Hoeveel takken mag ik verwijderen?';

  @override
  String get faqSnoeienA3 =>
      'Snoei niet te veel in één keer. Verwijder dode, zieke of beschadigde takken en de oude bloemen. De aanpak verschilt per soort (boerenhortensia versus pluimhortensia).';

  @override
  String get faqSnoeienQ4 => 'Hoe moet ik precies snoeien?';

  @override
  String get faqSnoeienA4 =>
      'Knip net boven een nieuwe groene knop of groeipunt, schuin weg van de knop. Werk van binnen naar buiten.';

  @override
  String get faqSnoeienQ5 => 'Hoe herstel ik schade door snoeien?';

  @override
  String get faqSnoeienA5 =>
      'Beschadigde takken wegsnoeien tot gezond hout. Plant laten rusten.';

  @override
  String get faqSnoeienQ6 => 'Hoe onderhoud ik de planten na het snoeien?';

  @override
  String get faqSnoeienA6 =>
      'Geef de plant na het snoeien alleen water wanneer dat nodig is en pas bemesting toe volgens de behoeften van de hortensia. Verwijder snoeiafval.';

  @override
  String get faqSnoeienQ7 => 'Welke veiligheidsmaatregelen gelden er?';

  @override
  String get faqSnoeienA7 =>
      'Handschoenen, veiligheidsbril, stabiele trap bij hoog werk. Let op vallende takken.';

  @override
  String get faqSnoeienQ8 => 'Wat zijn de meest voorkomende fouten?';

  @override
  String get faqSnoeienA8 =>
      'Verkeerde periode, verkeerde snoeiwijze voor de soort, bot gereedschap, afval niet opruimen.';

  @override
  String get faqSnoeienQ9 => 'Wat is de beste tip voor het snoeien?';

  @override
  String get faqSnoeienA9 =>
      'Snoei bij voorkeur niet tijdens vorst of wanneer direct na het snoeien strenge vorst wordt verwacht. Controleer eerst welke soort hortensia je hebt en volg het advies voor die soort.';

  @override
  String get faqSnoeienQ10 =>
      'Moet ik de snoeiwonden behandelen met een middel?';

  @override
  String get faqSnoeienA10 =>
      'Nee, het gebruik van wondafdekmiddelen wordt bij hortensia\'s niet standaard geadviseerd. De plant herstelt het beste op een natuurlijke wijze na een schone, scherpe snede.';

  @override
  String get faqOverkappingBouwenQ1 => 'Heb ik een vergunning nodig?';

  @override
  String get faqOverkappingBouwenA1 =>
      'Controleer vooraf via het Omgevingsloket en/of de gemeente of er een vergunning of melding nodig is. Controleer ook eventuele VvE-regels.';

  @override
  String get faqOverkappingBouwenQ2 =>
      'Hoeveel palen heb ik nodig en hoe zwaar moeten ze zijn?';

  @override
  String get faqOverkappingBouwenA2 =>
      'Het aantal en de afmetingen van palen, liggers en verbindingen zijn afhankelijk van de afmetingen, overspanning, dakbelasting, windbelasting en fundering. Bij twijfel een constructeur inschakelen.';

  @override
  String get faqOverkappingBouwenQ3 => 'Hoe bouw ik een stevig frame?';

  @override
  String get faqOverkappingBouwenA3 =>
      'Gebruik de juiste houtafmetingen en verbindingen volgens de constructieberekening. Zorg voor een waterpas en stabiel frame. Bij twijfel een constructeur inschakelen.';

  @override
  String get faqOverkappingBouwenQ4 => 'Hoe lang moet het beton drogen?';

  @override
  String get faqOverkappingBouwenA4 =>
      'Volg het voorschrift van het gebruikte betonproduct. De uithardingstijd hangt af van temperatuur, vocht en product; 24 uur is niet automatisch voldoende voor volledige belasting.';

  @override
  String get faqOverkappingBouwenQ5 =>
      'Hoe voorkom ik rotten of verkleuren van het hout?';

  @override
  String get faqOverkappingBouwenA5 =>
      'Kies een geschikt houttype of een ander materiaal (kunststof/aluminium). Behandel volgens het onderhoudsadvies van de fabrikant.';

  @override
  String get faqOverkappingBouwenQ6 => 'Hoe zorg ik voor een goede afwatering?';

  @override
  String get faqOverkappingBouwenA6 =>
      'Houd voldoende afschot aan voor een goede waterafvoer; de benodigde helling hangt af van toepassing en dakmateriaal. Volg de voorschriften van het dakmateriaal.';

  @override
  String get faqOverkappingBouwenQ7 => 'Hoe onderhoud ik de overkapping?';

  @override
  String get faqOverkappingBouwenA7 =>
      'Controleer jaarlijks op schade en reinig het dak. Behandel houtwerk volgens het onderhoudsadvies van het houttype of de fabrikant.';

  @override
  String get faqOverkappingBouwenQ8 =>
      'Welke veiligheidsmaatregelen gelden er?';

  @override
  String get faqOverkappingBouwenA8 =>
      'Helm, handschoenen, steiger. Nooit alleen op hoogte werken. Gebruik een geschikte en veilige trap of werkvoorziening voor lager werk.';

  @override
  String get faqOverkappingBouwenQ9 => 'Wat zijn de meest voorkomende fouten?';

  @override
  String get faqOverkappingBouwenA9 =>
      'Onvoldoende of verkeerd uitgevoerde constructie, niet waterpas, verkeerde dakhelling, geen goede fundering, vergunning vergeten.';

  @override
  String get faqOverkappingBouwenQ10 =>
      'Wat is de beste tip voor een goede overkapping?';

  @override
  String get faqOverkappingBouwenA10 =>
      'Houd voldoende afschot aan voor regenafvoer. Alles waterpas controleren. Raadpleeg bij twijfel een constructeur.';

  @override
  String get faqGazonLeggenQ1 => 'Waarom zou ik kiezen voor kunstgras?';

  @override
  String get faqGazonLeggenA1 =>
      'Kunstgras vraagt doorgaans minder onderhoud dan natuurgras en blijft het hele jaar groen. Regelmatig reinigen en borstelen blijft wel nodig. Kies een kwaliteit die past bij het gebruik.';

  @override
  String get faqGazonLeggenQ2 => 'Moet ik de grond voorbereiden?';

  @override
  String get faqGazonLeggenA2 =>
      'Ja, egaliseren en aandrukken. Verwijder oude grasmat, onkruid en oneffenheden. Breng een stabiele onderlaag aan.';

  @override
  String get faqGazonLeggenQ3 => 'Hoeveel kunstgras heb ik nodig?';

  @override
  String get faqGazonLeggenA3 =>
      'Oppervlakte + snijverlies (minimaal 5%, meer bij veel snijwerk). Kunstgras wordt meestal op rol geleverd met een vaste breedte.';

  @override
  String get faqGazonLeggenQ4 => 'Hoe leg ik kunstgras?';

  @override
  String get faqGazonLeggenA4 =>
      'Rol het kunstgras uit, laat het wennen aan de temperatuur, snijd op maat en leg de naden strak tegen elkaar. Gebruik eventueel een naadband.';

  @override
  String get faqGazonLeggenQ5 => 'Hoe onderhoud ik kunstgras?';

  @override
  String get faqGazonLeggenA5 =>
      'Regelmatig borstelen, bladeren verwijderen en afspoelen met water. Geen agressieve middelen gebruiken.';

  @override
  String get faqGazonLeggenQ6 =>
      'Wat moet ik doen bij plassen of slechte afwatering?';

  @override
  String get faqGazonLeggenA6 =>
      'Zorg voor een goed waterdoorlatende onderlaag. Bij veel regen kan een drainagevoorziening nodig zijn.';

  @override
  String get faqGazonLeggenQ7 => 'Welke veiligheidsmaatregelen gelden er?';

  @override
  String get faqGazonLeggenA7 =>
      'Handschoenen bij het snijden. Let op zwaar materieel. Werk stabiel.';

  @override
  String get faqGazonLeggenQ8 => 'Wat zijn de meest voorkomende fouten?';

  @override
  String get faqGazonLeggenA8 =>
      'Onvoldoende egaliseren, geen stabiele onderlaag, naden niet strak, verkeerde snijtechniek.';

  @override
  String get faqGazonLeggenQ9 =>
      'Wat is de beste tip voor het leggen van kunstgras?';

  @override
  String get faqGazonLeggenA9 =>
      'Laat het kunstgras voor het leggen een paar uur liggen zodat het zich kan zetten. Snijd met een scherp mes en een rechte lat.';

  @override
  String get faqGazonLeggenQ10 =>
      'Kan ik een barbecue of vuurkorf op het kunstgras plaatsen?';

  @override
  String get faqGazonLeggenA10 =>
      'Nee, kunstgras is gemaakt van kunststof en kan smelten door openspattende vonken of directe hitte. Houd open vuur en hete voorwerpen altijd op veilige afstand.';

  @override
  String get faqGardenerQ1 => 'Hoe vaak moet ik planten water geven?';

  @override
  String get faqGardenerA1 =>
      'De meeste planten hebben baat bij diep water geven 1–3 keer per week, afhankelijk van de weersomstandigheden.';

  @override
  String get faqGardenerQ2 => 'Welk type grond is het beste?';

  @override
  String get faqGardenerA2 =>
      'Goed doorlatende grond verrijkt met compost is geschikt voor de meeste tuinplanten.';

  @override
  String get faqGardenerQ3 => 'Hoe verbeter ik de grondkwaliteit?';

  @override
  String get faqGardenerA3 =>
      'Voeg regelmatig compost, organisch materiaal en mulch toe.';

  @override
  String get faqGardenerQ4 => 'Wanneer moet ik bemesten?';

  @override
  String get faqGardenerA4 =>
      'De meeste planten hebben baat bij bemesting tijdens het groeiseizoen.';

  @override
  String get faqGardenerQ5 => 'Hoe beheers ik onkruid?';

  @override
  String get faqGardenerA5 =>
      'Mulchen en regelmatig wieden zijn de meest effectieve methoden.';

  @override
  String get faqGardenerQ6 => 'Kan ik planten in de zomer?';

  @override
  String get faqGardenerA6 =>
      'Ja, maar planten hebben mogelijk vaker water nodig.';

  @override
  String get faqGardenerQ7 => 'Waarvoor wordt mulch gebruikt?';

  @override
  String get faqGardenerA7 =>
      'Mulch houdt vocht vast, onderdrukt onkruid en verbetert de bodemgezondheid.';

  @override
  String get faqGardenerQ8 => 'Hoe snoei ik struiken correct?';

  @override
  String get faqGardenerA8 =>
      'Verwijder dode of beschadigde takken en snoei volgens het plantentype.';

  @override
  String get faqGardenerQ9 => 'Hoe trek ik bestuivers aan?';

  @override
  String get faqGardenerA9 =>
      'Plant bloeiende soorten die bijen en vlinders aantrekken.';

  @override
  String get faqGardenerQ10 =>
      'Hoe voorkom ik plagen op een natuurlijke manier?';

  @override
  String get faqGardenerA10 =>
      'Stimuleer nuttige insecten en gebruik biologische bestrijdingsmiddelen.';

  @override
  String get faqGardenerQ11 =>
      'Wanneer is het beste moment om het gazon te maaien?';

  @override
  String get faqGardenerA11 =>
      'Maai regelmatig tijdens het groeiseizoen en vermijd te kort maaien.';

  @override
  String get faqGardenerQ12 => 'Hoe start ik een moestuin?';

  @override
  String get faqGardenerA12 =>
      'Kies een zonnige locatie, bereid de grond voor en selecteer geschikte gewassen.';

  @override
  String get faqGardenerQ13 => 'Kan ik tuinieren in containers?';

  @override
  String get faqGardenerA13 =>
      'Ja, containertuinieren is ideaal voor terrassen en kleine ruimtes.';

  @override
  String get faqGardenerQ14 => 'Hoe verlaag ik het tuinonderhoud?';

  @override
  String get faqGardenerA14 =>
      'Gebruik mulch, droogtebestendige planten en geautomatiseerde beregening indien mogelijk.';

  @override
  String get faqGardenerQ15 => 'Wat zijn veelgemaakte tuinfouten?';

  @override
  String get faqGardenerA15 =>
      'Te veel water geven, slechte plantenafstand en het verwaarlozen van grondvoorbereiding.';

  @override
  String get faqGardenerQ16 => 'Hoe lang duurt deze tuinklus?';

  @override
  String get faqGardenerA16 =>
      'Dit varieert sterk per klus. Een gazon aanleggen kost een halve dag; een terras aanleggen kan 1–3 dagen duren, afhankelijk van de grootte.';

  @override
  String get faqGardenerQ17 => 'Welk gereedschap heb ik nodig?';

  @override
  String get faqGardenerA17 =>
      'Basisgereedschap bestaat uit: schop, hark, kruiwagen, snoeischaar en tuinhandschoenen. Specifieke klussen kunnen extra gereedschap vereisen.';

  @override
  String get faqGardenerQ18 =>
      'Wanneer is het beste moment voor tuinwerkzaamheden?';

  @override
  String get faqGardenerA18 =>
      'Lente en herfst zijn ideale momenten voor aanplant en grote werkzaamheden. Vermijd extreme hitte of vorst.';

  @override
  String get faqGardenerQ19 => 'Hoe controleer ik of mijn grond goed is?';

  @override
  String get faqGardenerA19 =>
      'Neem een grondmonster en test de pH-waarde. Meeste planten groeien het beste bij een pH van 6–7. Voeg compost toe om de bodemkwaliteit te verbeteren.';

  @override
  String get faqGardenerQ20 => 'Kan ik dit als beginner doen?';

  @override
  String get faqGardenerA20 =>
      'Ja, de meeste tuinklussen zijn met het juiste gereedschap en ons stappenplan prima zelfstandig te doen.';

  @override
  String get faqCarpenterQ1 => 'Welk houtsoort moet ik kiezen?';

  @override
  String get faqCarpenterA1 =>
      'De beste keuze hangt af van het project. Grenen is betaalbaar, terwijl hardhout duurzamer is.';

  @override
  String get faqCarpenterQ2 => 'Hoe meet ik nauwkeurig?';

  @override
  String get faqCarpenterA2 =>
      'Meet twee keer en zaag één keer om kostbare fouten te voorkomen.';

  @override
  String get faqCarpenterQ3 => 'Moet ik voorboren?';

  @override
  String get faqCarpenterA3 => 'Ja, voorboren helpt voorkomen dat hout splijt.';

  @override
  String get faqCarpenterQ4 => 'Welke schroeven moet ik gebruiken?';

  @override
  String get faqCarpenterA4 =>
      'Samengevat voor de gemiddelde klusser:\nBuiten = RVS met Torx, lengte is 2,5x de houtdikte, en dikte is 6mm voor regels en 8mm+ voor zware balken. Binnen = goedkope gegalvaniseerde schroeven met dezelfde lengteregel.';

  @override
  String get faqCarpenterQ5 => 'Hoe maak ik rechte zagen?';

  @override
  String get faqCarpenterA5 =>
      'Gebruik een geleiderail, winkelhaak of aanslag bij het zagen.';

  @override
  String get faqCarpenterQ6 => 'Kan ik sloophout gebruiken?';

  @override
  String get faqCarpenterA6 =>
      'Ja, mits het schoon, droog en constructief gezond is.';

  @override
  String get faqCarpenterQ7 => 'Hoe voorkom ik dat hout krom trekt?';

  @override
  String get faqCarpenterA7 =>
      'Bewaar hout vlak in een droge omgeving voor gebruik.';

  @override
  String get faqCarpenterQ8 => 'Welke veiligheidsuitrusting moet ik dragen?';

  @override
  String get faqCarpenterA8 =>
      'Veiligheidsbril, gehoorbescherming en stofmasker worden aanbevolen.';

  @override
  String get faqCarpenterQ9 => 'Hoe schuur ik hout correct?';

  @override
  String get faqCarpenterA9 =>
      'Begin met grof schuurpapier en werk geleidelijk naar fijner korrel.';

  @override
  String get faqCarpenterQ10 => 'Wanneer moet ik houtlijm gebruiken?';

  @override
  String get faqCarpenterA10 =>
      'Houtlijm versterkt verbindingen en wordt aanbevolen voor de meeste houtbewerkingsprojecten.';

  @override
  String get faqCarpenterQ11 => 'Hoe werk ik houten oppervlakken af?';

  @override
  String get faqCarpenterA11 =>
      'Breng beits, vernis, olie of verf aan, afhankelijk van het gewenste uiterlijk.';

  @override
  String get faqCarpenterQ12 => 'Wat zijn veelgemaakte timmermanfouten?';

  @override
  String get faqCarpenterA12 =>
      'Onjuiste metingen, slechte uitlijning en het haasten van het montageproces.';

  @override
  String get faqCarpenterQ13 => 'Hoe lang gaat een houtwerkproject mee?';

  @override
  String get faqCarpenterA13 =>
      'Met goede materialen en onderhoud kunnen houtbewerkingsprojecten tientallen jaren meegaan.';

  @override
  String get faqCarpenterQ14 => 'Hoe lang duurt deze klus?';

  @override
  String get faqCarpenterA14 =>
      'Gemiddeld rekent u op een halve tot een hele dag voor een standaard timmerwerkklus. Bij grotere projecten kan dit oplopen tot meerdere dagen.';

  @override
  String get faqCarpenterQ15 => 'Welk gereedschap heb ik nodig?';

  @override
  String get faqCarpenterA15 =>
      'Basisgereedschap bestaat uit: meetlint, waterpas, potlood, boormachine, schroeven, zaag en hamer.';

  @override
  String get faqCarpenterQ16 => 'Hoe bereid ik de ondergrond voor?';

  @override
  String get faqCarpenterA16 =>
      'Controleer of de vloer of wand vlak en stevig is. Verwijder losse delen en zorg dat het oppervlak droog en schoon is.';

  @override
  String get faqCarpenterQ17 => 'Hoeveel materiaal moet ik extra bestellen?';

  @override
  String get faqCarpenterA17 =>
      'Bestel altijd 10% extra als snijverlies. Schakel de optie \"snijverlies\" in de app in om dit automatisch mee te berekenen.';

  @override
  String get faqCarpenterQ18 => 'Kan ik dit als beginner doen?';

  @override
  String get faqCarpenterA18 =>
      'Ja, met de juiste voorbereiding en ons stappenplan kunt u deze klus zelfstandig uitvoeren.';

  @override
  String get faqCarpenterQ19 => 'Moet ik een vergunning aanvragen?';

  @override
  String get faqCarpenterA19 =>
      'Voor de meeste doe-het-zelf klussen binnenshuis is geen vergunning vereist. Voor buitenwerk of constructieve aanpassingen raadpleegt u uw gemeente.';

  @override
  String get faqCarpenterQ20 => 'Welke bouwmarkt raadt u aan?';

  @override
  String get faqCarpenterA20 =>
      'Voor particuliere klussers raden wij Gamma en Hornbach aan voor een breed assortiment en goede prijzen. Voor vakmannen en bouwbedrijven zijn professionele groothandels zoals Bouwmaat en Jongeneel de beste keuze voor specialistische bouwmaterialen en bulkvoorraad.';

  @override
  String get faqVloerleggenQ1 => 'Moet ik laminaat laten acclimatiseren?';

  @override
  String get faqVloerleggenA1 => 'Volg de fabrikant; vaak 48 uur.';

  @override
  String get faqVloerleggenQ2 => 'Wat als de ondervloer niet vlak is?';

  @override
  String get faqVloerleggenA2 =>
      'Egaliseren of een geschikte onderlaag gebruiken.';

  @override
  String get faqVloerleggenQ3 => 'Heb ik een ondervloer nodig?';

  @override
  String get faqVloerleggenA3 =>
      'Meestal wel, voor geluidsdemping en stabiliteit.';

  @override
  String get faqVloerleggenQ4 => 'Hoeveel ruimte bij de muren?';

  @override
  String get faqVloerleggenA4 => 'Randspeling volgens fabrikant aanhouden.';

  @override
  String get faqVloerleggenQ5 => 'Moet ik wachten voordat ik de vloer beloop?';

  @override
  String get faqVloerleggenA5 =>
      'Volg het kliksysteem; veel systemen zijn direct beloopbaar.';

  @override
  String get faqVloerleggenQ6 => 'Hoe voorkom ik kraken?';

  @override
  String get faqVloerleggenA6 => 'Vlakke ondergrond en juiste montage.';

  @override
  String get faqVloerleggenQ7 => 'Wat bij een beschadigde plank?';

  @override
  String get faqVloerleggenA7 => 'Vervang volgens fabrikant.';

  @override
  String get faqVloerleggenQ8 => 'Hoe onderhoud ik de vloer?';

  @override
  String get faqVloerleggenA8 => 'Geschikt middel, niet te nat.';

  @override
  String get faqVloerleggenQ9 => 'Welke veiligheidsmaatregelen?';

  @override
  String get faqVloerleggenA9 => 'Oog- en oorbescherming bij zagen.';

  @override
  String get faqVloerleggenQ10 => 'Beste tip?';

  @override
  String get faqVloerleggenA10 =>
      'Lees de installatie-instructies en controleer de ondergrond.';

  @override
  String get faqVloerleggenQ11 => 'Hoe onderhoud ik de vloer?';

  @override
  String get faqVloerleggenA11 => 'Geschikt middel, niet te nat.';

  @override
  String get faqDeurPlaatsenQ1 => 'Welk type binnendeur?';

  @override
  String get faqDeurPlaatsenA1 => 'Stomp of opdek.';

  @override
  String get faqDeurPlaatsenQ2 => 'Hoe meet ik deur en kozijn op?';

  @override
  String get faqDeurPlaatsenA2 => 'Dagmaat en speling volgens fabrikant.';

  @override
  String get faqDeurPlaatsenQ3 => 'Waar komen de scharnieren?';

  @override
  String get faqDeurPlaatsenA3 => 'Volg de fabrikant.';

  @override
  String get faqDeurPlaatsenQ4 => 'Hoe voorkom ik klemmen?';

  @override
  String get faqDeurPlaatsenA4 => 'Correcte speling en uitlijning.';

  @override
  String get faqDeurPlaatsenQ5 => 'Wat als de deur niet goed hangt?';

  @override
  String get faqDeurPlaatsenA5 => 'Controleer kozijn, scharnieren en speling.';

  @override
  String get faqDeurPlaatsenQ6 => 'Moet ik wachten met schilderen?';

  @override
  String get faqDeurPlaatsenA6 => 'Volg de verf-fabrikant.';

  @override
  String get faqDeurPlaatsenQ7 => 'Hoe voorkom ik kromtrekken?';

  @override
  String get faqDeurPlaatsenA7 => 'Goede gronding en afwerking.';

  @override
  String get faqDeurPlaatsenQ8 => 'Hoe onderhoud ik hang- en sluitwerk?';

  @override
  String get faqDeurPlaatsenA8 => 'Volg de fabrikant.';

  @override
  String get faqDeurPlaatsenQ9 => 'Meest voorkomende fouten?';

  @override
  String get faqDeurPlaatsenA9 => 'Verkeerde maatvoering, speling of beslag.';

  @override
  String get faqDeurPlaatsenQ10 => 'Beste tip?';

  @override
  String get faqDeurPlaatsenA10 => 'Gebruik een deurheffer en werk veilig.';

  @override
  String get faqPlintenMonerenQ1 => 'Moet ik de muur en vloer schoonmaken?';

  @override
  String get faqPlintenMonerenA1 =>
      'Ja. De ondergronden moeten schoon, droog en stof- en vetvrij zijn voor de gekozen bevestigingsmethode.';

  @override
  String get faqPlintenMonerenQ2 =>
      'Hoe maak ik een 45-graden verstekzaagsnede?';

  @override
  String get faqPlintenMonerenA2 =>
      'Gebruik een verstekbak of afkortzaag en bepaal de werkelijke hoek met een zwaaihaak wanneer de hoek niet exact 90 graden is.';

  @override
  String get faqPlintenMonerenQ3 => 'Hoeveel meter plint heb ik nodig?';

  @override
  String get faqPlintenMonerenA3 =>
      'Meet de totale te bedekken lengte en tel daar over het algemeen ongeveer 10% zaagverlies bij op. Meer kan nodig zijn bij veel hoeken.';

  @override
  String get faqPlintenMonerenQ4 => 'Hoe voorkom ik dat de plint loslaat?';

  @override
  String get faqPlintenMonerenA4 =>
      'Gebruik de juiste bevestigingsmethode voor het type plint en ondergrond. Reinig de ondergrond en volg de voorschriften voor de lijm of tape.';

  @override
  String get faqPlintenMonerenQ5 => 'Hoe ga ik om met oneffen ondergronden?';

  @override
  String get faqPlintenMonerenA5 =>
      'Bij doorlopende plinten kunnen kleine kieren worden afgewerkt met geschikte acrylaatkit. Grote kieren vereisen een passende oplossing; gebruik kit niet als constructief vulmiddel.';

  @override
  String get faqPlintenMonerenQ6 => 'Hoe lang moet de plint drogen?';

  @override
  String get faqPlintenMonerenA6 =>
      'Volg de droog- en uithardingstijd van de gebruikte lijm of kit. Tape/plakplinten systemen kunnen anders werken dan gelijmde of mechanisch bevestigde plinten.';

  @override
  String get faqPlintenMonerenQ7 => 'Wat als de plint niet strak aansluit?';

  @override
  String get faqPlintenMonerenA7 =>
      'Controleer de hoek, vloer en wand. Kleine cosmetische naden kunnen passend worden afgewerkt; grotere afwijkingen dienen eerst te worden opgelost.';

  @override
  String get faqPlintenMonerenQ8 => 'Hoe onderhoud ik plinten?';

  @override
  String get faqPlintenMonerenA8 =>
      'Maak ze schoon met een voor het oppervlak geschikte vochtige doek en repareer eventuele beschadigingen volgens voorschrift van de fabrikant.';

  @override
  String get faqPlintenMonerenQ9 => 'Welke veiligheidsmaatregelen zijn nodig?';

  @override
  String get faqPlintenMonerenA9 =>
      'Gebruik oogbescherming bij het zagen met elektrische zagen en passende adembescherming wanneer er stof vrijkomt. Houd uw handen weg bij de zaaglijn.';

  @override
  String get faqPlintenMonerenQ10 =>
      'Wat is de beste tip voor niet-haakse hoeken?';

  @override
  String get faqPlintenMonerenA10 =>
      'Meet de werkelijke hoek op en test eerst met een kort proefstukje voordat u de definitieve plint zaagt.';

  @override
  String get faqPlakplintQ1 => 'Moet ik muur en vloer schoonmaken?';

  @override
  String get faqPlakplintA1 => 'Ja, schoon, droog en stofvrij.';

  @override
  String get faqPlakplintQ2 => 'Hoe zaag ik een verstek?';

  @override
  String get faqPlakplintA2 => 'Verstekbak of verstekzaag, meet de hoek.';

  @override
  String get faqPlakplintQ3 => 'Hoeveel meter plint?';

  @override
  String get faqPlakplintA3 => 'Omtrek + 10% snijverlies.';

  @override
  String get faqPlakplintQ4 => 'Hoe voorkom ik loslaten?';

  @override
  String get faqPlakplintA4 => 'Schone, droge vloer; stevig aandrukken.';

  @override
  String get faqPlakplintQ5 => 'Hoe werk ik oneffenheden weg?';

  @override
  String get faqPlakplintA5 => 'Niet met kit; zorg voor een vlakke vloer.';

  @override
  String get faqPlakplintQ6 => 'Moet ik wachten voordat de plint wordt belast?';

  @override
  String get faqPlakplintA6 =>
      'Direct klaar; volg het lijm- of kitvoorschrift.';

  @override
  String get faqPlakplintQ7 => 'Wat als de plint niet strak aansluit?';

  @override
  String get faqPlakplintA7 =>
      'Controleer de vloer; vulmiddel bij grote kieren.';

  @override
  String get faqPlakplintQ8 => 'Hoe onderhoud ik plinten?';

  @override
  String get faqPlakplintA8 => 'Vochtige doek.';

  @override
  String get faqPlakplintQ9 => 'Welke veiligheidsmaatregelen?';

  @override
  String get faqPlakplintA9 => 'Oog- en oorbescherming bij zagen.';

  @override
  String get faqPlakplintQ10 => 'Beste tip?';

  @override
  String get faqPlakplintA10 => 'Test met een proefstuk voor de hoek.';

  @override
  String get faqVoorzetplintQ1 => 'Moet ik de muur ontvetten voor het plakken?';

  @override
  String get faqVoorzetplintA1 =>
      'Ja, een ontvette en stofvrije ondergrond is essentieel voor een goede hechting van de lijm of montagelijm. Gebruik een ontvetter en laat de muur volledig drogen.';

  @override
  String get faqVoorzetplintQ2 => 'Hoe zaag ik een verstek van 45 graden?';

  @override
  String get faqVoorzetplintA2 =>
      'Gebruik een verstekbak of elektrische afkortzaag. Zaag met de sierkant naar boven voor een nette afwerking. Controleer de hoek altijd op pas vóór het definitief vastzetten.';

  @override
  String get faqVoorzetplintQ3 => 'Hoeveel meter plint heb ik nodig?';

  @override
  String get faqVoorzetplintA3 =>
      'Meet de omtrek van de ruimte en tel 10% snijverlies op voor de hoeken.';

  @override
  String get faqVoorzetplintQ4 => 'Hoe voorkom ik dat de voorzetplint loslaat?';

  @override
  String get faqVoorzetplintA4 =>
      'Gebruik de juiste montagelijm of dubbelzijdige tape en zorg voor een stofvrije, vetvrije en droge muur. Schroeven bieden extra zekerheid bij zware plinten.';

  @override
  String get faqVoorzetplintQ5 => 'Hoe werk ik oneffenheden weg?';

  @override
  String get faqVoorzetplintA5 =>
      'Kit de naden rondom af met acrylaatkit en strijk deze glad met een natte vinger of gladstrijkgereedschap voor een nette afwerking.';

  @override
  String get faqVoorzetplintQ6 =>
      'Hoe lang moet kit drogen voor het schilderen?';

  @override
  String get faqVoorzetplintA6 =>
      'Acrylaatkit is meestal na 1 uur aanraakdroog en na 24 uur volledig uitgehard. Volg de droogtijd op de verpakking van het gebruikte product.';

  @override
  String get faqVoorzetplintQ7 =>
      'Wat als de voorzetplint niet strak aansluit aan de muur?';

  @override
  String get faqVoorzetplintA7 =>
      'Breng extra kit aan of gebruik een vulstukje. Bij grotere kieren is purschuim of een extra strip hout een betere oplossing dan alleen kit.';

  @override
  String get faqVoorzetplintQ8 => 'Hoe onderhoud ik voorzetplinten?';

  @override
  String get faqVoorzetplintA8 =>
      'Neem regelmatig af met een licht vochtige doek. Bij gelakte plinten: werk beschadigingen bij met bijpassende lak. Controleer de kitvoeg jaarlijks.';

  @override
  String get faqVoorzetplintQ9 =>
      'Welke veiligheidsmaatregelen gelden bij het zagen?';

  @override
  String get faqVoorzetplintA9 =>
      'Draag een stofmasker en werkhandschoenen. Gebruik altijd een scherp zaagblad voor een rechte en stofvrije snede.';

  @override
  String get faqVoorzetplintQ10 =>
      'Wat is de beste tip voor onzichtbare hoeken?';

  @override
  String get faqVoorzetplintA10 =>
      'Zaag met de sierkant naar boven en gebruik een fijn getand zaagblad. Controleer altijd de hoek op pas vóór het definitief vastzetten.';

  @override
  String get faqTrapRenoverenQ1 => 'Moet ik de trap egaliseren?';

  @override
  String get faqTrapRenoverenA1 => 'Alleen als dat nodig is.';

  @override
  String get faqTrapRenoverenQ2 => 'Hoeveel materiaal heb ik nodig?';

  @override
  String get faqTrapRenoverenA2 =>
      'Tel de treden en meet breedte, diepte en hoogte. Houd zaagverlies aan.';

  @override
  String get faqTrapRenoverenQ3 => 'Welke lijm gebruik ik?';

  @override
  String get faqTrapRenoverenA3 => 'Een lijm die geschikt is voor laminaat.';

  @override
  String get faqTrapRenoverenQ4 =>
      'Moet ik wachten voordat ik de trap gebruik?';

  @override
  String get faqTrapRenoverenA4 => 'Volg de lijmfabrikant.';

  @override
  String get faqTrapRenoverenQ5 => 'Hoe werk ik de randen af?';

  @override
  String get faqTrapRenoverenA5 => 'Met trapneuzen en profielen.';

  @override
  String get faqTrapRenoverenQ6 => 'Wat als een trede beschadigd is?';

  @override
  String get faqTrapRenoverenA6 => 'Repareer of vervang de trede.';

  @override
  String get faqTrapRenoverenQ7 => 'Hoe onderhoud ik de trap?';

  @override
  String get faqTrapRenoverenA7 => 'Volg het onderhoudsadvies.';

  @override
  String get faqTrapRenoverenQ8 => 'Welke veiligheidsmaatregelen?';

  @override
  String get faqTrapRenoverenA8 =>
      'Stabiele toegang, ventilatie en persoonlijke bescherming.';

  @override
  String get faqTrapRenoverenQ9 => 'Meest voorkomende fouten?';

  @override
  String get faqTrapRenoverenA9 => 'Meten, voorbereiding, lijm en afwerking.';

  @override
  String get faqTrapRenoverenQ10 => 'Beste tip?';

  @override
  String get faqTrapRenoverenA10 => 'Werk eerst één trede af als referentie.';

  @override
  String get faqTrapRenoverenQ11 => 'Hoe werk ik randen en hoeken af?';

  @override
  String get faqTrapRenoverenA11 =>
      'Gebruik trapneuzen en profielen die geschikt zijn voor het gekozen systeem. Volg de instructies van de fabrikant voor een nette afwerking.';

  @override
  String get faqWandPlaatsenQ1 =>
      'Wat is de juiste hart-op-hart afstand voor de staanders?';

  @override
  String get faqWandPlaatsenA1 =>
      'Volg het gekozen wandsysteem en de instructies van de fabrikant. Een afstand van 600 mm is gebruikelijk in veel Metal Stud systemen, maar is niet universeel correct voor elke plaat, wand of belasting.';

  @override
  String get faqWandPlaatsenQ2 => 'Heb ik isolatie nodig?';

  @override
  String get faqWandPlaatsenA2 =>
      'Isolatie is afhankelijk van het doel van de wand, zoals thermische isolatie of geluidsisolatie. Kies een materiaal en dikte die geschikt is voor het gekozen wandsysteem.';

  @override
  String get faqWandPlaatsenQ3 => 'Hoe bouw ik het frame waterpas?';

  @override
  String get faqWandPlaatsenA3 =>
      'Teken de wand af, installeer de U-profielen volgens het systeem en controleer de vloer, plafond en staanders op uitlijning. Metal Stud U- en C-profielen zijn normaal gesproken gemaakt van verzinkt staal.';

  @override
  String get faqWandPlaatsenQ4 =>
      'Hoe lang moet ik wachten voor ik kan afvoegen/kitten?';

  @override
  String get faqWandPlaatsenA4 =>
      'Er is geen algemene verplichte wachttijd van 24 uur voor de constructie. Volg de verwerkingstijden van de voegmassa, kit en andere gebruikte producten.';

  @override
  String get faqWandPlaatsenQ5 => 'Hoe werk ik de naden en schroefgaten af?';

  @override
  String get faqWandPlaatsenA5 =>
      'Gebruik voor gipsplaten een geschikt voeg-/afwerkingssysteem, zoals voegpasta en wapeningsband waar het systeem dit vereist. Volg de instructies van de fabrikant.';

  @override
  String get faqWandPlaatsenQ6 => 'Wat als de vloer of wand niet waterpas is?';

  @override
  String get faqWandPlaatsenA6 =>
      'Lijn het frame correct uit met behulp van geschikte, stabiele bevestigings- en uitvulmaterialen. Gebruik purschuim niet als algemeen constructief vulmiddel.';

  @override
  String get faqWandPlaatsenQ7 => 'Hoe onderhoud ik de wand?';

  @override
  String get faqWandPlaatsenA7 =>
      'Onderhoud de wand na een juiste afwerking volgens het gekozen verf- of afwerkingssysteem. Volg de instructies van de verf- en platenfabrikant.';

  @override
  String get faqWandPlaatsenQ8 => 'Welke veiligheidsmaatregelen zijn vereist?';

  @override
  String get faqWandPlaatsenA8 =>
      'Gebruik oog-, hand- en adembescherming waar nodig. Pas op voor scherpe randen van de profielen en werk vanaf een stabiele trap of steiger die geschikt is voor de situatie.';

  @override
  String get faqWandPlaatsenQ9 => 'Wat zijn de meest gemaakte fouten?';

  @override
  String get faqWandPlaatsenA9 =>
      'Veelvoorkomende fouten zijn: verkeerde systeemkeuze, onjuiste hart-op-hart (h.o.h.) afstand, onvoldoende bevestiging, ontbrekende versteviging en verkeerde naadafwerking.';

  @override
  String get faqWandPlaatsenQ10 => 'Wat is de beste tip voor een sterke wand?';

  @override
  String get faqWandPlaatsenA10 =>
      'Plan zware bevestigingspunten vooraf en installeer geschikte achterhout/ondersteuning of systeemversteviging volgens de instructies van de wandfabrikant.';

  @override
  String get faqWandPlaatsenQ11 =>
      'Hoe hang ik een zwaar object op aan deze wand?';

  @override
  String get faqWandPlaatsenA11 =>
      'Gebruik speciale gipsplaatschroeven of -pluggen voor lichte objecten. Voor zware objecten moet een verstevigd houten blok achter de gipsplaat zijn geplaatst tijdens de bouw van de wand.';

  @override
  String get faqVloertegelsBadkamerQ1 =>
      'Moet ik egaliseren, voorstrijken en ontvetten?';

  @override
  String get faqVloertegelsBadkamerA1 =>
      'Ja. Controleer de vlakheid en draagkracht van de ondergrond en egaliseer waar nodig. Gebruik voorstrijk als het lijmsysteem of de ondergrond dat vereist. Ontvetten met een geschikte ontvetter/cleaner bij een vettige of verontreinigde ondergrond, zoals een keuken.';

  @override
  String get faqVloertegelsBadkamerQ2 =>
      'Hoe bereken ik snijverlies en het aantal tegels?';

  @override
  String get faqVloertegelsBadkamerA2 =>
      'Bereken het oppervlak en deel dat door het oppervlak van één tegel. Reken als richtlijn circa 10% snijverlies. Bij een patroon of diagonale verlegging reken dan circa 15% of meer.';

  @override
  String get faqVloertegelsBadkamerQ3 =>
      'Hoe zorg ik voor een goede hechting van de tegellijm?';

  @override
  String get faqVloertegelsBadkamerA3 =>
      'Gebruik de juiste getande spaan en lijm voor de tegel en ondergrond. Breng de lijm aan op een schone, stofvrije ondergrond. Pas bij grote tegels back-buttering toe volgens de aanwijzingen van de lijmfabrikant.';

  @override
  String get faqVloertegelsBadkamerQ4 => 'Hoe lang wachten voor het voegen?';

  @override
  String get faqVloertegelsBadkamerA4 =>
      'Vaak minimaal 24 uur. Grote tegels, lage temperaturen of een weinig absorberend substraat kunnen meer tijd vragen. Volg altijd het productdatasheet.';

  @override
  String get faqVloertegelsBadkamerQ5 =>
      'Hoe voorkom ik hoogteverschillen tussen tegels?';

  @override
  String get faqVloertegelsBadkamerA5 =>
      'Gebruik tegelwiggen of een tegelnivelleersysteem. Controleer regelmatig met een waterpas en rei.';

  @override
  String get faqVloertegelsBadkamerQ6 =>
      'Wat doe ik bij een losse of gebroken tegel?';

  @override
  String get faqVloertegelsBadkamerA6 =>
      'Verwijder de tegel voorzichtig. Verwijder losse lijm en stof van de ondergrond. Leg een geschikte vervangende tegel met passende lijm.';

  @override
  String get faqVloertegelsBadkamerQ7 => 'Hoe schoonmaken na het voegen?';

  @override
  String get faqVloertegelsBadkamerA7 =>
      'Verwijder voegresten op het juiste moment met een geschikte spons en schoon water vóór de voeg volledig uitgehard is.';

  @override
  String get faqVloertegelsBadkamerQ8 => 'Hoe onderhoud ik een tegelvloer?';

  @override
  String get faqVloertegelsBadkamerA8 =>
      'Gebruik een pH-neutraal reinigingsmiddel dat geschikt is voor de tegel. Vermijd schurende reinigingsmiddelen.';

  @override
  String get faqVloertegelsBadkamerQ9 =>
      'Welke veiligheidsmaatregelen gelden bij het zagen?';

  @override
  String get faqVloertegelsBadkamerA9 =>
      'Gebruik waar mogelijk natte verwerking of bronafzuiging met een bouwstofzuiger om kiezelstof te beperken. Draag geschikte oog-, gehoor- en ademhaling bescherming.\n\n⚠️ Raadpleeg bij twijfel een vakman. Controleer altijd de aanwijzingen van het te gebruiken materiaal en de geldende Nederlandse regelgeving.';

  @override
  String get faqVloertegelsBadkamerQ10 => 'Hoe lang duurt het?';

  @override
  String get faqVloertegelsBadkamerA10 =>
      'Vakman: 0,50 uur per m². Zelfklus: 1,20 uur per m².';

  @override
  String get faqWandtegelsPlaatsenQ1 =>
      'Moet ik egaliseren, voorstrijken en ontvetten?';

  @override
  String get faqWandtegelsPlaatsenA1 =>
      'Controleer of de wand vlak, schoon, droog, draagkrachtig en vetvrij is. Egaliseer waar nodig en gebruik voorstrijk als de ondergrond of het lijmsysteem dat vereist. Ontvetten met een geschikte ontvetter/cleaner bij een vettige of verontreinigde ondergrond, zoals een keukenwand.';

  @override
  String get faqWandtegelsPlaatsenQ2 =>
      'Hoe bereken ik het aantal tegels en snijverlies?';

  @override
  String get faqWandtegelsPlaatsenA2 =>
      'Bereken het wandoppervlak en deel dat door het oppervlak van één tegel. Reken als richtlijn circa 10% extra. Bij een patroon of diagonale verlegging circa 15% of meer.';

  @override
  String get faqWandtegelsPlaatsenQ3 => 'Hoe voorkom ik dat tegels loslaten?';

  @override
  String get faqWandtegelsPlaatsenA3 =>
      'Gebruik de juiste getande spaan en lijm voor de tegel en ondergrond. Breng niet te veel lijm tegelijk aan en druk de tegels stevig aan. Back-buttering kan nodig zijn bij grote tegels.';

  @override
  String get faqWandtegelsPlaatsenQ4 => 'Hoe lang wachten voor het voegen?';

  @override
  String get faqWandtegelsPlaatsenA4 =>
      'Vaak minimaal 24 uur. Grote tegels of ongunstige omstandigheden kunnen langer vragen. Volg het productdatasheet.';

  @override
  String get faqWandtegelsPlaatsenQ5 =>
      'Hoe zaag ik tegels zonder ze te breken?';

  @override
  String get faqWandtegelsPlaatsenA5 =>
      'Gebruik een tegelsnijder voor rechte sneden. Gebruik een haakse slijper met diamantblad voor uitsparingen. Werk rustig en ondersteun de tegel goed.';

  @override
  String get faqWandtegelsPlaatsenQ6 => 'Wat als de wand niet vlak is?';

  @override
  String get faqWandtegelsPlaatsenA6 =>
      'Herstel of egaliser de ondergrond waar nodig vóór het tegelen. Probeer niet eindeloos te compenseren met extra lijm.';

  @override
  String get faqWandtegelsPlaatsenQ7 => 'Hoe werk ik bij schuine wanden?';

  @override
  String get faqWandtegelsPlaatsenA7 =>
      'Meet de hoek op met een glijhoek en zaag de tegels op maat. Begin vanuit een rechte loodlijn en controleer regelmatig met een waterpas.';

  @override
  String get faqWandtegelsPlaatsenQ8 => 'Hoe schoonmaken na het voegen?';

  @override
  String get faqWandtegelsPlaatsenA8 =>
      'Gebruik een zachte spons en schoon water op het juiste moment, vóór de voeg volledig uitgehard is. Ververs het water regelmatig.';

  @override
  String get faqWandtegelsPlaatsenQ9 => 'Hoe onderhoud ik wandtegels?';

  @override
  String get faqWandtegelsPlaatsenA9 =>
      'Gebruik een vochtige doek en mild reinigingsmiddel. Vermijd schurende middelen.\n\n⚠️ Raadpleeg bij twijfel een vakman. Controleer altijd de aanwijzingen van het te gebruiken materiaal en de geldende Nederlandse regelgeving.';

  @override
  String get faqWandtegelsPlaatsenQ10 => 'Hoe lang duurt het?';

  @override
  String get faqWandtegelsPlaatsenA10 =>
      'Vakman: 0,40 uur per m². Zelfklus: 1,00 uur per m².';

  @override
  String get faqKraanVervangenQ1 => 'Moet ik het water afsluiten?';

  @override
  String get faqKraanVervangenA1 =>
      'Ja. Sluit de betreffende afsluiter of hoofdkraan en maak de leiding drukloos.';

  @override
  String get faqKraanVervangenQ2 => 'Hoe verwijder ik de oude kraan?';

  @override
  String get faqKraanVervangenA2 =>
      'Gebruik passend gereedschap en houd vaste aansluitingen tegen. Forceer geen vastzittende of beschadigde verbindingen.';

  @override
  String get faqKraanVervangenQ3 => 'Hoe weet ik welke kraan ik nodig heb?';

  @override
  String get faqKraanVervangenA3 =>
      'Controleer of het om bladmontage of wandmontage gaat en meet de bestaande aansluiting en beschikbare ruimte.';

  @override
  String get faqKraanVervangenQ4 =>
      'Welke aansluiting heeft een standaard bladkraan?';

  @override
  String get faqKraanVervangenA4 =>
      'Veel keukenkranen worden met flexibele aansluitslangen en een gebruikelijke aansluiting geleverd. Controleer altijd het specifieke product.';

  @override
  String get faqKraanVervangenQ5 =>
      'Moet een houten werkblad worden afgedicht?';

  @override
  String get faqKraanVervangenA5 =>
      'Bij een houten werkblad kan afdichting rond de kraandoorvoer nodig zijn om vochtindringing te voorkomen. Volg de voorschriften van het werkblad en de kit.';

  @override
  String get faqKraanVervangenQ6 => 'Hoe controleer ik op lekkage?';

  @override
  String get faqKraanVervangenA6 =>
      'Open de watertoevoer rustig en controleer alle aansluitingen met een droge doek.';

  @override
  String get faqKraanVervangenQ7 => 'Wat als de kraan blijft lekken?';

  @override
  String get faqKraanVervangenA7 =>
      'Sluit het water af en controleer aansluiting, afdichting en montagemethode. Draai verbindingen niet onbeperkt strakker.';

  @override
  String get faqKraanVervangenQ8 =>
      'Kan ik een oude kraan altijd vervangen door een nieuwe?';

  @override
  String get faqKraanVervangenA8 =>
      'Niet zonder controle. Controleer aansluiting, gatmaat, beschikbare ruimte en type kraan.';

  @override
  String get faqKraanVervangenQ9 => 'Meest voorkomende fout?';

  @override
  String get faqKraanVervangenA9 =>
      'Verkeerde maatvoering of een aansluiting te strak aandraaien.';

  @override
  String get faqKraanVervangenQ10 => 'Beste tip?';

  @override
  String get faqKraanVervangenA10 =>
      'Maak vóór demontage een foto en vergelijk alle aansluitingen met de nieuwe kraan.';

  @override
  String get faqLeidingOntstoppenQ1 => 'Waar begin ik?';

  @override
  String get faqLeidingOntstoppenA1 =>
      'Begin bij een lichte verstopping met een plopper.';

  @override
  String get faqLeidingOntstoppenQ2 =>
      'Wanneer gebruik ik een ontstoppingsveer?';

  @override
  String get faqLeidingOntstoppenA2 =>
      'Wanneer de plopper onvoldoende resultaat geeft en de verstopping bereikbaar is.';

  @override
  String get faqLeidingOntstoppenQ3 =>
      'Moet ik chemische ontstopper gebruiken?';

  @override
  String get faqLeidingOntstoppenA3 =>
      'Niet standaard. Mechanisch ontstoppen heeft de voorkeur. Gebruik een chemisch middel alleen wanneer dit voor de toepassing geschikt is en volg exact het etiket.';

  @override
  String get faqLeidingOntstoppenQ4 =>
      'Mag ik verschillende ontstoppingsmiddelen mengen?';

  @override
  String get faqLeidingOntstoppenA4 =>
      'Nee. Meng nooit verschillende chemische middelen.';

  @override
  String get faqLeidingOntstoppenQ5 => 'Kan ik de sifon reinigen?';

  @override
  String get faqLeidingOntstoppenA5 =>
      'Bij een bereikbare sifon kan deze worden gedemonteerd en gereinigd, mits dit veilig en passend is.';

  @override
  String get faqLeidingOntstoppenQ6 => 'Wat als de verstopping terugkomt?';

  @override
  String get faqLeidingOntstoppenA6 =>
      'Laat de oorzaak onderzoeken in plaats van steeds opnieuw middelen te gebruiken.';

  @override
  String get faqLeidingOntstoppenQ7 => 'Wanneer professional inschakelen?';

  @override
  String get faqLeidingOntstoppenA7 =>
      'Bij een diepe, hardnekkige of terugkerende verstopping of vermoedelijke leidingbeschadiging.';

  @override
  String get faqLeidingOntstoppenQ8 => 'Welke bescherming?';

  @override
  String get faqLeidingOntstoppenA8 =>
      'Handschoenen en oogbescherming. Extra voorzichtig wanneer eerder chemicaliën zijn gebruikt.';

  @override
  String get faqLeidingOntstoppenQ9 => 'Wat is een veelgemaakte fout?';

  @override
  String get faqLeidingOntstoppenA9 =>
      'Te hard forceren of chemische middelen mengen.';

  @override
  String get faqLeidingOntstoppenQ10 => 'Beste tip?';

  @override
  String get faqLeidingOntstoppenA10 =>
      'Begin mechanisch en onderzoek terugkerende verstoppingen.';

  @override
  String get faqToiletInstallerenQ1 => 'Moet de bestaande afvoer passen?';

  @override
  String get faqToiletInstallerenA1 =>
      'Ja. Controleer positie, maat, type en aansluitmogelijkheden vóór aankoop.';

  @override
  String get faqToiletInstallerenQ2 => 'Standaard of verhoogd toilet?';

  @override
  String get faqToiletInstallerenA2 =>
      'Een standaard toilet is het uitgangspunt. Een verhoogd toilet heeft een hogere zithoogte; de exacte hoogte verschilt per model.';

  @override
  String get faqToiletInstallerenQ3 => 'Kan ieder toilet op iedere afvoer?';

  @override
  String get faqToiletInstallerenA3 =>
      'Nee. Controleer de aansluitmaten en positie.';

  @override
  String get faqToiletInstallerenQ4 => 'Hoe bevestig ik het toilet?';

  @override
  String get faqToiletInstallerenA4 =>
      'Gebruik de bevestiging van de fabrikant en zorg dat het toilet stabiel en waterpas staat.';

  @override
  String get faqToiletInstallerenQ5 => 'Waarvoor dient sanitairkit?';

  @override
  String get faqToiletInstallerenA5 =>
      'Voor afdichting waar dit volgens het systeem nodig is. Kit is geen vervanging voor mechanische bevestiging.';

  @override
  String get faqToiletInstallerenQ6 => 'Hoe controleer ik de aansluiting?';

  @override
  String get faqToiletInstallerenA6 =>
      'Na montage rustig doorspoelen en alle aansluitingen controleren op lekkage.';

  @override
  String get faqToiletInstallerenQ7 => 'Wat bij een lekkende aansluiting?';

  @override
  String get faqToiletInstallerenA7 =>
      'Water afsluiten en de betreffende aansluiting opnieuw controleren.';

  @override
  String get faqToiletInstallerenQ8 => 'Welke bescherming?';

  @override
  String get faqToiletInstallerenA8 =>
      'Handschoenen, veilig tillen en rekening houden met restwater.';

  @override
  String get faqToiletInstallerenQ9 => 'Meest voorkomende fouten?';

  @override
  String get faqToiletInstallerenA9 =>
      'Verkeerde afvoermaat, verkeerde aansluiting of onvoldoende bevestiging.';

  @override
  String get faqToiletInstallerenQ10 => 'Beste tip?';

  @override
  String get faqToiletInstallerenA10 =>
      'Meet eerst alle aansluitmaten voordat je het toilet koopt.';

  @override
  String get faqCvBijvullenQ1 => 'Wanneer moet ik bijvullen?';

  @override
  String get faqCvBijvullenA1 =>
      'Wanneer de druk volgens de handleiding van het toestel te laag is.';

  @override
  String get faqCvBijvullenQ2 => 'Welke waarde moet ik aanhouden?';

  @override
  String get faqCvBijvullenA2 =>
      'De voorgeschreven waarde van het specifieke toestel is leidend.';

  @override
  String get faqCvBijvullenQ3 => 'Moet de installatie afgekoeld zijn?';

  @override
  String get faqCvBijvullenA3 =>
      'Volg hiervoor de handleiding van het toestel.';

  @override
  String get faqCvBijvullenQ4 => 'Hoe vul ik bij?';

  @override
  String get faqCvBijvullenA4 =>
      'Gebruik uitsluitend de voorgeschreven vulprocedure.';

  @override
  String get faqCvBijvullenQ5 => 'Moet ik daarna ontluchten?';

  @override
  String get faqCvBijvullenA5 =>
      'Alleen wanneer dit volgens de handleiding of de situatie nodig is.';

  @override
  String get faqCvBijvullenQ6 => 'Wat als de druk steeds daalt?';

  @override
  String get faqCvBijvullenA6 =>
      'Niet steeds opnieuw bijvullen. Terugkerend drukverlies kan wijzen op een probleem of lekkage.';

  @override
  String get faqCvBijvullenQ7 => 'Mag ik de ketel zelf repareren?';

  @override
  String get faqCvBijvullenA7 =>
      'Nee. Werkzaamheden aan gasverbrandingsinstallaties moeten door een daarvoor gecertificeerd bedrijf worden uitgevoerd.';

  @override
  String get faqCvBijvullenQ8 => 'Mag ik gaszijdige onderdelen openen?';

  @override
  String get faqCvBijvullenA8 => 'Nee.';

  @override
  String get faqCvBijvullenQ9 => 'Wat is een veelgemaakte fout?';

  @override
  String get faqCvBijvullenA9 =>
      'Te veel of te snel bijvullen en terugkerend drukverlies negeren.';

  @override
  String get faqCvBijvullenQ10 => 'Beste tip?';

  @override
  String get faqCvBijvullenA10 =>
      'Bewaar de handleiding van het toestel en volg de specifieke vulprocedure.';

  @override
  String get faqLeidingAanleggenQ1 => 'Welke leiding moet ik gebruiken?';

  @override
  String get faqLeidingAanleggenA1 =>
      'Gebruik een systeem dat geschikt is voor de toepassing en het gekozen waterleidingdoel.';

  @override
  String get faqLeidingAanleggenQ2 => 'Welke diameter moet ik gebruiken?';

  @override
  String get faqLeidingAanleggenA2 =>
      'Niet automatisch 12 of 15 mm. De benodigde diameter hangt af van toepassing, leidinglengte, benodigde volumestroom en het gekozen systeem.';

  @override
  String get faqLeidingAanleggenQ3 =>
      'Moet warmwaterleiding worden geïsoleerd?';

  @override
  String get faqLeidingAanleggenA3 =>
      'Waar warmteverlies moet worden beperkt, kan leidingisolatie worden toegepast volgens de installatie-eisen.';

  @override
  String get faqLeidingAanleggenQ4 => 'Hoeveel leiding heb ik nodig?';

  @override
  String get faqLeidingAanleggenA4 =>
      'Meet de volledige route en houd rekening met bochten, aansluitingen en snijverlies.';

  @override
  String get faqLeidingAanleggenQ5 => 'Hoe verbind ik koperen leiding?';

  @override
  String get faqLeidingAanleggenA5 =>
      'Gebruik een geschikt verbindingssysteem en volg de voorschriften van fabrikant en installatie.';

  @override
  String get faqLeidingAanleggenQ6 => 'Kan ik een buigijzer gebruiken?';

  @override
  String get faqLeidingAanleggenA6 =>
      'Ja, wanneer dit geschikt is voor de gekozen buis en toepassing.';

  @override
  String get faqLeidingAanleggenQ7 => 'Hoe bevestig ik leidingen?';

  @override
  String get faqLeidingAanleggenA7 =>
      'Gebruik geschikte bevestiging volgens het gekozen systeem, materiaal, diameter en temperatuurbelasting.';

  @override
  String get faqLeidingAanleggenQ8 => 'Mag ik zomaar in een muur frezen?';

  @override
  String get faqLeidingAanleggenA8 =>
      'Nee. Controleer vooraf op bestaande leidingen, kabels en bouwkundige beperkingen.';

  @override
  String get faqLeidingAanleggenQ9 => 'Hoe test ik de leiding?';

  @override
  String get faqLeidingAanleggenA9 =>
      'Test de installatie volgens de voorschriften van het gekozen systeem voordat deze definitief wordt weggewerkt.';

  @override
  String get faqLeidingAanleggenQ10 => 'Beste tip?';

  @override
  String get faqLeidingAanleggenA10 =>
      'Maak vooraf een leidingplan met route, aansluitpunten, afsluitpunten en materiaalkeuze. ⚠️ Bij drinkwaterinstallaties moeten geschikte materialen en de toepasselijke Nederlandse eisen worden gevolgd, waaronder NEN 1006 en de Waterwerkbladen.';

  @override
  String get faqStopcontactPlaatsenQ1 =>
      'Gebruik ik een geaard of ongeaard stopcontact?';

  @override
  String get faqStopcontactPlaatsenA1 =>
      'Geaard: bevat beschermingsaarde en is vereist voor apparaten met een geaarde stekker, zoals wasmachines, vaatwassers en magnetrons. Aarding is verplicht in natte ruimten zoals badkamers, keukens, bijkeukens, garages en buiten. Ongeaard: heeft geen beschermingsaarde en is uitsluitend bedoeld voor dubbel geïoleerde apparaten. Bij twijfel, of in een vochtige of natte ruimte, kies altijd een geaard stopcontact.';

  @override
  String get faqStopcontactPlaatsenQ2 =>
      'Moet ik de elektriciteit uitschakelen?';

  @override
  String get faqStopcontactPlaatsenA2 =>
      'Ja. Schakel de groep uit en gebruik een tweepolige spanningstester om te bevestigen dat de installatie spanningsloos is. Werk nooit op een installatiedeel dat onder spanning staat.';

  @override
  String get faqStopcontactPlaatsenQ3 => 'Hoeveel inbouwdozen heb ik nodig?';

  @override
  String get faqStopcontactPlaatsenA3 =>
      'Eén inbouwdoos per stopcontact. Voor een dubbel stopcontact gebruik je een dubbele doos of twee enkele dozen.';

  @override
  String get faqStopcontactPlaatsenQ4 => 'Hoe sluit ik het stopcontact aan?';

  @override
  String get faqStopcontactPlaatsenA4 =>
      'Sluit de fase, nul en beschermingsaarde aan volgens het aansluitschema van het product en de geldende installatievoorschriften. Het installatiedraad is doorgaans al in de wand aanwezig. Gebruik lasklemmen of een lasdoos voor de verbinding. In natte ruimten is een aardlekschakelaar van 30 mA verplicht.';

  @override
  String get faqStopcontactPlaatsenQ5 => 'Hoe lang duurt het?';

  @override
  String get faqStopcontactPlaatsenA5 =>
      'Vakman: 0,75 uur per stopcontact. Doe-het-zelver: 1,9 uur per stopcontact. Inbouwmontage kan langer duren door uitbikken, boren en herstelwerk.';

  @override
  String get faqStopcontactPlaatsenQ6 => 'Wat als het stopcontact niet werkt?';

  @override
  String get faqStopcontactPlaatsenA6 =>
      'Schakel de spanning uit en controleer de aansluiting, bedrading en beveiliging. Schakel bij twijfel niet terug in. Raadpleeg een vakbekwaam persoon.';

  @override
  String get faqStopcontactPlaatsenQ7 =>
      'Welke veiligheidsmaatregelen gelden er?';

  @override
  String get faqStopcontactPlaatsenA7 =>
      'Werk nooit op een installatiedeel dat onder spanning staat. Gebruik geschikte meetapparatuur. Draag passende beschermingsmiddelen. Gebruik een veilige werkmethode. Controleer met een leidingendetector voor het boren.';

  @override
  String get faqStopcontactPlaatsenQ8 =>
      'Wat zijn de meest voorkomende fouten?';

  @override
  String get faqStopcontactPlaatsenA8 =>
      'Onjuiste aansluiting of component, vergeten beschermingsaarde, niet verifiëren dat de groep spanningsloos is, onvoldoende bevestiging, onjuiste inbouwdoos, en een ongeaard stopcontact plaatsen in een natte ruimte waar aarding verplicht is.';

  @override
  String get faqStopcontactPlaatsenQ9 => 'Kan ik dit zelf doen?';

  @override
  String get faqStopcontactPlaatsenA9 =>
      'Ja, mits je de elektriciteit uitschakelt, een spanningstester gebruikt en de aansluitinstructies volgt. Raadpleeg bij twijfel over aarding of wijzigingen aan de groepenkast een erkend elektricien.';

  @override
  String get faqStopcontactPlaatsenQ10 => 'Beste tip?';

  @override
  String get faqStopcontactPlaatsenA10 =>
      'Maak indien veilig eerst een foto van de beginsituatie voordat je iets loskoppelt. Vertrouw nooit alleen op de foto — verifieer de bedrading met meetapparatuur en het aansluitschema van het product. Gebruik in natte ruimten altijd een geaard stopcontact met aardlekschakelaar. Raadpleeg een vakman bij twijfel. Controleer altijd de geldende Nederlandse regelgeving en het technisch productblad.';

  @override
  String get faqVerlichtingPlaatsenQ1 => 'Welk type lamp of armatuur kies ik?';

  @override
  String get faqVerlichtingPlaatsenA1 =>
      'Voor binnenshuis zijn een plafondlamp, hanglamp of opbouwarmatuur het meest gangbaar. In natte ruimten zoals badkamers en keukens gebruik je een vochtbestendige armatuur met een passende IP-klasse, bijvoorbeeld IP44 of hoger.';

  @override
  String get faqVerlichtingPlaatsenQ2 =>
      'Moet ik de elektriciteit uitschakelen?';

  @override
  String get faqVerlichtingPlaatsenA2 =>
      'Ja. Schakel de groep uit en gebruik een tweepolige spanningstester om te bevestigen dat de installatie spanningsloos is.';

  @override
  String get faqVerlichtingPlaatsenQ3 => 'Hoeveel lichtpunten heb ik nodig?';

  @override
  String get faqVerlichtingPlaatsenA3 =>
      'Dit hangt af van de ruimte, de functie en het gewenste lichtniveau. Er is geen universeel aantal.';

  @override
  String get faqVerlichtingPlaatsenQ4 => 'Hoe installeer ik het armatuur?';

  @override
  String get faqVerlichtingPlaatsenA4 =>
      'Monteer de bevestigingsbeugel volgens de handleiding van de fabrikant. Sluit de bedrading aan via het aansluitschema en monteer het armatuur. Het installatiedraad is doorgaans al in het plafond aanwezig. Gebruik een lasdoos of lasklemmen voor de verbinding. Sluit de beschermingsaarde alleen aan als het armatuur of het installatiesysteem dit vereist.';

  @override
  String get faqVerlichtingPlaatsenQ5 => 'Hoe lang duurt het?';

  @override
  String get faqVerlichtingPlaatsenA5 =>
      'Vakman: 0,50 uur per lichtpunt. Doe-het-zelver: 1,25 uur per lichtpunt. Natte ruimten kunnen extra tijd vragen voor passende afdichting en montage.';

  @override
  String get faqVerlichtingPlaatsenQ6 => 'Wat als het licht niet aangaat?';

  @override
  String get faqVerlichtingPlaatsenA6 =>
      'Schakel eerst de spanning uit. Controleer de aansluiting, schakelaar en beveiliging via een veilige testprocedure. Raadpleeg bij twijfel een elektricien.';

  @override
  String get faqVerlichtingPlaatsenQ7 =>
      'Welke veiligheidsmaatregelen gelden er?';

  @override
  String get faqVerlichtingPlaatsenA7 =>
      'Werk nooit op een installatiedeel dat onder spanning staat. Gebruik een stabiele ladder en passende oog- en handbescherming. Controleer met een leidingendetector voor het boren.';

  @override
  String get faqVerlichtingPlaatsenQ8 =>
      'Wat zijn de meest voorkomende fouten?';

  @override
  String get faqVerlichtingPlaatsenA8 =>
      'Onjuist armatuur voor een natte ruimte, slechte elektrische verbinding, onjuiste montage en verkeerde aansluiting van de beschermingsaarde waar dit vereist is.';

  @override
  String get faqVerlichtingPlaatsenQ9 =>
      'Waar moet ik op letten in natte ruimten?';

  @override
  String get faqVerlichtingPlaatsenA9 =>
      'Gebruik een armatuur met een passende IP-klasse, minimaal IP44 voor badkamers en keukens. Zorg voor goede afdichting en sluit de beschermingsaarde correct aan wanneer het systeem dit vereist.';

  @override
  String get faqVerlichtingPlaatsenQ10 => 'Beste tip?';

  @override
  String get faqVerlichtingPlaatsenA10 =>
      'Kies een kleurtemperatuur en dimmogelijkheid die past bij de ruimte. Controleer voor aankoop of de dimmer, lamp en armatuur compatibel zijn. Gebruik in natte ruimten altijd een passende IP-klasse. Raadpleeg een vakman bij twijfel. Controleer altijd de geldende Nederlandse regelgeving en het technisch productblad.';

  @override
  String get faqStroomleidingLeggenQ1 => 'Welke kabel of draad kies ik?';

  @override
  String get faqStroomleidingLeggenA1 =>
      'Het type kabel en de aderdiameter zijn afhankelijk van de toepassing, de aanlegwijze, de beveiliging, de elektrische belasting en de geldende installatievoorschriften. VD-draad wordt toegepast in een passend buis-/systeem. Kabeltypen zoals XMVK hebben eigen toepassingsvoorschriften.';

  @override
  String get faqStroomleidingLeggenQ2 =>
      'Moet ik de elektriciteit uitschakelen?';

  @override
  String get faqStroomleidingLeggenA2 =>
      'Ja. Schakel de groep uit en gebruik geschikte meetapparatuur om te verifiëren dat het werkgebied spanningsloos is.';

  @override
  String get faqStroomleidingLeggenQ3 => 'Hoeveel meter heb ik nodig?';

  @override
  String get faqStroomleidingLeggenA3 =>
      'Meet het complete tracé en reken extra lengte voor bochten en aansluitpunten. Tien procent extra is een praktische richtlijn, al kan een complex tracé meer vragen.';

  @override
  String get faqStroomleidingLeggenQ4 => 'Hoe leg ik de stroomleiding?';

  @override
  String get faqStroomleidingLeggenA4 =>
      'Markeer het tracé en controleer eerst met een leidingendetector op bestaande kabels en leidingen. Gebruik geschikt gereedschap en stofafzuiging bij het frezen en boren. De freesdiepte en aanlegwijze moeten passen bij het buis-/kabelsysteem, de wandopbouw en de geldende voorschriften. Leg de buis of kabel aan en trek de draden door het gekozen systeem. Zaag buizen op maat met een fijnboogzaag.';

  @override
  String get faqStroomleidingLeggenQ5 => 'Hoe lang duurt het?';

  @override
  String get faqStroomleidingLeggenA5 =>
      'Vakman: 0,10 uur per meter. Doe-het-zelver: 0,25 uur per meter. Voorbereiding, tracé, wandtype en afwerking kunnen de totale tijd beïnvloeden.';

  @override
  String get faqStroomleidingLeggenQ6 => 'Wat als een kabel beschadigd is?';

  @override
  String get faqStroomleidingLeggenA6 =>
      'Schakel de elektriciteit uit. Beschadigde kabels mogen niet zomaar worden overdekt. Herstel ze op een passende en normconforme wijze.';

  @override
  String get faqStroomleidingLeggenQ7 =>
      'Welke veiligheidsmaatregelen gelden er?';

  @override
  String get faqStroomleidingLeggenA7 =>
      'Werk met uitgeschakelde spanning. Controleer voor aanvang op bestaande kabels en dragende constructies. Draag passende beschermingsmiddelen. Vermijd onveilige diepe of lange horizontale uitsparingen in dragende wanden — laat constructieve vragen beoordelen door een vakkundige.';

  @override
  String get faqStroomleidingLeggenQ8 =>
      'Wat zijn de meest voorkomende fouten?';

  @override
  String get faqStroomleidingLeggenA8 =>
      'Onjuiste kabel of aderdiameter, te scherpe bochten, slechte bevestiging, onvoldoende trekvoor, het raken van bestaande kabels en niet controleren van de wand voor het frezen.';

  @override
  String get faqStroomleidingLeggenQ9 => 'Mag ik in een dragende wand frezen?';

  @override
  String get faqStroomleidingLeggenA9 =>
      'Nee. Diepe of lange horizontale uitsparingen in dragende wanden kunnen de constructieve sterkte verminderen. Laat constructieve vragen altijd beoordelen door een vakkundige.';

  @override
  String get faqStroomleidingLeggenQ10 => 'Beste tip?';

  @override
  String get faqStroomleidingLeggenA10 =>
      'Plan het tracé zorgvuldig en documenteer kabels voor het dichten van de uitsparingen. Gebruik voor toekomstige wijzigingen alleen voorzieningen die geschikt zijn voor de beoogde toepassing. Raadpleeg een vakman bij twijfel. Controleer altijd de geldende Nederlandse regelgeving en het technisch productblad.';

  @override
  String get faqKabelgootMonterenQ1 => 'Welk type kabelgoot gebruik ik?';

  @override
  String get faqKabelgootMonterenA1 =>
      'Zelfklevend: voor lichte kabels op een gladde, schone ondergrond. Schroefbaar: voor zwaardere kabels, ruwere ondergronden of gebruik buiten. Een gangbaar binnenhuisformaat is 20 × 12 mm tot 25 × 16 mm.';

  @override
  String get faqKabelgootMonterenQ2 => 'Moet ik de ondergrond voorbereiden?';

  @override
  String get faqKabelgootMonterenA2 =>
      'Ja. Reinig de ondergrond en zorg dat deze vetvrij en droog is wanneer de fabrikant dit vereist. Zelfklevende systemen vragen extra aandacht voor ondergrondvoorbereiding.';

  @override
  String get faqKabelgootMonterenQ3 => 'Hoeveel meter heb ik nodig?';

  @override
  String get faqKabelgootMonterenA3 =>
      'Meet het tracé en reken extra materiaal voor hoeken, verbindingen en zaagverlies. Tien procent extra is een praktische richtlijn.';

  @override
  String get faqKabelgootMonterenQ4 => 'Hoe monteer ik de kabelgoot?';

  @override
  String get faqKabelgootMonterenA4 =>
      'Volg de montage-instructies van het gekozen systeem. Zaag de goot recht en veilig op maat met een fijnboogzaag. Gebruik voor hoeken passende accessoires of een nette verstekverbinding. Gebruik een stabiele ladder bij werken op hoogte.';

  @override
  String get faqKabelgootMonterenQ5 => 'Hoe lang duurt het?';

  @override
  String get faqKabelgootMonterenA5 =>
      'Vakman: 0,07 uur per meter. Doe-het-zelver: 0,17 uur per meter. Boren in harde ondergronden kan extra tijd vragen.';

  @override
  String get faqKabelgootMonterenQ6 => 'Wat als de kabelgoot loslaat?';

  @override
  String get faqKabelgootMonterenA6 =>
      'Verwijder het losgeraakte deel, reinig de ondergrond en herstel op de door de fabrikant aanbevolen bevestigingswijze. Gebruik bij zwaardere belastingen een passende mechanische bevestiging.';

  @override
  String get faqKabelgootMonterenQ7 =>
      'Welke veiligheidsmaatregelen gelden er?';

  @override
  String get faqKabelgootMonterenA7 =>
      'Draag handschoenen en oogbescherming. Let op scherpe randen. Controleer met een leidingendetector voor het boren.';

  @override
  String get faqKabelgootMonterenQ8 => 'Wat zijn de meest voorkomende fouten?';

  @override
  String get faqKabelgootMonterenA8 =>
      'Ondergrond niet reinigen, onjuiste bevestigingsmethode voor de ondergrond, tracé niet recht markeren, onjuiste maat en onvoldoende bevestigingspunten.';

  @override
  String get faqKabelgootMonterenQ9 => 'Kan ik kabelgoot buiten gebruiken?';

  @override
  String get faqKabelgootMonterenA9 =>
      'Alleen als de kabelgoot specifiek geschikt is voor buitengebruik. Gebruik bij voorkeur schroefmontage in plaats van zelfklevende montage.';

  @override
  String get faqKabelgootMonterenQ10 => 'Beste tip?';

  @override
  String get faqKabelgootMonterenA10 =>
      'Gebruik voor hoeken passende accessoires of een nette verstekverbinding. Monteer de kabelgoot recht en strak. Raadpleeg een vakman bij twijfel. Controleer altijd de geldende Nederlandse regelgeving en het technisch productblad.';

  @override
  String get faqRookmelderPlaatsenQ1 => 'Welk type rookmelder gebruik ik?';

  @override
  String get faqRookmelderPlaatsenA1 =>
      'Een optische rookmelder is een gangbare keuze voor veel woonruimten. In een keuken kan een hittemelder geschikter zijn. Kies een product dat voldoet aan de geldende eisen.';

  @override
  String get faqRookmelderPlaatsenQ2 => 'Waar installeer ik de rookmelder?';

  @override
  String get faqRookmelderPlaatsenA2 =>
      'De Nederlandse overheid adviseert rookmelders op het plafond te plaatsen, bij voorkeur in de gang, op minimaal 50 cm van een wand of hoek en minimaal 30 cm van een verlichtingsarmatuur. Plaats de melder niet direct naast ventilatieopeningen of verwarming. Volg altijd de instructies van de fabrikant.';

  @override
  String get faqRookmelderPlaatsenQ3 => 'Hoeveel rookmelders heb ik nodig?';

  @override
  String get faqRookmelderPlaatsenA3 =>
      'In Nederland is een rookmelder op elke woonverdieping verplicht. Het exacte aantal en de beste locaties hangen af van de woning. Volg de geldende wettelijke eisen en de instructies van de fabrikant.';

  @override
  String get faqRookmelderPlaatsenQ4 => 'Hoe installeer ik de rookmelder?';

  @override
  String get faqRookmelderPlaatsenA4 =>
      'Monteer de bevestigingsplaat volgens de handleiding van de fabrikant. Bevestig de rookmelder en test hem na montage. Gebruik passende pluggen en schroeven wanneer mechanische bevestiging vereist is.';

  @override
  String get faqRookmelderPlaatsenQ5 => 'Hoe lang duurt het?';

  @override
  String get faqRookmelderPlaatsenA5 =>
      'Vakman: 0,25 uur per rookmelder. Doe-het-zelver: 0,60 uur per rookmelder. Boren, bereikbaarheid en het type plafond kunnen extra tijd vragen.';

  @override
  String get faqRookmelderPlaatsenQ6 => 'Wat doe ik bij vals alarm?';

  @override
  String get faqRookmelderPlaatsenA6 =>
      'Stel eerst de oorzaak vast. Reinig stof volgens de instructies van de fabrikant en controleer de locatie, ventilatie en vochtomstandigheden van de melder. Verplaats de melder alleen als de nieuwe locatie voldoet aan de geldende eisen.';

  @override
  String get faqRookmelderPlaatsenQ7 =>
      'Welke veiligheidsmaatregelen gelden er?';

  @override
  String get faqRookmelderPlaatsenA7 =>
      'Gebruik een stabiele ladder en werk veilig. Test de melder na montage en volg de instructies van de fabrikant. Controleer met een leidingendetector voor het boren in het plafond.';

  @override
  String get faqRookmelderPlaatsenQ8 => 'Wat zijn de meest voorkomende fouten?';

  @override
  String get faqRookmelderPlaatsenA8 =>
      'Onjuiste positionering, de melder niet testen, lege of ontbrekende batterij, vuil en het niet vervangen van de melder wanneer de fabrikant het einde van de levensduur aangeeft.';

  @override
  String get faqRookmelderPlaatsenQ9 => 'Hoe test ik de rookmelder?';

  @override
  String get faqRookmelderPlaatsenA9 =>
      'Test hem regelmatig met de testknop volgens de instructies van de fabrikant. Houd de melder stofvrij en volg de onderhouds- en vervangingsinstructies van het specifieke model.';

  @override
  String get faqRookmelderPlaatsenQ10 => 'Beste tip?';

  @override
  String get faqRookmelderPlaatsenA10 =>
      'Gebruik de testknop regelmatig en vervang de batterij of de volledige melder volgens de instructies van de fabrikant. Houd rekening met de wettelijke plaatsingseisen. Raadpleeg een vakman bij twijfel. Controleer altijd de geldende Nederlandse regelgeving en het technisch productblad.';

  @override
  String get jobCarpenter01 => 'Vloer leggen – laminaat';

  @override
  String get jobCarpenter02 => 'Deur plaatsen – binnendeur (stomp)';

  @override
  String get jobCarpenter03 => 'Plinten monteren – plakplint';

  @override
  String get jobCarpenter04 => 'Trap renoveren – laminaat';

  @override
  String get jobCarpenter05 => 'Wand plaatsen – gipsplaat met metaalstud';

  @override
  String get jobPlumber01 => 'Keukenkraan vervangen';

  @override
  String get jobPlumber02 => 'Afvoer ontstoppen';

  @override
  String get jobPlumber03 => 'Toilet installeren';

  @override
  String get jobPlumber04 => 'CV-installatie bijvullen';

  @override
  String get jobPlumber05 => 'Waterleiding aanleggen (koper)';

  @override
  String get jobPainter01 => 'Muur sauzen';

  @override
  String get jobPainter02 => 'Plafond sauzen';

  @override
  String get jobPainter03 => 'Behangen';

  @override
  String get jobPainter04 => 'Kozijn/deur schilderen';

  @override
  String get jobPainter05 => 'Radiator schilderen';

  @override
  String get jobGardener01 => 'Schutting plaatsen';

  @override
  String get jobGardener02 => 'Bestrating aanleggen';

  @override
  String get jobGardener03 => 'Snoeien';

  @override
  String get jobGardener04 => 'Overkapping bouwen';

  @override
  String get jobGardener05 => 'Gazon leggen';

  @override
  String get jobElectrician01 => 'Stopcontact plaatsen';

  @override
  String get jobElectrician02 => 'Verlichting plaatsen';

  @override
  String get jobElectrician03 => 'Stroomleiding leggen';

  @override
  String get jobElectrician04 => 'Kabelgoot monteren';

  @override
  String get jobElectrician05 => 'Rookmelder plaatsen';

  @override
  String get jobTiler01 => 'Vloertegels leggen';

  @override
  String get jobTiler02 => 'Wandtegels plaatsen';

  @override
  String get jobTiler03 => 'Tegels repareren';

  @override
  String get jobTiler04 => 'Voegen';

  @override
  String get jobTiler05 => 'Kit aanbrengen';

  @override
  String get checklistBehangtafel => 'Behangtafel';

  @override
  String get checklistBehangborstel => 'Behangborstel';

  @override
  String get checklistBehanglijmRoller => 'Behanglijm roller';

  @override
  String get checklistMeetlint => 'Meetlint';

  @override
  String get checklistWaterpas => 'Waterpas';

  @override
  String get checklistPotlood => 'Potlood';

  @override
  String get checklistSchaarBehangmes => 'Schaar / Behangmes';

  @override
  String get checklistSponzen => 'Sponzen';

  @override
  String get checklistEmmerVoorLijm => 'Emmer (voor lijm)';

  @override
  String get checklistTrapLadder => 'Trap / ladder';

  @override
  String get checklistStucloperAfdekfolie => 'Stucloper / afdekfolie';

  @override
  String get checklistSponsDoek => 'Spons / doek';

  @override
  String get checklistLoodlijn => 'Loodlijn';

  @override
  String get checklistPlamuurmes => 'Plamuurmes';

  @override
  String get checklistBehangnaadroller => 'Behangnaadroller (optioneel)';

  @override
  String get checklistVerfroller => 'Verfroller';

  @override
  String get checklistKwast => 'Kwast';

  @override
  String get checklistVerfbak => 'Verfbak';

  @override
  String get checklistAfplaktape => 'Afplaktape';

  @override
  String get checklistSchuurpapier => 'Schuurpapier';

  @override
  String get checklistStofzuigerStofdoek => 'Stofzuiger / Stofdoek';

  @override
  String get checklistLadderTrap => 'Ladder / Trap';

  @override
  String get checklistDekkleed => 'Dekkleed';

  @override
  String get checklistDecoupeerzaag => 'Decoupeerzaag';

  @override
  String get checklistRolmaat => 'Rolmaat';

  @override
  String get checklistPlintenknipper => 'Plintenknipper';

  @override
  String get checklistHamer => 'Hamer';

  @override
  String get checklistAccuboormachine => 'Accuboormachine';

  @override
  String get checklistSchroevendraaier => 'Schroevendraaier';

  @override
  String get checklistKitpistool => 'Kitpistool';

  @override
  String get checklistWaterpomptang => 'Waterpomptang';

  @override
  String get checklistTeflonTape => 'Teflon tape';

  @override
  String get checklistSleutelset => 'Sleutelset';

  @override
  String get checklistPijpsnijder => 'Pijpsnijder';

  @override
  String get checklistIJzerzaag => 'IJzerzaag';

  @override
  String get checklistOntluchtingssleutel => 'Ontluchtingssleutel';

  @override
  String get checklistSoldeerbrander => 'Soldeerbrander';

  @override
  String get checklistAfsluiters => 'Afsluiters';

  @override
  String get checklistEmmer => 'Emmer';

  @override
  String get checklistSchroevendraaierSet => 'Schroevendraaier set';

  @override
  String get checklistTrekkerDraadtrekker => 'Trekker / Draadtrekker';

  @override
  String get checklistKrimpkous => 'Krimpkous';

  @override
  String get checklistMultimeter => 'Multimeter';

  @override
  String get checklistKnijtang => 'Knijtang';

  @override
  String get checklistBoorhamers => 'Boorhamers';

  @override
  String get checklistIsolatietape => 'Isolatietape';

  @override
  String get checklistNulschakelaar => 'Nulschakelaar';

  @override
  String get checklistTegelsnijder => 'Tegelsnijder';

  @override
  String get checklistTandspaan => 'Tandspaan';

  @override
  String get checklistVoegspuit => 'Voegspuit';

  @override
  String get checklistSpons => 'Spons';

  @override
  String get checklistRubberHamer => 'Rubber hamer';

  @override
  String get checklistSchop => 'Schop';

  @override
  String get checklistHark => 'Hark';

  @override
  String get checklistSnoeischaar => 'Snoeischaar';

  @override
  String get checklistKruiwagen => 'Kruiwagen';

  @override
  String get checklistTuinhandschoenen => 'Tuinhandschoenen';

  @override
  String get checklistGraafmachine => 'Graafmachine';

  @override
  String get checklistGieter => 'Gieter';

  @override
  String get checklistBeitel => 'Beitel';

  @override
  String get checklistMontageschuimpistool => 'Montageschuimpistool';

  @override
  String get checklistBlokhaak => 'Blokhaak';

  @override
  String get checklistBreekijzer => 'Breekijzer';

  @override
  String get checklistLijmtang => 'Lijmtang';

  @override
  String get checklistSpeedboor => 'Speedboor (voor slotgat)';

  @override
  String get checklistStofmasker => 'Stofmasker';

  @override
  String get checklistVeiligheidsbril => 'Veiligheidsbril';

  @override
  String get checklistVerlengkabel => 'Verlengkabel';

  @override
  String get checklistTrapje => 'Trapje';

  @override
  String get checklistFreesmachine => 'Freesmachine (optioneel)';

  @override
  String get checklistSchuurmachine => 'Schuurmachine';

  @override
  String get checklistSchaafmachine => 'Schaafmachine';

  @override
  String get checklistAfkortzaag => 'Afkortzaag / Verstekzaag';

  @override
  String get checklistStofdoek => 'Stofdoek';

  @override
  String get checklistKniebeschermers => 'Kniebeschermers';

  @override
  String get checklistStanleymes => 'Stanleymes';

  @override
  String get checklistGatenzaag => 'Gatenzaag (voor sparingen)';

  @override
  String get checklistLijmklemmen => 'Lijmklemmen';

  @override
  String get checklistWerkhandschoenen => 'Werkhandschoenen';

  @override
  String get checklistCirkelzaag => 'Cirkelzaag of invalzaag';

  @override
  String get checklistGipsschaar => 'Gipsschaar';

  @override
  String get checklistSteiger => 'Trapje of steiger';

  @override
  String get checklistBehangafstomer => 'Behangafstomer / Stoommachine (huur)';

  @override
  String get checklistGrondboor => 'Grondboor';

  @override
  String get checklistVerstekbak => 'Verstekbak';

  @override
  String get checklistLijnlaser => 'Lijnlaser (optioneel)';

  @override
  String get checklistTroffel => 'Troffel';

  @override
  String get checklistVoegrubber => 'Voegrubber';

  @override
  String get checklistBezem => 'Bezem';

  @override
  String get checklistGrasrol => 'Grasrol / Tuinwals';

  @override
  String get checklistTakkenschaar => 'Takkenschaar';

  @override
  String get checklistHeggenschaar => 'Heggenschaar';

  @override
  String get checklistSnoeizaag => 'Snoeizaag';

  @override
  String get checklistKettingzaag =>
      'Kettingzaag (huur, alleen bij veilig gebruik)';

  @override
  String get checklistBitset => 'Bitset';

  @override
  String get checklistZaag => 'Handzaag';

  @override
  String get checklistBorstel => 'Borstel';

  @override
  String get checklistSpade => 'Spade';

  @override
  String get checklistBladhark => 'Bladhark';

  @override
  String get checklistBladblazer => 'Bladblazer (optioneel)';

  @override
  String get checklistSlijpsteen => 'Slijpsteen / Wetssteen';

  @override
  String get checklistStaalborstel => 'Staalborstel';

  @override
  String get checklistGereedschapsolie => 'Gereedschapsolie / Lijnzaadolie';

  @override
  String get checklistVoegenborstel => 'Voegenborstel';

  @override
  String get checklistHogedrukreiniger => 'Hogedrukreiniger (optioneel)';

  @override
  String get checklistGaskantenknipper => 'Graskantsnijder / Kantknipper';

  @override
  String get checklistZwaaihaak => 'Zwaaihaak / Schuintezoeker';

  @override
  String get checklistTacker => 'Handtacker / Nietpistool';

  @override
  String get checklistTrapspin => 'Trapspin (verstekhaak voor treden)';

  @override
  String get checklistLijmkam => 'Lijmkam / Lijmroller';

  @override
  String get checklistTrekijzer => 'Trekijzer';

  @override
  String get checklistSlagblok => 'Slagblok / Slaghoedje';

  @override
  String get checklistVloerwals => 'Zware aandrukrol / Vloerwals';

  @override
  String get checklistTrilplaat => 'Trilplaat (huur)';

  @override
  String get checklistKitschraper => 'Kitschraper';

  @override
  String get checklistPlantenspuit => 'Plantenspuit met afwasmiddel';

  @override
  String get checklistKeukenpapier => 'Keukenpapier';

  @override
  String get checklistBouwstofzuiger =>
      'Bouwstofzuiger (stofafzuiging bij droog zagen/slijpen)';

  @override
  String get checklistVoegkrabber => 'Voegkrabber';

  @override
  String get checklistGlijhoek => 'Glijhoek (voor schuine wanden)';

  @override
  String get checklistRubbereKitspatel => 'Rubberen kitspatel / afstrijker';

  @override
  String get checklistLiniaal => 'Liniaal / Stalen liniaal';

  @override
  String get checklistCentrumbits => 'Centrumbit / Scharnierboor';

  @override
  String get checklistWiggen => 'Wiggen / Afstandhouders';

  @override
  String get checklistGroteVerfroller => 'Grote verfroller';

  @override
  String get checklistKleineVerfroller => 'Kleine verfroller';

  @override
  String get checklistVerlengstok => 'Verlengstok';

  @override
  String get checklistKwasten => 'Kwasten';

  @override
  String get checklistRadiatorroller => 'Radiatorroller';

  @override
  String get checklistStofzuiger => 'Stofzuiger';

  @override
  String get checklistSchroefboormachine => 'Accuschroefboormachine';

  @override
  String get checklistBoormachine => 'Boormachine';

  @override
  String get checklistBuigtang => 'Buigtang';

  @override
  String get checklistMoersleutel => 'Moersleutel / Verstelbare sleutel';

  @override
  String get checklistOntbraker => 'Ontbramer';

  @override
  String get checklistLeidingzoeker => 'Leidingzoeker';

  @override
  String get checklistSteeksleutel => 'Steeksleutel';

  @override
  String get checklistInbussleutel => 'Inbussleutel';

  @override
  String get checklistFrees => 'Sleuvenfrees / Frees';

  @override
  String get checklistOntstoppingsveer => 'Ontstoppingsveer';

  @override
  String get checklistOntstoppingsmachine => 'Ontstoppingsmachine (huur)';

  @override
  String get checklistRioolkabel => 'Rioolkabel';

  @override
  String get checklistHandschoenen => 'Werkhandschoenen';

  @override
  String get checklistDoek => 'Schoonmaakdoek';

  @override
  String get checklistIsolatiemes => 'Isolatiemes';

  @override
  String get checklistSpanningstester => 'Spanningstester';

  @override
  String get checklistStriptang => 'Striptang';

  @override
  String get checklistKabelknipper => 'Kabelknipper';

  @override
  String get checklistGeisoleerGereedschap => 'Geïsoleerd gereedschap';

  @override
  String get checklistMeetTestgereedschap => 'Meet- en testgereedschap';

  @override
  String get checklistMomentsleutel => 'Momentsleutel';

  @override
  String get checklistTrapjeOfSteiger => 'Trapje of steiger';

  @override
  String get checklistTrekveer => 'Trekveer';

  @override
  String get checklistBuisbuiger => 'Buisbuiger';

  @override
  String get checklistZeskantsleutel => 'Zeskantsleutel';

  @override
  String get checklistSlijptol => 'Haakse slijper / Slijptol';

  @override
  String get checklistViltstift => 'Viltstift / Markeerpen';

  @override
  String get checklistRubbereHamer => 'Rubberen hamer';

  @override
  String get checklistVoegspijker => 'Voegspijker';

  @override
  String get checklistZuignap => 'Tegelzuignap';

  @override
  String get checklistDoekOfLap => 'Poetsdoek / Lap';

  @override
  String get checklistBoorhamer => 'Boorhamer';

  @override
  String get checklistStofferEnBlik => 'Stoffer en blik (om op te ruimen)';

  @override
  String get checklistLaarzen => 'Rubberlaarzen / Waadpak';

  @override
  String get checklistSchepnet => 'Schepnet';

  @override
  String get checklistTrimmer => 'Kantenmaaier / Grastrimmer';

  @override
  String get calcStatusPreparationExcluded => 'Voorbereiding niet inbegrepen';

  @override
  String get calcStatusMaterialWaitExcluded =>
      'Wachttijd materiaal niet inbegrepen';

  @override
  String get calcStatusDryingCuringExcluded =>
      'Droog-/uithardingstijd niet inbegrepen';

  @override
  String get calcStatusIndicative => 'Tijden zijn indicatief';

  @override
  String get calcStatusProjectSpecific =>
      'Projectspecifieke omstandigheden niet inbegrepen';

  @override
  String get calcStatusPipeInstallNote =>
      'Voor het aanleggen van waterleidingen is de tijd per meter alleen een berekeningsbasis. Bochten, koppelingen, doorgangen door de muur, bevestiging, testen en bereikbaarheid kunnen de werkelijke werktijd aanzienlijk verhogen.';

  @override
  String get safetyLoadBearingTitle => 'Easy4DIY Veiligheidsgrens';

  @override
  String get safetyLoadBearingBody =>
      'Easy4DIY behandelt niet het verwijderen of wijzigen van draagconstructies. Bij twijfel, of wanneer een wand mogelijk dragend is, moet deze eerst door een deskundige worden beoordeeld. Een wijziging aan een draagconstructie kan vergunningplichtig zijn.';

  @override
  String get onboardingSafetyTitle => 'Veiligheidscontrole';

  @override
  String get onboardingSafetyIntro =>
      'Selecteer voordat je verdergaat alle situaties hieronder die op deze klus van toepassing zijn. Gebruik altijd geschikte beschermingsmiddelen en volg de instructies van de fabrikant.';

  @override
  String get onboardingSafetyStopMessage =>
      'Stop hier. Deze klus valt buiten de veilige werkomvang van Easy4DIY. Ga niet verder met de berekening en neem contact op met een gekwalificeerde vakman.';

  @override
  String get safetyStopUnknownServices =>
      'Zitten er onbekende leidingen of kabels in de constructie waarin je gaat werken?';

  @override
  String get safetyStopAsbestos => 'Vermoed je dat materiaal asbest bevat?';

  @override
  String get safetyStopPermit => 'Is voor dit werk een vergunning nodig?';

  @override
  String get safetyStopHeight =>
      'Moet je op hoogte werken zonder geschikte veiligheidsuitrusting?';

  @override
  String get safetyStopLoadBearing =>
      'Moet deze klus een dragende constructie verwijderen of wijzigen, of is de constructieve veiligheid onzeker?';

  @override
  String get safetyStopGas =>
      'Heeft dit werk te maken met gasleidingen of een gastoestel of gasinstallatie?';

  @override
  String get safetyStopFlue =>
      'Heeft dit werk te maken met een rookgasafvoersysteem?';

  @override
  String get safetyStopBoiler =>
      'Heeft dit werk te maken met reparatie van een cv-ketel?';

  @override
  String get safetyStopSeriousLeak =>
      'Is er sprake van een ernstig of onverklaarbaar lek?';

  @override
  String get safetyStopPressureLoss =>
      'Verliest de cv-installatie herhaaldelijk druk?';

  @override
  String get safetyStopBlockage =>
      'Is de verstopping complex, komt deze steeds terug of kan er sprake zijn van leidingschade?';

  @override
  String get safetyStopDrinkingWater =>
      'Bestaat er twijfel over de veiligheid van het drinkwater?';

  @override
  String get safetyStopLeadPaint => 'Kan de bestaande verf lood bevatten?';

  @override
  String get safetyStopMoisture =>
      'Is er ernstige vochtschade of een onopgelost vochtprobleem?';

  @override
  String get safetyStopSubstrate =>
      'Twijfel je of de ondergrond geschikt of stevig genoeg is?';

  @override
  String get safetyStopWiring =>
      'Is de bestaande bedrading beschadigd of is de staat ervan onbekend?';

  @override
  String get safetyStopEarthing =>
      'Ontbreekt de aarding of is deze onzeker waar die verplicht is?';

  @override
  String get safetyStopCircuit =>
      'Twijfel je over de zekering of installatieautomaat?';

  @override
  String get safetyStopHeavyEquipment =>
      'Is voor dit werk zwaar materieel nodig dat je niet veilig kunt bedienen?';

  @override
  String get safetyStopPesticide =>
      'Moet je werken met bestrijdingsmiddelen waarvoor speciale kennis of voorzorgsmaatregelen nodig zijn?';

  @override
  String get checklistContourmal => 'Contourmal';

  @override
  String get checklistDeken => 'Deken (bescherming)';

  @override
  String get checklistDeurheffer => 'Deurheffer';

  @override
  String get checklistFijngetandeZaag =>
      'Fijngetande zaag of laminaatknipschaar';

  @override
  String get checklistVerstekzaag => 'Verstekzaag';

  @override
  String get doc5HourlyRateCarpenter => 'Rekenuurtarief timmerman: €45/u';

  @override
  String get doc5HourIndicationTitle => 'Urenindicatie & Besparing';

  @override
  String get doc5HourIndicationDisclaimer =>
      'De tijden zijn app-rekenwaarden, geen garantie voor iedere situatie. Ze gaan uit van een normale, goed bereikbare situatie. Extra werk door voorbereiding, ondergrond, maatwerk, bereikbaarheid of materiaalkeuze wordt afzonderlijk beoordeeld.';

  @override
  String get doc5ProTime => 'Pro-tijd';

  @override
  String get doc5DiyTime => 'Klusser-tijd';

  @override
  String get doc5IndicativeSaving => 'Indicatieve besparing';

  @override
  String get doc5SavingDisclaimer =>
      'Dit is uitsluitend een rekenkundige basis. In de praktijk kunnen extra materialen, versteviging, afwerking, bochten, doorvoeren of onvoorziene omstandigheden extra kosten en tijd veroorzaken.';

  @override
  String get doc5AppLogicTitle => 'App-logica – Vaste regels';

  @override
  String get doc5RuleMostCommonMaterial => 'Meest voorkomende materiaal eerst';

  @override
  String get doc5RuleMostCommonMaterialDesc =>
      'De app kiest per klus standaard het meest voorkomende materiaal/producttype als uitgangspunt.';

  @override
  String get doc5RuleAveragePrice => 'Gemiddelde richtprijs';

  @override
  String get doc5RuleAveragePriceDesc =>
      'Voor ieder standaardmateriaal gebruikt de app één gemiddelde richtprijs.';

  @override
  String get doc5RuleNoUnnecessaryMaterials =>
      'Geen onnodige materiaaloptelling';

  @override
  String get doc5RuleNoUnnecessaryMaterialsDesc =>
      'Onderdelen die standaard bij een product worden meegeleverd, worden niet nogmaals als apart materiaal gerekend.';

  @override
  String get doc5RuleOptionalMaterials => 'Optionele materialen';

  @override
  String get doc5RuleOptionalMaterialsDesc =>
      'Alleen wanneer de situatie of productkeuze dit vereist, worden aanvullende materialen toegevoegd.';

  @override
  String get doc5RuleManufacturerFirst => 'Fabrikant eerst';

  @override
  String get doc5RuleManufacturerFirstDesc =>
      'Fabrikantvoorschriften gaan altijd voor algemene rekenwaarden.';

  @override
  String get doc5RuleSituationCheck => 'Situatiecheck';

  @override
  String get doc5RuleSituationCheckDesc =>
      'Controleer vóór de start het type klus, de afmetingen, het materiaal, de ondergrond, de bereikbaarheid en de gewenste afwerking. Ga niet verder als de werkelijke situatie buiten deze uitgangspunten valt.';

  @override
  String get doc5RuleStructuralSafety => 'Constructieve veiligheid';

  @override
  String get doc5RuleStructuralSafetyDesc =>
      'Geen draagconstructies verwijderen of wijzigen. Bij twijfel of een mogelijk dragende wand: eerst deskundig laten beoordelen.';

  @override
  String get doc5StopMomentTitle => 'Stopmomenten';

  @override
  String get doc5StopMomentLoadBearing => 'Draagconstructies';

  @override
  String get doc5StopMomentAsbestos => 'Asbestverdachte materialen';

  @override
  String get doc5StopMomentMoisture => 'Vocht- of lekkageproblemen';

  @override
  String get doc5StopMomentUnknownWiring =>
      'Onbekende leidingen of kabels in constructies';

  @override
  String get doc5StopMomentPermit => 'Vergunningplichtige werkzaamheden';

  @override
  String get doc5StopMomentComplex => 'Complexe constructies';

  @override
  String get doc5TestTitle => 'Testen na werkzaamheden';

  @override
  String get doc5TestLevel => 'Waterpas en stabiel resultaat';

  @override
  String get doc5TestSecure => 'Veilige bevestiging';

  @override
  String get doc5TestFunction => 'Correcte werking';

  @override
  String get doc5TestFinish => 'Nette afwerking';

  @override
  String get doc5CostNote =>
      'De app toont een gemiddelde richtprijs. De live-app kan later actuele productprijzen ophalen.';

  @override
  String get doc5HoursNote =>
      'De app toont een rekenkundige montagetijd en vermeldt duidelijk wat wel en niet inbegrepen is.';

  @override
  String get doc5SafetyNote =>
      'Gebruik passende persoonlijke bescherming en werk volgens de voorschriften van materiaal, gereedschap en installatie.';

  @override
  String get doc5GuidanceTitle =>
      'Belangrijke uitgangspunten en veiligheidscontroles';

  @override
  String get doc5GuidanceCarpenter =>
      'Verwijder of wijzig geen dragende constructies. Laat twijfelachtige constructies beoordelen door een deskundige. Controleer of gemonteerde onderdelen stevig, waterpas en stabiel zijn.';

  @override
  String get doc5GuidancePainter =>
      'Volg de instructies voor verf en primer. Gebruik passende bescherming bij schuren en het werken met chemicaliën. Stop bij verdenking van loodverf, asbest, ernstige vochtschade of een ongeschikte ondergrond. Droog- en uithardingstijd is niet inbegrepen; controleer het eindresultaat op zakkers en gebreken.';

  @override
  String get doc5GuidancePlumber =>
      'Volg productinstructies en gebruik materialen die geschikt zijn voor drinkwaterinstallaties. Stop bij gas, rookgasafvoer, ketelreparaties, onverklaarbare lekkages, terugkerend drukverlies, ernstige verstoppingen of twijfel over drinkwaterveiligheid. Controleer op lekkage en correcte werking voordat leidingen worden afgedekt.';

  @override
  String get doc5GuidanceGardener =>
      'Volg instructies voor machines, behandelingen en materialen; draag passende beschermingsmiddelen. Stop bij twijfel over constructieve veiligheid, werken op hoogte, zwaar materieel, bestrijdingsmiddelen of vergunningen. Controleer na afloop de stabiliteit en afwatering.';

  @override
  String get doc5GuidanceElectrician =>
      'Werk nooit aan een installatie die onder spanning staat. Kun je de stroom niet veilig uitschakelen en controleren, of twijfel je over bedrading, aarding of beveiliging, stop dan en schakel een erkend elektricien in. Volg productinstructies en geldende elektrotechnische normen; controleer werking en aarding vóór gebruik.';

  @override
  String get doc5GuidanceTiler =>
      'Volg de productinstructies voor tegellijm, voegmiddel en kit. Beperk kwartsstof bij zagen en slijpen en gebruik passende oog-, gehoor- en adembescherming. Stop bij verdenking van asbest, constructieve problemen, ernstige vochtproblemen of een ongeschikte ondergrond. Controleer na afloop de hechting, voegen en vlakheid.';

  @override
  String get safetyPlumberTitle => 'Easy4DIY Veiligheidsgrens – Loodgieter';

  @override
  String get safetyPlumberBody =>
      'Easy4DIY behandelt geen gasleidingen, werkzaamheden aan gasverbrandingsinstallaties, rookgasafvoer, ketelreparaties of ketelonderhoud. Bij twijfel, lekkage, constructieve problemen of werkzaamheden buiten de eenvoudige klus: stop en verwijs door naar een vakbekwaam/gecertificeerd installateur.';
}
