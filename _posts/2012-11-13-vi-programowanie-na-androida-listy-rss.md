---
layout: post
title: VI Programowanie na Androida: Listy i RSS
date: 2012-11-13 21:14
author: admin
comments: true
categories: [Android, Aplikacje Mobilne, Java, Java, Kości, Kurs, Losowanie, Lotto, Programowanie, Programowanie, RSS, Tutorial, Zapisywanie danych]
---
Po dłuższym utęsknieniu i znalezieniu czasu pomiędzy pracą inżynierską, graniem a przeklinaniem na notebook, znalazłem czas oraz chęci na kontynuowanie<a title="I Programowanie na Androida: Instalowanie Środowiska Eclipse + Android SDK" href="http://szymonmotyka.pl/programowanie-na-androida-instalowanie-rodowiska-eclipse-android-sdk/"> kursu programowania na platformę Android</a>. Tym razem obiektem mojego kursu zostały listy oraz wg sondaży czytnik <strong>rss</strong> (przykro mi, bazy będą w innej części).

<!--more-->Jako, że lotto nie ma oficjalnego czytnika rss , użyję rss z  mojego serwisu. (http://szymonmotyka.pl/feed/)

Zacznijmy więc od stworzenia layoutu dla naszego czytnika ( oczywiście, layout będzie fragmentem poprzednio stworzonego layoutu:

[xml]

< ?xml version="1.0" encoding="utf-8"?>
<linearlayout xmlns:android="http://schemas.android.com/apk/res/android"
 android:layout_width="match_parent"
 android:layout_height="match_parent"
 android:orientation="vertical" >

<textview android:id="@+id/TextView08"
 android:layout_width="match_parent"
 android:layout_height="wrap_content"
 android:background="#0C5687"
 android:text="@string/rss"
 android:textAppearance="?android:attr/textAppearanceLarge"
 android:textColor="#FFD11C"
 android:textStyle="bold"></textview>

 <listview android:id="@id/android:list"
 android:layout_width="match_parent"
 android:layout_height="match_parent"
 >

</listview>

</linearlayout>

[/xml]

Jest to prosty layout z listview z nagłówkiem znanym z innych fragmentów. Urodziwe to nie jest, ale działa. Reszta zależy od was czytelnicy

<a href="http://szymonmotyka.pl/wp-content/uploads/2012/11/rss1.jpg"><img class="aligncenter size-medium wp-image-657" title="RSS Eclipse" alt="" src="http://szymonmotyka.pl/wp-content/uploads/2012/11/rss1-202x300.jpg" width="202" height="300" /></a>

Kolejnym krokiem jest też dodanie layoutu dla  wierszy naszej linii, by adapter wiedział, co gdzie umieścić.

[xml]

< ?xml version="1.0" encoding="utf-8"?>
 <linearlayout xmlns:android="http://schemas.android.com/apk/res/android"
 android:layout_width="fill_parent"
 android:layout_height="fill_parent"
 android:orientation="vertical" >

<textview android:id="@+id/title"
 android:layout_width="match_parent"
 android:layout_height="wrap_content"
 android:text="Large Text"
 android:textAppearance="?android:attr/textAppearanceLarge"></textview>

<textview android:id="@+id/content"
 android:layout_width="match_parent"
 android:layout_height="wrap_content"
 android:text="Medium Text"
 android:textAppearance="?android:attr/textAppearanceMedium"></textview>
<textview android:id="@+id/date"
 android:layout_width="match_parent"
 android:layout_height="wrap_content"
 android:text="Small Text"
 android:textAppearance="?android:attr/textAppearanceSmall"></textview>
</linearlayout>

[/xml]

Kolejnym krokiem jest utworzenie nowego fragmentu, tym razem dziedziczącego po listfragment

[java]

public class RSS extends ListFragment {
 ArrayList<rssmodel> rsslist=new ArrayList</rssmodel><rssmodel>();
 @Override
 public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
 View mainView = inflater.inflate(R.layout.rsslayout, container, false);
 //Tworzenie przykładowej arraylisty, którą potem uzupełnimy wpisami z rss
rsslist.add(new RSSModel("Test", "testskontent", "http://developer.android.com/reference/android/app/ListFragment.html","10-10-2012"));
<pre>
 //Tworzenie obiektu rssAdapter
 RSSAdapter rssAdapter=new RSSAdapter(getActivity(), rsslist);
 //PRzypisanie jej do listy
 setListAdapter(rssAdapter);
 return mainView;
 }
 @Override
 public void onListItemClick (ListView l, View v, int position, long id)
 {
 super.onListItemClick(l, v, position, id);
 Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(rsslist.get(position).getLink()));
 startActivity(intent);
 }
}

