---
author: admin
comments: true
date: 2012-09-27 14:09:03+00:00
layout: post
link: http://szymonmotyka.pl/programowanie-na-androida-reklamy-publikacje/
slug: programowanie-na-androida-reklamy-publikacje
title: 'V Programowanie na Androida: Reklamy i Publikacje'
wordpress_id: 566
categories:
- Android
- Java
- Programowanie
tags:
- Aplikacje
- Aplikacje Mobilne
- Programowanie
- Publikowanie
- Reklamy
---

[![](http://szymonmotyka.pl/wp-content/uploads/2012/09/kurs11-300x168.jpg)](http://szymonmotyka.pl/wp-content/uploads/2012/09/kurs11.jpg)Witam w Piątek części kursu z Cyklu **[Programowanie na Androida](http://szymonmotyka.pl/category/programowanie/android-programowanie/). **W tej części  kursu poznacie jak założyć konto w serwisie reklamowym adMob + dodanie ich do aplikacji oraz jak założyć konto do publikowania aplikacji na androida, wraz z publikacją waszej pierwszej aplikacji.

<!-- more -->

**I Założenie konta admob i pobranie biblioteki Jar** Konto zakładamy nowe, lub na podstawie naszego google accounts (lub konta firmowe bazujące na google). Robimy to na stronie: [http://www.admob.com/my_sites/](http://www.admob.com/my_sites/) Następnie Signup (chyba, że mamy konto google, klikamy poniżej)

[caption id="attachment_567" align="aligncenter" width="300"][![](http://szymonmotyka.pl/wp-content/uploads/2012/09/admob1-300x219.jpg)](http://szymonmotyka.pl/wp-content/uploads/2012/09/admob1.jpg) Proces aktywacji Konta, jeśli mamy już konto google[/caption]

W Accoundtype wybieracie, czy jesteście osobą indywidualną, większą firmą itp, Business to nazwa firmy. Jako , że sam nie mam firmy wpisałem swoje ImieINazwisko. Jeśli o Payment Details chodzi, to albo powiązanie z bankiem, albo użycie paypal'a (sam osobiście wybrałem drugi sposób). Gdy już zalogujemy się, możemy dodać naszą aplikację wg poniższego obrazkowego tutorialu: [![](http://szymonmotyka.pl/wp-content/uploads/2012/09/admob21-300x145.jpg)](http://szymonmotyka.pl/wp-content/uploads/2012/09/admob21.jpg)

[caption id="attachment_569" align="aligncenter" width="300"][![](http://szymonmotyka.pl/wp-content/uploads/2012/09/admob3-300x287.jpg)](http://szymonmotyka.pl/wp-content/uploads/2012/09/admob3.jpg) Kreator dodawania aplikacji[/caption]

Market:// Nie musimy uzupełniac, lecz jeśli tego nie robimy, należy wyczyścić pole tekstowe. Oraz wpisać captcha (miłego odczytywania) [![](http://szymonmotyka.pl/wp-content/uploads/2012/09/kanji-300x115.png)](http://szymonmotyka.pl/wp-content/uploads/2012/09/kanji.png)

[caption id="attachment_570" align="aligncenter" width="300"][![](http://szymonmotyka.pl/wp-content/uploads/2012/09/admob4-300x60.jpg)](http://szymonmotyka.pl/wp-content/uploads/2012/09/admob4.jpg) Pobieramy biblioteke[/caption]

Następnie paczkę rozpakowujemy a plik jar wrzucamy do folderu z naszym projektem\libs i jak na obrazku niżej dodajemy do build patch

[caption id="attachment_572" align="aligncenter" width="300"][![](http://szymonmotyka.pl/wp-content/uploads/2012/09/admob6-300x253.jpg)](http://szymonmotyka.pl/wp-content/uploads/2012/09/admob6.jpg) Tak postępujemy z większością bibliotek w Jarze[/caption]

**II Inicjacja kontrolki reklamy**W moim przypadku po imporcie biblioteki admob reklamę dodaję w main_activity.java dodając poniższą metodę.

[java]

private void reklama() {
 adView = (AdView)findViewById(R.id.adView);
 //addTestDevice dodaje tryb testowy na naszym urządzeniu (niezbyt mile widziane jest klikanie w swoje reklamy, a to podczas testów robimy często w nadmiarze)
 adView.loadAd(new AdRequest().addTestDevice("60B8970CC9DB86C274D7C7F4B3FE68D9"));
 }[/java]

Objaśnienie: addTestDevice pozwala ustawić nasze urządzenie jako developerskie (dzięki czemu reklamy możemy dowolnie wielokrotnie klikać bez obawy o spam, jednocześnie nie będąc naliczane).  No i metodę wywołujemy w onCreate Poza javą, także w XML dodamy kontrolkę adView (choć można ją dodać także z kodu)

[xml]
<com.google.ads.AdView
 android:id="@+id/adView"
 android:layout_width="wrap_content"
 android:layout_height="wrap_content"
 android:layout_alignParentBottom="true"
 android:layout_alignParentLeft="true"
 ads:adSize="BANNER"
 ads:adUnitId="a15062f81fbed45"
 ads:loadAdOnCreate="true"
 ads:testDevices="TEST_EMULATOR, 60B8970CC9DB86C274D7C7F4B3FE68D9" >
 </com.google.ads.AdView>
[/xml]

Zmieniłem layout głównej strony na RelativeLayout, ponieważ pozwala na dowolniejszą modyfikacje kontrolek względem siebie oraz wprowadziłem parę poprawek.  Dodatkowo, jeśli chcesz użyć zewnętrzną kontrolkę , to w najwyższym layoucie (u mnie <relative> ) należy użyć: xmlns:ads="http://schemas.android.com/apk/lib/com.google.ads" Ostatnią rzeczą jest dodanie do Android manifestu pozwoleń na internet oraz aktywności reklamy. Permission:

[xml]
<uses-permission android:name="android.permission.INTERNET"/>
 <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
[/xml]

Powyższe Pozwolenia pozwalają aplikacji na sprawdzenie statusu sieci oraz łączenie się do niej. Pomiędzy <application..></application>

[xml]
<activity android:name="com.google.ads.AdActivity"
 android:configChanges="keyboard|keyboardHidden|orientation|screenLayout|uiMode|screenSize|smallestScreenSize"/>
[/xml]

**III Założenie konta w Android Developer Console** Pierwszym krokiem jest wejście na strone [http://developer.android.com/index.html](http://developer.android.com/index.html) i kliknięcie na 3 kropki po prawej i Google play developer console (screen robiony w czasie pisania artykułu) lub bezpośrednio na https://play.google.com/apps/publish/. [![](http://szymonmotyka.pl/wp-content/uploads/2012/09/developer1-300x170.jpg)](http://szymonmotyka.pl/wp-content/uploads/2012/09/developer1.jpg) Podobnie jak przy reklamach w AdMobie tu też opieramy nasze konto na naszym koncie googlowskim, tyle, że dodatkowo wpisujemy nazwę programisty oraz adres strony WWW. (można później strone zmienić). Za pomocą nazwy programisty można nas także znaleźć w google play. **[![](http://szymonmotyka.pl/wp-content/uploads/2012/09/developer2-300x100.jpg)](http://szymonmotyka.pl/wp-content/uploads/2012/09/developer2.jpg)** Następnym, juz nie do końca wesołym, ale za to jednorazowym krokiem jest wpłata na konto 25 dolarów. Jako że nie trzeba płacić regularnie, myślę że jest to do przyjęcia ta opłata. Ewentualnie, mogę na swoje konto wrzucić. [![](http://szymonmotyka.pl/wp-content/uploads/2012/09/developer3-300x80.jpg)](http://szymonmotyka.pl/wp-content/uploads/2012/09/developer3.jpg) Po zapłaceniu (za pomocą karty płatniczej)  i odczekaniu na potwierdzenie , nasze konto jest aktywne i gotowe do publikacji. **IV  Podpisywanie aplikacji**Aby aplikację opublikować, trzeba ją najpierw podpisać. Podpis można wygenerować w kreatorze podpisywania. Podpis także może być potem użyty  np do użycia oAuth z G+ (na daną chwilę) oraz do używania map google w naszej aplikacji.

[caption id="attachment_580" align="aligncenter" width="300"][![](http://szymonmotyka.pl/wp-content/uploads/2012/09/publikacja1-300x164.jpg)](http://szymonmotyka.pl/wp-content/uploads/2012/09/publikacja1.jpg) Narzędzie do podpisywania aplikacji[/caption]

[caption id="attachment_581" align="aligncenter" width="300"][![](http://szymonmotyka.pl/wp-content/uploads/2012/09/publikacja2-300x251.jpg)](http://szymonmotyka.pl/wp-content/uploads/2012/09/publikacja2.jpg) Wybieramy projekt (domyślnie wybiera obecnie uruchomiony(tzn mamy otwarte pliki z niego)[/caption]

[caption id="attachment_585" align="aligncenter" width="300"][![](http://szymonmotyka.pl/wp-content/uploads/2012/09/publikacja2b-300x249.jpg)](http://szymonmotyka.pl/wp-content/uploads/2012/09/publikacja2b.jpg) Tutaj jeśli jeszcze nie mamy klucza, tworzymy nowy[/caption]

[caption id="attachment_582" align="aligncenter" width="300"][![](http://szymonmotyka.pl/wp-content/uploads/2012/09/publikacja3-300x249.jpg)](http://szymonmotyka.pl/wp-content/uploads/2012/09/publikacja3.jpg) Najważniejsze jest pierwsze 5 pól(alias, hasło z powtórzeniem oraz długość ważności klucza)[/caption]

P.S: KLUCZ PO OPUBLIKOWANIU ZOSTAWIĆ W BEZPIECZNYM MIEJSCU. Strata klucza = brak możliwości aktualizacji itp, ponieważ to on identyfikuje ważność aplikacji z danym kontem. **V P**ublikacja aplikacji Zacznijmy od zalogowania się do naszej konsoli developerskiej (ta sama strona co z rejestracją). Jeśli już wpłaciliśmy oraz konto jest aktywne, dostaniemy prosty panel developerski, na którym można przeglądnąć statystyki aplikacji, błędy które użytkownikom zwróciło (niestety z lekkim poślizgiem od chwili zdarzenia). Przejdźmy więc do dodania własnej aplikacji klikając **"Prześlij aplikację"**

[caption id="attachment_586" align="aligncenter" width="300"][![](http://szymonmotyka.pl/wp-content/uploads/2012/09/developerconsole1-300x162.jpg)](http://szymonmotyka.pl/wp-content/uploads/2012/09/developerconsole1.jpg) Konsola developera[/caption]

[caption id="attachment_587" align="aligncenter" width="300"][![](http://szymonmotyka.pl/wp-content/uploads/2012/09/developerconsole2-300x178.jpg)](http://szymonmotyka.pl/wp-content/uploads/2012/09/developerconsole2.jpg) Wysyłamy naszą aplikację na serwer[/caption]

[caption id="attachment_588" align="aligncenter" width="300"][![](http://szymonmotyka.pl/wp-content/uploads/2012/09/developerconsole3-300x263.jpg)](http://szymonmotyka.pl/wp-content/uploads/2012/09/developerconsole3.jpg) Uzupełniamy podpisy, publikujemy screeny oraz ikonę aplikacji. Na końcu ustalamy czy aplikacja płatna czy darmowa[/caption]

[caption id="attachment_589" align="aligncenter" width="300"][![](http://szymonmotyka.pl/wp-content/uploads/2012/09/developerconsole4-300x109.jpg)](http://szymonmotyka.pl/wp-content/uploads/2012/09/developerconsole4.jpg) Aktywujemy nasze apk  i publikujemy[/caption]

Pamiętacie jak przy zakładaniu projektu wpisywało się package? Jest to tez odnośnik do naszej aplikacji w markecie[ https://play.google.com/store/apps/details?id=pl.szymonmotyka.tutorialrandomizer]( https://play.google.com/store/apps/details?id=pl.szymonmotyka.tutorialrandomizer) **details?id=** wpisujemy nazwę naszego pakietu. To jest odnośnik do naszej aplikacji na google play. P.s w celu wykonania grafik promocyjnych na developer.android.com są dostępne różne narzędzia (typu generowanie grafiki telefonu /tabletu z screenem)

źródła: https://dl.dropbox.com/u/14815030/tutorialrandomizerpt4.zip
