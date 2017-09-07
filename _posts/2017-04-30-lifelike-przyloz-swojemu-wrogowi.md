---
layout: post
title: LifeLike - Przyłóż swojemu wrogowi!
date: 2017-04-30 13:16
author: Alus
comments: true
categories: [c#, Daj Się poznać, dotnet, dsp, dsp2017, LifeLike, Programowanie, Unity3d, unity3d]
---
W ostatnich odcinkach na temat LifeLIke nauczyłem się, jak wybierać wrogów, jak tworzyć samego siebie (sooo deep! ). Dzisiaj ponownie wracamy do tematyki walki. Tym razem takiej praktycznej … ale tylko na pięści!
<!--more-->
<h2>Podsumowanie poprzednich odcinków</h2>
Jak pamiętacie, w poście na temat tworzenia postaci i walki (<a href="http://szymonmotyka.pl/lifelike-postac-i-ataki/" target="_blank" rel="noopener noreferrer">Postać i Ataki</a>) poruszyłem już tematykę walki. Oprócz walk była jeszcze kwestia tworzenia samego siebie (<a href="http://szymonmotyka.pl/lifelike-tworzenie-postaci-okno-szczegolow/">Tworzenie Postaci</a>) oraz tworzenia UI - w tym kluczowego Gamelog <a href="http://szymonmotyka.pl/lifelike-interfejs-uzytkownika/">Interfejs Użytkownika</a>.
W tym temacie chciałbym się skupić bardziej na walce bezpośredniej. W kodzie przeprowadziłem też trochę refactoringu.
<h2>Zaznaczanie najbliższego przeciwnika</h2>
Skoro już poruszyłem temat zaznaczania przeciwnika (link), warto by było umożliwić graczowi podświetlenie tych, których możemy zaatakować, czyż nie? Ulepszyłem więc metodę do zaznaczania przeciwników, tylko tych, co są w ustalonym zasięgu:

[csharp]
            var nearby = GameManager.Instance.Enemies.Where(p=&gt;p.Distance&lt;=MAXDISTANCE).OrderBy(p =&gt; p.Distance).ToList();
[/csharp]

Wypadało także zmienić zaznaczonego przeciwnika. W końcu ciężko zaznaczyć index przeciwnika, gdy bazujemy na liście tylko tych, co są nam najbliżsi! Obecnie wartość dla MAXDISTANCE wynosi 1 :)

[csharp]
  public static Enemy SelectedEnemy
        {
            get
            {
                return EnemyIndex!=-1 
                    ? GameManager.Instance.Enemies.FirstOrDefault(p=&gt;p.IsSelected)
                    : null;
            }
        }
[/csharp]

<h2>Walka!</h2>
Gdy już mamy zaznaczonego przeciwnika, starczy kliknąć spacje, aby zaatakować. Szczerze, w obecnej sytuacji liczy się tylko <strong>Agility</strong> i <strong>Strength</strong>. Ok, jeszcze <strong>Endurance</strong> ma znaczenie dla naszej ilości punktów życia.
A to też ważne, choć w obecnej sytuacji tylko dla wroga (huehue). Dodałem procedurę śmierci przeciwnika z doświadczeniem dla nas:

[csharp]
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
            Debug.Log(&quot;Enemy shouldn't be here!&quot;);
        }
    }
[/csharp]

A więc po kliknięciu w spacje, sprawdza szansę na zaatakowanie i atakuje! Zresztą, tematykę już poruszyłem, tylko zmodernizowałem o …

[caption id="attachment_1746" align="aligncenter" width="640"]<a href="http://szymonmotyka.pl/wp-content/uploads/2017/04/Screenshot-2017-04-30-01.00.14.png"><img class="size-large wp-image-1746" src="http://szymonmotyka.pl/wp-content/uploads/2017/04/Screenshot-2017-04-30-01.00.14-785x491.png" alt="LifeLIke" width="640" height="400" /></a> Okno gry[/caption]
<h2>Logi Ataku w LifeLike</h2>
Wypadało trochę ulepszyć powiadomienia, co się właściwie dzieje. W końcu trzeba wiedzieć, czy wspomniany przeciwnik jeszcze żyje, za ile był nasz atak oraz jak miała na imię nasza ofiara. ;)
W <strong>FightSystem</strong> wrzuciłem UI do gettera, aby trochę ten kod upiększyć. <strong>UI.AddLog(string)</strong> wrzuca tekst do konsoli.
Dodatkowo, panel z tekstem dostał tło i został przypięty u dołu ekranu.<a href="http://szymonmotyka.pl/wp-content/uploads/2017/04/Screenshot-2017-04-30-01.00.31.png"><img class="aligncenter size-large wp-image-1745" src="http://szymonmotyka.pl/wp-content/uploads/2017/04/Screenshot-2017-04-30-01.00.31-785x185.png" alt="LifeLIke" width="640" height="151" /></a>Podsumowanie postu

Poniżej znajdziecie video z kolejnego gameplay, tym razem na YT :) Dodatkowo pod linkiem - [<a href="https://aluspl.github.io/RogueLikeDSP/Versions/fight/">link</a>] - znajdziecie nowszą wersję playera. Tym razem z logiem i walką. Przepraszam za ruch, będzie poprawiony w następnej wersji, jak dodam system walki turowej (choć przyznam, że <strong>Zelda: Link Beetwen the Worlds</strong>, kusi mnie trochę do przejścia w trybie realtime).
KIedy zamiast grać w grę, robisz grę … to wiedz, że coś się dzieje!
P.S. Mam nadzieje, że wybaczycie mi, jeśli na majówkę zrobię wpis na temat moich ulubionych IDE!

[embed]https://www.youtube.com/watch?v=nNqPyAq3gX0[/embed]

Enjoy!
Link do Githuba: [<a href="https://github.com/aluspl/RogueLikeDSP">https://github.com/aluspl/RogueLikeDSP</a>]
