---
author: Alus
comments: true
date: 2017-04-15 21:57:01+00:00
layout: post
link: http://szymonmotyka.pl/lifelike-walka-bezposrednia/
slug: lifelike-walka-bezposrednia
title: LifeLike - Walka Bezpośrednia
wordpress_id: 1693
categories:
- Daj Się poznać
- Programowanie
- Unity3d
tags:
- dsp
- dsp2017
- gamedev
- LifeLike
---

A w przyszłości i dystansowa :)

Tematem dzisiejszego wieczorno-sobotniego wpisu jest kolejna część dotycząca walki. Byłem świadkiem wpisów na blogach, które mają maksymalnie po 2-3 zdania, 2 razy w tygodniu i to totalnie o niczym. Nie chcę iść tą drogą, ale niestety skutkuje to tym, że ciężko mi czasami wrzucić 2 posty tygodniowo. Dzisiaj przechodzimy do kolejnej części na temat walki, czyli to, czym roguelike żyją .. lub nie :)

<!-- more -->


## W poprzednim odcinku


Ostatnio na slacku zarzucił mi ktoś, że brakuje mi podsumowań tego, co było we wcześniejszych wpisach, dlatego ten akapit poświęcę właśnie na to. Ci, co wiernie czytali, wiedzą że poprzednio poruszyłem ważną tematykę w roguelike, czyli walkę. Testowałem ją w unit testach, dodałem statystyki (wiem, jeszcze bez percepcji). Ważnym elementem były też klasy w naszej grze. Teraz przyszedł czas na kolejny etap. Dzisiaj - dodawanie przeciwnika, jutro zaimplementowanie walki. W kolejnych odcinkach UI (User Interface) oraz poruszanie przeciwnika w turach.


## Wróg!


Podobnie jak nasza postać, przeciwnik będzie opierał się na klasie abstrakcyjnej - MoveObjects, ale w przeciwieństwie do nas, będzie miał swoje statystyki w klasie Enemy. Podobnie jak nasz Gracz, będzie bazować na klasach, a tym samym na tych samych metodach. Będzie posiadać te same statystyki i na obecną chwilę … będą czerwoni. :) Jeśli ktoś ma zamiar zarzucić mi inspirację **SuperHot** … Ma rację!

```
 public BaseCharacter EnemyCharacter { get; set; }

        public Enemy()
        {
            EnemyCharacter = EnemyUtils.GenerateEnemy();
        }
```



## Statystyki i Klasa


Wybaczcie, ale na obecną chwilę, przeciwnik będzie miał wszystkie statystyki równe 1. Imię jego to “Any Enemy” … i nie będzie się jeszcze dzisiaj poruszał. Ale będzie miał ładny generator. :)

```
   public static BaseCharacter GenerateEnemy()
        {
            var classes = CharacterFactory.EnemyClassList();
            var statistic = new CharacterStatisticDataModel()
            {
                Agility = 1,
                Charisma = 1,
                CurrentExperience = 0,
                Endurance = 1,
                Inteligence = 1,
                Level = 1,
                Name = "Enemy",
                Strength = 1
            };
            return CharacterFactory.GetPlayerClass(classes.FirstOrDefault().Key, statistic);
        }
```



## Podsumowanie


To tyle na dzisiaj, wybaczcie, że jeszcze was nie ugoszczę ładnym screenem, ani kolejnym demem, ale obiecuję, że doczekacie się wkrótce skromnego gifa, web playera, a kto wie, może i w najbliższym czasie jakiegoś gameplaya na kanale YT.

Pozdrawiam i Wesołych Świąt

[![LifeLIke](http://szymonmotyka.pl/wp-content/uploads/2017/04/GREECE-61-785x520.jpg)](http://szymonmotyka.pl/wp-content/uploads/2017/04/GREECE-61.jpg)