[/java]

Jest to prosty fragment dziedziczący po listFragment. Dodatkowo dzięki metodzie onListItemClick można zaimplementować zdarzenie po kliknięciu w element listy.

Dodatkowo do naszej metody trzeba zaimplementować klasy RSSModel

[java]
class RSSModel
{
private String Title;
 private String Link;
 private String Date;
 public String getTitle() {
 return Title;
 }

public void setLink(String string) {
 Link=string;
 }

public void setDate(String string) {
 Date=string;
 }

public void setTitle(String string) {
 Title=string;
 }

public String getLink() {
 return Link;
 }
 public String getDate() {
 return Date;
 }
 public RSSModel() {
 }
}

[/java]

oraz najważniejsze w przypadku listy. czyli adapter:

[java]
class RSSAdapter extends ArrayAdapter<rssmodel>{

private final Activity context;
 private ArrayList</rssmodel><rssmodel> rssy;
 /*
 * Konstruktor pobierający listę RSS, ustawiający layout dla linijek naszego rss
 */
 public RSSAdapter(Activity context, ArrayList</rssmodel><rssmodel> lista) {
 super(context, R.layout.rssrow, lista);
 this.context = context;

 this.rssy=lista;

 }

 static class ViewHolder {
 public TextView tytul;
 public TextView date;
 }

@Override
 public View getView(int position, View convertView, ViewGroup parent) {
 ViewHolder holder;
 View rowView = convertView;
 if (rowView == null) {
 LayoutInflater inflater = context.getLayoutInflater();
 rowView = inflater.inflate(R.layout.rssrow, null, true);
 holder = new ViewHolder();

 holder.tytul= (TextView) rowView.findViewById(R.id.title);
 holder.date=(TextView) rowView.findViewById(R.id.date);

rowView.setTag(holder);
 } else {
 holder = (ViewHolder) rowView.getTag();
 }
 //Przypisanie elementów z arraylist do wierszy naszej listy
 holder.tytul.setText(rssy.get(position).getTitle());
 holder.date.setText(rssy.get(position).getDate());
 return rowView;
 }
}

[/java]

Takim oto sposobem, nasz fragment powinien wyglądać tak:

<a href="http://szymonmotyka.pl/wp-content/uploads/2012/11/rssandroid1.png"><img class="aligncenter size-medium wp-image-659" title="rssandroid" alt="" src="http://szymonmotyka.pl/wp-content/uploads/2012/11/rssandroid1-180x300.png" width="180" height="300" /></a>

Teraz zabierzmy się za nasz prosty czytnik RSS. Ze względów estetycznych. Utworzę do niego osobną metodę, która zwracać będzie ArrayList&lt;RSSModel&gt;. Uwierzcie. Dawanie wszystkich instrukcji do głównej metody utrudnia nam potem wrócenie do tego kodu ;)

I teraz zaczyna się zabawa:

<strong>RSS:</strong>

[java]

private ArrayList</rssmodel><rssmodel> getRSS()
 {
 String url="http://szymonmotyka.pl/feed/";
 SAXParserFactory factory = SAXParserFactory.newInstance();
 SAXParser saxParser;
 RssParseHandler handler = new RssParseHandler();

try {
 saxParser = factory.newSAXParser();
 saxParser.parse(url, handler);

} catch (ParserConfigurationException e1) {
 e1.printStackTrace();
 } catch (SAXException e1) {
 e1.printStackTrace();
 } catch (IOException e) {
 // TODO Auto-generated catch block
 e.printStackTrace();
 }
 return handler.getItems();
 }

[/java]

Wywołujemy metodę,

rsslist=getRSS();

w onCreateView.

a na końcu dodajemy klasę :

[java]

class RssParseHandler extends DefaultHandler {

