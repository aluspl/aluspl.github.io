---
layout: post
title: III Programowanie na Androida: Zapisywanie danych i nowe fragmenty
date: 2012-09-20 12:57
author: admin
comments: true
categories: [Android, Aplikacje Mobilne, Java, Java, Kości, Kurs, Layout, Losowanie, Lotto, Programowanie, Programowanie, SharedPrefences, Tutorial, Zapisywanie danych]
---
<a href="http://szymonmotyka.pl/wp-content/uploads/2012/09/kurs3.jpg"><img class="aligncenter size-medium wp-image-541" title="kurs3" src="http://szymonmotyka.pl/wp-content/uploads/2012/09/kurs3-300x168.jpg" alt="" width="300" height="168" /></a>W 3 części kursu z cyklu o programowaniu na Androida (<a href="http://szymonmotyka.pl/category/programowanie/">http://szymonmotyka.pl/category/programowanie/</a>)  przejdziemy do lekkiej zabawy layoutami oraz dodawaniem nowych funkcji.  Jeśli jednak będziecie mieli pomysł  czego chcielibyście się nauczyć i jak mogłoby się tu przydać. Piszcie i komentujcie.  Tak przy okazji na FB do <a title="I Programowanie na Androida: Instalowanie Środowiska Eclipse + Android SDK" href="http://szymonmotyka.pl/programowanie-na-androida-instalowanie-rodowiska-eclipse-android-sdk/" target="_blank">1 części kursu</a> pojawiło się zapytanie czemu pokazuję tutorial instalacji eclipse na Windowsie a nie Linuksie. Jest to wynik osobistej preferencji oraz z winy NVIDII, która nie wypuściła sterowników do Optimusa.

W poprzedniej części kursu poznaliście jak tworzyć nowe projekty oraz jak utworzyć "rdzeń" pod aplikację opartą na fragmentach. Tym razem do aplikacji dodamy nowe fragmenty typu rzut różnymi kośćmi oraz nauczymy się jak zapisywać liczby do lotka by można je było odtworzyć przy kolejnym uruchomieniu aplikacji.

<!--more-->

Nasz projekt zacznijmy od utworzenia klasy typu fragment oraz layoutu do niego. Na potrzeby kursu, layout będzie typu table. Najpierw stwórzmy layout

[sourcecode language="xml"]
&lt;?xml version=&quot;1.0&quot; encoding=&quot;utf-8&quot;?&gt;
&lt;TableLayout xmlns:android=&quot;http://schemas.android.com/apk/res/android&quot;
 android:layout_width=&quot;match_parent&quot;
 android:layout_height=&quot;match_parent&quot; &gt;

 &lt;TextView
 android:id=&quot;@+id/TextView08&quot;
 android:layout_width=&quot;match_parent&quot;
 android:layout_height=&quot;wrap_content&quot;
 android:background=&quot;#0C5687&quot;
 android:text=&quot;@string/kosci&quot;
 android:textAppearance=&quot;?android:attr/textAppearanceLarge&quot;
 android:textColor=&quot;#FFD11C&quot;
 android:textStyle=&quot;bold&quot; /&gt;

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
 android:padding=&quot;20dp&quot;
 android:text=&quot;@string/number&quot; /&gt;

&lt;Button
 android:id=&quot;@+id/btnk50&quot;
 android:layout_width=&quot;0dp&quot;
 android:layout_height=&quot;wrap_content&quot;
 android:layout_weight=&quot;1&quot;
 android:padding=&quot;20dp&quot;
 android:text=&quot;@string/number&quot; /&gt;
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
 android:textAppearance=&quot;?android:attr/textAppearanceMedium&quot; /&gt;

&lt;TextView
 android:id=&quot;@+id/TextView07&quot;
 android:layout_width=&quot;wrap_content&quot;
 android:layout_height=&quot;wrap_content&quot;
 android:padding=&quot;10dp&quot;
 android:text=&quot;K50&quot;
 android:textAppearance=&quot;?android:attr/textAppearanceMedium&quot; /&gt;
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
 android:padding=&quot;20dp&quot;
 android:text=&quot;@string/number&quot; /&gt;

&lt;Button
 android:id=&quot;@+id/btnk12&quot;
 android:layout_width=&quot;0dp&quot;
 android:layout_height=&quot;wrap_content&quot;
 android:layout_weight=&quot;1&quot;
 android:padding=&quot;20dp&quot;
 android:text=&quot;@string/number&quot; /&gt;
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
 android:textAppearance=&quot;?android:attr/textAppearanceMedium&quot; /&gt;

&lt;TextView
 android:id=&quot;@+id/TextView05&quot;
 android:layout_width=&quot;wrap_content&quot;
 android:layout_height=&quot;wrap_content&quot;
 android:padding=&quot;10dp&quot;
 android:text=&quot;K12&quot;
 android:textAppearance=&quot;?android:attr/textAppearanceMedium&quot; /&gt;
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
 android:padding=&quot;20dp&quot;
 android:text=&quot;@string/number&quot; /&gt;

&lt;Button
 android:id=&quot;@+id/btnk8&quot;
 android:layout_width=&quot;0dp&quot;
 android:layout_height=&quot;wrap_content&quot;
 android:layout_weight=&quot;1&quot;
 android:padding=&quot;20dp&quot;
 android:text=&quot;@string/number&quot; /&gt;
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
 android:textAppearance=&quot;?android:attr/textAppearanceMedium&quot; /&gt;

&lt;TextView
 android:id=&quot;@+id/TextView01&quot;
 android:layout_width=&quot;wrap_content&quot;
 android:layout_height=&quot;wrap_content&quot;
 android:padding=&quot;10dp&quot;
 android:text=&quot;K8&quot;
 android:textAppearance=&quot;?android:attr/textAppearanceMedium&quot; /&gt;
 &lt;/TableRow&gt;

&lt;TableRow
 android:id=&quot;@+id/tableRow1&quot;
 android:layout_width=&quot;wrap_content&quot;
 android:layout_height=&quot;wrap_content&quot;
 android:layout_gravity=&quot;center&quot;
 android:gravity=&quot;center&quot; &gt;

&lt;Button
 android:id=&quot;@+id/btnk6&quot;
 android:layout_width=&quot;0dp&quot;
 android:layout_height=&quot;wrap_content&quot;
 android:layout_weight=&quot;1&quot;
 android:padding=&quot;20dp&quot;
 android:text=&quot;@string/number&quot; /&gt;

&lt;Button
 android:id=&quot;@+id/btnk4&quot;
 android:layout_width=&quot;0dp&quot;
 android:layout_height=&quot;wrap_content&quot;
 android:layout_weight=&quot;1&quot;
 android:padding=&quot;20dp&quot;
 android:text=&quot;@string/number&quot; /&gt;
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
 android:textAppearance=&quot;?android:attr/textAppearanceMedium&quot; /&gt;

&lt;TextView
 android:id=&quot;@+id/TextView03&quot;
 android:layout_width=&quot;wrap_content&quot;
 android:layout_height=&quot;wrap_content&quot;
 android:padding=&quot;10dp&quot;
 android:text=&quot;K4&quot;
 android:textAppearance=&quot;?android:attr/textAppearanceMedium&quot; /&gt;
 &lt;/TableRow&gt;

&lt;/TableLayout&gt;

[/sourcecode]

Każdy wiersz tabeli  składa się z elementu &lt;TableRow&gt; . Co drugi wiersz zawiera podpisy do przycisków, reszta same przyciski (jednocześnie nasze kostki). Do głębszej modyfikacji layouta przejdziemy po implementacji naszego fragmentu.

Tym razem onClickListener został zaimplementowany do naszej klasy a nie jako obiekt.

Dzięki temu do naszej klasy została dodana metoda

[sourcecode language="java"]
@Override

public void onClick(View v) {

//k4 jest typem Button, który dziedziczy po View, tak więc mozna się bez problemu odwołać. Można też dodać ten listener do TextView oraz innych komponentów dziedziczonych po View

if (v==k4)
 {
 k4.setText(r.nextInt(3)+1+&quot;&quot;);
 }

}

[/sourcecode]

Jest to całkiem dobry wg mnie sposób, jeśli mamy więcej komponenntów np typu Button (można zaimplementować jeszcze inne listenery, np do obsługi dotyku).

[sourcecode language="java"]
package pl.szymonmotyka.tutorialrandomizer;

import java.util.Random;

import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.Button;

public class Kosci extends Fragment implements OnClickListener{
 private View mainView;
 private Button k4,k6,k8,k10,k12,k20,k50,k100;

 public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
 mainView = inflater.inflate(R.layout.kosci, container, false);
 initialize();
 listeners();
 return mainView;
}

private void initialize() {
 k4=(Button)mainView.findViewById(R.id.btnk4);
 k6=(Button)mainView.findViewById(R.id.btnk6);
 k8=(Button)mainView.findViewById(R.id.btnk8);
 k10=(Button)mainView.findViewById(R.id.btnk10);
 k12=(Button)mainView.findViewById(R.id.btnk12);
 k20=(Button)mainView.findViewById(R.id.btnk20);
 k50=(Button)mainView.findViewById(R.id.btnk50);
 k100=(Button)mainView.findViewById(R.id.btnk100);

 }

private void listeners() {
 k4.setOnClickListener(this);
 k6.setOnClickListener(this);
 k8.setOnClickListener(this);
 k10.setOnClickListener(this);
 k12.setOnClickListener(this);
 k20.setOnClickListener(this);
 k50.setOnClickListener(this);
 k100.setOnClickListener(this);
 }
 /*
 * Tym razem zamiast tworzyć osobne listenery dla każdego buttona, użyjemy jednego onClick z implementacji onClick
 */
 @Override
 public void onClick(View v) {
 Random r=new Random();
 if (v==k4)
 {
 k4.setText(r.nextInt(3)+1+&quot;&quot;);
 }
 else if(v==k6)
 {
 k6.setText(r.nextInt(5)+1+&quot;&quot;);
 }
 else if(v==k8)
 {
 k8.setText(r.nextInt(7)+1+&quot;&quot;);
 }
 else if(v==k10)
 {
 k10.setText(r.nextInt(9)+1+&quot;&quot;);
 }
 else if(v==k12)
 {
 k12.setText(r.nextInt(11)+1+&quot;&quot;);
 }
 else if(v==k20)
 {
 k20.setText(r.nextInt(19)+1+&quot;&quot;);
 }
 else if(v==k50)
 {
 k50.setText(r.nextInt(49)+1+&quot;&quot;);
 }
 else if(v==k100)
 {
 k100.setText(r.nextInt(99)+1+&quot;&quot;);
 }
 }
}

