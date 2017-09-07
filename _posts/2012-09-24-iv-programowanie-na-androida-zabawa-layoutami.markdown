---
author: admin
comments: true
date: 2012-09-24 22:31:25+00:00
layout: post
link: http://szymonmotyka.pl/iv-programowanie-na-androida-zabawa-layoutami/
slug: iv-programowanie-na-androida-zabawa-layoutami
title: 'IV Programowanie na Androida: Zabawa Layoutami'
wordpress_id: 557
categories:
- Android
- Java
- Programowanie
tags:
- Aplikacje Mobilne
- Java
- Kurs Tworzenia aplikacji
- Programowanie
- Programwoanie mobilne
---

[![](http://szymonmotyka.pl/wp-content/uploads/2012/09/kurs4-300x168.jpg)](http://szymonmotyka.pl/wp-content/uploads/2012/09/kurs4.jpg) Witam w kolejnej części cyklu programowania na Androida. Jeżeli wytrzymaliście poprzednie 3 części i dalej jesteście chętni na kursy, powiedźcie o tym znajomym . Skomentujecie itp. Byłbym bardzo ale to bardzo zadowolony. Dzisiaj zapoznamy się z "kolorowaniem" layoutów, używaniu selectorów oraz tworzeniu gradientów. Dodatkowo wszystko wprowadzimy do utworzonej wcześniej aplikacji.<!-- more -->

**Figury: **

Zaczniemy od  stworzenia folderu drawable(bez żadnych dopisków, chyba, że dla każdej rozdzielczości ekranu chcecie dać inne kolory gradientów. Następnie tworzymy nowy plik xml w tym folderze (new > other > android xml file > shape

**gradient:**

[xml]</pre>
<?xml version="1.0" encoding="utf-8"?>
<shape xmlns:android="http://schemas.android.com/apk/res/android"
 android:shape="rectangle">
 <gradient
 android:startColor="#f1f1f2"
 android:centerColor="#e7e7e8"
 android:endColor="#cfcfcf"
 android:angle="270" />

</shape> [/xml]

solid:

[xml]<?xml version="1.0" encoding="utf-8"?>
 <shape xmlns:android="http://schemas.android.com/apk/res/android"
 android:shape="oval">
 <solid android:color="@color/blue"/>
 </shape>[/xml]

android:shape jest figurą na jakiej nałożony jest gradient lub jednostajny kolor (solid). W tym przypadku oparty na kwadracie.  Start/Center/EndColor odpowiadają za poszczególne kolory (w hexie) a agle to obrót.

Teraz wchodzimy do layotu z naszymi koścmi. Na zmianę  parametrów layoutu są 2 sposoby. Albo przez edytor graficzny, albo xml. W tym pierwszym klikamy ppm na komponent

[![](http://szymonmotyka.pl/wp-content/uploads/2012/09/editbg-300x295.png)](http://szymonmotyka.pl/wp-content/uploads/2012/09/editbg.png)

a następnie wybieramy naszą "grafikę".

Takim o to sposobem zmodernizowałem lotto za pomocą solid oval , oraz kości (łącznie z tłem)

**Selectory: **

Za ich pomocą możemy tworzyć np przyciski, akcję po najechaniu, kliknieciu dla grafiki danego komponentu.  Utwórzmy więc przycisk złożony z 3 gradientów dla przycisku w naszych kościach.

[xml]

<?xml version="1.0" encoding="utf-8"?>
<selector xmlns:android="http://schemas.android.com/apk/res/android" >
 <item android:state_pressed="false" android:state_selected="false" android:drawable="@drawable/gradientokragly"/>
 <item android:state_pressed="false" android:state_selected="true" android:drawable="@drawable/gradientkwadratowy"/>
 <item android:state_pressed="true" android:drawable="@drawable/gradientkwadratowy"/>
</selector>

[/xml]

W tym przypadku jest to najlepsze ustawienie dla przycisków. Pierwszy <item> oznacza stan, gdy przycisk jest w stanie wolnym, drugi po najechaniu a trzeci przycisniety. Nic nie stoi na przeszkodzie by popróbować inne stany.

Podobnie jak gradienty, selectory też są traktowane jako grafiki i wybieramy je dokładnie takim samym sposobem.

**kosci.xml**

Dzięki powyższym modyfikacją oraz dodaniu **scrollview** (Za jego pomocą, nasz layout możemy przewijać. Jednak Scrollview może zawierać tylko jeden layout), zmieniamy ten layout. Do przycisków przypisujemy selectory. Do selectora  przypisujemy okrągłe gradienty oraz gradient tła. Nie jest to może piękne kolorystycznie. Ale teraz wiele już od was zależy i dodatkowo dobrze obrazuje nowe elementy layoutów

[xml]

<?xml version="1.0" encoding="utf-8"?>
<TableLayout xmlns:android="http://schemas.android.com/apk/res/android"
 android:layout_width="match_parent"
 android:layout_height="match_parent"
 android:background="@drawable/bgcolor" >

<TextView
 android:id="@+id/TextView08"
 android:layout_width="match_parent"
 android:layout_height="wrap_content"
 android:background="#0C5687"
 android:text="@string/kosci"
 android:textAppearance="?android:attr/textAppearanceLarge"
 android:textColor="#FFD11C"
 android:textStyle="bold" />

<ScrollView
 android:id="@+id/scrollView1"
 android:layout_width="wrap_content"
 android:layout_height="wrap_content" >

 <TableLayout
 android:layout_width="match_parent"
 android:layout_height="wrap_content"
 android:padding="30dp" >

<TableRow
 android:id="@+id/TableRow05"
 android:layout_width="wrap_content"
 android:layout_height="wrap_content"
 android:gravity="center" >

<Button
 android:id="@+id/btnk100"
 android:layout_width="0dp"
 android:layout_height="wrap_content"
 android:layout_weight="1"
 android:background="@drawable/przycisk"
 android:padding="20dp"
 android:text="@string/number"
 android:textColor="@color/yellow" />

<Button
 android:id="@+id/btnk50"
 android:layout_width="0dp"
 android:layout_height="wrap_content"
 android:layout_gravity="center"
 android:layout_weight="1"
 android:background="@drawable/przycisk"
 android:padding="20dp"
 android:text="@string/number"
 android:textColor="@color/yellow" />
 </TableRow>

<TableRow
 android:id="@+id/TableRow06"
 android:layout_width="wrap_content"
 android:layout_height="wrap_content"
 android:gravity="center" >

<TextView
 android:id="@+id/TextView06"
 android:layout_width="wrap_content"
 android:layout_height="wrap_content"
 android:padding="10dp"
 android:text="K100"
 android:textAppearance="?android:attr/textAppearanceMedium"
 android:textColor="@color/yellow" />

<TextView
 android:id="@+id/TextView07"
 android:layout_width="wrap_content"
 android:layout_height="wrap_content"
 android:padding="10dp"
 android:text="K50"
 android:textAppearance="?android:attr/textAppearanceMedium"
 android:textColor="@color/yellow" />
 </TableRow>

<TableRow
 android:id="@+id/TableRow03"
 android:layout_width="wrap_content"
 android:layout_height="wrap_content"
 android:gravity="center" >

<Button
 android:id="@+id/btnk20"
 android:layout_width="0dp"
 android:layout_height="wrap_content"
 android:layout_weight="1"
 android:background="@drawable/przycisk"
 android:padding="20dp"
 android:text="@string/number"
 android:textColor="@color/yellow" />

<Button
 android:id="@+id/btnk12"
 android:layout_width="0dp"
 android:layout_height="wrap_content"
 android:layout_weight="1"
 android:background="@drawable/przycisk"
 android:padding="20dp"
 android:text="@string/number"
 android:textColor="@color/yellow" />
 </TableRow>

<TableRow
 android:id="@+id/TableRow04"
 android:layout_width="wrap_content"
 android:layout_height="wrap_content"
 android:gravity="center" >

<TextView
 android:id="@+id/TextView04"
 android:layout_width="wrap_content"
 android:layout_height="wrap_content"
 android:padding="10dp"
 android:text="K20"
 android:textAppearance="?android:attr/textAppearanceMedium"
 android:textColor="@color/yellow" />

<TextView
 android:id="@+id/TextView05"
 android:layout_width="wrap_content"
 android:layout_height="wrap_content"
 android:padding="10dp"
 android:text="K12"
 android:textAppearance="?android:attr/textAppearanceMedium"
 android:textColor="@color/yellow" />
 </TableRow>

<TableRow
 android:id="@+id/TableRow02"
 android:layout_width="wrap_content"
 android:layout_height="wrap_content"
 android:gravity="center" >

<Button
 android:id="@+id/btnk10"
 android:layout_width="0dp"
 android:layout_height="wrap_content"
 android:layout_weight="1"
 android:background="@drawable/przycisk"
 android:padding="20dp"
 android:text="@string/number"
 android:textColor="@color/yellow" />

<Button
 android:id="@+id/btnk8"
 android:layout_width="0dp"
 android:layout_height="wrap_content"
 android:layout_weight="1"
 android:background="@drawable/przycisk"
 android:padding="20dp"
 android:text="@string/number"
 android:textColor="@color/yellow" />
 </TableRow>

<TableRow
 android:id="@+id/TableRow01"
 android:layout_width="wrap_content"
 android:layout_height="wrap_content"
 android:gravity="center" >

<TextView
 android:id="@+id/TextView02"
 android:layout_width="wrap_content"
 android:layout_height="wrap_content"
 android:padding="10dp"
 android:text="K10"
 android:textAppearance="?android:attr/textAppearanceMedium"
 android:textColor="@color/yellow" />

<TextView
 android:id="@+id/TextView01"
 android:layout_width="wrap_content"
 android:layout_height="wrap_content"
 android:padding="10dp"
 android:text="K8"
 android:textAppearance="?android:attr/textAppearanceMedium"
 android:textColor="@color/yellow" />
 </TableRow>

<TableRow
 android:id="@+id/tableRow1"
 android:layout_width="wrap_content"
 android:layout_height="wrap_content"
 android:gravity="center" >

<Button
 android:id="@+id/btnk6"
 android:layout_width="0dp"
 android:layout_height="wrap_content"
 android:layout_weight="1"
 android:background="@drawable/przycisk"
 android:padding="20dp"
 android:text="@string/number"
 android:textColor="@color/yellow" />

<Button
 android:id="@+id/btnk4"
 android:layout_width="0dp"
 android:layout_height="wrap_content"
 android:layout_weight="1"
 android:background="@drawable/przycisk"
 android:padding="20dp"
 android:text="@string/number"
 android:textColor="@color/yellow" />
 </TableRow>

<TableRow
 android:id="@+id/tableRow2"
 android:layout_width="wrap_content"
 android:layout_height="wrap_content"
 android:gravity="center" >

<TextView
 android:id="@+id/textView1"
 android:layout_width="wrap_content"
 android:layout_height="wrap_content"
 android:padding="10dp"
 android:text="K6"
 android:textAppearance="?android:attr/textAppearanceMedium"
 android:textColor="@color/yellow" />

<TextView
 android:id="@+id/TextView03"
 android:layout_width="wrap_content"
 android:layout_height="wrap_content"
 android:padding="10dp"
 android:text="K4"
 android:textAppearance="?android:attr/textAppearanceMedium"
 android:textColor="@color/yellow" />
 </TableRow>
 </TableLayout>

</ScrollView>

</TableLayout>

[/xml]

**lotto.xml**
W tym przypadku dodałem tło oraz pozmieniałem marginesy. Dodatkowo dodałem okrągłe solid shape o kolorze niebieskim (znajdziecie w kodzie źródłowym w res/values/colors.xml) z żółtymi literami by przypominały te lottowskie.

[xml]</pre>
<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
 android:layout_width="match_parent"
 android:layout_height="match_parent"
 android:background="@drawable/lottobgcolor"
 android:orientation="vertical" >

 <TextView
 android:id="@+id/textView1"
 android:layout_width="match_parent"
 android:layout_height="wrap_content"
 android:layout_gravity="center"
 android:background="#0C5687"
 android:text="@string/lotto"
 android:textAppearance="?android:attr/textAppearanceLarge"
 android:textColor="#FFD11C"
 android:textStyle="bold" />

 <LinearLayout
 android:layout_width="match_parent"
 android:layout_height="wrap_content"
 android:layout_marginTop="20dp" >

<TextView
 android:id="@+id/nr1"
 android:layout_width="0dp"
 android:layout_height="wrap_content"
 android:layout_weight="1"
 android:background="@drawable/lottoshape"
 android:gravity="center"
 android:padding="10dp"
 android:text="@string/number"
 android:textAppearance="?android:attr/textAppearanceMedium"
 android:textColor="@color/yellow"
 android:textSize="20dp"
 android:textStyle="bold" />

<TextView
 android:id="@+id/nr2"
 android:layout_width="0dp"
 android:layout_height="wrap_content"
 android:layout_weight="1"
 android:background="@drawable/lottoshape"
 android:gravity="center"
 android:padding="10dp"
 android:text="@string/number"
 android:textAppearance="?android:attr/textAppearanceMedium"
 android:textColor="@color/yellow"
 android:textSize="20dp"
 android:textStyle="bold" />

<TextView
 android:id="@+id/nr3"
 android:layout_width="0dp"
 android:layout_height="wrap_content"
 android:layout_weight="1"
 android:background="@drawable/lottoshape"
 android:gravity="center"
 android:padding="10dp"
 android:text="@string/number"
 android:textAppearance="?android:attr/textAppearanceMedium"
 android:textColor="@color/yellow"
 android:textSize="20dp"
 android:textStyle="bold" />

<TextView
 android:id="@+id/nr4"
 android:layout_width="0dp"
 android:layout_height="wrap_content"
 android:layout_weight="1"
 android:background="@drawable/lottoshape"
 android:gravity="center"
 android:padding="10dp"
 android:text="@string/number"
 android:textAppearance="?android:attr/textAppearanceMedium"
 android:textColor="@color/yellow"
 android:textSize="20dp"
 android:textStyle="bold" />

<TextView
 android:id="@+id/nr5"
 android:layout_width="0dp"
 android:layout_height="wrap_content"
 android:layout_weight="1"
 android:background="@drawable/lottoshape"
 android:gravity="center"
 android:padding="10dp"
 android:text="@string/number"
 android:textAppearance="?android:attr/textAppearanceMedium"
 android:textColor="@color/yellow"
 android:textSize="20dp"
 android:textStyle="bold" />

<TextView
 android:id="@+id/nr6"
 android:layout_width="0dp"
 android:layout_height="match_parent"
 android:layout_weight="1"
 android:background="@drawable/lottoshape"
 android:gravity="center"
 android:text="@string/number"
 android:textAppearance="?android:attr/textAppearanceMedium"
 android:textColor="@color/yellow"
 android:textSize="20dp"
 android:textStyle="bold" />
 </LinearLayout>

 <Button
 android:id="@+id/btnrandom"
 android:layout_width="wrap_content"
 android:layout_height="wrap_content"
 android:layout_gravity="center"
 android:text="@string/losuj" />

</LinearLayout> [/xml]

Ostatnią z zmian jest główny layout (activity_main.xml), gdzie edycji uległ tylko nagłówek.

[xml]

<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
 xmlns:tools="http://schemas.android.com/tools"
 android:id="@+id/LinearLayout1"
 android:layout_width="match_parent"
 android:layout_height="match_parent"
 android:orientation="vertical" >

<TextView
 android:id="@+id/labelTitle"
 android:layout_width="match_parent"
 android:layout_height="wrap_content"
 android:layout_gravity="center"
 android:gravity="center"
 android:text="@string/app_name"
 android:textAppearance="?android:attr/textAppearanceMedium"
 android:textColor="@color/blue"
 android:textSize="40dp"
 android:textStyle="bold" />

<android.support.v4.view.ViewPager
 xmlns:android="http://schemas.android.com/apk/res/android"
 android:id="@+id/awesomepager"
 android:layout_width="fill_parent"
 android:layout_height="wrap_content" >
 </android.support.v4.view.ViewPager>

</LinearLayout>[/xml]

No to na dzisiaj tyle.

Nowością od tej części jest dodanie aplikacji do GOogle play by każdy mógł sprawdzić postępy aplikacji (Choć plik apk znajdziecie także w paczkach z źródłem do danej części kursu)

[![](http://szymonmotyka.pl/wp-content/uploads/2012/09/device-2012-09-24-235440-180x300.png)](http://szymonmotyka.pl/wp-content/uploads/2012/09/device-2012-09-24-235440.png)[![](http://szymonmotyka.pl/wp-content/uploads/2012/09/device-2012-09-24-235423-180x300.png)](http://szymonmotyka.pl/wp-content/uploads/2012/09/device-2012-09-24-235423.png)

[https://play.google.com/store/apps/details?id=pl.szymonmotyka.tutorialrandomizer](https://play.google.com/store/apps/details?id=pl.szymonmotyka.tutorialrandomizer)

źródło aktualnej wersji z drobnymi poprawkami: https://dl.dropbox.com/u/14815030/tutorialrandomizerpt3.zip
