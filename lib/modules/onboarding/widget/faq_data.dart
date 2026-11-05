import 'package:easy_four_diy/models/faq_item.dart';

List<FaqItem> getOnboardingFaqs({
  required dynamic l10n,
  required String jobId,
  required List<String> selectedSpecificJobs,
  bool isPlakplinten = false,
}) {
  final jobs = selectedSpecificJobs.map((job) => job.toLowerCase()).toList(growable: false);

  bool hasAny(List<String> keywords) =>
      jobs.any((job) => keywords.any((keyword) => job.contains(keyword.toLowerCase())));

  bool matches(String id, List<String> keywords) => jobId == id && hasAny(keywords);

  if (matches('painter', ['behangen', 'wallpapering'])) {
    return [
      // Doc 4 – Job 8 Behangen: 10 dedicated FAQ entries
      FaqItem(question: l10n.faqBehangenDoc4Q1, answer: l10n.faqBehangenDoc4A1),
      FaqItem(question: l10n.faqBehangenDoc4Q2, answer: l10n.faqBehangenDoc4A2),
      FaqItem(question: l10n.faqBehangenDoc4Q3, answer: l10n.faqBehangenDoc4A3),
      FaqItem(question: l10n.faqBehangenDoc4Q4, answer: l10n.faqBehangenDoc4A4),
      FaqItem(question: l10n.faqBehangenDoc4Q5, answer: l10n.faqBehangenDoc4A5),
      FaqItem(question: l10n.faqBehangenDoc4Q6, answer: l10n.faqBehangenDoc4A6),
      FaqItem(question: l10n.faqBehangenDoc4Q7, answer: l10n.faqBehangenDoc4A7),
      FaqItem(question: l10n.faqBehangenDoc4Q8, answer: l10n.faqBehangenDoc4A8),
      FaqItem(question: l10n.faqBehangenDoc4Q9, answer: l10n.faqBehangenDoc4A9),
      FaqItem(question: l10n.faqBehangenDoc4Q10, answer: l10n.faqBehangenDoc4A10),
    ];
  }

  if (matches('painter', ['muur sauzen', 'binnenmuren', 'paint walls'])) {
    return [
      // Doc 4 – Job 6 Muur sauzen: 10 dedicated FAQ entries
      FaqItem(question: l10n.faqMuurSauzenQ1, answer: l10n.faqMuurSauzenA1),
      FaqItem(question: l10n.faqMuurSauzenQ2, answer: l10n.faqMuurSauzenA2),
      FaqItem(question: l10n.faqMuurSauzenQ3, answer: l10n.faqMuurSauzenA3),
      FaqItem(question: l10n.faqMuurSauzenQ4, answer: l10n.faqMuurSauzenA4),
      FaqItem(question: l10n.faqMuurSauzenQ5, answer: l10n.faqMuurSauzenA5),
      FaqItem(question: l10n.faqMuurSauzenQ6, answer: l10n.faqMuurSauzenA6),
      FaqItem(question: l10n.faqMuurSauzenQ7, answer: l10n.faqMuurSauzenA7),
      FaqItem(question: l10n.faqMuurSauzenQ8, answer: l10n.faqMuurSauzenA8),
      FaqItem(question: l10n.faqMuurSauzenQ9, answer: l10n.faqMuurSauzenA9),
      FaqItem(question: l10n.faqMuurSauzenQ10, answer: l10n.faqMuurSauzenA10),
    ];
  }

  if (matches('painter', ['plafond', 'ceiling'])) {
    return [
      // Doc 4 – Job 7 Plafond sauzen: 10 dedicated FAQ entries
      FaqItem(question: l10n.faqPlafondSauzenQ1, answer: l10n.faqPlafondSauzenA1),
      FaqItem(question: l10n.faqPlafondSauzenQ2, answer: l10n.faqPlafondSauzenA2),
      FaqItem(question: l10n.faqPlafondSauzenQ3, answer: l10n.faqPlafondSauzenA3),
      FaqItem(question: l10n.faqPlafondSauzenQ4, answer: l10n.faqPlafondSauzenA4),
      FaqItem(question: l10n.faqPlafondSauzenQ5, answer: l10n.faqPlafondSauzenA5),
      FaqItem(question: l10n.faqPlafondSauzenQ6, answer: l10n.faqPlafondSauzenA6),
      FaqItem(question: l10n.faqPlafondSauzenQ7, answer: l10n.faqPlafondSauzenA7),
      FaqItem(question: l10n.faqPlafondSauzenQ8, answer: l10n.faqPlafondSauzenA8),
      FaqItem(question: l10n.faqPlafondSauzenQ9, answer: l10n.faqPlafondSauzenA9),
      FaqItem(question: l10n.faqPlafondSauzenQ10, answer: l10n.faqPlafondSauzenA10),
    ];
  }

  if (matches('painter', ['kozijn', 'frame'])) {
    return [
      // Doc 4 – Job 9 Kozijn/deur schilderen: 10 dedicated FAQ entries
      FaqItem(question: l10n.faqKozijnSchilderenQ1, answer: l10n.faqKozijnSchilderenA1),
      FaqItem(question: l10n.faqKozijnSchilderenQ2, answer: l10n.faqKozijnSchilderenA2),
      FaqItem(question: l10n.faqKozijnSchilderenQ3, answer: l10n.faqKozijnSchilderenA3),
      FaqItem(question: l10n.faqKozijnSchilderenQ4, answer: l10n.faqKozijnSchilderenA4),
      FaqItem(question: l10n.faqKozijnSchilderenQ5, answer: l10n.faqKozijnSchilderenA5),
      FaqItem(question: l10n.faqKozijnSchilderenQ6, answer: l10n.faqKozijnSchilderenA6),
      FaqItem(question: l10n.faqKozijnSchilderenQ7, answer: l10n.faqKozijnSchilderenA7),
      FaqItem(question: l10n.faqKozijnSchilderenQ8, answer: l10n.faqKozijnSchilderenA8),
      FaqItem(question: l10n.faqKozijnSchilderenQ9, answer: l10n.faqKozijnSchilderenA9),
      FaqItem(question: l10n.faqKozijnSchilderenQ10, answer: l10n.faqKozijnSchilderenA10),
    ];
  }

  if (matches('painter', ['radiator'])) {
    return [
      // Doc 4 – Job 10 Radiator schilderen: 10 dedicated FAQ entries
      FaqItem(question: l10n.faqRadiatorSchilderenQ1, answer: l10n.faqRadiatorSchilderenA1),
      FaqItem(question: l10n.faqRadiatorSchilderenQ2, answer: l10n.faqRadiatorSchilderenA2),
      FaqItem(question: l10n.faqRadiatorSchilderenQ3, answer: l10n.faqRadiatorSchilderenA3),
      FaqItem(question: l10n.faqRadiatorSchilderenQ4, answer: l10n.faqRadiatorSchilderenA4),
      FaqItem(question: l10n.faqRadiatorSchilderenQ5, answer: l10n.faqRadiatorSchilderenA5),
      FaqItem(question: l10n.faqRadiatorSchilderenQ6, answer: l10n.faqRadiatorSchilderenA6),
      FaqItem(question: l10n.faqRadiatorSchilderenQ7, answer: l10n.faqRadiatorSchilderenA7),
      FaqItem(question: l10n.faqRadiatorSchilderenQ8, answer: l10n.faqRadiatorSchilderenA8),
      FaqItem(question: l10n.faqRadiatorSchilderenQ9, answer: l10n.faqRadiatorSchilderenA9),
      FaqItem(question: l10n.faqRadiatorSchilderenQ10, answer: l10n.faqRadiatorSchilderenA10),
    ];
  }

  if (matches('plumber', ['kraan', 'keukenkraan', 'tap', 'kitchen tap'])) {
    return [
      // Doc 4 – Job 16 Kraan vervangen: 10 dedicated FAQ entries
      FaqItem(question: l10n.faqKraanVervangenQ1, answer: l10n.faqKraanVervangenA1),
      FaqItem(question: l10n.faqKraanVervangenQ2, answer: l10n.faqKraanVervangenA2),
      FaqItem(question: l10n.faqKraanVervangenQ3, answer: l10n.faqKraanVervangenA3),
      FaqItem(question: l10n.faqKraanVervangenQ4, answer: l10n.faqKraanVervangenA4),
      FaqItem(question: l10n.faqKraanVervangenQ5, answer: l10n.faqKraanVervangenA5),
      FaqItem(question: l10n.faqKraanVervangenQ6, answer: l10n.faqKraanVervangenA6),
      FaqItem(question: l10n.faqKraanVervangenQ7, answer: l10n.faqKraanVervangenA7),
      FaqItem(question: l10n.faqKraanVervangenQ8, answer: l10n.faqKraanVervangenA8),
      FaqItem(question: l10n.faqKraanVervangenQ9, answer: l10n.faqKraanVervangenA9),
      FaqItem(question: l10n.faqKraanVervangenQ10, answer: l10n.faqKraanVervangenA10),
    ];
  }

  if (matches('plumber', ['ontstoppen', 'afvoer', 'unblock', 'drain'])) {
    return [
      // Doc 4 – Job 17 Leiding ontstoppen: 10 dedicated FAQ entries
      FaqItem(question: l10n.faqLeidingOntstoppenQ1, answer: l10n.faqLeidingOntstoppenA1),
      FaqItem(question: l10n.faqLeidingOntstoppenQ2, answer: l10n.faqLeidingOntstoppenA2),
      FaqItem(question: l10n.faqLeidingOntstoppenQ3, answer: l10n.faqLeidingOntstoppenA3),
      FaqItem(question: l10n.faqLeidingOntstoppenQ4, answer: l10n.faqLeidingOntstoppenA4),
      FaqItem(question: l10n.faqLeidingOntstoppenQ5, answer: l10n.faqLeidingOntstoppenA5),
      FaqItem(question: l10n.faqLeidingOntstoppenQ6, answer: l10n.faqLeidingOntstoppenA6),
      FaqItem(question: l10n.faqLeidingOntstoppenQ7, answer: l10n.faqLeidingOntstoppenA7),
      FaqItem(question: l10n.faqLeidingOntstoppenQ8, answer: l10n.faqLeidingOntstoppenA8),
      FaqItem(question: l10n.faqLeidingOntstoppenQ9, answer: l10n.faqLeidingOntstoppenA9),
      FaqItem(question: l10n.faqLeidingOntstoppenQ10, answer: l10n.faqLeidingOntstoppenA10),
    ];
  }

  if (matches('plumber', ['toilet', 'wc'])) {
    return [
      // Doc 4 – Job 18 Toilet installeren: 10 dedicated FAQ entries
      FaqItem(question: l10n.faqToiletInstallerenQ1, answer: l10n.faqToiletInstallerenA1),
      FaqItem(question: l10n.faqToiletInstallerenQ2, answer: l10n.faqToiletInstallerenA2),
      FaqItem(question: l10n.faqToiletInstallerenQ3, answer: l10n.faqToiletInstallerenA3),
      FaqItem(question: l10n.faqToiletInstallerenQ4, answer: l10n.faqToiletInstallerenA4),
      FaqItem(question: l10n.faqToiletInstallerenQ5, answer: l10n.faqToiletInstallerenA5),
      FaqItem(question: l10n.faqToiletInstallerenQ6, answer: l10n.faqToiletInstallerenA6),
      FaqItem(question: l10n.faqToiletInstallerenQ7, answer: l10n.faqToiletInstallerenA7),
      FaqItem(question: l10n.faqToiletInstallerenQ8, answer: l10n.faqToiletInstallerenA8),
      FaqItem(question: l10n.faqToiletInstallerenQ9, answer: l10n.faqToiletInstallerenA9),
      FaqItem(question: l10n.faqToiletInstallerenQ10, answer: l10n.faqToiletInstallerenA10),
    ];
  }

  if (matches('plumber', ['cv', 'cv-installatie', 'bijvullen', 'central heating'])) {
    return [
      // Doc 4 – Job 19 CV bijvullen: 10 dedicated FAQ entries
      FaqItem(question: l10n.faqCvBijvullenQ1, answer: l10n.faqCvBijvullenA1),
      FaqItem(question: l10n.faqCvBijvullenQ2, answer: l10n.faqCvBijvullenA2),
      FaqItem(question: l10n.faqCvBijvullenQ3, answer: l10n.faqCvBijvullenA3),
      FaqItem(question: l10n.faqCvBijvullenQ4, answer: l10n.faqCvBijvullenA4),
      FaqItem(question: l10n.faqCvBijvullenQ5, answer: l10n.faqCvBijvullenA5),
      FaqItem(question: l10n.faqCvBijvullenQ6, answer: l10n.faqCvBijvullenA6),
      FaqItem(question: l10n.faqCvBijvullenQ7, answer: l10n.faqCvBijvullenA7),
      FaqItem(question: l10n.faqCvBijvullenQ8, answer: l10n.faqCvBijvullenA8),
      FaqItem(question: l10n.faqCvBijvullenQ9, answer: l10n.faqCvBijvullenA9),
      FaqItem(question: l10n.faqCvBijvullenQ10, answer: l10n.faqCvBijvullenA10),
    ];
  }

  if (matches('plumber', ['leiding', 'waterleiding', 'pipe', 'water pipe', 'aanleggen', 'installeren', 'lay', 'install'])) {
    return [
      // Doc 4 – Job 20 Leiding aanleggen: 10 dedicated FAQ entries
      FaqItem(question: l10n.faqLeidingAanleggenQ1, answer: l10n.faqLeidingAanleggenA1),
      FaqItem(question: l10n.faqLeidingAanleggenQ2, answer: l10n.faqLeidingAanleggenA2),
      FaqItem(question: l10n.faqLeidingAanleggenQ3, answer: l10n.faqLeidingAanleggenA3),
      FaqItem(question: l10n.faqLeidingAanleggenQ4, answer: l10n.faqLeidingAanleggenA4),
      FaqItem(question: l10n.faqLeidingAanleggenQ5, answer: l10n.faqLeidingAanleggenA5),
      FaqItem(question: l10n.faqLeidingAanleggenQ6, answer: l10n.faqLeidingAanleggenA6),
      FaqItem(question: l10n.faqLeidingAanleggenQ7, answer: l10n.faqLeidingAanleggenA7),
      FaqItem(question: l10n.faqLeidingAanleggenQ8, answer: l10n.faqLeidingAanleggenA8),
      FaqItem(question: l10n.faqLeidingAanleggenQ9, answer: l10n.faqLeidingAanleggenA9),
      FaqItem(question: l10n.faqLeidingAanleggenQ10, answer: l10n.faqLeidingAanleggenA10),
    ];
  }

  if (matches('electrician', ['deurbel', 'doorbell'])) {
    final isEn = (l10n.localeName as String).startsWith('en');

    return [
      FaqItem(
        question: isEn
            ? 'How long does installing a doorbell take?'
            : 'Hoe lang duurt het installeren van een deurbel?',
        answer: isEn
            ? 'Installing a wireless doorbell takes about 15 to 30 minutes. A wired doorbell or smart video doorbell takes about 30 to 45 minutes.'
            : 'Het installeren van een draadloze deurbel duurt circa 15 tot 30 minuten. Een bedrade deurbel of slimme videodeurbel aansluiten duurt ongeveer 30 tot 45 minuten.',
      ),
      FaqItem(
        question: isEn
            ? 'Do I need special protective gear for a doorbell?'
            : 'Heb ik speciale beschermingsmiddelen nodig voor een deurbel?',
        answer: isEn
            ? 'No, protective gear like safety glasses or heavy gloves is not needed for a doorbell. For a wired bell with a transformer, just make sure to switch off power at the fuse box beforehand.'
            : 'Nee, voor een deurbel monteren zijn veiligheidsbrillen of zware werkhandschoenen overbodig. Schakel bij een bedrade bel met transformator wel vooraf de stroom uit in de meterkast.',
      ),
      FaqItem(
        question: isEn
            ? 'How do I install a wireless doorbell?'
            : 'Hoe sluit ik een draadloze deurbel aan?',
        answer: isEn
            ? 'Insert batteries into the push button and indoor chime (or plug it into an outlet). Pair the units and mount the button outside next to the door using screws or the supplied adhesive strip.'
            : 'Plaats de batterijen in de drukknop en de deurgong (of steek de gong in een stopcontact). Koppel beide units en monteer de drukknop buiten naast de deur met schroeven of de meegeleverde plakstrip.',
      ),
      FaqItem(
        question: isEn
            ? 'How do I connect a wired doorbell or transformer?'
            : 'Hoe sluit ik een bedrade deurbel of beltrafo aan?',
        answer: isEn
            ? 'Connect the low-voltage wires (8V or 12V) from the bell transformer to the doorbell button and chime. The transformer converts 230V mains voltage into safe low voltage.'
            : 'Sluit de zwakstroomdraden (8V of 12V) van de beltransformator aan op de deurbelknop en de gong. De transformator zet 230V netspanning om in veilige zwakstroom.',
      ),
      FaqItem(
        question: isEn
            ? 'At what height should I mount the doorbell?'
            : 'Op welke hoogte hang ik de deurbel op?',
        answer: isEn
            ? 'The ideal mounting height for a doorbell or video doorbell is approximately 1.20 to 1.40 meters above doorstep level for easy reach and an optimal camera angle.'
            : 'De ideale montagehoogte voor een deurbel of videodeurbel is circa 1,20 tot 1,40 meter boven de grond voor optimaal gebruiksgemak en camerahoek.',
      ),
      FaqItem(
        question: isEn
            ? 'How do I install a video doorbell (Ring, Eufy, Nest)?'
            : 'Hoe monteer ik een slimme videodeurbel (bijv. Ring, Eufy of Nest)?',
        answer: isEn
            ? 'Screw the mounting bracket to the door frame or masonry at ~1.20m, click the doorbell into place, and connect it to your 2.4 GHz Wi-Fi network via the smartphone app.'
            : 'Schroef de montagebeugel vast op ca. 1,20m hoogte, klik de videodeurbel vast en verbind deze via de app met uw wifi-netwerk.',
      ),
      FaqItem(question: l10n.faqElectricianQ9, answer: l10n.faqElectricianA9),
      FaqItem(question: l10n.faqElectricianQ18, answer: l10n.faqElectricianA18),
      FaqItem(question: l10n.faqElectricianQ20, answer: l10n.faqElectricianA20),
    ];
  }

  if (matches('electrician', ['stopcontact', 'socket', 'outlet'])) {
    return [
      // Doc 4 – Job 26 Stopcontact plaatsen: 10 dedicated FAQ entries
      FaqItem(question: l10n.faqStopcontactPlaatsenQ1, answer: l10n.faqStopcontactPlaatsenA1),
      FaqItem(question: l10n.faqStopcontactPlaatsenQ2, answer: l10n.faqStopcontactPlaatsenA2),
      FaqItem(question: l10n.faqStopcontactPlaatsenQ3, answer: l10n.faqStopcontactPlaatsenA3),
      FaqItem(question: l10n.faqStopcontactPlaatsenQ4, answer: l10n.faqStopcontactPlaatsenA4),
      FaqItem(question: l10n.faqStopcontactPlaatsenQ5, answer: l10n.faqStopcontactPlaatsenA5),
      FaqItem(question: l10n.faqStopcontactPlaatsenQ6, answer: l10n.faqStopcontactPlaatsenA6),
      FaqItem(question: l10n.faqStopcontactPlaatsenQ7, answer: l10n.faqStopcontactPlaatsenA7),
      FaqItem(question: l10n.faqStopcontactPlaatsenQ8, answer: l10n.faqStopcontactPlaatsenA8),
      FaqItem(question: l10n.faqStopcontactPlaatsenQ9, answer: l10n.faqStopcontactPlaatsenA9),
      FaqItem(question: l10n.faqStopcontactPlaatsenQ10, answer: l10n.faqStopcontactPlaatsenA10),
    ];
  }

  if (matches('electrician', ['verlichting', 'lighting', 'lamp'])) {
    return [
      // Doc 4 – Job 27 Verlichting plaatsen: 10 dedicated FAQ entries
      FaqItem(question: l10n.faqVerlichtingPlaatsenQ1, answer: l10n.faqVerlichtingPlaatsenA1),
      FaqItem(question: l10n.faqVerlichtingPlaatsenQ2, answer: l10n.faqVerlichtingPlaatsenA2),
      FaqItem(question: l10n.faqVerlichtingPlaatsenQ3, answer: l10n.faqVerlichtingPlaatsenA3),
      FaqItem(question: l10n.faqVerlichtingPlaatsenQ4, answer: l10n.faqVerlichtingPlaatsenA4),
      FaqItem(question: l10n.faqVerlichtingPlaatsenQ5, answer: l10n.faqVerlichtingPlaatsenA5),
      FaqItem(question: l10n.faqVerlichtingPlaatsenQ6, answer: l10n.faqVerlichtingPlaatsenA6),
      FaqItem(question: l10n.faqVerlichtingPlaatsenQ7, answer: l10n.faqVerlichtingPlaatsenA7),
      FaqItem(question: l10n.faqVerlichtingPlaatsenQ8, answer: l10n.faqVerlichtingPlaatsenA8),
      FaqItem(question: l10n.faqVerlichtingPlaatsenQ9, answer: l10n.faqVerlichtingPlaatsenA9),
      FaqItem(question: l10n.faqVerlichtingPlaatsenQ10, answer: l10n.faqVerlichtingPlaatsenA10),
    ];
  }

  if (matches('electrician', ['stroomleiding', 'kabel', 'cable', 'wiring'])) {
    return [
      // Doc 4 – Job 28 Stroomleiding leggen: 10 dedicated FAQ entries
      FaqItem(question: l10n.faqStroomleidingLeggenQ1, answer: l10n.faqStroomleidingLeggenA1),
      FaqItem(question: l10n.faqStroomleidingLeggenQ2, answer: l10n.faqStroomleidingLeggenA2),
      FaqItem(question: l10n.faqStroomleidingLeggenQ3, answer: l10n.faqStroomleidingLeggenA3),
      FaqItem(question: l10n.faqStroomleidingLeggenQ4, answer: l10n.faqStroomleidingLeggenA4),
      FaqItem(question: l10n.faqStroomleidingLeggenQ5, answer: l10n.faqStroomleidingLeggenA5),
      FaqItem(question: l10n.faqStroomleidingLeggenQ6, answer: l10n.faqStroomleidingLeggenA6),
      FaqItem(question: l10n.faqStroomleidingLeggenQ7, answer: l10n.faqStroomleidingLeggenA7),
      FaqItem(question: l10n.faqStroomleidingLeggenQ8, answer: l10n.faqStroomleidingLeggenA8),
      FaqItem(question: l10n.faqStroomleidingLeggenQ9, answer: l10n.faqStroomleidingLeggenA9),
      FaqItem(question: l10n.faqStroomleidingLeggenQ10, answer: l10n.faqStroomleidingLeggenA10),
    ];
  }

  if (matches('electrician', ['kabelgoot', 'cable duct', 'cable trunking'])) {
    return [
      // Doc 4 – Job 29 Kabelgoot monteren: 10 dedicated FAQ entries
      FaqItem(question: l10n.faqKabelgootMonterenQ1, answer: l10n.faqKabelgootMonterenA1),
      FaqItem(question: l10n.faqKabelgootMonterenQ2, answer: l10n.faqKabelgootMonterenA2),
      FaqItem(question: l10n.faqKabelgootMonterenQ3, answer: l10n.faqKabelgootMonterenA3),
      FaqItem(question: l10n.faqKabelgootMonterenQ4, answer: l10n.faqKabelgootMonterenA4),
      FaqItem(question: l10n.faqKabelgootMonterenQ5, answer: l10n.faqKabelgootMonterenA5),
      FaqItem(question: l10n.faqKabelgootMonterenQ6, answer: l10n.faqKabelgootMonterenA6),
      FaqItem(question: l10n.faqKabelgootMonterenQ7, answer: l10n.faqKabelgootMonterenA7),
      FaqItem(question: l10n.faqKabelgootMonterenQ8, answer: l10n.faqKabelgootMonterenA8),
      FaqItem(question: l10n.faqKabelgootMonterenQ9, answer: l10n.faqKabelgootMonterenA9),
      FaqItem(question: l10n.faqKabelgootMonterenQ10, answer: l10n.faqKabelgootMonterenA10),
    ];
  }

  if (matches('electrician', ['rookmelder', 'smoke detector', 'fire alarm'])) {
    return [
      // Doc 4 – Job 30 Rookmelder plaatsen: 10 dedicated FAQ entries
      FaqItem(question: l10n.faqRookmelderPlaatsenQ1, answer: l10n.faqRookmelderPlaatsenA1),
      FaqItem(question: l10n.faqRookmelderPlaatsenQ2, answer: l10n.faqRookmelderPlaatsenA2),
      FaqItem(question: l10n.faqRookmelderPlaatsenQ3, answer: l10n.faqRookmelderPlaatsenA3),
      FaqItem(question: l10n.faqRookmelderPlaatsenQ4, answer: l10n.faqRookmelderPlaatsenA4),
      FaqItem(question: l10n.faqRookmelderPlaatsenQ5, answer: l10n.faqRookmelderPlaatsenA5),
      FaqItem(question: l10n.faqRookmelderPlaatsenQ6, answer: l10n.faqRookmelderPlaatsenA6),
      FaqItem(question: l10n.faqRookmelderPlaatsenQ7, answer: l10n.faqRookmelderPlaatsenA7),
      FaqItem(question: l10n.faqRookmelderPlaatsenQ8, answer: l10n.faqRookmelderPlaatsenA8),
      FaqItem(question: l10n.faqRookmelderPlaatsenQ9, answer: l10n.faqRookmelderPlaatsenA9),
      FaqItem(question: l10n.faqRookmelderPlaatsenQ10, answer: l10n.faqRookmelderPlaatsenA10),
    ];
  }

  if (matches('tiler', ['vloertegel', 'floor tile'])) {
    return [
      // Doc 4 – Job 11 Vloertegels leggen: 10 dedicated FAQ entries
      FaqItem(question: l10n.faqVloertegelsBadkamerQ1, answer: l10n.faqVloertegelsBadkamerA1),
      FaqItem(question: l10n.faqVloertegelsBadkamerQ2, answer: l10n.faqVloertegelsBadkamerA2),
      FaqItem(question: l10n.faqVloertegelsBadkamerQ3, answer: l10n.faqVloertegelsBadkamerA3),
      FaqItem(question: l10n.faqVloertegelsBadkamerQ4, answer: l10n.faqVloertegelsBadkamerA4),
      FaqItem(question: l10n.faqVloertegelsBadkamerQ5, answer: l10n.faqVloertegelsBadkamerA5),
      FaqItem(question: l10n.faqVloertegelsBadkamerQ6, answer: l10n.faqVloertegelsBadkamerA6),
      FaqItem(question: l10n.faqVloertegelsBadkamerQ7, answer: l10n.faqVloertegelsBadkamerA7),
      FaqItem(question: l10n.faqVloertegelsBadkamerQ8, answer: l10n.faqVloertegelsBadkamerA8),
      FaqItem(question: l10n.faqVloertegelsBadkamerQ9, answer: l10n.faqVloertegelsBadkamerA9),
      FaqItem(question: l10n.faqVloertegelsBadkamerQ10, answer: l10n.faqVloertegelsBadkamerA10),
    ];
  }

  if (matches('tiler', ['wandtegel', 'wall tile'])) {
    return [
      // Doc 4 – Job 12 Wandtegels plaatsen: 10 dedicated FAQ entries
      FaqItem(question: l10n.faqWandtegelsPlaatsenQ1, answer: l10n.faqWandtegelsPlaatsenA1),
      FaqItem(question: l10n.faqWandtegelsPlaatsenQ2, answer: l10n.faqWandtegelsPlaatsenA2),
      FaqItem(question: l10n.faqWandtegelsPlaatsenQ3, answer: l10n.faqWandtegelsPlaatsenA3),
      FaqItem(question: l10n.faqWandtegelsPlaatsenQ4, answer: l10n.faqWandtegelsPlaatsenA4),
      FaqItem(question: l10n.faqWandtegelsPlaatsenQ5, answer: l10n.faqWandtegelsPlaatsenA5),
      FaqItem(question: l10n.faqWandtegelsPlaatsenQ6, answer: l10n.faqWandtegelsPlaatsenA6),
      FaqItem(question: l10n.faqWandtegelsPlaatsenQ7, answer: l10n.faqWandtegelsPlaatsenA7),
      FaqItem(question: l10n.faqWandtegelsPlaatsenQ8, answer: l10n.faqWandtegelsPlaatsenA8),
      FaqItem(question: l10n.faqWandtegelsPlaatsenQ9, answer: l10n.faqWandtegelsPlaatsenA9),
      FaqItem(question: l10n.faqWandtegelsPlaatsenQ10, answer: l10n.faqWandtegelsPlaatsenA10),
    ];
  }

  if (matches('tiler', ['tegels repareren', 'tile repair'])) {
    return [
      // Doc 4 – Job 13 Tegels repareren: 10 dedicated FAQ entries
      FaqItem(question: l10n.faqTegelReparerenQ1, answer: l10n.faqTegelReparerenA1),
      FaqItem(question: l10n.faqTegelReparerenQ2, answer: l10n.faqTegelReparerenA2),
      FaqItem(question: l10n.faqTegelReparerenQ3, answer: l10n.faqTegelReparerenA3),
      FaqItem(question: l10n.faqTegelReparerenQ4, answer: l10n.faqTegelReparerenA4),
      FaqItem(question: l10n.faqTegelReparerenQ5, answer: l10n.faqTegelReparerenA5),
      FaqItem(question: l10n.faqTegelReparerenQ6, answer: l10n.faqTegelReparerenA6),
      FaqItem(question: l10n.faqTegelReparerenQ7, answer: l10n.faqTegelReparerenA7),
      FaqItem(question: l10n.faqTegelReparerenQ8, answer: l10n.faqTegelReparerenA8),
      FaqItem(question: l10n.faqTegelReparerenQ9, answer: l10n.faqTegelReparerenA9),
      FaqItem(question: l10n.faqTegelReparerenQ10, answer: l10n.faqTegelReparerenA10),
    ];
  }

  if (matches('tiler', ['voegen', 'grouting'])) {
    return [
      // Doc 4 – Job 14 Voegen: 10 dedicated FAQ entries
      FaqItem(question: l10n.faqVoegenQ1, answer: l10n.faqVoegenA1),
      FaqItem(question: l10n.faqVoegenQ2, answer: l10n.faqVoegenA2),
      FaqItem(question: l10n.faqVoegenQ3, answer: l10n.faqVoegenA3),
      FaqItem(question: l10n.faqVoegenQ4, answer: l10n.faqVoegenA4),
      FaqItem(question: l10n.faqVoegenQ5, answer: l10n.faqVoegenA5),
      FaqItem(question: l10n.faqVoegenQ6, answer: l10n.faqVoegenA6),
      FaqItem(question: l10n.faqVoegenQ7, answer: l10n.faqVoegenA7),
      FaqItem(question: l10n.faqVoegenQ8, answer: l10n.faqVoegenA8),
      FaqItem(question: l10n.faqVoegenQ9, answer: l10n.faqVoegenA9),
      FaqItem(question: l10n.faqVoegenQ10, answer: l10n.faqVoegenA10),
    ];
  }

  if (matches('tiler', ['kit', 'caulk', 'sealant'])) {
    return [
      // Doc 4 – Job 15 Kit aanbrengen: 10 dedicated FAQ entries
      FaqItem(question: l10n.faqKitAanbrengenQ1, answer: l10n.faqKitAanbrengenA1),
      FaqItem(question: l10n.faqKitAanbrengenQ2, answer: l10n.faqKitAanbrengenA2),
      FaqItem(question: l10n.faqKitAanbrengenQ3, answer: l10n.faqKitAanbrengenA3),
      FaqItem(question: l10n.faqKitAanbrengenQ4, answer: l10n.faqKitAanbrengenA4),
      FaqItem(question: l10n.faqKitAanbrengenQ5, answer: l10n.faqKitAanbrengenA5),
      FaqItem(question: l10n.faqKitAanbrengenQ6, answer: l10n.faqKitAanbrengenA6),
      FaqItem(question: l10n.faqKitAanbrengenQ7, answer: l10n.faqKitAanbrengenA7),
      FaqItem(question: l10n.faqKitAanbrengenQ8, answer: l10n.faqKitAanbrengenA8),
      FaqItem(question: l10n.faqKitAanbrengenQ9, answer: l10n.faqKitAanbrengenA9),
      FaqItem(question: l10n.faqKitAanbrengenQ10, answer: l10n.faqKitAanbrengenA10),
    ];
  }

  if (matches('gardener', ['schutting', 'fence', 'omheining'])) {
    return [
      // Doc 4 – Job 21 Schutting plaatsen: 10 dedicated FAQ entries
      FaqItem(question: l10n.faqSchuttingPlaatsenQ1, answer: l10n.faqSchuttingPlaatsenA1),
      FaqItem(question: l10n.faqSchuttingPlaatsenQ2, answer: l10n.faqSchuttingPlaatsenA2),
      FaqItem(question: l10n.faqSchuttingPlaatsenQ3, answer: l10n.faqSchuttingPlaatsenA3),
      FaqItem(question: l10n.faqSchuttingPlaatsenQ4, answer: l10n.faqSchuttingPlaatsenA4),
      FaqItem(question: l10n.faqSchuttingPlaatsenQ5, answer: l10n.faqSchuttingPlaatsenA5),
      FaqItem(question: l10n.faqSchuttingPlaatsenQ6, answer: l10n.faqSchuttingPlaatsenA6),
      FaqItem(question: l10n.faqSchuttingPlaatsenQ7, answer: l10n.faqSchuttingPlaatsenA7),
      FaqItem(question: l10n.faqSchuttingPlaatsenQ8, answer: l10n.faqSchuttingPlaatsenA8),
      FaqItem(question: l10n.faqSchuttingPlaatsenQ9, answer: l10n.faqSchuttingPlaatsenA9),
      FaqItem(question: l10n.faqSchuttingPlaatsenQ10, answer: l10n.faqSchuttingPlaatsenA10),
    ];
  }

  if (matches('gardener', ['terras', 'bestrating', 'paving', 'patio'])) {
    return [
      // Doc 4 – Job 22 Bestrating aanleggen: 10 dedicated FAQ entries
      FaqItem(question: l10n.faqBestratingAanleggenQ1, answer: l10n.faqBestratingAanleggenA1),
      FaqItem(question: l10n.faqBestratingAanleggenQ2, answer: l10n.faqBestratingAanleggenA2),
      FaqItem(question: l10n.faqBestratingAanleggenQ3, answer: l10n.faqBestratingAanleggenA3),
      FaqItem(question: l10n.faqBestratingAanleggenQ4, answer: l10n.faqBestratingAanleggenA4),
      FaqItem(question: l10n.faqBestratingAanleggenQ5, answer: l10n.faqBestratingAanleggenA5),
      FaqItem(question: l10n.faqBestratingAanleggenQ6, answer: l10n.faqBestratingAanleggenA6),
      FaqItem(question: l10n.faqBestratingAanleggenQ7, answer: l10n.faqBestratingAanleggenA7),
      FaqItem(question: l10n.faqBestratingAanleggenQ8, answer: l10n.faqBestratingAanleggenA8),
      FaqItem(question: l10n.faqBestratingAanleggenQ9, answer: l10n.faqBestratingAanleggenA9),
      FaqItem(question: l10n.faqBestratingAanleggenQ10, answer: l10n.faqBestratingAanleggenA10),
    ];
  }

  if (matches('gardener', ['snoeien', 'pruning', 'tuinonderhoud', 'garden maintenance'])) {
    return [
      // Doc 4 – Job 23 Snoeien: 10 dedicated FAQ entries
      FaqItem(question: l10n.faqSnoeienQ1, answer: l10n.faqSnoeienA1),
      FaqItem(question: l10n.faqSnoeienQ2, answer: l10n.faqSnoeienA2),
      FaqItem(question: l10n.faqSnoeienQ3, answer: l10n.faqSnoeienA3),
      FaqItem(question: l10n.faqSnoeienQ4, answer: l10n.faqSnoeienA4),
      FaqItem(question: l10n.faqSnoeienQ5, answer: l10n.faqSnoeienA5),
      FaqItem(question: l10n.faqSnoeienQ6, answer: l10n.faqSnoeienA6),
      FaqItem(question: l10n.faqSnoeienQ7, answer: l10n.faqSnoeienA7),
      FaqItem(question: l10n.faqSnoeienQ8, answer: l10n.faqSnoeienA8),
      FaqItem(question: l10n.faqSnoeienQ9, answer: l10n.faqSnoeienA9),
      FaqItem(question: l10n.faqSnoeienQ10, answer: l10n.faqSnoeienA10),
    ];
  }

  if (matches('gardener', ['overkapping', 'canopy', 'veranda'])) {
    return [
      // Doc 4 – Job 24 Overkapping bouwen: 10 dedicated FAQ entries
      FaqItem(question: l10n.faqOverkappingBouwenQ1, answer: l10n.faqOverkappingBouwenA1),
      FaqItem(question: l10n.faqOverkappingBouwenQ2, answer: l10n.faqOverkappingBouwenA2),
      FaqItem(question: l10n.faqOverkappingBouwenQ3, answer: l10n.faqOverkappingBouwenA3),
      FaqItem(question: l10n.faqOverkappingBouwenQ4, answer: l10n.faqOverkappingBouwenA4),
      FaqItem(question: l10n.faqOverkappingBouwenQ5, answer: l10n.faqOverkappingBouwenA5),
      FaqItem(question: l10n.faqOverkappingBouwenQ6, answer: l10n.faqOverkappingBouwenA6),
      FaqItem(question: l10n.faqOverkappingBouwenQ7, answer: l10n.faqOverkappingBouwenA7),
      FaqItem(question: l10n.faqOverkappingBouwenQ8, answer: l10n.faqOverkappingBouwenA8),
      FaqItem(question: l10n.faqOverkappingBouwenQ9, answer: l10n.faqOverkappingBouwenA9),
      FaqItem(question: l10n.faqOverkappingBouwenQ10, answer: l10n.faqOverkappingBouwenA10),
    ];
  }

  if (matches('gardener', ['gazon', 'lawn', 'gras', 'grass'])) {
    return [
      // Doc 4 – Job 25 Gazon leggen: 10 dedicated FAQ entries
      FaqItem(question: l10n.faqGazonLeggenQ1, answer: l10n.faqGazonLeggenA1),
      FaqItem(question: l10n.faqGazonLeggenQ2, answer: l10n.faqGazonLeggenA2),
      FaqItem(question: l10n.faqGazonLeggenQ3, answer: l10n.faqGazonLeggenA3),
      FaqItem(question: l10n.faqGazonLeggenQ4, answer: l10n.faqGazonLeggenA4),
      FaqItem(question: l10n.faqGazonLeggenQ5, answer: l10n.faqGazonLeggenA5),
      FaqItem(question: l10n.faqGazonLeggenQ6, answer: l10n.faqGazonLeggenA6),
      FaqItem(question: l10n.faqGazonLeggenQ7, answer: l10n.faqGazonLeggenA7),
      FaqItem(question: l10n.faqGazonLeggenQ8, answer: l10n.faqGazonLeggenA8),
      FaqItem(question: l10n.faqGazonLeggenQ9, answer: l10n.faqGazonLeggenA9),
      FaqItem(question: l10n.faqGazonLeggenQ10, answer: l10n.faqGazonLeggenA10),
    ];
  }

  if (hasAny(['gipswand', 'plasterboard'])) {
    return [
      // Doc 4 - Job 5 Wand plaatsen: 10 dedicated FAQ entries
      FaqItem(question: l10n.faqWandPlaatsenQ1, answer: l10n.faqWandPlaatsenA1),
      FaqItem(question: l10n.faqWandPlaatsenQ3, answer: l10n.faqWandPlaatsenA3),
      FaqItem(question: l10n.faqWandPlaatsenQ4, answer: l10n.faqWandPlaatsenA4),
      FaqItem(question: l10n.faqWandPlaatsenQ5, answer: l10n.faqWandPlaatsenA5),
      FaqItem(question: l10n.faqWandPlaatsenQ6, answer: l10n.faqWandPlaatsenA6),
      FaqItem(question: l10n.faqWandPlaatsenQ7, answer: l10n.faqWandPlaatsenA7),
      FaqItem(question: l10n.faqWandPlaatsenQ8, answer: l10n.faqWandPlaatsenA8),
      FaqItem(question: l10n.faqWandPlaatsenQ9, answer: l10n.faqWandPlaatsenA9),
      FaqItem(question: l10n.faqWandPlaatsenQ10, answer: l10n.faqWandPlaatsenA10),
      FaqItem(question: l10n.faqWandPlaatsenQ11, answer: l10n.faqWandPlaatsenA11),
    ];
  }

  if (matches('carpenter', ['laminaat', 'laminate'])) {
    return [
      // Doc 4 – Job 1 Vloer leggen: 10 dedicated FAQ entries
      FaqItem(question: l10n.faqVloerleggenQ1, answer: l10n.faqVloerleggenA1),
      FaqItem(question: l10n.faqVloerleggenQ2, answer: l10n.faqVloerleggenA2),
      FaqItem(question: l10n.faqVloerleggenQ3, answer: l10n.faqVloerleggenA3),
      FaqItem(question: l10n.faqVloerleggenQ4, answer: l10n.faqVloerleggenA4),
      FaqItem(question: l10n.faqVloerleggenQ5, answer: l10n.faqVloerleggenA5),
      FaqItem(question: l10n.faqVloerleggenQ6, answer: l10n.faqVloerleggenA6),
      FaqItem(question: l10n.faqVloerleggenQ7, answer: l10n.faqVloerleggenA7),
      FaqItem(question: l10n.faqVloerleggenQ8, answer: l10n.faqVloerleggenA8),
      FaqItem(question: l10n.faqVloerleggenQ9, answer: l10n.faqVloerleggenA9),
      FaqItem(question: l10n.faqVloerleggenQ10, answer: l10n.faqVloerleggenA10),
    ];
  }

  if (matches('carpenter', ['deur plaatsen', 'deur', 'door installation'])) {
    return [
      // Doc 4 – Job 2 Deur plaatsen: 10 dedicated FAQ entries
      FaqItem(question: l10n.faqDeurPlaatsenQ1, answer: l10n.faqDeurPlaatsenA1),
      FaqItem(question: l10n.faqDeurPlaatsenQ2, answer: l10n.faqDeurPlaatsenA2),
      FaqItem(question: l10n.faqDeurPlaatsenQ3, answer: l10n.faqDeurPlaatsenA3),
      FaqItem(question: l10n.faqDeurPlaatsenQ4, answer: l10n.faqDeurPlaatsenA4),
      FaqItem(question: l10n.faqDeurPlaatsenQ5, answer: l10n.faqDeurPlaatsenA5),
      FaqItem(question: l10n.faqDeurPlaatsenQ6, answer: l10n.faqDeurPlaatsenA6),
      FaqItem(question: l10n.faqDeurPlaatsenQ7, answer: l10n.faqDeurPlaatsenA7),
      FaqItem(question: l10n.faqDeurPlaatsenQ8, answer: l10n.faqDeurPlaatsenA8),
      FaqItem(question: l10n.faqDeurPlaatsenQ9, answer: l10n.faqDeurPlaatsenA9),
      FaqItem(question: l10n.faqDeurPlaatsenQ10, answer: l10n.faqDeurPlaatsenA10),
    ];
  }

  // Doc 4 – Job 3a Plinten monteren – Plakplint: 10 dedicated FAQ entries
  if (matches('carpenter', ['plinten', 'skirting']) && isPlakplinten) {
    return [
      FaqItem(question: l10n.faqPlakplintQ1, answer: l10n.faqPlakplintA1),
      FaqItem(question: l10n.faqPlakplintQ2, answer: l10n.faqPlakplintA2),
      FaqItem(question: l10n.faqPlakplintQ3, answer: l10n.faqPlakplintA3),
      FaqItem(question: l10n.faqPlakplintQ4, answer: l10n.faqPlakplintA4),
      FaqItem(question: l10n.faqPlakplintQ5, answer: l10n.faqPlakplintA5),
      FaqItem(question: l10n.faqPlakplintQ6, answer: l10n.faqPlakplintA6),
      FaqItem(question: l10n.faqPlakplintQ7, answer: l10n.faqPlakplintA7),
      FaqItem(question: l10n.faqPlakplintQ8, answer: l10n.faqPlakplintA8),
      FaqItem(question: l10n.faqPlakplintQ9, answer: l10n.faqPlakplintA9),
      FaqItem(question: l10n.faqPlakplintQ10, answer: l10n.faqPlakplintA10),
    ];
  }

  // Doc 4 – Job 3b Plinten monteren – Voorzetplint: 10 dedicated FAQ entries
  if (matches('carpenter', ['plinten', 'skirting']) && !isPlakplinten) {
    return [
      FaqItem(question: l10n.faqVoorzetplintQ1, answer: l10n.faqVoorzetplintA1),
      FaqItem(question: l10n.faqVoorzetplintQ2, answer: l10n.faqVoorzetplintA2),
      FaqItem(question: l10n.faqVoorzetplintQ3, answer: l10n.faqVoorzetplintA3),
      FaqItem(question: l10n.faqVoorzetplintQ4, answer: l10n.faqVoorzetplintA4),
      FaqItem(question: l10n.faqVoorzetplintQ5, answer: l10n.faqVoorzetplintA5),
      FaqItem(question: l10n.faqVoorzetplintQ6, answer: l10n.faqVoorzetplintA6),
      FaqItem(question: l10n.faqVoorzetplintQ7, answer: l10n.faqVoorzetplintA7),
      FaqItem(question: l10n.faqVoorzetplintQ8, answer: l10n.faqVoorzetplintA8),
      FaqItem(question: l10n.faqVoorzetplintQ9, answer: l10n.faqVoorzetplintA9),
      FaqItem(question: l10n.faqVoorzetplintQ10, answer: l10n.faqVoorzetplintA10),
    ];
  }

  if (matches('carpenter', ['trap', 'stair'])) {
    return [
      // Doc 4 – Job 4 Trap renoveren: 10 dedicated FAQ entries
      FaqItem(question: l10n.faqTrapRenoverenQ1, answer: l10n.faqTrapRenoverenA1),
      FaqItem(question: l10n.faqTrapRenoverenQ2, answer: l10n.faqTrapRenoverenA2),
      FaqItem(question: l10n.faqTrapRenoverenQ3, answer: l10n.faqTrapRenoverenA3),
      FaqItem(question: l10n.faqTrapRenoverenQ4, answer: l10n.faqTrapRenoverenA4),
      FaqItem(question: l10n.faqTrapRenoverenQ5, answer: l10n.faqTrapRenoverenA5),
      FaqItem(question: l10n.faqTrapRenoverenQ6, answer: l10n.faqTrapRenoverenA6),
      FaqItem(question: l10n.faqTrapRenoverenQ7, answer: l10n.faqTrapRenoverenA7),
      FaqItem(question: l10n.faqTrapRenoverenQ8, answer: l10n.faqTrapRenoverenA8),
      FaqItem(question: l10n.faqTrapRenoverenQ9, answer: l10n.faqTrapRenoverenA9),
      FaqItem(question: l10n.faqTrapRenoverenQ10, answer: l10n.faqTrapRenoverenA10),
    ];
  }

  if (jobId == 'painter') {
    return [
      FaqItem(question: l10n.faqPainterQ1, answer: l10n.faqPainterA1),
      FaqItem(question: l10n.faqPainterQ2, answer: l10n.faqPainterA2),
      FaqItem(question: l10n.faqPainterQ3, answer: l10n.faqPainterA3),
      FaqItem(question: l10n.faqPainterQ4, answer: l10n.faqPainterA4),
      FaqItem(question: l10n.faqPainterQ5, answer: l10n.faqPainterA5),
      FaqItem(question: l10n.faqPainterQ6, answer: l10n.faqPainterA6),
      FaqItem(question: l10n.faqPainterQ7, answer: l10n.faqPainterA7),
      FaqItem(question: l10n.faqPainterQ8, answer: l10n.faqPainterA8),
      FaqItem(question: l10n.faqPainterQ9, answer: l10n.faqPainterA9),
      FaqItem(question: l10n.faqPainterQ10, answer: l10n.faqPainterA10),
      FaqItem(question: l10n.faqPainterQ11, answer: l10n.faqPainterA11),
      FaqItem(question: l10n.faqPainterQ12, answer: l10n.faqPainterA12),
      FaqItem(question: l10n.faqPainterQ13, answer: l10n.faqPainterA13),
      FaqItem(question: l10n.faqPainterQ14, answer: l10n.faqPainterA14),
      FaqItem(question: l10n.faqPainterQ15, answer: l10n.faqPainterA15),
      FaqItem(question: l10n.faqPainterQ16, answer: l10n.faqPainterA16),
      FaqItem(question: l10n.faqPainterQ17, answer: l10n.faqPainterA17),
      FaqItem(question: l10n.faqPainterQ18, answer: l10n.faqPainterA18),
      FaqItem(question: l10n.faqPainterQ19, answer: l10n.faqPainterA19),
      FaqItem(question: l10n.faqPainterQ20, answer: l10n.faqPainterA20),
    ];
  }

  if (jobId == 'plumber') {
    return [
      FaqItem(question: l10n.faqPlumberQ1, answer: l10n.faqPlumberA1),
      FaqItem(question: l10n.faqPlumberQ2, answer: l10n.faqPlumberA2),
      FaqItem(question: l10n.faqPlumberQ3, answer: l10n.faqPlumberA3),
      FaqItem(question: l10n.faqPlumberQ4, answer: l10n.faqPlumberA4),
      FaqItem(question: l10n.faqPlumberQ5, answer: l10n.faqPlumberA5),
      FaqItem(question: l10n.faqPlumberQ6, answer: l10n.faqPlumberA6),
      FaqItem(question: l10n.faqPlumberQ7, answer: l10n.faqPlumberA7),
      FaqItem(question: l10n.faqPlumberQ8, answer: l10n.faqPlumberA8),
      FaqItem(question: l10n.faqPlumberQ9, answer: l10n.faqPlumberA9),
      FaqItem(question: l10n.faqPlumberQ10, answer: l10n.faqPlumberA10),
      FaqItem(question: l10n.faqPlumberQ11, answer: l10n.faqPlumberA11),
      FaqItem(question: l10n.faqPlumberQ12, answer: l10n.faqPlumberA12),
      FaqItem(question: l10n.faqPlumberQ13, answer: l10n.faqPlumberA13),
      FaqItem(question: l10n.faqPlumberQ14, answer: l10n.faqPlumberA14),
      FaqItem(question: l10n.faqPlumberQ15, answer: l10n.faqPlumberA15),
      FaqItem(question: l10n.faqPlumberQ16, answer: l10n.faqPlumberA16),
      FaqItem(question: l10n.faqPlumberQ17, answer: l10n.faqPlumberA17),
      FaqItem(question: l10n.faqPlumberQ18, answer: l10n.faqPlumberA18),
      FaqItem(question: l10n.faqPlumberQ19, answer: l10n.faqPlumberA19),
      FaqItem(question: l10n.faqPlumberQ20, answer: l10n.faqPlumberA20),
    ];
  }

  if (jobId == 'tiler') {
    return [
      FaqItem(question: l10n.faqTilerQ1, answer: l10n.faqTilerA1),
      FaqItem(question: l10n.faqTilerQ2, answer: l10n.faqTilerA2),
      FaqItem(question: l10n.faqTilerQ3, answer: l10n.faqTilerA3),
      FaqItem(question: l10n.faqTilerQ4, answer: l10n.faqTilerA4),
      FaqItem(question: l10n.faqTilerQ5, answer: l10n.faqTilerA5),
      FaqItem(question: l10n.faqTilerQ6, answer: l10n.faqTilerA6),
      FaqItem(question: l10n.faqTilerQ7, answer: l10n.faqTilerA7),
      FaqItem(question: l10n.faqTilerQ8, answer: l10n.faqTilerA8),
      FaqItem(question: l10n.faqTilerQ9, answer: l10n.faqTilerA9),
      FaqItem(question: l10n.faqTilerQ10, answer: l10n.faqTilerA10),
      FaqItem(question: l10n.faqTilerQ11, answer: l10n.faqTilerA11),
      FaqItem(question: l10n.faqTilerQ12, answer: l10n.faqTilerA12),
      FaqItem(question: l10n.faqTilerQ13, answer: l10n.faqTilerA13),
      FaqItem(question: l10n.faqTilerQ14, answer: l10n.faqTilerA14),
      FaqItem(question: l10n.faqTilerQ15, answer: l10n.faqTilerA15),
      FaqItem(question: l10n.faqTilerQ16, answer: l10n.faqTilerA16),
      FaqItem(question: l10n.faqTilerQ17, answer: l10n.faqTilerA17),
      FaqItem(question: l10n.faqTilerQ18, answer: l10n.faqTilerA18),
      FaqItem(question: l10n.faqTilerQ19, answer: l10n.faqTilerA19),
      FaqItem(question: l10n.faqTilerQ20, answer: l10n.faqTilerA20),
    ];
  }

  if (jobId == 'gardener') {
    return [
      FaqItem(question: l10n.faqGardenerQ1, answer: l10n.faqGardenerA1),
      FaqItem(question: l10n.faqGardenerQ2, answer: l10n.faqGardenerA2),
      FaqItem(question: l10n.faqGardenerQ3, answer: l10n.faqGardenerA3),
      FaqItem(question: l10n.faqGardenerQ4, answer: l10n.faqGardenerA4),
      FaqItem(question: l10n.faqGardenerQ5, answer: l10n.faqGardenerA5),
      FaqItem(question: l10n.faqGardenerQ6, answer: l10n.faqGardenerA6),
      FaqItem(question: l10n.faqGardenerQ7, answer: l10n.faqGardenerA7),
      FaqItem(question: l10n.faqGardenerQ8, answer: l10n.faqGardenerA8),
      FaqItem(question: l10n.faqGardenerQ9, answer: l10n.faqGardenerA9),
      FaqItem(question: l10n.faqGardenerQ10, answer: l10n.faqGardenerA10),
      FaqItem(question: l10n.faqGardenerQ11, answer: l10n.faqGardenerA11),
      FaqItem(question: l10n.faqGardenerQ12, answer: l10n.faqGardenerA12),
      FaqItem(question: l10n.faqGardenerQ13, answer: l10n.faqGardenerA13),
      FaqItem(question: l10n.faqGardenerQ14, answer: l10n.faqGardenerA14),
      FaqItem(question: l10n.faqGardenerQ15, answer: l10n.faqGardenerA15),
      FaqItem(question: l10n.faqGardenerQ16, answer: l10n.faqGardenerA16),
      FaqItem(question: l10n.faqGardenerQ17, answer: l10n.faqGardenerA17),
      FaqItem(question: l10n.faqGardenerQ18, answer: l10n.faqGardenerA18),
      FaqItem(question: l10n.faqGardenerQ19, answer: l10n.faqGardenerA19),
      FaqItem(question: l10n.faqGardenerQ20, answer: l10n.faqGardenerA20),
    ];
  }

  if (jobId == 'electrician') {
    return [
      FaqItem(question: l10n.faqElectricianQ1, answer: l10n.faqElectricianA1),
      FaqItem(question: l10n.faqElectricianQ2, answer: l10n.faqElectricianA2),
      FaqItem(question: l10n.faqElectricianQ3, answer: l10n.faqElectricianA3),
      FaqItem(question: l10n.faqElectricianQ4, answer: l10n.faqElectricianA4),
      FaqItem(question: l10n.faqElectricianQ5, answer: l10n.faqElectricianA5),
      FaqItem(question: l10n.faqElectricianQ6, answer: l10n.faqElectricianA6),
      FaqItem(question: l10n.faqElectricianQ7, answer: l10n.faqElectricianA7),
      FaqItem(question: l10n.faqElectricianQ8, answer: l10n.faqElectricianA8),
      FaqItem(question: l10n.faqElectricianQ9, answer: l10n.faqElectricianA9),
      FaqItem(question: l10n.faqElectricianQ10, answer: l10n.faqElectricianA10),
      FaqItem(question: l10n.faqElectricianQ11, answer: l10n.faqElectricianA11),
      FaqItem(question: l10n.faqElectricianQ12, answer: l10n.faqElectricianA12),
      FaqItem(question: l10n.faqElectricianQ13, answer: l10n.faqElectricianA13),
      FaqItem(question: l10n.faqElectricianQ14, answer: l10n.faqElectricianA14),
      FaqItem(question: l10n.faqElectricianQ15, answer: l10n.faqElectricianA15),
      FaqItem(question: l10n.faqElectricianQ16, answer: l10n.faqElectricianA16),
      FaqItem(question: l10n.faqElectricianQ17, answer: l10n.faqElectricianA17),
      FaqItem(question: l10n.faqElectricianQ18, answer: l10n.faqElectricianA18),
      FaqItem(question: l10n.faqElectricianQ19, answer: l10n.faqElectricianA19),
      FaqItem(question: l10n.faqElectricianQ20, answer: l10n.faqElectricianA20),
    ];
  }

  // Doc 4 – Job 2 Deur plaatsen: 10 dedicated FAQ entries (PDF v4.0)
  if (matches('carpenter', ['deur plaatsen', 'door install', 'install door', 'deur afhangen', 'door placement'])) {
    return [
      FaqItem(question: l10n.faqDeurPlaatsenQ1, answer: l10n.faqDeurPlaatsenA1),
      FaqItem(question: l10n.faqDeurPlaatsenQ2, answer: l10n.faqDeurPlaatsenA2),
      FaqItem(question: l10n.faqDeurPlaatsenQ3, answer: l10n.faqDeurPlaatsenA3),
      FaqItem(question: l10n.faqDeurPlaatsenQ4, answer: l10n.faqDeurPlaatsenA4),
      FaqItem(question: l10n.faqDeurPlaatsenQ5, answer: l10n.faqDeurPlaatsenA5),
      FaqItem(question: l10n.faqDeurPlaatsenQ6, answer: l10n.faqDeurPlaatsenA6),
      FaqItem(question: l10n.faqDeurPlaatsenQ7, answer: l10n.faqDeurPlaatsenA7),
      FaqItem(question: l10n.faqDeurPlaatsenQ8, answer: l10n.faqDeurPlaatsenA8),
      FaqItem(question: l10n.faqDeurPlaatsenQ9, answer: l10n.faqDeurPlaatsenA9),
      FaqItem(question: l10n.faqDeurPlaatsenQ10, answer: l10n.faqDeurPlaatsenA10),
    ];
  }

  // Preserve the original default: Carpenter FAQ.
  return [
    FaqItem(question: l10n.faqCarpenterQ1, answer: l10n.faqCarpenterA1),
    FaqItem(question: l10n.faqCarpenterQ2, answer: l10n.faqCarpenterA2),
    FaqItem(question: l10n.faqCarpenterQ3, answer: l10n.faqCarpenterA3),
    FaqItem(question: l10n.faqCarpenterQ4, answer: l10n.faqCarpenterA4),
    FaqItem(question: l10n.faqCarpenterQ5, answer: l10n.faqCarpenterA5),
    FaqItem(question: l10n.faqCarpenterQ6, answer: l10n.faqCarpenterA6),
    FaqItem(question: l10n.faqCarpenterQ7, answer: l10n.faqCarpenterA7),
    FaqItem(question: l10n.faqCarpenterQ8, answer: l10n.faqCarpenterA8),
    FaqItem(question: l10n.faqCarpenterQ9, answer: l10n.faqCarpenterA9),
    FaqItem(question: l10n.faqCarpenterQ10, answer: l10n.faqCarpenterA10),
    FaqItem(question: l10n.faqCarpenterQ11, answer: l10n.faqCarpenterA11),
    FaqItem(question: l10n.faqCarpenterQ12, answer: l10n.faqCarpenterA12),
    FaqItem(question: l10n.faqCarpenterQ13, answer: l10n.faqCarpenterA13),
    FaqItem(question: l10n.faqCarpenterQ14, answer: l10n.faqCarpenterA14),
    FaqItem(question: l10n.faqCarpenterQ15, answer: l10n.faqCarpenterA15),
    FaqItem(question: l10n.faqCarpenterQ16, answer: l10n.faqCarpenterA16),
    FaqItem(question: l10n.faqCarpenterQ17, answer: l10n.faqCarpenterA17),
    FaqItem(question: l10n.faqCarpenterQ18, answer: l10n.faqCarpenterA18),
    FaqItem(question: l10n.faqCarpenterQ19, answer: l10n.faqCarpenterA19),
    FaqItem(question: l10n.faqCarpenterQ20, answer: l10n.faqCarpenterA20),
  ];
}
