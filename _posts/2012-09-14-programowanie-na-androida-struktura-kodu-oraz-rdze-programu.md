---
layout: post
title: II Programowanie na Androida: Struktura kodu oraz rdzeń programu
date: 2012-09-14 14:52
author: admin
comments: true
categories: [Android, Android Suppor, Aplikacje Mobilne, Java, Java, Programowanie, Programowanie, ViewPager]
---
<a href="http://szymonmotyka.pl/wp-content/uploads/2012/09/kurs2.jpg"><img class="aligncenter size-medium wp-image-545" title="kurs2" src="http://szymonmotyka.pl/wp-content/uploads/2012/09/kurs2-300x168.jpg" alt="" width="300" height="168" /></a>Jeżeli przetrwaliście <a title="Programowanie na Androida: Instalowanie Środowiska Eclipse + Android SDK" href="http://szymonmotyka.pl/programowanie-na-androida-instalowanie-rodowiska-eclipse-android-sdk/" target="_blank">pierwszą część mojego survival programistycznego kursu</a> (cykl : <a href="http://szymonmotyka.pl/category/programowanie/">http://szymonmotyka.pl/category/programowanie/</a> ) , zapraszam na część drugą - praktyczną. Po zamyśleniach postanowiłem, że kurs podzielę na parę części, gdzie w pierwszej poznacie jak utworzyć aplikację opartą na ViewPager (znany np w Google Play do przewijania stron w boki). Aplikacja utworzona jest dla Api 14 (4.0) z wsteczną kompatybilnością do API 8 (2.2). Dzięki oficjalnej bibliotece android.support łatwo jest stworzyć aplikację kompatybilną wstecz.   W kursie tym poznacie także jak się tworzy projekty oraz strukturę plikową projektu.<!--more-->

<strong>TWORZENIE PROJEKTU</strong>

historia obrazkowa w 3 aktach.

<strong></strong> <strong><a href="http://szymonmotyka.pl/wp-content/uploads/2012/09/2Nowy-projekt.jpg"><img class="aligncenter size-medium wp-image-500" title="2Nowy projekt" src="http://szymonmotyka.pl/wp-content/uploads/2012/09/2Nowy-projekt-300x252.jpg" alt="" width="300" height="252" /></a></strong>
<p style="text-align: center;"><a href="http://szymonmotyka.pl/wp-content/uploads/2012/09/2nowy-projekt2.jpg"><img class="size-medium wp-image-501 aligncenter" title="2nowy projekt2" src="http://szymonmotyka.pl/wp-content/uploads/2012/09/2nowy-projekt2-300x113.jpg" alt="" width="300" height="113" /></a></p>


[caption id="attachment_504" align="aligncenter" width="300"]<a href="http://szymonmotyka.pl/wp-content/uploads/2012/09/kreator-projektu.jpg"><img class="size-medium wp-image-504" title="kreator projektu" src="http://szymonmotyka.pl/wp-content/uploads/2012/09/kreator-projektu-300x300.jpg" alt="" width="300" height="300" /></a> Package Name jest w pewnym sensie wizytówką naszego projektu oraz ścieżką do PlayStore. Nazwa projektu i aplikacji można dowolnie zmienić w przyszłości[/caption]

Dalej poprowadzi nas tutorial za rękę (łącznie z tworzeniem ikony aplikacji o ile zaznaczyliśmy Create Custom Icons).

<strong>STRUKTURA PROJEKTU</strong>

<a href="http://szymonmotyka.pl/wp-content/uploads/2012/09/2Skład-projektu.jpg"><img class="aligncenter size-medium wp-image-502" title="Drzewko folderów oraz stuktura projektu" src="http://szymonmotyka.pl/wp-content/uploads/2012/09/2Skład-projektu-86x300.jpg" alt="" width="86" height="300" /></a>

-src zawiera źródło programu, czyli nasz kod (w podfolderach wg naszego ustawionego package).

-gen - czyli kod którego edytować wręcz nie możemy, a generować się będzie sam przez dodanie grafik, motywów i innych folderów w resources

-assets -  jest folderem na różnorodne pliki (też powiązuje się z Resources). Można wrzucać tu np dzwięki, xml oraz różnorodne pliki

-bin - tu pojawi się nasz apk po skompilowaniu projektu

-res - czyli główne zasoby naszego projektu czyli Stringi, grafiki, UI. Co warto zaznaczyć. Można stworzyć to w wielu językach (np Strings i Strings-pl), które pojawią się w zależności od języka systemu. Można też ustawić kolory, gradienty.

-Android manifest - jest to główny plik zarządzajacy projektem. Można tu ustalić aktywności,  uprawnienia,  nazwe , styl layoutu a nawet ikonę aplikacji.

PIERWSZA APLIKACJA

Obiektem naszego kursu będzie aplikacja losująca (symulator kostek do RPG, Lotto i własne zabiegi). W tej części kursu zgubimy się na głównej aktywności (Głównym FragmentActivity) oraz jednej przykładowej podstronie losującej liczby do lotto (w następnych kursach inne moduły).

Jak wspominałem wcześniej, projekt tutorialowy oprę na android.support.v4.*. Pozwala on na bezproblemowe użycie fragmentów, a także innych specyficznych dla SDK &gt;11 (czyli 4.x) opcji w zgodzie z wcześniejszymi androidami.

Zaczniemy więc od klasy utworzonej w kreatorze ( u mnie to MainActivity.java)

[sourcecode language="java"]&lt;/pre&gt;
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

List&lt;Fragment&gt; fragments = new Vector&lt;Fragment&gt;();
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
 private final List&lt;Fragment&gt; fragments;

public myPageAdapter(FragmentManager fm, List&lt;Fragment&gt; fragments) {
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
&lt;pre&gt;[/sourcecode]

Pierwsze, co musimy zrobić to zamienić dziedziczenie (extends) z Activity do FragmentActivity, aby obsługiwał utworzone przez nas aktywności.
<pre>public class MainActivity extends FragmentActivity {</pre>
Jeśli będzie podkreślało na czerwono, użyjcie skrótu klawiszowego ctrl + shift   + o (automatyczne importowanie bibliotek) i wybierzcie android.support.v4

[sourcecode language="java"]
/**
 * Tworzy strony naszej aplikacji
 */
List&lt;Fragment&gt; fragments = new Vector&lt;Fragment&gt;();
 //Dodaje fragmenty do listy, którą użyjemy w naszym adapterze. W tym przypadku dodałem 2 takie same (są jako osobne aktywności) by pokazać jak to działa w praktyce
 fragments.add(Fragment.instantiate(this, Lotto.class.getName()));
 fragments.add(Fragment.instantiate(this, Kosci.class.getName()));

 this.mPagerAdapter = new myPageAdapter(super.getSupportFragmentManager(), fragments);
 ViewPager pager = (ViewPager) super.findViewById(R.id.awesomepager);
 pager.setAdapter(this.mPagerAdapter);
 }
[/sourcecode]

Powyższa metoda tworzy listę Fragmentów i dodaje je do naszego PageAdapera (klasa utworzona w pliku MainActivity.java, którą możecie spokojnie skopiować). Jedną z najważniejszych rzeczy jest przypisanie ViewPager'a do id w utworzonym przez nas XML  (kod poniżej) poprzez
<pre>ViewPager pager = (ViewPager) super.findViewById(R.id.awesomepager);</pre>
Kolejną ważną rzeczą (do przyszłego usprawniania aplikacji , dodawaniu kolejnych stron ip) jest dodanie przykładowej strony (do  której tworzenia przejdziemy w tej części kursu) poprzez dodanie do listy
<pre>fragments.add(Fragment.instantiate(this, Lotto.class.getName()));</pre>
Lotto.class jest jednym z naszych fragmentów (czyli klasy dziedziczone po Fragment)
<p style="text-align: center;">Teraz przejdziemy do tworzenia layoutu w stworzonym przez kreator pliku w folderze res\layout\activity_main.xml. Teraz wrzucamy poprzez widok XML <a href="http://szymonmotyka.pl/wp-content/uploads/2012/09/screen.jpg"><img class="aligncenter" title="screen" src="http://szymonmotyka.pl/wp-content/uploads/2012/09/screen-300x50.jpg" alt="" width="300" height="50" /></a>kontrolkę &lt;<strong>android.support.v4.view.ViewPager ... </strong>&gt; która obsługuje nasze zakładki.</p>

[sourcecode language="xml"]&lt;/pre&gt;
&lt;LinearLayout xmlns:android=&quot;http://schemas.android.com/apk/res/android&quot;
 xmlns:tools=&quot;http://schemas.android.com/tools&quot;
 android:id=&quot;@+id/LinearLayout1&quot;
 android:layout_width=&quot;match_parent&quot;
 android:layout_height=&quot;match_parent&quot;
 android:orientation=&quot;vertical&quot; &gt;

&amp;nbsp;

&amp;nbsp;

&lt;TextView
 android:id=&quot;@+id/labelTitle&quot;
 android:layout_width=&quot;match_parent&quot;
 android:layout_height=&quot;wrap_content&quot;
 android:layout_gravity=&quot;center&quot;
 android:gravity=&quot;center&quot;
 android:text=&quot;@string/app_name&quot;
 android:textAppearance=&quot;?android:attr/textAppearanceMedium&quot;
 android:textSize=&quot;20dp&quot; /&gt;

&lt;android.support.v4.view.ViewPager
 xmlns:android=&quot;http://schemas.android.com/apk/res/android&quot;
 android:id=&quot;@+id/awesomepager&quot;
 android:layout_width=&quot;fill_parent&quot;
 android:layout_height=&quot;wrap_content&quot; &gt;
 &lt;/android.support.v4.view.ViewPager&gt;

&lt;/LinearLayout&gt;
&lt;pre&gt;
[/sourcecode]


Przy okazji zachęcam do improwizacji z layoutami.

Teraz przejdziemy do tworzenia naszego przykładowego fragmentu Lotto.java. Aby utworzyć nową klasę przechodzimy do src/(nasz package)/ i klikamy na nasz package a następnie New &gt; Class.  <a href="http://szymonmotyka.pl/wp-content/uploads/2012/09/newclass.jpg"><img class="aligncenter size-medium wp-image-520" title="newclass" src="http://szymonmotyka.pl/wp-content/uploads/2012/09/newclass-300x153.jpg" alt="" width="300" height="153" /></a>

Zanim zaczniemy uzupełniać nasz fragment, zaprojektujmy, co chcemy zrobić. Przechodzimy więc do res/layout na którego klikamy prawym przyciskiem myszy i New &gt; Other &gt; Android XML Layout file

<a href="http://szymonmotyka.pl/wp-content/uploads/2012/09/layout.jpg"><img class="aligncenter size-medium wp-image-519" title="layout" src="http://szymonmotyka.pl/wp-content/uploads/2012/09/layout-300x269.jpg" alt="" width="300" height="269" /></a>

Nasz layout wygląda tak:


[caption id="attachment_521" align="aligncenter" width="300"]<a href="http://szymonmotyka.pl/wp-content/uploads/2012/09/lotto.jpg"><img class="size-medium wp-image-521" title="lotto" src="http://szymonmotyka.pl/wp-content/uploads/2012/09/lotto-300x267.jpg" alt="" width="300" height="267" /></a> Screen z przykładowej aplikacji[/caption]

[sourcecode language="xml"]&amp;lt;/pre&amp;gt;
&amp;lt;?xml version=&amp;quot;1.0&amp;quot; encoding=&amp;quot;utf-8&amp;quot;?&amp;gt;
&amp;lt;LinearLayout xmlns:android=&amp;quot;http://schemas.android.com/apk/res/android&amp;quot;
 android:layout_width=&amp;quot;match_parent&amp;quot;
 android:layout_height=&amp;quot;match_parent&amp;quot;
 android:orientation=&amp;quot;vertical&amp;quot; &amp;gt;

 &amp;lt;TextView
 android:id=&amp;quot;@+id/textView1&amp;quot;
 android:layout_width=&amp;quot;match_parent&amp;quot;
 android:layout_height=&amp;quot;wrap_content&amp;quot;
 android:layout_gravity=&amp;quot;center&amp;quot;
 android:background=&amp;quot;#0C5687&amp;quot;
 android:text=&amp;quot;@string/lotto&amp;quot;
 android:textAppearance=&amp;quot;?android:attr/textAppearanceLarge&amp;quot;
 android:textColor=&amp;quot;#FFD11C&amp;quot;
 android:textStyle=&amp;quot;bold&amp;quot; /&amp;gt;

&amp;lt;LinearLayout
 android:layout_width=&amp;quot;match_parent&amp;quot;
 android:layout_height=&amp;quot;wrap_content&amp;quot; &amp;gt;

&amp;lt;TextView
 android:id=&amp;quot;@+id/nr1&amp;quot;
 android:layout_width=&amp;quot;wrap_content&amp;quot;
 android:layout_height=&amp;quot;wrap_content&amp;quot;
 android:padding=&amp;quot;10dp&amp;quot;
 android:text=&amp;quot;@string/number&amp;quot;
 android:textAppearance=&amp;quot;?android:attr/textAppearanceMedium&amp;quot; /&amp;gt;

&amp;lt;TextView
 android:id=&amp;quot;@+id/nr2&amp;quot;
 android:layout_width=&amp;quot;wrap_content&amp;quot;
 android:layout_height=&amp;quot;wrap_content&amp;quot;
 android:padding=&amp;quot;10dp&amp;quot;
 android:text=&amp;quot;@string/number&amp;quot;
 android:textAppearance=&amp;quot;?android:attr/textAppearanceMedium&amp;quot; /&amp;gt;

&amp;lt;TextView
 android:id=&amp;quot;@+id/nr3&amp;quot;
 android:layout_width=&amp;quot;wrap_content&amp;quot;
 android:layout_height=&amp;quot;wrap_content&amp;quot;
 android:padding=&amp;quot;10dp&amp;quot;
 android:text=&amp;quot;@string/number&amp;quot;
 android:textAppearance=&amp;quot;?android:attr/textAppearanceMedium&amp;quot; /&amp;gt;

&amp;lt;TextView
 android:id=&amp;quot;@+id/nr4&amp;quot;
 android:layout_width=&amp;quot;wrap_content&amp;quot;
 android:layout_height=&amp;quot;wrap_content&amp;quot;
 android:padding=&amp;quot;10dp&amp;quot;
 android:text=&amp;quot;@string/number&amp;quot;
 android:textAppearance=&amp;quot;?android:attr/textAppearanceMedium&amp;quot; /&amp;gt;

&amp;lt;TextView
 android:id=&amp;quot;@+id/nr5&amp;quot;
 android:layout_width=&amp;quot;wrap_content&amp;quot;
 android:layout_height=&amp;quot;wrap_content&amp;quot;
 android:padding=&amp;quot;10dp&amp;quot;
 android:text=&amp;quot;@string/number&amp;quot;
 android:textAppearance=&amp;quot;?android:attr/textAppearanceMedium&amp;quot; /&amp;gt;

&amp;lt;TextViewandroid:id=&amp;quot;@+id/nr6&amp;quot;

 android:layout_width=&amp;quot;wrap_content&amp;quot;
 android:layout_height=&amp;quot;wrap_content&amp;quot;
 android:text=&amp;quot;@string/number&amp;quot;
 android:textAppearance=&amp;quot;?android:attr/textAppearanceMedium&amp;quot; /&amp;gt;

&amp;lt;/LinearLayout&amp;gt;

 &amp;lt;Button
 android:id=&amp;quot;@+id/btnrandom&amp;quot;
 android:layout_width=&amp;quot;wrap_content&amp;quot;
 android:layout_height=&amp;quot;wrap_content&amp;quot;
 android:layout_gravity=&amp;quot;center&amp;quot;
 android:text=&amp;quot;@string/losuj&amp;quot; /&amp;gt;

&amp;lt;/LinearLayout&amp;gt;

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
 txtNr1.setText(rand.nextInt(48)+1+&amp;quot;&amp;quot;);
 txtNr2.setText(rand.nextInt(48)+1+&amp;quot;&amp;quot;);
 txtNr3.setText(rand.nextInt(48)+1+&amp;quot;&amp;quot;);
 txtNr4.setText(rand.nextInt(48)+1+&amp;quot;&amp;quot;);
 txtNr5.setText(rand.nextInt(48)+1+&amp;quot;&amp;quot;);
 txtNr6.setText(rand.nextInt(48)+1+&amp;quot;&amp;quot;);
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

<pre>View mainView;
public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
 mainView = inflater.inflate(R.layout.lotto, container, false);
...&lt;kod tutaj&gt; 
 return mainView;
 }</pre>
Za pomocą obiektu mainView , możemy przypisywać komponenty z xml do zmiennych w klasie. Pamiętajcie jednak, że zanim użyjecie danego obiektu, należy go pierwsze zainicjować poniższym sposobem

<strong> txtNr1=(TextView)mainView.findViewById(R.id.nr1);</strong>

gdzie txtNr1 jest Zmienną typu TextView, mainView jest zmienną typu View a R.id.nr1 jest odnośnikiem do komponentu w pliku xml

Następnym etapem jest dodanie akcji do przycisku Losuj, który istnieje tutaj pod zmienną btnRandom.  Odbywa się to za pomocą listenerów,  do których można przypisać akcję. Odbywa się to na pare sposobów np:

[sourcecode language="java"]
btnRandom.setOnClickListener(new OnClickListener() {@Override
 public void onClick(View v) {
 Random rand=new Random();
 txtNr1.setText(rand.nextInt(48)+1+&amp;quot;&amp;quot;);
 ... (losowanie kolejnych liczb)
 }
}); [/sourcecode]

&nbsp;

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

Źródło: <a title="Źródło" href="https://dl.dropbox.com/u/14815030/tutorialrandomizerpt1.zip" target="_blank">https://dl.dropbox.com/u/14815030/tutorialrandomizerpt1.zip</a>
