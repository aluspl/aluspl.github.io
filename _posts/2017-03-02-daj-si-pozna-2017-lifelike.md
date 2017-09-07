---
layout: post
title: Daj się poznać 2017 - LifeLike
date: 2017-03-02 13:00
author: admin
comments: true
categories: [Daj Się poznać, dsp, LifeLike, RogueLike, Unity3d]
---
Po weekendowym męczeniu “drugiej połówki” na temat klas postaci oraz moim sposobie na generowania map, postanowiłem tworzyć mapę kafelkową, z czego ściany, będą dostępne jako dodatkowy obiekt.
Let’s Begin!

<!--more-->
<h2>Narzędzia:</h2>
Jak wspominałem w poprzedniej części, używam Maca do produkcji. Powody są 2: jak kupowałem, był tańszy niż Dell i Surface o tych samych parametrach. No i dobrze mi się pracuje na tym systemie :)
<strong>Unity 5</strong>

[caption id="attachment_1590" align="aligncenter" width="785"]<a href="http://szymonmotyka.pl/wp-content/uploads/2017/02/Screen-Shot-2017-02-19-at-21.41.22.png"><img class="size-large wp-image-1590" src="http://szymonmotyka.pl/wp-content/uploads/2017/02/Screen-Shot-2017-02-19-at-21.41.22-785x490.png" alt="" width="785" height="490" /></a> Unity3d[/caption]

<strong>InteliJ Rider EAP</strong>
Polecam, ale trzeba wrzucić do Unity skrypt (znajdziecie w moim projekcie), który poprawnie eksportuje i komunikuje Unity3d z Rider EAP

[caption id="attachment_1591" align="aligncenter" width="785"]<a href="http://szymonmotyka.pl/wp-content/uploads/2017/02/Screen-Shot-2017-02-19-at-21.41.31.png"><img class="size-large wp-image-1591" src="http://szymonmotyka.pl/wp-content/uploads/2017/02/Screen-Shot-2017-02-19-at-21.41.31-785x491.png" alt="" width="785" height="491" /></a> Rider EAP[/caption]
<h2>Generowanie Map:</h2>
System, który stworzyłem do generowania map jest oparty na kafelkach. Osobny kafelek to ściana, osobny będzie jako drzwi i osobny jako podłoga. Wszystko generowane w macierzy 2-wymiarowej złożonej z enumów, które nazwałem *MapElement* . Prawdopodobnie, pokoje będą inaczej generowane -&gt; i to nie tylko samo tworzenie pokojów, ale również wszelkiego rodzaju elementów typu skrzynki z dropem czy innymi elementami, które są charakterystyczne dla danego pomieszczenia.
MapManager będzie dodatkowo rozszerzony o zestaw tekstur, w zależności od typu pomieszczenia ;) Czy to ciasna wilgotna piwnica dla IT czy piętro w złej korpo :) A może i coś bardziej ekstremalnego, jak np. jaskinia czy złomowisko.
Cały plik z generatorem można znaleźć na githubie, który zamieściłem w ostatnim wpisie :) w Scripts\MapUtils
Póki co, przyjąłem, że podłoga to jeden kafelek, a ściana to inny kafelek :)

[caption id="attachment_1592" align="aligncenter" width="785"]<a href="http://szymonmotyka.pl/wp-content/uploads/2017/02/Screen-Shot-2017-02-19-at-23.28.40.png"><img class="size-large wp-image-1592" src="http://szymonmotyka.pl/wp-content/uploads/2017/02/Screen-Shot-2017-02-19-at-23.28.40-785x491.png" alt="Daj się Poznać" width="785" height="491" /></a> LifeLike[/caption]
<h2>Klasy Postaci:</h2>
Tu podchodzę bardziej tradycyjnie. Typ klasy, zawiera określony zestaw skilli oraz tradycyjnych atrybutów inspirowanych przez np. serię *Fallout*. Póki co, klasy które wymyśliłem to:
-<em>Menel</em>: taki współczesny odpowiednik Wiedźmina, tylko, że zamiast mikstur…mamy alkohole…bez których mamy statystyki ujemne (kac). Jest jeszcze okres po kacu, gdzie jest po prostu przeciętnie, ale statystyki będą się zmniejszały z racji uzależnienia. Dodatkowo postać zacznie na śmietniku ;)
-<em>Klasa IT:</em> Haking czy walka klawiaturą to dla niego chleb powszedni. Duszenie myszką bezprzewodową przeciwnika będzie jego specjalnym skillem, a przeciwników może dodatkowo uśpić za pomocą skilla aktywnego: “Tech Gadka”

Z pewnością pojawi się więcej typów klas, które zostaną opisane. A dotychczas przedstawione… kto wie, może ulegną zmianie. Bo jak wiadomo, w wirze pracy, różne pomysły przychodzą człowiekowi do głowy. :)

Podsumowanie:
Po resztę zapraszam na githuba oraz na kolejne odcinki tutaj. Następny planowany wpis będzie również skupiony na mapie -&gt; bardziej zaawansowany sposób na generowanie map.

P.S. Tak na podsumowanie, ładny render pustej mapy :) Czyli ramki + ładnych kafelków stworzonych w gimpie :D

P.S 2 Roboczy tytuł gry : <strong>LifeLike </strong>

<a href="http://szymonmotyka.pl/wp-content/uploads/2017/02/giphy.gif"><img class="aligncenter size-full wp-image-1593" src="http://szymonmotyka.pl/wp-content/uploads/2017/02/giphy.gif" alt="" width="500" height="313" /></a>
