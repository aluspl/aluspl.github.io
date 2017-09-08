---
author: Alus
comments: true
date: 2017-07-25 23:01:14+00:00
layout: post
link: http://szymonmotyka.pl/lifelike-rpg-web-czyjebnie-pl/
slug: lifelike-rpg-web-czyjebnie-pl
title: 'LifeLike: RPG & WEB i CzyJebnie.pl'
wordpress_id: 1834
categories:
- Blog
- Programowanie
- Unity3d
tags:
- ASP.NET Core
- DajSię
- Docker
- dsp
- dsp2017
- Geek
- LifeLike
- unity3d
- VLOG
---

Hej, dzisiaj chciałbym poruszać tematykę małych update’ów.
Pierwszym jest gra **LifeLike**, a drugim serwis **LifeLike** oraz jeden mały bonus :)


## LifeLike: RPG


Trochę dawno nie robiłem aktualizacji w tym temacie, ale w końcu skończyłem 1. wersję ekwipunku! :)

Tzn. jest okno pod klawiszem "i" z wyborem ekwipunku (lista) na razie z predefiniowanymi elementami, które możemy wybrać do naszego ekwipunku.

(http://szymonmotyka.pl/wp-content/uploads/2017/07/Screenshot-2017-07-06-23.05.38.png) Ekwipunek v 0.1

Link do repo:[ https://github.com/aluspl/RogueLikeDSP](https://github.com/aluspl/RogueLikeDSP)


## LifeLike: Web


Ostatnio zamiast na rozwijaniu gry, skupiam się na projekcie strony, o czym ostatnio wspominałem.
Obecnie najnowszą zmianą jest dodanie dynamicznych stron na bazie znaczników **markdown** oraz galerii. Dodatkowo zmieniłem cały CSS na jaśniejszy motyw.

(http://szymonmotyka.pl/wp-content/uploads/2017/07/Screenshot-2017-07-26-23.09.59.png) Nowa strona główna Lifelike.pl

Strona może korzystać też opcjonalnie z bazy **SQLite** (w startup.cs wystarczy odkomentować fragment z SQLite).
Dodatkowo galeria posiada początkowe formatowanie - tu dodanie tekstu w markdown.
Tak samo linki do Youtube’a, teraz wystarczy wkleić cały link, a nie tylko ID.

Warto tez wspomnieć o innym kluczowym feature tej wersji **Galeria Zdjęć**:

[![](http://szymonmotyka.pl/wp-content/uploads/2017/07/Screenshot-2017-07-20-17.54.11-785x491.png)](http://szymonmotyka.pl/wp-content/uploads/2017/07/Screenshot-2017-07-20-17.54.11.png)Link do repo: [https://github.com/aluspl/LifeLIke](https://github.com/aluspl/LifeLIke)


## CzyJebnie.pl


Tak, trochę bekowo i na luzie zrobiłem swoją własną “pogodynkę”.
Przyznam, że miałem poważny dylemat, co do wyboru źródła, z którego mają pochodzić dane. Czyli które API wybrać.
Wygrało **https://api.darksky.net/** ze względu na prostotę. Czy będę tego żałował ? Zobaczę ;) Najwyżej przejdę na openweathermap.
Zainspirowało mnie do tego projektu sobotnie ognisko i mem z kotem (Andrzej, To jebnie).
Domena http://czyjebnie.pl była dostępna i kupiłem na thecamels.org za 10 zł. Przyznam, że z racji irytującego zmieniania się półki cenowej na **Azure**, wolałem nie ryzykować z przekroczeniem budżetu 25$ , które jak ostatnio wspominałem każdy może dostać za konto w visualstudio.net. Wybrałem więc technologię zwaną **DOCKER**, którą przybliżył nam na warsztatach Michał Franc ([link](http://mfranc.com/)) .
Użyłem więc **DigitalOcean**: ([https://m.do.co/c/a0ee3602fd94](https://m.do.co/c/a0ee3602fd94)) , gdzie na start z ref linka dostałem 10$ dolarów (to jakieś 2 miesiące serwera ubuntu z 20GB dyskiem). Do 2-3 mikroserwisów nada się idealnie.
Ponownie wykorzystałem **ASP.NET Core** jako technologię. Tym razem jednak będę się ograniczał z razerem. Głównie będzie to API plus strona z instrukcją :)

[code]
http://czyjebnie.pl/Pogoda/{Miasto} 
[/code]

Powyższe zapytanie pobierze stan dla danego miasta. Obecnie zwraca najbliższą pogodę, w której będzie padać, jeśli nie będzie - zwraca słoneczko :)

(http://szymonmotyka.pl/wp-content/uploads/2017/07/Screenshot-2017-07-26-23.24.52.png) Andrzej, to jebnie: Użyj Parasola

Link do repo: [https://github.com/aluspl/MicroServiceToJebnie](https://github.com/aluspl/MicroServiceToJebnie)


## Vlog i sprzęt


Postanowiłem rozszerzyć trochę działalność VLOG’ową :) Taki kierunek dla własnego rozwoju, swojej charyzmy itp.
Tym razem mniej gadany odcinek 4: Żywiec

[embed]https://www.youtube.com/watch?v=SC4o9JqI_aA[/embed]

Użyłem do niego Xiaomi Yi 4k+ i DJI Mavic Pro.


### Xiaomi Yi4k+


O dronie już wspominałem nie raz. Kamerka to świeży zakup, wraz z gimbalem (który odebrałem po nagraniu filmu).
Kamerka już w standardzie w 4k ma znacznie lepszą stabilizację, niż kamerka 1. generacji na FHD. (zdjecie kamerki). Jest też znacznie bardziej energooszczędna (2.5x trzeba było ładować 1gen na jedno działanie 4k+). Niestety, podobnie jak dron i inne sprzęty 4k: wymaga szybkiej karty SD o dużej pojemności. 16GB = 12 min w 4k/25fps. Opcję Timelapse, itp. pokażę obszerniej w następnym odcinku, ale już w tym widać fragmenty z miasta Żywca.

Generalnie, samą kamerą byłoby znacznie stabilnych więcej ujęć z Grecji, a z Gimbalem to już poezja :)


### Gimbal:


(http://szymonmotyka.pl/wp-content/uploads/2017/07/20170717_191028.jpg) Feiyu Tech G5 z Xiaomi Yi 4k+

Feiyu Tech 5G. Na początku myślałem o SPG Live, którego użyłbym też do telefonu, ale jak to się mówi “Co jest do wszystkiego to jest do niczego”, więc skupiłem się tylko na jednym celu. Póki, co jestem zadowolony z wszystkiego poza dwoma funkcjami:
* Aplikacja na androida wygląda strasznie
* Brakuje mi opcji połączenia kamerki z gimbalem i przycisku który uruchamia nagrywanie/robienie zdjęć, itp.

Więcej o nim powiem, w następnym odcinku  ;)

(http://szymonmotyka.pl/wp-content/uploads/2017/07/Screenshot_20170718-091545.png) Appka pisana na kolanie chyba ;)




## Projekt Gamedevowy


Inicjatywa Slackowo - Wrocławska. Więcej o niej powiem wkrótce :) póki co przedstawiam wam etap planowania:

(http://szymonmotyka.pl/wp-content/uploads/2017/07/padbar.jpg) Projektowanie Gry: Faza pomysłów z pokemonową Inspiracją


## Podsumowanie


To tyle na dzisiaj. Chyba wyczerpałem wszystkie kluczowe tematy. Jak zwykle zapraszam na kanał oraz powyższe strony. Jeśli macie jakieś sensowne pomysły, na niewkurzające innych “**monetyzacje**” (przynoszące mamonę) projekty, to dajecie śmiało :)

Przy okazji udzieliłem się na blogu Sowy, która także uczestniczyła na DSP2017  [ http://sowaprogramuje.pl/czy-programowanie-jest-trudne/  ](http://sowaprogramuje.pl/czy-programowanie-jest-trudne/)

Jeśli chcecie rozszerzenia konkretnej części, technologii lub tematu który do tej pory opisałem! Piszcie!
Przy okazji: Mam nowe logo!
[![](http://szymonmotyka.pl/wp-content/uploads/2017/07/logo-300x225.png)](http://szymonmotyka.pl/wp-content/uploads/2017/07/logo.png)
