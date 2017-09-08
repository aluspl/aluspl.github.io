---
author: Alus
comments: true
date: 2017-05-10 21:21:25+00:00
layout: post
link: http://szymonmotyka.pl/lifelike-next-level-game-over/
slug: lifelike-next-level-game-over
title: 'LifeLike: Next Level i Game Over'
wordpress_id: 1766
categories:
- Android
- Daj Się poznać
- Unity3d
tags:
- dsp
- dsp2017
- LifeLike
- unity2d
- unity3d
---

W obecnej wersji gry wprowadziłem nową klasę postaci, która wkrótce otrzyma specjalne zdolności. Podpowiem tylko, że będzie wykorzystana charyzma. Ten post miał być znacznie dłuższy, miał mieć conajmniej 2 akapity o przejściu na nowy sposób sterowania ale…
<!-- more -->


## Problem z sterowaniem


Problem, który poruszę w następnym wpisie. Dokładniej mówiąc problem z implementacją innego kontrolera oraz poprawnym skonfigurowaniu ruchów pada.
Dodatkowo, na Macu jest inne bindowanie na przyciski pada, niż na Windowsie i Linuxie. O ustawieniu czułości już nawet nie mówię. Porusza się jak FLASH! (nie, nie ten od Adobe)

```id="attachment_1772" align="aligncenter" width="640"][![LIfeLIke](http://szymonmotyka.pl/wp-content/uploads/2017/05/Screenshot-2017-05-10-22.01.39-785x491.png)](http://szymonmotyka.pl/wp-content/uploads/2017/05/Screenshot-2017-05-10-22.01.39.png) Wersja Webowa```


## Game Over


W poprzedniej części można było zabić przeciwnika, ale gdy on nas dobił.. nic się nie działo.
W tej wersji już to zmieniłem. W GameManagerze dodałem opcję GameOver, która czyści obiekty i wyrzuca nas do głównego menu. Możliwe , że ulepszę jeszcze zakończenie o okno statystyk z gry - takie podsumowanie.

```
 public void GameOver()
    {
        Destroy(_gameUI.gameObject);
        Destroy(Instance);
        SceneManager.LoadScene(0);
    }
```

Więc **GameOver**, koniec gry :) Jesteśmy zabici, musimy zacząć od początku … życie jest brutalne!


## Next Level


Po wejściu na czerwony punkt na mapie, przechodzimy do następnej mapy. Dodatkowo, zmienia się pora dnia a mapa generuje się na nowo. Razem z przeciwnikami. Tylko nasza postać przechodzi do następnej mapy.
Takie zamierzenia osiągnąłem za pomocą wrzucenia boxcollidera na schody, które są umieszczone na mapie, a następnie jeśli wstąpimy na nie, otwiera się nowa mapa.
Będzie trzeba pomyśleć jeszcze, żeby każda mapa dodatkowo różniła się od poprzedniej, ale to w późniejszej fazie rozwoju.
Dodatkowo, światło w grze jest niezależne od postaci, możemy je tylko włączyć lub wyłączyć pod klawiszem F.


## Tworzenie postaci w LifeLike


Przypominam, że na obecną chwilę, bez umiejętności specjalnych, najważniejsze jest Endurance (HP), Strength (Siła ataku), Agility (szansa na atak i unik). Miejcie to na uwadze, przy tworzeniu postaci.

[![LifeLIke](http://szymonmotyka.pl/wp-content/uploads/2017/05/Screenshot-2017-05-10-22.46.37-785x491.png)](http://szymonmotyka.pl/wp-content/uploads/2017/05/Screenshot-2017-05-10-22.46.37.png)


## Podsumowanie


To tyle na dzisiaj. DSP zbliża się ku końcowi, ale gra będzie dalej rozwijana. Dodatkowo nowa wersja gry z paroma ulepszeniami dostępna jest pod adresem : [https://aluspl.github.io/RogueLikeDSP/Versions/version6/](https://aluspl.github.io/RogueLikeDSP/Versions/version6/)

kod w aktualnej postaci dostępny jest na Githubie: [https://github.com/aluspl/RogueLikeDSP](https://github.com/aluspl/RogueLikeDSP)
Niestety przed końcem konkursu nie uda mi się stworzyć ekwipunku, ale wierzę, że skończę jeszcze chociaż specjalne umiejętności. Mam jednak nadzieję, że nawet po DSP zostaniecie ze mną i będziecie śledzić kolejne etapy rozwoju, w tym powstawanie i wykorzystanie wyżej wspomnianego ekwipunku.

```id="attachment_1773" align="aligncenter" width="480"][![LifeLIke](http://szymonmotyka.pl/wp-content/uploads/2017/05/giphy-1.gif)](http://szymonmotyka.pl/wp-content/uploads/2017/05/giphy-1.gif) Kto zgasił światło ?```
