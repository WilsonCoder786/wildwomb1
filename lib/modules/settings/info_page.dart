import 'package:easy_four_diy/core/utils.dart';
import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  final String title;
  final String body;
  final String? emailLabel;

  const InfoPage({
    super.key,
    required this.title,
    required this.body,
    this.emailLabel,
  });

  static const privacyTitle = 'Privacybeleid Easy4Diy';
  static const helpTitle = 'Hulp & Ondersteuning';
  static const aboutTitle = 'Over Easy4DIY';

  static const privacyBody = '''Laatst bijgewerkt: 20 oktober 2024

Welkom bij Easy4Diy. Easy4Diy is een applicatie (de "App") en handelsnaam van DigyFix.com. Wij respecteren je privacy en vinden het belangrijk dat je erop kunt vertrouwen dat wij zorgvuldig met je gegevens omgaan. In dit privacybeleid leggen we uit welke gegevens we verzamelen via de App, waarom we dat doen, en welke rechten je hebt.

DigyFix.com (hierna: "wij", "ons" of "onze") is de verwerkingsverantwoordelijke voor de verwerking van je persoonsgegevens zoals beschreven in dit beleid.

1. Welke gegevens verzamelen we?

Afhankelijk van hoe je de App gebruikt, kunnen we de volgende persoonsgegevens van je verzamelen:

· Accountgegevens: Als je een account aanmaakt, verzamelen we je naam, e-mailadres en een wachtwoord.
· Klus- en Projectgegevens: Informatie die je invoert om je klus te plannen, zoals gekozen vakgebieden, specifieke klussen, ingevoerde afmetingen (lengte, breedte, hoogte), geselecteerde materialen en gereedschappen.
· Locatiegegevens (indien van toepassing): Als je toestemming geeft, kunnen we je globale locatie gebruiken om bouwmarkten of "De Vakman" in jouw buurt te vinden. Dit kun je altijd uitschakelen in je telefooninstellingen.
· Betalingsgegevens: Voor het afsluiten van een abonnement verwerken we factuurgegevens. Betalingen worden verwerkt door een beveiligde, externe betaalprovider. Wij slaan zelf geen volledige creditcardgegevens op.
· Communicatiegegevens: Als je contact met ons opneemt (bijvoorbeeld via de klantenservice of de FAQ), bewaren we deze correspondentie.
· Technische Gegevens: Informatie over je apparaat (type telefoon, besturingssysteem), IP-adres, app-versie en crash-rapporten. Dit helpt ons de App te verbeteren en te beveiligen.

2. Waarom verwerken we deze gegevens? (Doeleinden)

Wij gebruiken je gegevens uitsluitend voor de volgende doeleinden:

· Om de App te laten werken: Je klusgegevens gebruiken we om materialen te berekenen, prijzen te tonen en stap-voor-stap handleidingen te genereren.
· Accountbeheer: Om je in te laten loggen en je voortgang op te slaan.
· Abonnementen en Betalingen: Om je abonnement te activeren en te factureren.
· Klantenservice: Om je vragen te beantwoorden via ons supportkanaal.
· Verbetering van de App: Door middel van geanonimiseerde statistieken en crash-logs.
· Communicatie (met jouw toestemming): Om je updates, nieuwsbrieven of promoties te sturen.

3. Op welke rechtsgrond baseren we dit?

Wij verwerken je gegevens op basis van de volgende rechtsgronden uit de Algemene Verordening Gegevensbescherming (AVG):

· Uitvoering van een overeenkomst: Omdat je gebruikmaakt van onze App en/of een abonnement hebt afgesloten.
· Toestemming: Voor specifieke zaken, zoals het versturen van marketing-e-mails of het gebruik van GPS-locatie.
· Gerechtvaardigd belang: Om de App te verbeteren, te beveiligen tegen fraude en onze dienstverlening te optimaliseren.

4. Delen we je gegevens met derden?

Wij verkopen je gegevens nooit aan derden. We delen je gegevens alleen als dat strikt noodzakelijk is:

· Met "De Vakman": Als je expliciet kiest voor de optie "Vraag eenvoudig een offerte aan" (Stap 7 in de app), delen we de door jou ingevulde klusomschrijving en afmetingen met de betreffende vakman of het aangesloten netwerk.
· Met Dienstverleners: Bedrijven die ons helpen met de App, zoals hostingproviders, betaalproviders en analytics-diensten. Zij mogen je gegevens alleen gebruiken om hun dienst aan ons te leveren.
· Wettelijke verplichtingen: Als de wet ons hiertoe verplicht (bijv. bij fraudeonderzoek).

5. Bewaartermijnen

Wij bewaren je persoonsgegevens niet langer dan strikt noodzakelijk is voor de doeleinden waarvoor ze zijn verzameld.

· Je accountgegevens bewaren we zolang je een actief account hebt.
· Factuurgegevens bewaren we 7 jaar vanwege de fiscale bewaarplicht.
· Als je je account verwijdert, verwijderen of anonimiseren we je gegevens binnen 30 dagen, tenzij er een wettelijke bewaarplicht geldt.

6. Beveiliging van je gegevens

DigyFix.com neemt de bescherming van je gegevens serieus en neemt passende maatregelen om misbruik, verlies, onbevoegde toegang, ongewenste openbaarmaking en ongeoorloofde wijziging tegen te gaan. De verbinding met de App is beveiligd via SSL/TLS.

7. Jouw rechten

Op grond van de AVG heb je een aantal rechten met betrekking tot je persoonsgegevens:

· Recht op inzage: Je kunt opvragen welke gegevens wij van je hebben.
· Recht op rectificatie: Je kunt onjuiste gegevens laten aanpassen.
· Recht op gegevenswissing (Vergetelheid): Je kunt vragen om je gegevens te verwijderen.
· Recht op beperking van de verwerking: Je kunt vragen om minder gegevens te laten verwerken.
· Recht op dataportabiliteit: Je kunt je gegevens opvragen in een gangbaar bestandsformaat.
· Recht van bezwaar: Je kunt bezwaar maken tegen het gebruik van je gegevens voor marketing.

Om gebruik te maken van je rechten, kun je contact met ons opnemen via de gegevens onderaan dit document. We reageren binnen 30 dagen op je verzoek. Je hebt ook altijd het recht om een klacht in te dienen bij de Autoriteit Persoonsgegevens in Nederland.

8. Kinderen

Onze App is niet gericht op kinderen onder de 16 jaar. Wij verzamelen niet bewust persoonsgegevens van kinderen onder de 16 jaar. Als je vermoedt dat een kind jonger dan 16 jaar gegevens heeft verstrekt, neem dan contact met ons op, zodat we deze kunnen verwijderen.

9. Wijzigingen in dit Privacybeleid

Wij kunnen dit privacybeleid van tijd tot tijd aanpassen (bijvoorbeeld bij nieuwe functies in de App). De meest recente versie is altijd te vinden in de App en op onze website (www.easy4diy.com). Bij ingrijpende wijzigingen zullen we je via de App of per e-mail op de hoogte stellen.

10. Contact

Heb je vragen over dit privacybeleid of over de manier waarop wij met je gegevens omgaan? Neem dan contact met ons op:

Verwerkingsverantwoordelijke:

· Bedrijf: DigyFix.com (Moederbedrijf van Easy4Diy)
· Adres: Stationsstraat 109, 3112 VT Schiedam, Nederland
· KvK-nummer: 42089918
· Website Moederbedrijf: www.digyfix.com

Contactgegevens voor de Applicatie (Easy4Diy):

· Website App: www.easy4diy.com
· E-mail (Gebruikers & Support): Info@Easy4Diy.com
· E-mail (Algemeen/Administratie): Easy4Diy@hotmail.com en DigyFix@hotmail.com''';

  static const helpBody = '''Hoe kunnen we je helpen?
Welkom bij de helpdesk van Easy4Diy. We willen dat je klus zo soepel mogelijk verloopt. Bekijk hieronder de meestgestelde vragen of neem direct contact met ons op.

Veelgestelde Vragen (FAQ)

1. Hoe werkt de Easy4Diy app precies?
De app begeleidt je in 7 eenvoudige stappen. Jij kiest je vakgebied, de klus en de afmetingen (Stap 1 t/m 3). Vervolgens rekent de app automatisch de materialen, prijzen en gereedschappen voor je uit (Stap 4 t/m 7). Zo weet je precies wat je nodig hebt voordat je naar de bouwmarkt gaat.

2. Werkt de app ook zonder internet?
Ja, de basisinformatie en je opgeslagen klussen zijn offline beschikbaar. Let op: voor het live ophalen van de meest actuele prijzen en het bekijken van video's heb je wel een internetverbinding nodig.

3. Zijn de prijzen in de app actueel?
De app rekent met de meest recente gemiddelde prijzen van bouwmarkten. Houd er rekening mee dat prijzen kunnen afwijken door acties, locatie of leveringskosten. De app geeft je een zeer goede indicatie van de kosten.

4. Hoe werkt het jaarabonnement en de korting?
Je kunt gebruikmaken van een jaarabonnement met 45% korting (dat staat gelijk aan 5 maanden cadeau). Je kunt je abonnement beheren en opzeggen via de instellingen van je Google Play- of Apple-account.

5. Kan ik een offerte aanvragen bij een echte vakman?
Ja, dat is Stap 7 in de app. Als je een klus hebt ingevoerd, kun je kiezen voor "De Vakman". De app stuurt jouw klusomschrijving en afmetingen dan door naar het netwerk van aangesloten professionals. Zij nemen vervolgens contact met je op voor een offerte.

6. Ik ben mijn wachtwoord vergeten, wat nu?
Ga naar het inlogscherm en klik op "Wachtwoord vergeten?". Je ontvangt dan een e-mail met instructies om een nieuw wachtwoord in te stellen.

7. Hoe kan ik mijn account verwijderen?
Je hebt het recht om je account en gegevens te verwijderen. Ga naar Instellingen > Overig > Account verwijderen (of neem contact op met onze support). Wij verwijderen je gegevens binnen 30 dagen, tenzij er een wettelijke bewaarplicht geldt.

Staat je vraag er niet tussen?

Ons supportteam staat klaar om je te helpen! We streven ernaar om je vraag binnen 2 werkdagen te beantwoorden.

· E-mail ons: Info@Easy4Diy.com
· Bekijk de video-uitleg: Hoe werkt Easy4Diy?

Heb je een suggestie voor de app of loop je tegen een technische fout aan? Laat het ons weten via de mail! We bouwen de app samen met jou.''';

  static const aboutBody = '''Stap voor stap.
Dat is ons motto! Easy4DIY is dé app die klussen zonder stress mogelijk maakt. Of je nu een beginner bent of een ervaren klusser, wij begeleiden je stap voor stap van het eerste idee tot het eindresultaat.

Met onze slimme app bereken je eenvoudig de benodigde materialen, gereedschappen en kosten voor jouw project. Jij zet de eerste stappen en kiest de afmetingen, de app doet de rest. Zo weet je precies waar je aan begint en hoef je niet onnodig vaak naar de bouwmarkt. Bespaar tijd, geld en frustratie, en start vandaag nog met jouw klus!

App Versie:
Version 10.0

Ontwikkelaar:
Deze applicatie is een product van DigyFix.com.
Stationsstraat 109, 3112 VT Schiedam
KvK-nummer: 42089918

Contact & Support:
Voor vragen, suggesties of technische ondersteuning kun je contact met ons opnemen via:
E-mail: Info@Easy4Diy.com
Website: www.easy4diy.com

©️ 2024 DigyFix.com. Alle rechten voorbehouden.''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Utils.kDarkBlue,
        foregroundColor: Colors.white,
        title: Text(
          title,
          style: Utils.getTextStyle(
            baseSize: 16,
            isBold: true,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            body,
            style: Utils.getTextStyle(
              baseSize: 14,
              isBold: false,
              color: Colors.black87,
            ),
          ),
          if (emailLabel != null) ...[
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: Utils.sendMail,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Utils.kOrange,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  emailLabel!,
                  style: Utils.getTextStyle(
                    baseSize: 14,
                    isBold: true,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