[/sourcecode]

Teraz wróćmy do naszej klasy lotto. Pokażę, jak zrobić, by wcześniej wygenerowane liczby zostały zapisane (i dostępne przy ponownym odtworzeniu) Odbywa się to za pomocą SharedPreferences. Jednak aby odwołać się do SharedPrefences, potrzebujemy w klasie Lotto dodać Context oraz go zainicjować.  Dodatkowo  do sharedprefences potrzebna jest nazwa naszych ustawień (czyli String USTAWIENIA).

[sourcecode language="java"]
Context context;
 private SharedPreferences preferences;
 public static final String USTAWIENIA = &quot;ustawienia&quot;;
 public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
 mainView = inflater.inflate(R.layout.lotto, container, false);
 context=getActivity().getApplicationContext();
 preferences = context.getSharedPreferences(USTAWIENIA, Activity.MODE_PRIVATE);

... }

[/sourcecode]

Najpierw zajmiemy się przywróceniem danych. Użyję do tego metody restore() która umieszczamy pomiędzy inicjatorem a listenerami.

[sourcecode language="java"]
/*
 * Za pomocą get... pobieramy dowolną zmienną z ustawień. Dla przykładu tutaj pobierane są Stringi(żeby nie bawić się konwersją getText&gt;String i setText&gt;String
 * Pierwszym parametrem jest nazwa ustawienia, a drugim wartość domyślna, gdy takiego ustawienia nie znajdzie.
 */
 private void restore() {
 txtNr1.setText(preferences.getString(&quot;nr1&quot;, &quot;0&quot;));
 txtNr2.setText(preferences.getString(&quot;nr2&quot;, &quot;0&quot;));
 txtNr3.setText(preferences.getString(&quot;nr3&quot;, &quot;0&quot;));
 txtNr4.setText(preferences.getString(&quot;nr4&quot;, &quot;0&quot;));
 txtNr5.setText(preferences.getString(&quot;nr5&quot;, &quot;0&quot;));
 txtNr6.setText(preferences.getString(&quot;nr6&quot;, &quot;0&quot;));

}[/sourcecode]

