---
layout: post
title: IV Programowanie na Androida: Zabawa Layoutami
date: 2012-09-24 23:31
author: admin
comments: true
categories: [Android, Aplikacje Mobilne, Java, Java, Kurs Tworzenia aplikacji, Programowanie, Programowanie, Programwoanie mobilne]
---
<a href="http://szymonmotyka.pl/wp-content/uploads/2012/09/kurs4.jpg"><img class="aligncenter size-medium wp-image-561" title="kurs4" src="http://szymonmotyka.pl/wp-content/uploads/2012/09/kurs4-300x168.jpg" alt="" width="300" height="168" /></a> Witam w kolejnej części cyklu programowania na Androida. Jeżeli wytrzymaliście poprzednie 3 części i dalej jesteście chętni na kursy, powiedźcie o tym znajomym . Skomentujecie itp. Byłbym bardzo ale to bardzo zadowolony. Dzisiaj zapoznamy się z "kolorowaniem" layoutów, używaniu selectorów oraz tworzeniu gradientów. Dodatkowo wszystko wprowadzimy do utworzonej wcześniej aplikacji.<!--more-->

<strong>Figury: </strong>

Zaczniemy od  stworzenia folderu drawable(bez żadnych dopisków, chyba, że dla każdej rozdzielczości ekranu chcecie dać inne kolory gradientów. Następnie tworzymy nowy plik xml w tym folderze (new &gt; other &gt; android xml file &gt; shape

<strong>gradient:</strong>

[xml]&lt;/pre&gt;
&lt;?xml version=&quot;1.0&quot; encoding=&quot;utf-8&quot;?&gt;
&lt;shape xmlns:android=&quot;http://schemas.android.com/apk/res/android&quot;
 android:shape=&quot;rectangle&quot;&gt;
 &lt;gradient
 android:startColor=&quot;#f1f1f2&quot;
 android:centerColor=&quot;#e7e7e8&quot;
 android:endColor=&quot;#cfcfcf&quot;
 android:angle=&quot;270&quot; /&gt;

&lt;/shape&gt; [/xml]

solid:

[xml]&lt;?xml version=&quot;1.0&quot; encoding=&quot;utf-8&quot;?&gt;
 &lt;shape xmlns:android=&quot;http://schemas.android.com/apk/res/android&quot;
 android:shape=&quot;oval&quot;&gt;
 &lt;solid android:color=&quot;@color/blue&quot;/&gt;
 &lt;/shape&gt;[/xml]

android:shape jest figurą na jakiej nałożony jest gradient lub jednostajny kolor (solid). W tym przypadku oparty na kwadracie.  Start/Center/EndColor odpowiadają za poszczególne kolory (w hexie) a agle to obrót.

Teraz wchodzimy do layotu z naszymi koścmi. Na zmianę  parametrów layoutu są 2 sposoby. Albo przez edytor graficzny, albo xml. W tym pierwszym klikamy ppm na komponent

<a href="http://szymonmotyka.pl/wp-content/uploads/2012/09/editbg.png"><img title="editbg" src="http://szymonmotyka.pl/wp-content/uploads/2012/09/editbg-300x295.png" alt="" width="300" height="295" /></a>

a następnie wybieramy naszą "grafikę".

Takim o to sposobem zmodernizowałem lotto za pomocą solid oval , oraz kości (łącznie z tłem)

<strong>Selectory: </strong>

Za ich pomocą możemy tworzyć np przyciski, akcję po najechaniu, kliknieciu dla grafiki danego komponentu.  Utwórzmy więc przycisk złożony z 3 gradientów dla przycisku w naszych kościach.

[xml]

&lt;?xml version=&quot;1.0&quot; encoding=&quot;utf-8&quot;?&gt;
&lt;selector xmlns:android=&quot;http://schemas.android.com/apk/res/android&quot; &gt;
 &lt;item android:state_pressed=&quot;false&quot; android:state_selected=&quot;false&quot; android:drawable=&quot;@drawable/gradientokragly&quot;/&gt;
 &lt;item android:state_pressed=&quot;false&quot; android:state_selected=&quot;true&quot; android:drawable=&quot;@drawable/gradientkwadratowy&quot;/&gt;
 &lt;item android:state_pressed=&quot;true&quot; android:drawable=&quot;@drawable/gradientkwadratowy&quot;/&gt;
&lt;/selector&gt;

[/xml]

W tym przypadku jest to najlepsze ustawienie dla przycisków. Pierwszy &lt;item&gt; oznacza stan, gdy przycisk jest w stanie wolnym, drugi po najechaniu a trzeci przycisniety. Nic nie stoi na przeszkodzie by popróbować inne stany.

Podobnie jak gradienty, selectory też są traktowane jako grafiki i wybieramy je dokładnie takim samym sposobem.

<strong>kosci.xml</strong>

Dzięki powyższym modyfikacją oraz dodaniu <strong>scrollview</strong> (Za jego pomocą, nasz layout możemy przewijać. Jednak Scrollview może zawierać tylko jeden layout), zmieniamy ten layout. Do przycisków przypisujemy selectory. Do selectora  przypisujemy okrągłe gradienty oraz gradient tła. Nie jest to może piękne kolorystycznie. Ale teraz wiele już od was zależy i dodatkowo dobrze obrazuje nowe elementy layoutów

[xml]

&lt;?xml version=&quot;1.0&quot; encoding=&quot;utf-8&quot;?&gt;
&lt;TableLayout xmlns:android=&quot;http://schemas.android.com/apk/res/android&quot;
 android:layout_width=&quot;match_parent&quot;
 android:layout_height=&quot;match_parent&quot;
 android:background=&quot;@drawable/bgcolor&quot; &gt;

&lt;TextView
 android:id=&quot;@+id/TextView08&quot;
 android:layout_width=&quot;match_parent&quot;
 android:layout_height=&quot;wrap_content&quot;
 android:background=&quot;#0C5687&quot;
 android:text=&quot;@string/kosci&quot;
 android:textAppearance=&quot;?android:attr/textAppearanceLarge&quot;
 android:textColor=&quot;#FFD11C&quot;
 android:textStyle=&quot;bold&quot; /&gt;

&lt;ScrollView
 android:id=&quot;@+id/scrollView1&quot;
 android:layout_width=&quot;wrap_content&quot;
 android:layout_height=&quot;wrap_content&quot; &gt;

 &lt;TableLayout
 android:layout_width=&quot;match_parent&quot;
 android:layout_height=&quot;wrap_content&quot;
 android:padding=&quot;30dp&quot; &gt;

&lt;TableRow
 android:id=&quot;@+id/TableRow05&quot;
 android:layout_width=&quot;wrap_content&quot;
 android:layout_height=&quot;wrap_content&quot;
 android:gravity=&quot;center&quot; &gt;

&lt;Button
 android:id=&quot;@+id/btnk100&quot;
 android:layout_width=&quot;0dp&quot;
 android:layout_height=&quot;wrap_content&quot;
 android:layout_weight=&quot;1&quot;
 android:background=&quot;@drawable/przycisk&quot;
 android:padding=&quot;20dp&quot;
 android:text=&quot;@string/number&quot;
 android:textColor=&quot;@color/yellow&quot; /&gt;

&lt;Button
 android:id=&quot;@+id/btnk50&quot;
 android:layout_width=&quot;0dp&quot;
 android:layout_height=&quot;wrap_content&quot;
 android:layout_gravity=&quot;center&quot;
 android:layout_weight=&quot;1&quot;
 android:background=&quot;@drawable/przycisk&quot;
 android:padding=&quot;20dp&quot;
 android:text=&quot;@string/number&quot;
 android:textColor=&quot;@color/yellow&quot; /&gt;
 &lt;/TableRow&gt;

&lt;TableRow
 android:id=&quot;@+id/TableRow06&quot;
 android:layout_width=&quot;wrap_content&quot;
 android:layout_height=&quot;wrap_content&quot;
 android:gravity=&quot;center&quot; &gt;

&lt;TextView
 android:id=&quot;@+id/TextView06&quot;
 android:layout_width=&quot;wrap_content&quot;
 android:layout_height=&quot;wrap_content&quot;
 android:padding=&quot;10dp&quot;
 android:text=&quot;K100&quot;
 android:textAppearance=&quot;?android:attr/textAppearanceMedium&quot;
 android:textColor=&quot;@color/yellow&quot; /&gt;

&lt;TextView
 android:id=&quot;@+id/TextView07&quot;
 android:layout_width=&quot;wrap_content&quot;
 android:layout_height=&quot;wrap_content&quot;
 android:padding=&quot;10dp&quot;
 android:text=&quot;K50&quot;
 android:textAppearance=&quot;?android:attr/textAppearanceMedium&quot;
 android:textColor=&quot;@color/yellow&quot; /&gt;
 &lt;/TableRow&gt;

&lt;TableRow
 android:id=&quot;@+id/TableRow03&quot;
 android:layout_width=&quot;wrap_content&quot;
 android:layout_height=&quot;wrap_content&quot;
 android:gravity=&quot;center&quot; &gt;

&lt;Button
 android:id=&quot;@+id/btnk20&quot;
 android:layout_width=&quot;0dp&quot;
 android:layout_height=&quot;wrap_content&quot;
 android:layout_weight=&quot;1&quot;
 android:background=&quot;@drawable/przycisk&quot;
 android:padding=&quot;20dp&quot;
 android:text=&quot;@string/number&quot;
 android:textColor=&quot;@color/yellow&quot; /&gt;

&lt;Button
 android:id=&quot;@+id/btnk12&quot;
 android:layout_width=&quot;0dp&quot;
 android:layout_height=&quot;wrap_content&quot;
 android:layout_weight=&quot;1&quot;
 android:background=&quot;@drawable/przycisk&quot;
 android:padding=&quot;20dp&quot;
 android:text=&quot;@string/number&quot;
 android:textColor=&quot;@color/yellow&quot; /&gt;
 &lt;/TableRow&gt;

&lt;TableRow
 android:id=&quot;@+id/TableRow04&quot;
 android:layout_width=&quot;wrap_content&quot;
 android:layout_height=&quot;wrap_content&quot;
 android:gravity=&quot;center&quot; &gt;

&lt;TextView
 android:id=&quot;@+id/TextView04&quot;
 android:layout_width=&quot;wrap_content&quot;
 android:layout_height=&quot;wrap_content&quot;
 android:padding=&quot;10dp&quot;
 android:text=&quot;K20&quot;
 android:textAppearance=&quot;?android:attr/textAppearanceMedium&quot;
 android:textColor=&quot;@color/yellow&quot; /&gt;

&lt;TextView
 android:id=&quot;@+id/TextView05&quot;
 android:layout_width=&quot;wrap_content&quot;
 android:layout_height=&quot;wrap_content&quot;
 android:padding=&quot;10dp&quot;
 android:text=&quot;K12&quot;
 android:textAppearance=&quot;?android:attr/textAppearanceMedium&quot;
 android:textColor=&quot;@color/yellow&quot; /&gt;
 &lt;/TableRow&gt;

&lt;TableRow
 android:id=&quot;@+id/TableRow02&quot;
 android:layout_width=&quot;wrap_content&quot;
 android:layout_height=&quot;wrap_content&quot;
 android:gravity=&quot;center&quot; &gt;

&lt;Button
 android:id=&quot;@+id/btnk10&quot;
 android:layout_width=&quot;0dp&quot;
 android:layout_height=&quot;wrap_content&quot;
 android:layout_weight=&quot;1&quot;
 android:background=&quot;@drawable/przycisk&quot;
 android:padding=&quot;20dp&quot;
 android:text=&quot;@string/number&quot;
 android:textColor=&quot;@color/yellow&quot; /&gt;

&lt;Button
 android:id=&quot;@+id/btnk8&quot;
 android:layout_width=&quot;0dp&quot;
 android:layout_height=&quot;wrap_content&quot;
 android:layout_weight=&quot;1&quot;
 android:background=&quot;@drawable/przycisk&quot;
 android:padding=&quot;20dp&quot;
 android:text=&quot;@string/number&quot;
 android:textColor=&quot;@color/yellow&quot; /&gt;
 &lt;/TableRow&gt;

&lt;TableRow
 android:id=&quot;@+id/TableRow01&quot;
 android:layout_width=&quot;wrap_content&quot;
 android:layout_height=&quot;wrap_content&quot;
 android:gravity=&quot;center&quot; &gt;

&lt;TextView
 android:id=&quot;@+id/TextView02&quot;
 android:layout_width=&quot;wrap_content&quot;
 android:layout_height=&quot;wrap_content&quot;
 android:padding=&quot;10dp&quot;
 android:text=&quot;K10&quot;
 android:textAppearance=&quot;?android:attr/textAppearanceMedium&quot;
 android:textColor=&quot;@color/yellow&quot; /&gt;

&lt;TextView
 android:id=&quot;@+id/TextView01&quot;
 android:layout_width=&quot;wrap_content&quot;
 android:layout_height=&quot;wrap_content&quot;
 android:padding=&quot;10dp&quot;
 android:text=&quot;K8&quot;
 android:textAppearance=&quot;?android:attr/textAppearanceMedium&quot;
 android:textColor=&quot;@color/yellow&quot; /&gt;
 &lt;/TableRow&gt;

&lt;TableRow
 android:id=&quot;@+id/tableRow1&quot;
 android:layout_width=&quot;wrap_content&quot;
 android:layout_height=&quot;wrap_content&quot;
 android:gravity=&quot;center&quot; &gt;

&lt;Button
 android:id=&quot;@+id/btnk6&quot;
 android:layout_width=&quot;0dp&quot;
 android:layout_height=&quot;wrap_content&quot;
 android:layout_weight=&quot;1&quot;
 android:background=&quot;@drawable/przycisk&quot;
 android:padding=&quot;20dp&quot;
 android:text=&quot;@string/number&quot;
 android:textColor=&quot;@color/yellow&quot; /&gt;

&lt;Button
 android:id=&quot;@+id/btnk4&quot;
 android:layout_width=&quot;0dp&quot;
 android:layout_height=&quot;wrap_content&quot;
 android:layout_weight=&quot;1&quot;
 android:background=&quot;@drawable/przycisk&quot;
 android:padding=&quot;20dp&quot;
 android:text=&quot;@string/number&quot;
 android:textColor=&quot;@color/yellow&quot; /&gt;
 &lt;/TableRow&gt;

&lt;TableRow
 android:id=&quot;@+id/tableRow2&quot;
 android:layout_width=&quot;wrap_content&quot;
 android:layout_height=&quot;wrap_content&quot;
 android:gravity=&quot;center&quot; &gt;

&lt;TextView
 android:id=&quot;@+id/textView1&quot;
 android:layout_width=&quot;wrap_content&quot;
 android:layout_height=&quot;wrap_content&quot;
 android:padding=&quot;10dp&quot;
 android:text=&quot;K6&quot;
 android:textAppearance=&quot;?android:attr/textAppearanceMedium&quot;
 android:textColor=&quot;@color/yellow&quot; /&gt;

&lt;TextView
 android:id=&quot;@+id/TextView03&quot;
 android:layout_width=&quot;wrap_content&quot;
 android:layout_height=&quot;wrap_content&quot;
 android:padding=&quot;10dp&quot;
 android:text=&quot;K4&quot;
 android:textAppearance=&quot;?android:attr/textAppearanceMedium&quot;
 android:textColor=&quot;@color/yellow&quot; /&gt;
 &lt;/TableRow&gt;
 &lt;/TableLayout&gt;

&lt;/ScrollView&gt;

&lt;/TableLayout&gt;

[/xml]

<strong>lotto.xml</strong>
W tym przypadku dodałem tło oraz pozmieniałem marginesy. Dodatkowo dodałem okrągłe solid shape o kolorze niebieskim (znajdziecie w kodzie źródłowym w res/values/colors.xml) z żółtymi literami by przypominały te lottowskie.

[xml]&lt;/pre&gt;
&lt;?xml version=&quot;1.0&quot; encoding=&quot;utf-8&quot;?&gt;
&lt;LinearLayout xmlns:android=&quot;http://schemas.android.com/apk/res/android&quot;
 android:layout_width=&quot;match_parent&quot;
 android:layout_height=&quot;match_parent&quot;
 android:background=&quot;@drawable/lottobgcolor&quot;
 android:orientation=&quot;vertical&quot; &gt;

 &lt;TextView
 android:id=&quot;@+id/textView1&quot;
 android:layout_width=&quot;match_parent&quot;
 android:layout_height=&quot;wrap_content&quot;
 android:layout_gravity=&quot;center&quot;
 android:background=&quot;#0C5687&quot;
 android:text=&quot;@string/lotto&quot;
 android:textAppearance=&quot;?android:attr/textAppearanceLarge&quot;
 android:textColor=&quot;#FFD11C&quot;
 android:textStyle=&quot;bold&quot; /&gt;

 &lt;LinearLayout
 android:layout_width=&quot;match_parent&quot;
 android:layout_height=&quot;wrap_content&quot;
 android:layout_marginTop=&quot;20dp&quot; &gt;

&lt;TextView
 android:id=&quot;@+id/nr1&quot;
 android:layout_width=&quot;0dp&quot;
 android:layout_height=&quot;wrap_content&quot;
 android:layout_weight=&quot;1&quot;
 android:background=&quot;@drawable/lottoshape&quot;
 android:gravity=&quot;center&quot;
 android:padding=&quot;10dp&quot;
 android:text=&quot;@string/number&quot;
 android:textAppearance=&quot;?android:attr/textAppearanceMedium&quot;
 android:textColor=&quot;@color/yellow&quot;
 android:textSize=&quot;20dp&quot;
 android:textStyle=&quot;bold&quot; /&gt;

&lt;TextView
 android:id=&quot;@+id/nr2&quot;
 android:layout_width=&quot;0dp&quot;
 android:layout_height=&quot;wrap_content&quot;
 android:layout_weight=&quot;1&quot;
 android:background=&quot;@drawable/lottoshape&quot;
 android:gravity=&quot;center&quot;
 android:padding=&quot;10dp&quot;
 android:text=&quot;@string/number&quot;
 android:textAppearance=&quot;?android:attr/textAppearanceMedium&quot;
 android:textColor=&quot;@color/yellow&quot;
 android:textSize=&quot;20dp&quot;
 android:textStyle=&quot;bold&quot; /&gt;

&lt;TextView
 android:id=&quot;@+id/nr3&quot;
 android:layout_width=&quot;0dp&quot;
 android:layout_height=&quot;wrap_content&quot;
 android:layout_weight=&quot;1&quot;
 android:background=&quot;@drawable/lottoshape&quot;
 android:gravity=&quot;center&quot;
 android:padding=&quot;10dp&quot;
 android:text=&quot;@string/number&quot;
 android:textAppearance=&quot;?android:attr/textAppearanceMedium&quot;
 android:textColor=&quot;@color/yellow&quot;
 android:textSize=&quot;20dp&quot;
 android:textStyle=&quot;bold&quot; /&gt;

&lt;TextView
 android:id=&quot;@+id/nr4&quot;
 android:layout_width=&quot;0dp&quot;
 android:layout_height=&quot;wrap_content&quot;
 android:layout_weight=&quot;1&quot;
 android:background=&quot;@drawable/lottoshape&quot;
 android:gravity=&quot;center&quot;
 android:padding=&quot;10dp&quot;
 android:text=&quot;@string/number&quot;
 android:textAppearance=&quot;?android:attr/textAppearanceMedium&quot;
 android:textColor=&quot;@color/yellow&quot;
 android:textSize=&quot;20dp&quot;
 android:textStyle=&quot;bold&quot; /&gt;

&lt;TextView
 android:id=&quot;@+id/nr5&quot;
 android:layout_width=&quot;0dp&quot;
 android:layout_height=&quot;wrap_content&quot;
 android:layout_weight=&quot;1&quot;
 android:background=&quot;@drawable/lottoshape&quot;
 android:gravity=&quot;center&quot;
 android:padding=&quot;10dp&quot;
 android:text=&quot;@string/number&quot;
 android:textAppearance=&quot;?android:attr/textAppearanceMedium&quot;
 android:textColor=&quot;@color/yellow&quot;
 android:textSize=&quot;20dp&quot;
 android:textStyle=&quot;bold&quot; /&gt;

&lt;TextView
 android:id=&quot;@+id/nr6&quot;
 android:layout_width=&quot;0dp&quot;
 android:layout_height=&quot;match_parent&quot;
 android:layout_weight=&quot;1&quot;
 android:background=&quot;@drawable/lottoshape&quot;
 android:gravity=&quot;center&quot;
 android:text=&quot;@string/number&quot;
 android:textAppearance=&quot;?android:attr/textAppearanceMedium&quot;
 android:textColor=&quot;@color/yellow&quot;
 android:textSize=&quot;20dp&quot;
 android:textStyle=&quot;bold&quot; /&gt;
 &lt;/LinearLayout&gt;

 &lt;Button
 android:id=&quot;@+id/btnrandom&quot;
 android:layout_width=&quot;wrap_content&quot;
 android:layout_height=&quot;wrap_content&quot;
 android:layout_gravity=&quot;center&quot;
 android:text=&quot;@string/losuj&quot; /&gt;

&lt;/LinearLayout&gt; [/xml]

Ostatnią z zmian jest główny layout (activity_main.xml), gdzie edycji uległ tylko nagłówek.

[xml]

&lt;LinearLayout xmlns:android=&quot;http://schemas.android.com/apk/res/android&quot;
 xmlns:tools=&quot;http://schemas.android.com/tools&quot;
 android:id=&quot;@+id/LinearLayout1&quot;
 android:layout_width=&quot;match_parent&quot;
 android:layout_height=&quot;match_parent&quot;
 android:orientation=&quot;vertical&quot; &gt;

&lt;TextView
 android:id=&quot;@+id/labelTitle&quot;
 android:layout_width=&quot;match_parent&quot;
 android:layout_height=&quot;wrap_content&quot;
 android:layout_gravity=&quot;center&quot;
 android:gravity=&quot;center&quot;
 android:text=&quot;@string/app_name&quot;
 android:textAppearance=&quot;?android:attr/textAppearanceMedium&quot;
 android:textColor=&quot;@color/blue&quot;
 android:textSize=&quot;40dp&quot;
 android:textStyle=&quot;bold&quot; /&gt;

&lt;android.support.v4.view.ViewPager
 xmlns:android=&quot;http://schemas.android.com/apk/res/android&quot;
 android:id=&quot;@+id/awesomepager&quot;
 android:layout_width=&quot;fill_parent&quot;
 android:layout_height=&quot;wrap_content&quot; &gt;
 &lt;/android.support.v4.view.ViewPager&gt;

&lt;/LinearLayout&gt;[/xml]

No to na dzisiaj tyle.

Nowością od tej części jest dodanie aplikacji do GOogle play by każdy mógł sprawdzić postępy aplikacji (Choć plik apk znajdziecie także w paczkach z źródłem do danej części kursu)

<a href="http://szymonmotyka.pl/wp-content/uploads/2012/09/device-2012-09-24-235440.png"><img class="aligncenter size-medium wp-image-560" title="device-2012-09-24-235440" src="http://szymonmotyka.pl/wp-content/uploads/2012/09/device-2012-09-24-235440-180x300.png" alt="" width="180" height="300" /></a><a href="http://szymonmotyka.pl/wp-content/uploads/2012/09/device-2012-09-24-235423.png"><img class="aligncenter size-medium wp-image-559" title="device-2012-09-24-235423" src="http://szymonmotyka.pl/wp-content/uploads/2012/09/device-2012-09-24-235423-180x300.png" alt="" width="180" height="300" /></a>

<a href="https://play.google.com/store/apps/details?id=pl.szymonmotyka.tutorialrandomizer">https://play.google.com/store/apps/details?id=pl.szymonmotyka.tutorialrandomizer</a>

źródło aktualnej wersji z drobnymi poprawkami: https://dl.dropbox.com/u/14815030/tutorialrandomizerpt3.zip
