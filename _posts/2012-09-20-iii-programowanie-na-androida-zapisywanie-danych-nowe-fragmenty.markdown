---
author: admin
comments: true
date: 2012-09-20 11:57:33+00:00
layout: post
link: http://szymonmotyka.pl/iii-programowanie-na-androida-zapisywanie-danych-nowe-fragmenty/
slug: iii-programowanie-na-androida-zapisywanie-danych-nowe-fragmenty
title: 'III Programowanie na Androida: Zapisywanie danych i nowe fragmenty'
wordpress_id: 533
categories:
- Android
- Java
- Programowanie
tags:
- Aplikacje Mobilne
- Java
- Kości
- Kurs
- Layout
- Losowanie
- Lotto
- Programowanie
- SharedPrefences
- Tutorial
- Zapisywanie danych
---

[![](http://szymonmotyka.pl/wp-content/uploads/2012/09/kurs3-300x168.jpg)](http://szymonmotyka.pl/wp-content/uploads/2012/09/kurs3.jpg)W 3 części kursu z cyklu o programowaniu na Androida ([http://szymonmotyka.pl/category/programowanie/](http://szymonmotyka.pl/category/programowanie/))  przejdziemy do lekkiej zabawy layoutami oraz dodawaniem nowych funkcji.  Jeśli jednak będziecie mieli pomysł  czego chcielibyście się nauczyć i jak mogłoby się tu przydać. Piszcie i komentujcie.  Tak przy okazji na FB do [1 części kursu](http://szymonmotyka.pl/programowanie-na-androida-instalowanie-rodowiska-eclipse-android-sdk/) pojawiło się zapytanie czemu pokazuję tutorial instalacji eclipse na Windowsie a nie Linuksie. Jest to wynik osobistej preferencji oraz z winy NVIDII, która nie wypuściła sterowników do Optimusa.

W poprzedniej części kursu poznaliście jak tworzyć nowe projekty oraz jak utworzyć "rdzeń" pod aplikację opartą na fragmentach. Tym razem do aplikacji dodamy nowe fragmenty typu rzut różnymi kośćmi oraz nauczymy się jak zapisywać liczby do lotka by można je było odtworzyć przy kolejnym uruchomieniu aplikacji.

<!-- more -->

Nasz projekt zacznijmy od utworzenia klasy typu fragment oraz layoutu do niego. Na potrzeby kursu, layout będzie typu table. Najpierw stwórzmy layout

[sourcecode language="xml"]
<?xml version="1.0" encoding="utf-8"?>
<TableLayout xmlns:android="http://schemas.android.com/apk/res/android"
 android:layout_width="match_parent"
 android:layout_height="match_parent" >

 <TextView
 android:id="@+id/TextView08"
 android:layout_width="match_parent"
 android:layout_height="wrap_content"
 android:background="#0C5687"
 android:text="@string/kosci"
 android:textAppearance="?android:attr/textAppearanceLarge"
 android:textColor="#FFD11C"
 android:textStyle="bold" />

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
 android:padding="20dp"
 android:text="@string/number" />

<Button
 android:id="@+id/btnk50"
 android:layout_width="0dp"
 android:layout_height="wrap_content"
 android:layout_weight="1"
 android:padding="20dp"
 android:text="@string/number" />
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
 android:textAppearance="?android:attr/textAppearanceMedium" />

<TextView
 android:id="@+id/TextView07"
 android:layout_width="wrap_content"
 android:layout_height="wrap_content"
 android:padding="10dp"
 android:text="K50"
 android:textAppearance="?android:attr/textAppearanceMedium" />
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
 android:padding="20dp"
 android:text="@string/number" />

<Button
 android:id="@+id/btnk12"
 android:layout_width="0dp"
 android:layout_height="wrap_content"
 android:layout_weight="1"
 android:padding="20dp"
 android:text="@string/number" />
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
 android:textAppearance="?android:attr/textAppearanceMedium" />

<TextView
 android:id="@+id/TextView05"
 android:layout_width="wrap_content"
 android:layout_height="wrap_content"
 android:padding="10dp"
 android:text="K12"
 android:textAppearance="?android:attr/textAppearanceMedium" />
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
 android:padding="20dp"
 android:text="@string/number" />

<Button
 android:id="@+id/btnk8"
 android:layout_width="0dp"
 android:layout_height="wrap_content"
 android:layout_weight="1"
 android:padding="20dp"
 android:text="@string/number" />
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
 android:textAppearance="?android:attr/textAppearanceMedium" />

<TextView
 android:id="@+id/TextView01"
 android:layout_width="wrap_content"
 android:layout_height="wrap_content"
 android:padding="10dp"
 android:text="K8"
 android:textAppearance="?android:attr/textAppearanceMedium" />
 </TableRow>

<TableRow
 android:id="@+id/tableRow1"
 android:layout_width="wrap_content"
 android:layout_height="wrap_content"
 android:layout_gravity="center"
 android:gravity="center" >

<Button
 android:id="@+id/btnk6"
 android:layout_width="0dp"
 android:layout_height="wrap_content"
 android:layout_weight="1"
 android:padding="20dp"
 android:text="@string/number" />

<Button
 android:id="@+id/btnk4"
 android:layout_width="0dp"
 android:layout_height="wrap_content"
 android:layout_weight="1"
 android:padding="20dp"
 android:text="@string/number" />
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
 android:textAppearance="?android:attr/textAppearanceMedium" />

<TextView
 android:id="@+id/TextView03"
 android:layout_width="wrap_content"
 android:layout_height="wrap_content"
 android:padding="10dp"
 android:text="K4"
 android:textAppearance="?android:attr/textAppearanceMedium" />
 </TableRow>

</TableLayout>

[/sourcecode]

Każdy wiersz tabeli  składa się z elementu <TableRow> . Co drugi wiersz zawiera podpisy do przycisków, reszta same przyciski (jednocześnie nasze kostki). Do głębszej modyfikacji layouta przejdziemy po implementacji naszego fragmentu.

Tym razem onClickListener został zaimplementowany do naszej klasy a nie jako obiekt.

Dzięki temu do naszej klasy została dodana metoda

[sourcecode language="java"]
@Override

public void onClick(View v) {

//k4 jest typem Button, który dziedziczy po View, tak więc mozna się bez problemu odwołać. Można też dodać ten listener do TextView oraz innych komponentów dziedziczonych po View

if (v==k4)
 {
 k4.setText(r.nextInt(3)+1+"");
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
 k4.setText(r.nextInt(3)+1+"");
 }
 else if(v==k6)
 {
 k6.setText(r.nextInt(5)+1+"");
 }
 else if(v==k8)
 {
 k8.setText(r.nextInt(7)+1+"");
 }
 else if(v==k10)
 {
 k10.setText(r.nextInt(9)+1+"");
 }
 else if(v==k12)
 {
 k12.setText(r.nextInt(11)+1+"");
 }
 else if(v==k20)
 {
 k20.setText(r.nextInt(19)+1+"");
 }
 else if(v==k50)
 {
 k50.setText(r.nextInt(49)+1+"");
 }
 else if(v==k100)
 {
 k100.setText(r.nextInt(99)+1+"");
 }
 }
}

[/sourcecode]

Teraz wróćmy do naszej klasy lotto. Pokażę, jak zrobić, by wcześniej wygenerowane liczby zostały zapisane (i dostępne przy ponownym odtworzeniu) Odbywa się to za pomocą SharedPreferences. Jednak aby odwołać się do SharedPrefences, potrzebujemy w klasie Lotto dodać Context oraz go zainicjować.  Dodatkowo  do sharedprefences potrzebna jest nazwa naszych ustawień (czyli String USTAWIENIA).

[sourcecode language="java"]
Context context;
 private SharedPreferences preferences;
 public static final String USTAWIENIA = "ustawienia";
 public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
 mainView = inflater.inflate(R.layout.lotto, container, false);
 context=getActivity().getApplicationContext();
 preferences = context.getSharedPreferences(USTAWIENIA, Activity.MODE_PRIVATE);

... }