Następnym krokiem jest utworzenie naszej metody zapisującej, którą wywołamy w tym przypadku po wygenerowaniu liczb. Odbywa się to przez

SharedPreferences.Editor editor= preferences.edit();

a kończy poprzez editor.commit();

[sourcecode language="java"]
/*
 * Metoda zapisująca nasze dane do ustwaień
 */
 private void save(){
 SharedPreferences.Editor editor= preferences.edit();
 /*
 * za pomocą putString przekazujemy zmienną do ustawień, pierwszym parametrem jest klucz, do którego się potem odwołujemy.
 */
 editor.putString(&quot;nr1&quot;, txtNr1.getText().toString());
 editor.putString(&quot;nr2&quot;, txtNr2.getText().toString());
 editor.putString(&quot;nr3&quot;, txtNr3.getText().toString());
 editor.putString(&quot;nr4&quot;, txtNr4.getText().toString());
 editor.putString(&quot;nr5&quot;, txtNr5.getText().toString());
 editor.putString(&quot;nr6&quot;, txtNr6.getText().toString());
 editor.commit();
 }
[/sourcecode]

Na końcu dodajemy naszą metodę save()  na koniec onClick przy btnRandom();

I to tyle na dzisiaj Wasz uniżony programista ma do przekazania. W następnych częściach kursu postanowię pokazać głębszą zabawę layoutami, wykorzystanie zewnętrzne API czy użycie bazy SQLite. Jestem otwarty na propozycję. Jak widać poniżej. Tak aplikacja wygląda poniżej, więc następnym krokiem wypadałoby ją upiększyć

[caption id="attachment_554" align="aligncenter" width="180"]<a href="http://szymonmotyka.pl/wp-content/uploads/2012/09/device-2012-09-20-141729.png"><img class="size-medium wp-image-554" title="device-2012-09-20-141729" src="http://szymonmotyka.pl/wp-content/uploads/2012/09/device-2012-09-20-141729-180x300.png" alt="" width="180" height="300" /></a> Tak aplikacja wygląda pod koniec tej części kursu[/caption]

a i na koniec: https://dl.dropbox.com/u/14815030/tutorialrandomizerpt2.zip
