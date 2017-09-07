---
author: admin
comments: true
date: 2012-09-14 13:52:14+00:00
layout: post
link: http://szymonmotyka.pl/programowanie-na-androida-struktura-kodu-oraz-rdze-programu/
slug: programowanie-na-androida-struktura-kodu-oraz-rdze-programu
title: 'II Programowanie na Androida: Struktura kodu oraz rdzeń programu'
wordpress_id: 495
categories:
- Android
- Java
- Programowanie
tags:
- Android Suppor
- Aplikacje Mobilne
- Java
- Programowanie
- ViewPager
---

[![](http://szymonmotyka.pl/wp-content/uploads/2012/09/kurs2-300x168.jpg)](http://szymonmotyka.pl/wp-content/uploads/2012/09/kurs2.jpg)Jeżeli przetrwaliście [pierwszą część mojego survival programistycznego kursu](http://szymonmotyka.pl/programowanie-na-androida-instalowanie-rodowiska-eclipse-android-sdk/) (cykl : [http://szymonmotyka.pl/category/programowanie/](http://szymonmotyka.pl/category/programowanie/) ) , zapraszam na część drugą - praktyczną. Po zamyśleniach postanowiłem, że kurs podzielę na parę części, gdzie w pierwszej poznacie jak utworzyć aplikację opartą na ViewPager (znany np w Google Play do przewijania stron w boki). Aplikacja utworzona jest dla Api 14 (4.0) z wsteczną kompatybilnością do API 8 (2.2). Dzięki oficjalnej bibliotece android.support łatwo jest stworzyć aplikację kompatybilną wstecz.   W kursie tym poznacie także jak się tworzy projekty oraz strukturę plikową projektu.<!-- more -->

**TWORZENIE PROJEKTU**

historia obrazkowa w 3 aktach.

**** **[![](http://szymonmotyka.pl/wp-content/uploads/2012/09/2Nowy-projekt-300x252.jpg)](http://szymonmotyka.pl/wp-content/uploads/2012/09/2Nowy-projekt.jpg)**


[![](http://szymonmotyka.pl/wp-content/uploads/2012/09/2nowy-projekt2-300x113.jpg)](http://szymonmotyka.pl/wp-content/uploads/2012/09/2nowy-projekt2.jpg)




[caption id="attachment_504" align="aligncenter" width="300"][![](http://szymonmotyka.pl/wp-content/uploads/2012/09/kreator-projektu-300x300.jpg)](http://szymonmotyka.pl/wp-content/uploads/2012/09/kreator-projektu.jpg) Package Name jest w pewnym sensie wizytówką naszego projektu oraz ścieżką do PlayStore. Nazwa projektu i aplikacji można dowolnie zmienić w przyszłości[/caption]

Dalej poprowadzi nas tutorial za rękę (łącznie z tworzeniem ikony aplikacji o ile zaznaczyliśmy Create Custom Icons).

**STRUKTURA PROJEKTU**

[![](http://szymonmotyka.pl/wp-content/uploads/2012/09/2Skład-projektu-86x300.jpg)](http://szymonmotyka.pl/wp-content/uploads/2012/09/2Skład-projektu.jpg)

-src zawiera źródło programu, czyli nasz kod (w podfolderach wg naszego ustawionego package).

-gen - czyli kod którego edytować wręcz nie możemy, a generować się będzie sam przez dodanie grafik, motywów i innych folderów w resources

-assets -  jest folderem na różnorodne pliki (też powiązuje się z Resources). Można wrzucać tu np dzwięki, xml oraz różnorodne pliki

-bin - tu pojawi się nasz apk po skompilowaniu projektu

-res - czyli główne zasoby naszego projektu czyli Stringi, grafiki, UI. Co warto zaznaczyć. Można stworzyć to w wielu językach (np Strings i Strings-pl), które pojawią się w zależności od języka systemu. Można też ustawić kolory, gradienty.

-Android manifest - jest to główny plik zarządzajacy projektem. Można tu ustalić aktywności,  uprawnienia,  nazwe , styl layoutu a nawet ikonę aplikacji.

PIERWSZA APLIKACJA

Obiektem naszego kursu będzie aplikacja losująca (symulator kostek do RPG, Lotto i własne zabiegi). W tej części kursu zgubimy się na głównej aktywności (Głównym FragmentActivity) oraz jednej przykładowej podstronie losującej liczby do lotto (w następnych kursach inne moduły).

Jak wspominałem wcześniej, projekt tutorialowy oprę na android.support.v4.*. Pozwala on na bezproblemowe użycie fragmentów, a także innych specyficznych dla SDK >11 (czyli 4.x) opcji w zgodzie z wcześniejszymi androidami.

Zaczniemy więc od klasy utworzonej w kreatorze ( u mnie to MainActivity.java)

[sourcecode language="java"]</pre>
package pl.szymonmotyka.tutorialrandomizer;

import java.util.List;
import java.util.Vector;

import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentPagerAdapter;
import android.support.v4.view.PagerAdapter;
import android.support.v4.view.ViewPager;

public class MainActivity extends FragmentActivity {

/*
 * Page adapter jest adapterem obsługującym wiele fragmentów w naszej aplikacji
 */
 private PagerAdapter mPagerAdapter;

 @Override
 protected void onCreate(Bundle savedInstanceState) {
 super.onCreate(savedInstanceState);
 super.setContentView(R.layout.activity_main);
 this.initialisePaging();
 }

/**
 * Tworzy strony naszej aplikacji
 */
 private void initialisePaging() {

List<Fragment> fragments = new Vector<Fragment>();
 //Dodaje fragmenty do listy, którą użyjemy w naszym adapterze. W tym przypadku dodałem 2 takie same (są jako osobne aktywności) by pokazać jak to działa w praktyce
 fragments.add(Fragment.instantiate(this, Lotto.class.getName()));
 fragments.add(Fragment.instantiate(this, Kosci.class.getName()));

 this.mPagerAdapter = new myPageAdapter(super.getSupportFragmentManager(), fragments);
 ViewPager pager = (ViewPager) super.findViewById(R.id.awesomepager);
 pager.setAdapter(this.mPagerAdapter);
 }
}
/*
 * Jest to prosty adapter dla ViewPager do przełączania stron
 */
class myPageAdapter extends FragmentPagerAdapter {

/*
 * fragments = Lista fragmentow programu
 */
 private final List<Fragment> fragments;

public myPageAdapter(FragmentManager fm, List<Fragment> fragments) {
 super(fm);
 this.fragments = fragments;
 }

@Override
 public Fragment getItem(int position) {
 return this.fragments.get(position);
 }

@Override
 public int getCount() {
 return this.fragments.size();
 }
}
<pre>[/sourcecode]

Pierwsze, co musimy zrobić to zamienić dziedziczenie (extends) z Activity do FragmentActivity, aby obsługiwał utworzone przez nas aktywności.

    
    public class MainActivity extends FragmentActivity {


Jeśli będzie podkreślało na czerwono, użyjcie skrótu klawiszowego ctrl + shift   + o (automatyczne importowanie bibliotek) i wybierzcie android.support.v4

[sourcecode language="java"]
/**
 * Tworzy strony naszej aplikacji
 */
List<Fragment> fragments = new Vector<Fragment>();
 //Dodaje fragmenty do listy, którą użyjemy w naszym adapterze. W tym przypadku dodałem 2 takie same (są jako osobne aktywności) by pokazać jak to działa w praktyce
 fragments.add(Fragment.instantiate(this, Lotto.class.getName()));
 fragments.add(Fragment.instantiate(this, Kosci.class.getName()));

 this.mPagerAdapter = new myPageAdapter(super.getSupportFragmentManager(), fragments);
 ViewPager pager = (ViewPager) super.findViewById(R.id.awesomepager);
 pager.setAdapter(this.mPagerAdapter);
 }
[/sourcecode]

Powyższa metoda tworzy listę Fragmentów i dodaje je do naszego PageAdapera (klasa utworzona w pliku MainActivity.java, którą możecie spokojnie skopiować). Jedną z najważniejszych rzeczy jest przypisanie ViewPager'a do id w utworzonym przez nas XML  (kod poniżej) poprzez

    
    ViewPager pager = (ViewPager) super.findViewById(R.id.awesomepager);


Kolejną ważną rzeczą (do przyszłego usprawniania aplikacji , dodawaniu kolejnych stron ip) jest dodanie przykładowej strony (do  której tworzenia przejdziemy w tej części kursu) poprzez dodanie do listy

    
    fragments.add(Fragment.instantiate(this, Lotto.class.getName()));


Lotto.class jest jednym z naszych fragmentów (czyli klasy dziedziczone po Fragment)


Teraz przejdziemy do tworzenia layoutu w stworzonym przez kreator pliku w folderze res\layout\activity_main.xml. Teraz wrzucamy poprzez widok XML [![](http://szymonmotyka.pl/wp-content/uploads/2012/09/screen-300x50.jpg)](http://szymonmotyka.pl/wp-content/uploads/2012/09/screen.jpg)kontrolkę <**android.support.v4.view.ViewPager ... **> która obsługuje nasze zakładki.



[sourcecode language="xml"]</pre>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
 xmlns:tools="http://schemas.android.com/tools"
 android:id="@+id/LinearLayout1"
 android:layout_width="match_parent"
 android:layout_height="match_parent"
 android:orientation="vertical" >

&nbsp;

&nbsp;

<TextView
 android:id="@+id/labelTitle"
 android:layout_width="match_parent"
 android:layout_height="wrap_content"
 android:layout_gravity="center"
 android:gravity="center"
 android:text="@string/app_name"
 android:textAppearance="?android:attr/textAppearanceMedium"
 android:textSize="20dp" />

<android.support.v4.view.ViewPager
 xmlns:android="http://schemas.android.com/apk/res/android"
 android:id="@+id/awesomepager"
 android:layout_width="fill_parent"
 android:layout_height="wrap_content" >
 </android.support.v4.view.ViewPager>

</LinearLayout>
<pre>
[/sourcecode]


Przy okazji zachęcam do improwizacji z layoutami.

Teraz przejdziemy do tworzenia naszego przykładowego fragmentu Lotto.java. Aby utworzyć nową klasę przechodzimy do src/(nasz package)/ i klikamy na nasz package a następnie New > Class.  [![](http://szymonmotyka.pl/wp-content/uploads/2012/09/newclass-300x153.jpg)](http://szymonmotyka.pl/wp-content/uploads/2012/09/newclass.jpg)

Zanim zaczniemy uzupełniać nasz fragment, zaprojektujmy, co chcemy zrobić. Przechodzimy więc do res/layout na którego klikamy prawym przyciskiem myszy i New > Other > Android XML Layout file

[![](http://szymonmotyka.pl/wp-content/uploads/2012/09/layout-300x269.jpg)](http://szymonmotyka.pl/wp-content/uploads/2012/09/layout.jpg)

Nasz layout wygląda tak:


[caption id="attachment_521" align="aligncenter" width="300"][![](http://szymonmotyka.pl/wp-content/uploads/2012/09/lotto-300x267.jpg)](http://szymonmotyka.pl/wp-content/uploads/2012/09/lotto.jpg) Screen z przykładowej aplikacji[/caption]

[sourcecode language="xml"]&lt;/pre&gt;
&lt;?xml version=&quot;1.0&quot; encoding=&quot;utf-8&quot;?&gt;
&lt;LinearLayout xmlns:android=&quot;http://schemas.android.com/apk/res/android&quot;
 android:layout_width=&quot;match_parent&quot;
 android:layout_height=&quot;match_parent&quot;
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
 android:layout_height=&quot;wrap_content&quot; &gt;

&lt;TextView
 android:id=&quot;@+id/nr1&quot;
 android:layout_width=&quot;wrap_content&quot;
 android:layout_height=&quot;wrap_content&quot;
 android:padding=&quot;10dp&quot;
 android:text=&quot;@string/number&quot;
 android:textAppearance=&quot;?android:attr/textAppearanceMedium&quot; /&gt;

&lt;TextView
 android:id=&quot;@+id/nr2&quot;
 android:layout_width=&quot;wrap_content&quot;
 android:layout_height=&quot;wrap_content&quot;
 android:padding=&quot;10dp&quot;
 android:text=&quot;@string/number&quot;
 android:textAppearance=&quot;?android:attr/textAppearanceMedium&quot; /&gt;

&lt;TextView
 android:id=&quot;@+id/nr3&quot;
 android:layout_width=&quot;wrap_content&quot;
 android:layout_height=&quot;wrap_content&quot;
 android:padding=&quot;10dp&quot;
 android:text=&quot;@string/number&quot;
 android:textAppearance=&quot;?android:attr/textAppearanceMedium&quot; /&gt;

&lt;TextView
 android:id=&quot;@+id/nr4&quot;
 android:layout_width=&quot;wrap_content&quot;
 android:layout_height=&quot;wrap_content&quot;
 android:padding=&quot;10dp&quot;
 android:text=&quot;@string/number&quot;
 android:textAppearance=&quot;?android:attr/textAppearanceMedium&quot; /&gt;

&lt;TextView
 android:id=&quot;@+id/nr5&quot;
 android:layout_width=&quot;wrap_content&quot;
 android:layout_height=&quot;wrap_content&quot;
 android:padding=&quot;10dp&quot;
 android:text=&quot;@string/number&quot;
 android:textAppearance=&quot;?android:attr/textAppearanceMedium&quot; /&gt;

&lt;TextViewandroid:id=&quot;@+id/nr6&quot;

 android:layout_width=&quot;wrap_content&quot;
 android:layout_height=&quot;wrap_content&quot;
 android:text=&quot;@string/number&quot;
 android:textAppearance=&quot;?android:attr/textAppearanceMedium&quot; /&gt;

&lt;/LinearLayout&gt;

 &lt;Button
 android:id=&quot;@+id/btnrandom&quot;
 android:layout_width=&quot;wrap_content&quot;
 android:layout_height=&quot;wrap_content&quot;
 android:layout_gravity=&quot;center&quot;
 android:text=&quot;@string/losuj&quot; /&gt;

&lt;/LinearLayout&gt;

[/sourcecode]


Z tego co widać w kodzie i po obrazku, nasza aplikacja składa się z 6 pól tekstowych w jednym linear layout (dzięki czemu wszystkie są w jednym rzędzie) oraz z przycisku.

parametr android:text="@string/..." odnosi się do stringów wpisanych w /res/values/strings (choć nie jest wcale powiedziane, by plik musiał się dokładnie tak nazywać. Możecie np utworzyć osobny plik do stringow dla osobnych activities, osobny do kolorów  a osobny do styli.

Teraz zapisujemy nasz layout i przechodzimy do klasy lotto.java
[sourcecode language="java"]
package pl.szymonmotyka.tutorialrandomizer;

import java.util.Random;

import android.content.Context;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.TextView;

public class Lotto extends Fragment {
 /*
 * Zmienna odpowiadajaca za widok
 */
 View mainView;
 Context ctx;
 TextView txtNr1,txtNr2,txtNr3,txtNr4,txtNr5,txtNr6;
 Button btnRandom;

 public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
 mainView = inflater.inflate(R.layout.lotto, container, false);
 ctx=container.getContext();
 initialize();
 listeners();
 return mainView;
 }
 private void listeners() {
 btnRandom.setOnClickListener(new OnClickListener() {

 @Override
 public void onClick(View v) {
 Random rand=new Random();
 txtNr1.setText(rand.nextInt(48)+1+&quot;&quot;);
 txtNr2.setText(rand.nextInt(48)+1+&quot;&quot;);
 txtNr3.setText(rand.nextInt(48)+1+&quot;&quot;);
 txtNr4.setText(rand.nextInt(48)+1+&quot;&quot;);
 txtNr5.setText(rand.nextInt(48)+1+&quot;&quot;);
 txtNr6.setText(rand.nextInt(48)+1+&quot;&quot;);
 }
 });
 }
 private void initialize() {
 txtNr1=(TextView)mainView.findViewById(R.id.nr1);
 txtNr2=(TextView)mainView.findViewById(R.id.nr2);
 txtNr3=(TextView)mainView.findViewById(R.id.nr3);
 txtNr4=(TextView)mainView.findViewById(R.id.nr4);
 txtNr5=(TextView)mainView.findViewById(R.id.nr5);
 txtNr6=(TextView)mainView.findViewById(R.id.nr6);
 btnRandom=(Button)mainView.findViewById(R.id.btnrandom);
 }
}
[/sourcecode]


w Fragmentach, w przeciwieństwie do FragmentActivity i Activity, metoda onCreate zostaje zastąpiona przez


    
    View mainView;
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
     mainView = inflater.inflate(R.layout.lotto, container, false);
    ...<kod tutaj> 
     return mainView;
     }


Za pomocą obiektu mainView , możemy przypisywać komponenty z xml do zmiennych w klasie. Pamiętajcie jednak, że zanim użyjecie danego obiektu, należy go pierwsze zainicjować poniższym sposobem

** txtNr1=(TextView)mainView.findViewById(R.id.nr1);**

gdzie txtNr1 jest Zmienną typu TextView, mainView jest zmienną typu View a R.id.nr1 jest odnośnikiem do komponentu w pliku xml

Następnym etapem jest dodanie akcji do przycisku Losuj, który istnieje tutaj pod zmienną btnRandom.  Odbywa się to za pomocą listenerów,  do których można przypisać akcję. Odbywa się to na pare sposobów np:

[sourcecode language="java"]
btnRandom.setOnClickListener(new OnClickListener() {@Override
 public void onClick(View v) {
 Random rand=new Random();
 txtNr1.setText(rand.nextInt(48)+1+&quot;&quot;);
 ... (losowanie kolejnych liczb)
 }
}); [/sourcecode]



[sourcecode language="java"]

void listeners(){

btnRandom.setOnClickListener(losuj);

}

OnClickListener losuj=new OnClickListener() {

 @Override
 public void onClick(View v) {
 // TODO Auto-generated method stub

 }
 };[/sourcecode]

Teraz zapraszam do testowania appki i oczekiwanie na kolejne części kursu. Wszelkie uwagi itp: pisać na twittera ,g+, maila lub w komentarzach.

Źródło: [https://dl.dropbox.com/u/14815030/tutorialrandomizerpt1.zip](https://dl.dropbox.com/u/14815030/tutorialrandomizerpt1.zip)
