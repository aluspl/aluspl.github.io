---
author: Alus
comments: true
date: 2017-04-02 20:59:04+00:00
layout: post
link: http://szymonmotyka.pl/lifelike-postac-statystyki/
slug: lifelike-postac-statystyki
title: LifeLike - Postać i Statystyki
wordpress_id: 1676
categories:
- Daj Się poznać
- Unity3d
tags:
- character
- dsp
- dsp2017
- postac
- Unity
---

Ostatnio poruszyłem temat Testów, które przydadzą się do kolejnego punktu - postaci. W końcu od tego zaczęły się moje koncepty. Moja druga połówka trochę mi pomogła, jak rozpisywałem, jak to widzę na ścianie, za co jej ogromnie dziękuje. Więc zapraszamy do cyklu : Postać i Statystyki


## Testy


Wróćmy do testów z poprzedniej części ([link](http://szymonmotyka.pl/lifelike-tdd/)), bo jest to integralna część tego fragmentu wpisu. Niestety, dodatkowe projekty w Solucji, które nie są od Unity, są czyszczone przy każdym przeładowaniu, więc trzeba ręcznie dodać wcześniej stworzony projekt z testami do naszej solucji, za każdym razem, gdy się solucja nadpisuje przez edytor Unity. Z racji, że ostatnio pracuję bardziej na kodzie, nie muszę się aż tak często męczyć. Wszelkie testy można znaleźć na githubie w projekcie Test.


## Base Character


Klasa, która określa zarys postaci. Czy to naszej, czy przeciwnika. Odpowiada za ataki, specjalne ataki, statystyki postaci, jej punkty życia. Każda klasa postaci, którą tworzę, dziedziczy po niej, dodając do głównych funkcji dodatkowe, jak np. więcej typów ataków.
Dzięki tej uniwersalności, łatwiej zrobić back-end do ataków, oraz zrobić je bardziej generyczne. Po prostu same plusy z obiektowego punktu tworzenia gier. Jak to powinno praktycznie wyglądać ? Może ktoś mi powie, kto jest bardziej wprawiony.
Dzięki temu sposobowi, łatwiej będziemy mogli się dostać do statystyk dla naszej postaci, np. z poziomu UI.


## Tworzenie postaci


Żeby nie iść w złe nawyki i byle jaki kod, stworzyłem **CharacterFactory**, który zwraca klasę ze statystykami, w zależności od naszej nazwy. W praktyce, w późniejszej fazie i po obliczeniach dla systemu walki itp. Charakterystyki startowe, będą charakterystyczne dla danej klasy, a potem w fazie rozwoju, będziemy mogli je rozszerzać…
Na tworzenie postaci, stworzyłem testy większości funkcji, choć nie są kompletne ... jeszcze :)
W każdym bądź razie, system walki ma swoje zaczątki, jednak będzie brane pod uwagę coś więcej niż siła, a każde wyliczenie do podstawowej walki będzie brane pod unit testy, więc spokojnie :)

Przy okazji stworzyłem nowe klasy : Super Hobo (styl małpy, wiedźmińskie alkohole itp)  oraz klasy, które będą skupione na przeciwnikach jak Boss, Hobo itp
```c# 

 public static BaseCharacter GetPlayerClass(string classType, CharacterStatisticDataModel statistic )
        {
            switch (classType)
            {
                case ItGuyClass.ClassType:
                    return new ItGuyClass(statistic);

                case SuperHoboClass.ClassType:
                    return new SuperHoboClass(statistic);
                case HoboClass.ClassType:
                    return new HoboClass(statistic);
                case CorpoBoss.ClassType:
                    return new CorpoBoss(statistic);
                case CorpoRat.ClassType:
                    return new CorpoRat(statistic);
                default:
                    return  null;
            }
        }
```c# 



## Atak


W początkowej fazie **Damage** = **Siła**.
Lecz w następnych etapach rozgrywki, powodzenie ataku będzie zależne od zręczności obu postaci, a siła ataku będzie liczbą losową zmniejszoną o przyszły ekwipunek postaci. Oczywiście szansa uniku będzie tym większa, im większa różnica zręczności, a sam atak będzie liczbą losową (taaak, grało się w **RPG**).

```c# 

    public virtual string Attack(BaseCharacter enemy)
        {
            var damage = Strength;
            enemy.HealthPoint -= damage;
            return GameLogSystem.Attack(damage, enemy);
        }
```c# 



## Podsumowanie


To tyle na dzisiaj, postać będzie rozwijana przez co najmniej 2-3 części, ale nie pominę oczywiście tworzenia przeciwnika na mapie oraz UI przygotowanego do walki (wyświetlanie logów, ataku itp).
Miłego czytania :)

Cały kod dostępny na porn... znaczy **githubie**!
