---
author: Alus
comments: true
date: 2017-04-16 21:00:09+00:00
layout: post
link: http://szymonmotyka.pl/lifelike-walka-bezposrednia-serio/
slug: lifelike-walka-bezposrednia-serio
title: LifeLike - Walka Bezpośrednia - na serio!
wordpress_id: 1698
categories:
- Daj Się poznać
- Programowanie
- Unity3d
tags:
- dsp
- LifeLike
- Unity
---

Tak, tym razem na serio, będę kontynuował walkę bezpośrednią. Zauważyłem, że jeśli skupię się na kodzie i robię wpis “Code First”, a nie “Theory First” - jak to miało miejsce w poprzednim wpisie, to powstaje dużo kodu, a zostaje mało czasu na jego opis. Będę więc się trochę streszczał. :)


## Refactoring LifeLike


Z racji wkurzających żółtych podpowiedzi w nowym Rider oraz paru pomysłów związanych z przeciwnikami, postanowiłem zrobić lekką refaktoryzację - w tym zmiany namespace i foldery plików + parę narzędzi do zarządzania przeciwnikami.


## Wróg… jest czerwony!


W poprzednim wpisie wspominałem o inspiracji Superhot, w tym postanowiłem słowa zamienić w czyny i stworzyć tego wroga. Jest to, lekka modyfikacja naszego playera, który swoją drogą, również zmienił grafikę. W przyszłości, każdy zasłuży na swój własny wygląd.W tym, będzie po prostu Red Manem ..i wygląda tak:

```id="attachment_1700" align="aligncenter" width="100"][![](http://szymonmotyka.pl/wp-content/uploads/2017/04/Character.png)](http://szymonmotyka.pl/wp-content/uploads/2017/04/Character.png) Jesteśmy Zieloni ... Ci dobrzy```

```id="attachment_1701" align="aligncenter" width="100"][![](http://szymonmotyka.pl/wp-content/uploads/2017/04/Enemy.png)](http://szymonmotyka.pl/wp-content/uploads/2017/04/Enemy.png) Oni są Czerwoni ... są Be```


## Przeciwniku, pojaw się na mapie!


A przy okazji dodaj się do listy Przeciwników, aby łatwo Cię było potem wybrać … i zabić.
…

```
private void AddEnemy(MapElement[,] map, int x, int y)
{
if (MaxEnemies &lt;= 0) return;
var chance = _random.Next(100)==1;
if (chance) return;
if (map[x,y]!=MapElement.Floor) return;

var enemy=Instantiate(Enemies.FirstOrDefault(), GetPosition(x, y), Quaternion.identity , EnemiesCollection);
GameManager.Instance.AddEnemy(enemy);

MaxEnemies--;
}
```

Założyłem sobie, że przeciwnik musi pojawić się na podłodze, a nie w ścianie. A i musi być w ograniczonej liczbie. :) Póki co, generator działa ze zbyt dużą częstotliwością, więc szansa na pojawienie się przeciwnika jest bardzo duża - za duża.
Ale cóż, ważne, że takim oto sposobem, nasz czerwony wróg pojawił się na mapie !

```id="attachment_1699" align="aligncenter" width="744"][![](http://szymonmotyka.pl/wp-content/uploads/2017/04/Screenshot-2017-04-16-16.20.51.png)](http://szymonmotyka.pl/wp-content/uploads/2017/04/Screenshot-2017-04-16-16.20.51.png) Luke ! I am Your Enemy```


## Przeciwniku, bądź Oznaczony!


Kolejnym kluczowym elementem, jest wiedza … kogo zaatakowaliśmy. :)
…
Przeciwnik dostał ten sam **shader**, co podłoga, więc nie jest widoczny w nocy, ale dodałem mu jakiś element oznaczenia. Małą lampkę, która oznacza, że przeciwnik jest zaznaczony. Zaznaczenia zmieniamy, przez kliknięcie TAB (lub innego przypisanego klawisza)

```
  private void SelectEnemy()
    {
        if (Enemies.Count < = 0) return;
        if (EnemyUtils.EnemyIndex == Enemies.Count) EnemyUtils.EnemyIndex = 0;
        foreach (var enemy in Enemies)
        {
            enemy.IsSelected = false;
        }
        Debug.Log("Selected Enemy: "+EnemyUtils.SelectedEnemy.EnemyCharacter.Name + "Current Index: "+ EnemyUtils.EnemyIndex);
        Enemies[EnemyUtils.EnemyIndex].IsSelected = true;
        EnemyUtils.EnemyIndex++;
    }
```

[![](http://szymonmotyka.pl/wp-content/uploads/2017/04/giphy-2.gif)](http://szymonmotyka.pl/wp-content/uploads/2017/04/giphy-2.gif)


## Podsumowanie


To tyle w dzisiejszym odcinku. Temat kontynuowany będzie też w następny wpisie. Jak widać, nie jest to wcale mało rozbudowany system, a gdy będziemy chcieli do tego dodać jeszcze walkę dystansową i mierzenie, czy dany przeciwnik faktycznie jest w zasięgu bezpośredniego czy dalekiego ataku, to system będzie naprawdę sporo rozbudowany. Nie zapominajmy też, że będzie UI, szansa trafienia oraz okno z logiem naszych ataków.

Link do gry i aktualnej wersji jak zwykle na [githubie](https://github.com/aluspl/RogueLikeDSP)
