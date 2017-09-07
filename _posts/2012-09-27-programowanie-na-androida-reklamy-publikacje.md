---
layout: post
title: V Programowanie na Androida: Reklamy i Publikacje
date: 2012-09-27 15:09
author: admin
comments: true
categories: [Android, Aplikacje, Aplikacje Mobilne, Java, Programowanie, Programowanie, Publikowanie, Reklamy]
---
<a href="http://szymonmotyka.pl/wp-content/uploads/2012/09/kurs11.jpg"><img class="aligncenter size-medium wp-image-595" title="kurs1" src="http://szymonmotyka.pl/wp-content/uploads/2012/09/kurs11-300x168.jpg" alt="" width="300" height="168" /></a>Witam w Piątek części kursu z Cyklu <strong><a title="Programowanie na Androida" href="http://szymonmotyka.pl/category/programowanie/android-programowanie/" target="_blank">Programowanie na Androida</a>. </strong>W tej części  kursu poznacie jak założyć konto w serwisie reklamowym adMob + dodanie ich do aplikacji oraz jak założyć konto do publikowania aplikacji na androida, wraz z publikacją waszej pierwszej aplikacji.

<!--more-->

<strong>I Założenie konta admob i pobranie biblioteki Jar</strong> Konto zakładamy nowe, lub na podstawie naszego google accounts (lub konta firmowe bazujące na google). Robimy to na stronie: <a href="http://www.admob.com/my_sites/">http://www.admob.com/my_sites/</a> Następnie Signup (chyba, że mamy konto google, klikamy poniżej)

[caption id="attachment_567" align="aligncenter" width="300"]<a href="http://szymonmotyka.pl/wp-content/uploads/2012/09/admob1.jpg"><img class="size-medium wp-image-567" title="admob1" src="http://szymonmotyka.pl/wp-content/uploads/2012/09/admob1-300x219.jpg" alt="" width="300" height="219" /></a> Proces aktywacji Konta, jeśli mamy już konto google[/caption]

W Accoundtype wybieracie, czy jesteście osobą indywidualną, większą firmą itp, Business to nazwa firmy. Jako , że sam nie mam firmy wpisałem swoje ImieINazwisko. Jeśli o Payment Details chodzi, to albo powiązanie z bankiem, albo użycie paypal'a (sam osobiście wybrałem drugi sposób). Gdy już zalogujemy się, możemy dodać naszą aplikację wg poniższego obrazkowego tutorialu: <a href="http://szymonmotyka.pl/wp-content/uploads/2012/09/admob21.jpg"><img class="aligncenter size-medium wp-image-573" title="admob2" src="http://szymonmotyka.pl/wp-content/uploads/2012/09/admob21-300x145.jpg" alt="" width="300" height="145" /></a>

[caption id="attachment_569" align="aligncenter" width="300"]<a href="http://szymonmotyka.pl/wp-content/uploads/2012/09/admob3.jpg"><img class="size-medium wp-image-569" title="admob3" src="http://szymonmotyka.pl/wp-content/uploads/2012/09/admob3-300x287.jpg" alt="" width="300" height="287" /></a> Kreator dodawania aplikacji[/caption]

Market:// Nie musimy uzupełniac, lecz jeśli tego nie robimy, należy wyczyścić pole tekstowe. Oraz wpisać captcha (miłego odczytywania) <a href="http://szymonmotyka.pl/wp-content/uploads/2012/09/kanji.png"><img class="aligncenter size-medium wp-image-574" title="kanji" src="http://szymonmotyka.pl/wp-content/uploads/2012/09/kanji-300x115.png" alt="" width="300" height="115" /></a>

[caption id="attachment_570" align="aligncenter" width="300"]<a href="http://szymonmotyka.pl/wp-content/uploads/2012/09/admob4.jpg"><img class="size-medium wp-image-570" title="admob4" src="http://szymonmotyka.pl/wp-content/uploads/2012/09/admob4-300x60.jpg" alt="" width="300" height="60" /></a> Pobieramy biblioteke[/caption]

Następnie paczkę rozpakowujemy a plik jar wrzucamy do folderu z naszym projektem\libs i jak na obrazku niżej dodajemy do build patch

[caption id="attachment_572" align="aligncenter" width="300"]<a href="http://szymonmotyka.pl/wp-content/uploads/2012/09/admob6.jpg"><img class="size-medium wp-image-572" title="admob6" src="http://szymonmotyka.pl/wp-content/uploads/2012/09/admob6-300x253.jpg" alt="" width="300" height="253" /></a> Tak postępujemy z większością bibliotek w Jarze[/caption]

<strong>II Inicjacja kontrolki reklamy</strong>W moim przypadku po imporcie biblioteki admob reklamę dodaję w main_activity.java dodając poniższą metodę.

[java]

private void reklama() {
 adView = (AdView)findViewById(R.id.adView);
 //addTestDevice dodaje tryb testowy na naszym urządzeniu (niezbyt mile widziane jest klikanie w swoje reklamy, a to podczas testów robimy często w nadmiarze)
 adView.loadAd(new AdRequest().addTestDevice(&quot;60B8970CC9DB86C274D7C7F4B3FE68D9&quot;));
 }[/java]

