---
author: Alus
comments: true
date: 2017-04-30 12:16:07+00:00
layout: post
link: http://szymonmotyka.pl/lifelike-przyloz-swojemu-wrogowi/
slug: lifelike-przyloz-swojemu-wrogowi
title: LifeLike - Przyłóż swojemu wrogowi!
wordpress_id: 1744
categories:
- Daj Się poznać
- Programowanie
- Unity3d
tags:
- c#
- dotnet
- dsp
- dsp2017
- LifeLike
- unity3d
---

W ostatnich odcinkach na temat LifeLIke nauczyłem się, jak wybierać wrogów, jak tworzyć samego siebie (sooo deep! ). Dzisiaj ponownie wracamy do tematyki walki. Tym razem takiej praktycznej … ale tylko na pięści!
<!-- more -->


## Podsumowanie poprzednich odcinków


Jak pamiętacie, w poście na temat tworzenia postaci i walki ([Postać i Ataki](http://szymonmotyka.pl/lifelike-postac-i-ataki/)) poruszyłem już tematykę walki. Oprócz walk była jeszcze kwestia tworzenia samego siebie ([Tworzenie Postaci](http://szymonmotyka.pl/lifelike-tworzenie-postaci-okno-szczegolow/)) oraz tworzenia UI - w tym kluczowego Gamelog [Interfejs Użytkownika](http://szymonmotyka.pl/lifelike-interfejs-uzytkownika/).
W tym temacie chciałbym się skupić bardziej na walce bezpośredniej. W kodzie przeprowadziłem też trochę refactoringu.


## Zaznaczanie najbliższego przeciwnika


Skoro już poruszyłem temat zaznaczania przeciwnika (link), warto by było umożliwić graczowi podświetlenie tych, których możemy zaatakować, czyż nie? Ulepszyłem więc metodę do zaznaczania przeciwników, tylko tych, co są w ustalonym zasięgu:

```
            var nearby = GameManager.Instance.Enemies.Where(p=>p.Distance<=MAXDISTANCE).OrderBy(p => p.Distance).ToList();
```

Wypadało także zmienić zaznaczonego przeciwnika. W końcu ciężko zaznaczyć index przeciwnika, gdy bazujemy na liście tylko tych, co są nam najbliżsi! Obecnie wartość dla MAXDISTANCE wynosi 1 :)

```
  public static Enemy SelectedEnemy
        {
            get
            {
                return EnemyIndex!=-1 
                    ? GameManager.Instance.Enemies.FirstOrDefault(p=>p.IsSelected)
                    : null;
            }
        }
```



## Walka!


Gdy już mamy zaznaczonego przeciwnika, starczy kliknąć spacje, aby zaatakować. Szczerze, w obecnej sytuacji liczy się tylko **Agility** i **Strength**. Ok, jeszcze **Endurance** ma znaczenie dla naszej ilości punktów życia.
A to też ważne, choć w obecnej sytuacji tylko dla wroga (huehue). Dodałem procedurę śmierci przeciwnika z doświadczeniem dla nas:

```
  public void KillEnemy(Enemy enemy)
    {
        try
        {
            Enemies.Remove(enemy);
            Destroy(enemy.gameObject);
            EnemyUtils.EnemyIndex = -1;
        }
        catch (Exception)
        {
            Debug.Log("Enemy shouldn't be here!");
        }
    }
```

A więc po kliknięciu w spacje, sprawdza szansę na zaatakowanie i atakuje! Zresztą, tematykę już poruszyłem, tylko zmodernizowałem o …

[![LifeLIke](http://szymonmotyka.pl/wp-content/uploads/2017/04/Screenshot-2017-04-30-01.00.14-785x491.png)](http://szymonmotyka.pl/wp-content/uploads/2017/04/Screenshot-2017-04-30-01.00.14.png) Okno gry


## Logi Ataku w LifeLike


Wypadało trochę ulepszyć powiadomienia, co się właściwie dzieje. W końcu trzeba wiedzieć, czy wspomniany przeciwnik jeszcze żyje, za ile był nasz atak oraz jak miała na imię nasza ofiara. ;)
W **FightSystem** wrzuciłem UI do gettera, aby trochę ten kod upiększyć. **UI.AddLog(string)** wrzuca tekst do konsoli.
Dodatkowo, panel z tekstem dostał tło i został przypięty u dołu ekranu.[![LifeLIke](http://szymonmotyka.pl/wp-content/uploads/2017/04/Screenshot-2017-04-30-01.00.31-785x185.png)](http://szymonmotyka.pl/wp-content/uploads/2017/04/Screenshot-2017-04-30-01.00.31.png)Podsumowanie postu

Poniżej znajdziecie video z kolejnego gameplay, tym razem na YT :) Dodatkowo pod linkiem - [[link](https://aluspl.github.io/RogueLikeDSP/Versions/fight/)] - znajdziecie nowszą wersję playera. Tym razem z logiem i walką. Przepraszam za ruch, będzie poprawiony w następnej wersji, jak dodam system walki turowej (choć przyznam, że **Zelda: Link Beetwen the Worlds**, kusi mnie trochę do przejścia w trybie realtime).
KIedy zamiast grać w grę, robisz grę … to wiedz, że coś się dzieje!
P.S. Mam nadzieje, że wybaczycie mi, jeśli na majówkę zrobię wpis na temat moich ulubionych IDE!

[embed]https://www.youtube.com/watch?v=nNqPyAq3gX0[/embed]

Enjoy!
Link do Githuba: [[https://github.com/aluspl/RogueLikeDSP](https://github.com/aluspl/RogueLikeDSP)]
