---
layout: post
title: LifeLike: Input Manager i Podsumowanie
date: 2017-05-14 21:36
author: Alus
comments: true
categories: [Daj Się poznać, dsp, dsp2017, LifeLike, Programowanie, Unity3d, unity3d]
---
W tej części zajmijmy się 2. rzeczami. 1. -sterowaniem (własny Input Manager) , o którym ostatnio wspominałem, 2. - podsumowanie projektu. To, co mi się udało skończyć i jak daleko zostało mi do końca. Jest to 20 post, więc stąd ta ckliwość.
<!--more-->
<h2>System Turowy</h2>
Trochę ulepszony system turowy pozwolił rozwiązać problem ze zbyt dalekim poruszaniem się w jednym ruchu. Rozwiązaniem tym okazało się WaitForSecond i wrzucenie ruchów przeciwnika w IEnumerator, który zwraca właśnie to WaitForSecond. Po wszystkim nastaje tura gracza.

[csharp]
	  var coroutine = EnemyUtils.EnemiesMove(PlayerObject);
           StartCoroutine(coroutine);
[/csharp]

W wyniku tej operacji, możemy ruszać się trzymając klawisz, ale tylko w swojej turze, co określony czas.
<h2>Input Manager</h2>
Jak wspominałem w poprzednim wpisie, domyślny Input Manager w Unity jest strasznie ograniczony.
Jednym z ograniczeń jest ustawienie klawiszy przez Unity, drugim problemem okazał się pad Xbox One (choć nie wiem, jak to wygląda z innymi kontrolerami) i innym mapowaniem przycisków. Na forach i Slacku często polecają albo eksperymentalne systemy do sterowania m.in od Unity, które można znaleźć np. na blogu Unity lub kupić w asset store. Innym rozwiązaniem jest napisanie swojego własnego systemu.
Skoro już uparłem się na własne doświadczenia to i tutaj pójdę dalej z swoją upartością: stworzę swój własny Input Manager.
W 1. fazie będzie miał tylko predefiniowane klawisze w zależności od kontrolera lub w przypadku braku kontrolera … wybór klawiatury. W późniejszej wersji będzie to bardziej inteligentne - tzn. obsługa klawiatury i pada jednocześnie, jak to ma miejsce w nowoczesnych grach.
Dodatkowo InputManager podobnie jak GameManager jest instancją typu Singleton, która będzie inicjowana na początku gry.
Nie ukrywam, że będzie rozwijany o własne menu ustawiania klawiszy.
Dodatkowo, w przyszłości pojawi się rozszerzenie do tego modułu w postaci przypisania swoich klawiszy.

&nbsp;
<h2>Niepowodzenia</h2>
Niestety zacznę od tego, czego nie udało się osiągnąć:
1. Animacji postaci i walki
2. Wprowadzić scenariusza
3. Wprowadzić niektórych planowanych specjalnych umiejętności
4. Dodać dźwięki
5. Dodać ozdoby na mapie
<h2>Powodzenia</h2>
Nie można w życiu narzekać, w końcu wszystko, co złe, może przerodzić się w dobro :) Więc to, co mi się udało wykonać w trakcie konkursu:
1. Wprowadziłem System walki
2. Wprowadziłem Cykl Dnia i Nocy
3. Interfejs tworzenia postaci i podglądu statystyk
4. Przeciwnicy nas śledzą
5. The Ball is Still Alive!
6. Losowe Mapy
7. Własny Input Manager
<h2>Podsumowanie</h2>
Nie kończę swojego cyklu tym wpisem, mimo że jest on 20. Nie zaszkodzi w końcu dodać jeszcze 2-3 wpisów :) Podejrzewam, że nie uda mi się naprawić niepowodzeń, ale przynajmniej postaram się pójść w stronę naprawy tego.
Zmiany nie są jednak na tyle duże, aby tworzyć nowej wersji web playera, tak więc wersja 6:

<a href="https://aluspl.github.io/RogueLikeDSP/Versions/version6/">https://aluspl.github.io/RogueLikeDSP/Versions/version6/</a>

oraz kod dostępny na githubie:

<a href="https://github.com/aluspl/RogueLikeDSP">https://github.com/aluspl/RogueLikeDSP</a>
Przy okazji, po konkursie spodziewajcie się skrótowych wpisów dotyczących aktualizacji.

&nbsp;

A na bonus:

<a href="http://szymonmotyka.pl/wp-content/uploads/2017/05/DJI_0087.jpg"><img class="aligncenter size-large wp-image-1776" src="http://szymonmotyka.pl/wp-content/uploads/2017/05/DJI_0087-785x442.jpg" alt="Input Manager" width="640" height="360" /></a>