Objaśnienie: addTestDevice pozwala ustawić nasze urządzenie jako developerskie (dzięki czemu reklamy możemy dowolnie wielokrotnie klikać bez obawy o spam, jednocześnie nie będąc naliczane).  No i metodę wywołujemy w onCreate Poza javą, także w XML dodamy kontrolkę adView (choć można ją dodać także z kodu)

[xml]
&lt;com.google.ads.AdView
 android:id=&quot;@+id/adView&quot;
 android:layout_width=&quot;wrap_content&quot;
 android:layout_height=&quot;wrap_content&quot;
 android:layout_alignParentBottom=&quot;true&quot;
 android:layout_alignParentLeft=&quot;true&quot;
 ads:adSize=&quot;BANNER&quot;
 ads:adUnitId=&quot;a15062f81fbed45&quot;
 ads:loadAdOnCreate=&quot;true&quot;
 ads:testDevices=&quot;TEST_EMULATOR, 60B8970CC9DB86C274D7C7F4B3FE68D9&quot; &gt;
 &lt;/com.google.ads.AdView&gt;
[/xml]

Zmieniłem layout głównej strony na RelativeLayout, ponieważ pozwala na dowolniejszą modyfikacje kontrolek względem siebie oraz wprowadziłem parę poprawek.  Dodatkowo, jeśli chcesz użyć zewnętrzną kontrolkę , to w najwyższym layoucie (u mnie &lt;relative&gt; ) należy użyć: xmlns:ads="http://schemas.android.com/apk/lib/com.google.ads" Ostatnią rzeczą jest dodanie do Android manifestu pozwoleń na internet oraz aktywności reklamy. Permission:

[xml]
&lt;uses-permission android:name=&quot;android.permission.INTERNET&quot;/&gt;
 &lt;uses-permission android:name=&quot;android.permission.ACCESS_NETWORK_STATE&quot;/&gt;
[/xml]

Powyższe Pozwolenia pozwalają aplikacji na sprawdzenie statusu sieci oraz łączenie się do niej. Pomiędzy &lt;application..&gt;&lt;/application&gt;

[xml]
&lt;activity android:name=&quot;com.google.ads.AdActivity&quot;
 android:configChanges=&quot;keyboard|keyboardHidden|orientation|screenLayout|uiMode|screenSize|smallestScreenSize&quot;/&gt;
[/xml]

<strong>III Założenie konta w Android Developer Console</strong> Pierwszym krokiem jest wejście na strone <a href="http://developer.android.com/index.html">http://developer.android.com/index.html</a> i kliknięcie na 3 kropki po prawej i Google play developer console (screen robiony w czasie pisania artykułu) lub bezpośrednio na https://play.google.com/apps/publish/. <a href="http://szymonmotyka.pl/wp-content/uploads/2012/09/developer1.jpg"><img class="aligncenter size-medium wp-image-577" title="developer1" src="http://szymonmotyka.pl/wp-content/uploads/2012/09/developer1-300x170.jpg" alt="" width="300" height="170" /></a> Podobnie jak przy reklamach w AdMobie tu też opieramy nasze konto na naszym koncie googlowskim, tyle, że dodatkowo wpisujemy nazwę programisty oraz adres strony WWW. (można później strone zmienić). Za pomocą nazwy programisty można nas także znaleźć w google play. <strong style="line-height: 24px; font-size: 16px;"><a style="color: #ff4b33;" href="http://szymonmotyka.pl/wp-content/uploads/2012/09/developer2.jpg"><img class="aligncenter size-medium wp-image-578" title="developer2" src="http://szymonmotyka.pl/wp-content/uploads/2012/09/developer2-300x100.jpg" alt="" width="300" height="100" /></a></strong> Następnym, juz nie do końca wesołym, ale za to jednorazowym krokiem jest wpłata na konto 25 dolarów. Jako że nie trzeba płacić regularnie, myślę że jest to do przyjęcia ta opłata. Ewentualnie, mogę na swoje konto wrzucić. <a href="http://szymonmotyka.pl/wp-content/uploads/2012/09/developer3.jpg"><img class="aligncenter size-medium wp-image-579" title="developer3" src="http://szymonmotyka.pl/wp-content/uploads/2012/09/developer3-300x80.jpg" alt="" width="300" height="80" /></a> Po zapłaceniu (za pomocą karty płatniczej)  i odczekaniu na potwierdzenie , nasze konto jest aktywne i gotowe do publikacji. <strong>IV  Podpisywanie aplikacji</strong>Aby aplikację opublikować, trzeba ją najpierw podpisać. Podpis można wygenerować w kreatorze podpisywania. Podpis także może być potem użyty  np do użycia oAuth z G+ (na daną chwilę) oraz do używania map google w naszej aplikacji.

[caption id="attachment_580" align="aligncenter" width="300"]<a href="http://szymonmotyka.pl/wp-content/uploads/2012/09/publikacja1.jpg"><img class="size-medium wp-image-580" title="publikacja1" src="http://szymonmotyka.pl/wp-content/uploads/2012/09/publikacja1-300x164.jpg" alt="" width="300" height="164" /></a> Narzędzie do podpisywania aplikacji[/caption]