 private ArrayList</rssmodel><rssmodel> rssItems;

private RSSModel currentItem;

private boolean parsingTitle;
 private boolean parsingLink;
 private boolean parsingDate;

public RssParseHandler() {
 rssItems = new ArrayList</rssmodel><rssmodel>();
 }
 public ArrayList</rssmodel><rssmodel> getItems() {
 return rssItems;
 }
 @Override
 public void startElement(String uri, String localName, String qName, Attributes attributes) throws SAXException {
 if ("item".equals(qName)) {
 currentItem = new RSSModel();
 } else if ("title".equals(qName)) {
 parsingTitle = true;
 } else if ("link".equals(qName)) {
 parsingLink = true;
 } else if ("pubDate".equals(qName))
 parsingDate=true;

 }
 @Override
 public void endElement(String uri, String localName, String qName) throws SAXException {
 if ("item".equals(qName)) {
 rssItems.add(currentItem);
 currentItem = null;
 } else if ("title".equals(qName)) {
 parsingTitle = false;
 } else if ("link".equals(qName)) {
 parsingLink = false;
 } else if ("pubDate".equals(qName)) {
 parsingDate = false;

 }

 }
 @Override
 public void characters(char[] ch, int start, int length) throws SAXException {
 if (parsingTitle) {
 if (currentItem != null)
 currentItem.setTitle(new String(ch, start, length));
 } else if (parsingLink) {
 if (currentItem != null) {
 currentItem.setLink(new String(ch, start, length));
 parsingLink = false;
 }
 } else if (parsingDate) {
 if (currentItem != null) {
 currentItem.setDate(new String(ch, start, length));
 parsingDate = false;
 }
 }
 }
}

[/java]

za pomocą tej klasy parsujemy nasz xml z RSS, dzięki czemu otrzymujemy ArrayListę z obiektami typu RSSModel potrzebnymi do naszego adaptera. Oczywiście nic nie stoi na przeszkodzie, by  pobrać jeszcze obrazki. Ale to  juz zależy od was.

Zostało już tylko dodanie fragmentu RSS w MainActivity:

<strong>fragments.add(Fragment.instantiate(this, RSS.class.getName())); </strong>

<strong>Na końcu:</strong>

Jeżeli nie dodaliście reklam, pominęliście itp to prawdopodobnie nie dodaliście jeszcze pozwolenia na używanie internetu.

W tym celu wchodzimy do manifestu. Osobiście preferuję edycję xml, więc przechodzimy do zakładki AndroidManifest.xml

[xml]

<manifest xmlns:android="http://schemas.android.com/apk/res/android"
 package="pl.szymonmotyka.tutorialrandomizer"
 android:versionCode="2"
 android:versionName="1.1">

<uses -sdk
 android:minSdkVersion="8"></uses>
 <uses -permission android:name="android.permission.INTERNET"></uses>
 <uses -permission android:name="android.permission.ACCESS_NETWORK_STATE"></uses>

 <application android:icon="@drawable/ic_launcher"
 android:label="@string/app_name"
 android:theme="@style/AppTheme">
 <activity android:name=".MainActivity"
 android:label="@string/app_name" android:screenOrientation="portrait">
 <intent -filter>
 <action android:name="android.intent.action.MAIN"></action>

<category android:name="android.intent.category.LAUNCHER"></category>
 </intent>
 </activity>
 </application>

</manifest>

[/xml]

Poza pozwoleniami &lt;uses-permission&gt;  dodałem jeszcze atrybut do activitity android:screenOrientation="portrait"

<a href="http://szymonmotyka.pl/wp-content/uploads/2012/11/rssandroid2.png"><img class="aligncenter size-medium wp-image-661" title="rssandroid2" alt="" src="http://szymonmotyka.pl/wp-content/uploads/2012/11/rssandroid2-180x300.png" width="180" height="300" /></a> Źródło: https://dl.dropbox.com/u/14815030/prog6zip.zip

Aplikacja również w markecie: https://play.google.com/store/apps/details?id=pl.szymonmotyka.tutorialrandomizer

<strong>Czynik RSS oparty o : http://www.itcuties.com/android/how-to-write-android-rss-parser/ . Lista pokazana na własnym przykładzie</strong>

Jeżeli jeszcze was nie zanudziłem, zapraszam do oczekiwania na kolejne części. W planach : SQLite, zewnętrzne biblioteki. Zapraszam również do polubienia i częstego odwiedzania: https://www.facebook.com/SzymonMotykapl</rssmodel></pre></rssmodel>