[/sourcecode]

Najpierw zajmiemy się przywróceniem danych. Użyję do tego metody restore() która umieszczamy pomiędzy inicjatorem a listenerami.

[sourcecode language="java"]
/*
 * Za pomocą get... pobieramy dowolną zmienną z ustawień. Dla przykładu tutaj pobierane są Stringi(żeby nie bawić się konwersją getText>String i setText>String
 * Pierwszym parametrem jest nazwa ustawienia, a drugim wartość domyślna, gdy takiego ustawienia nie znajdzie.
 */
 private void restore() {
 txtNr1.setText(preferences.getString("nr1", "0"));
 txtNr2.setText(preferences.getString("nr2", "0"));
 txtNr3.setText(preferences.getString("nr3", "0"));
 txtNr4.setText(preferences.getString("nr4", "0"));
 txtNr5.setText(preferences.getString("nr5", "0"));
 txtNr6.setText(preferences.getString("nr6", "0"));

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
 editor.putString("nr1", txtNr1.getText().toString());
 editor.putString("nr2", txtNr2.getText().toString());
 editor.putString("nr3", txtNr3.getText().toString());
 editor.putString("nr4", txtNr4.getText().toString());
 editor.putString("nr5", txtNr5.getText().toString());
 editor.putString("nr6", txtNr6.getText().toString());
 editor.commit();
 }
[/sourcecode]

Na końcu dodajemy naszą metodę save()  na koniec onClick przy btnRandom();

I to tyle na dzisiaj Wasz uniżony programista ma do przekazania. W następnych częściach kursu postanowię pokazać głębszą zabawę layoutami, wykorzystanie zewnętrzne API czy użycie bazy SQLite. Jestem otwarty na propozycję. Jak widać poniżej. Tak aplikacja wygląda poniżej, więc następnym krokiem wypadałoby ją upiększyć

[![](http://szymonmotyka.pl/wp-content/uploads/2012/09/device-2012-09-20-141729-180x300.png)](http://szymonmotyka.pl/wp-content/uploads/2012/09/device-2012-09-20-141729.png) Tak aplikacja wygląda pod koniec tej części kursu

a i na koniec: https://dl.dropbox.com/u/14815030/tutorialrandomizerpt2.zip