[caption id="attachment_581" align="aligncenter" width="300"]<a href="http://szymonmotyka.pl/wp-content/uploads/2012/09/publikacja2.jpg"><img class="size-medium wp-image-581" title="publikacja2" src="http://szymonmotyka.pl/wp-content/uploads/2012/09/publikacja2-300x251.jpg" alt="" width="300" height="251" /></a> Wybieramy projekt (domyślnie wybiera obecnie uruchomiony(tzn mamy otwarte pliki z niego)[/caption]

[caption id="attachment_585" align="aligncenter" width="300"]<a href="http://szymonmotyka.pl/wp-content/uploads/2012/09/publikacja2b.jpg"><img class="size-medium wp-image-585" title="publikacja2b" src="http://szymonmotyka.pl/wp-content/uploads/2012/09/publikacja2b-300x249.jpg" alt="" width="300" height="249" /></a> Tutaj jeśli jeszcze nie mamy klucza, tworzymy nowy[/caption]

[caption id="attachment_582" align="aligncenter" width="300"]<a href="http://szymonmotyka.pl/wp-content/uploads/2012/09/publikacja3.jpg"><img class="size-medium wp-image-582" title="publikacja3" src="http://szymonmotyka.pl/wp-content/uploads/2012/09/publikacja3-300x249.jpg" alt="" width="300" height="249" /></a> Najważniejsze jest pierwsze 5 pól(alias, hasło z powtórzeniem oraz długość ważności klucza)[/caption]

P.S: KLUCZ PO OPUBLIKOWANIU ZOSTAWIĆ W BEZPIECZNYM MIEJSCU. Strata klucza = brak możliwości aktualizacji itp, ponieważ to on identyfikuje ważność aplikacji z danym kontem. <strong>V P</strong>ublikacja aplikacji Zacznijmy od zalogowania się do naszej konsoli developerskiej (ta sama strona co z rejestracją). Jeśli już wpłaciliśmy oraz konto jest aktywne, dostaniemy prosty panel developerski, na którym można przeglądnąć statystyki aplikacji, błędy które użytkownikom zwróciło (niestety z lekkim poślizgiem od chwili zdarzenia). Przejdźmy więc do dodania własnej aplikacji klikając <strong>"Prześlij aplikację"</strong>

[caption id="attachment_586" align="aligncenter" width="300"]<a href="http://szymonmotyka.pl/wp-content/uploads/2012/09/developerconsole1.jpg"><img class="size-medium wp-image-586" title="developerconsole1" src="http://szymonmotyka.pl/wp-content/uploads/2012/09/developerconsole1-300x162.jpg" alt="" width="300" height="162" /></a> Konsola developera[/caption]

[caption id="attachment_587" align="aligncenter" width="300"]<a href="http://szymonmotyka.pl/wp-content/uploads/2012/09/developerconsole2.jpg"><img class="size-medium wp-image-587" title="developerconsole2" src="http://szymonmotyka.pl/wp-content/uploads/2012/09/developerconsole2-300x178.jpg" alt="" width="300" height="178" /></a> Wysyłamy naszą aplikację na serwer[/caption]

[caption id="attachment_588" align="aligncenter" width="300"]<a href="http://szymonmotyka.pl/wp-content/uploads/2012/09/developerconsole3.jpg"><img class="size-medium wp-image-588" title="developerconsole3" src="http://szymonmotyka.pl/wp-content/uploads/2012/09/developerconsole3-300x263.jpg" alt="" width="300" height="263" /></a> Uzupełniamy podpisy, publikujemy screeny oraz ikonę aplikacji. Na końcu ustalamy czy aplikacja płatna czy darmowa[/caption]

[caption id="attachment_589" align="aligncenter" width="300"]<a href="http://szymonmotyka.pl/wp-content/uploads/2012/09/developerconsole4.jpg"><img class="size-medium wp-image-589" title="developerconsole4" src="http://szymonmotyka.pl/wp-content/uploads/2012/09/developerconsole4-300x109.jpg" alt="" width="300" height="109" /></a> Aktywujemy nasze apk  i publikujemy[/caption]

Pamiętacie jak przy zakładaniu projektu wpisywało się package? Jest to tez odnośnik do naszej aplikacji w markecie<a title=" https://play.google.com/store/apps/details?id=pl.szymonmotyka.tutorialrandomizer" href=" https://play.google.com/store/apps/details?id=pl.szymonmotyka.tutorialrandomizer"> https://play.google.com/store/apps/details?id=pl.szymonmotyka.tutorialrandomizer</a> <strong>details?id=</strong> wpisujemy nazwę naszego pakietu. To jest odnośnik do naszej aplikacji na google play. P.s w celu wykonania grafik promocyjnych na developer.android.com są dostępne różne narzędzia (typu generowanie grafiki telefonu /tabletu z screenem)

źródła: https://dl.dropbox.com/u/14815030/tutorialrandomizerpt4.zip
