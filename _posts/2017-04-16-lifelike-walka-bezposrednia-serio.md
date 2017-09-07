---
layout: post
title: LifeLike - Walka Bezpośrednia - na serio!
date: 2017-04-16 22:00
author: Alus
comments: true
categories: [Daj Się poznać, dsp, LifeLike, Programowanie, Unity, Unity3d]
---
Tak, tym razem na serio, będę kontynuował walkę bezpośrednią. Zauważyłem, że jeśli skupię się na kodzie i robię wpis “Code First”, a nie “Theory First” - jak to miało miejsce w poprzednim wpisie, to powstaje dużo kodu, a zostaje mało czasu na jego opis. Będę więc się trochę streszczał. :)
<h2>Refactoring LifeLike</h2>
Z racji wkurzających żółtych podpowiedzi w nowym Rider oraz paru pomysłów związanych z przeciwnikami, postanowiłem zrobić lekką refaktoryzację - w tym zmiany namespace i foldery plików + parę narzędzi do zarządzania przeciwnikami.
<h2>Wróg… jest czerwony!</h2>
W poprzednim wpisie wspominałem o inspiracji Superhot, w tym postanowiłem słowa zamienić w czyny i stworzyć tego wroga. Jest to, lekka modyfikacja naszego playera, który swoją drogą, również zmienił grafikę. W przyszłości, każdy zasłuży na swój własny wygląd.W tym, będzie po prostu Red Manem ..i wygląda tak:

[caption id="attachment_1700" align="aligncenter" width="100"]<a href="http://szymonmotyka.pl/wp-content/uploads/2017/04/Character.png"><img class="wp-image-1700 size-full" src="http://szymonmotyka.pl/wp-content/uploads/2017/04/Character.png" alt="" width="100" height="100" /></a> Jesteśmy Zieloni ... Ci dobrzy[/caption]

[caption id="attachment_1701" align="aligncenter" width="100"]<a href="http://szymonmotyka.pl/wp-content/uploads/2017/04/Enemy.png"><img class="size-full wp-image-1701" src="http://szymonmotyka.pl/wp-content/uploads/2017/04/Enemy.png" alt="" width="100" height="100" /></a> Oni są Czerwoni ... są Be[/caption]
<h2>Przeciwniku, pojaw się na mapie!</h2>
A przy okazji dodaj się do listy Przeciwników, aby łatwo Cię było potem wybrać … i zabić.
…

[csharp]
private void AddEnemy(MapElement[,] map, int x, int y)
{
if (MaxEnemies &amp;lt;= 0) return;
var chance = _random.Next(100)==1;
if (chance) return;
if (map[x,y]!=MapElement.Floor) return;

var enemy=Instantiate(Enemies.FirstOrDefault(), GetPosition(x, y), Quaternion.identity , EnemiesCollection);
GameManager.Instance.AddEnemy(enemy);

MaxEnemies--;
}
[/csharp]

Założyłem sobie, że przeciwnik musi pojawić się na podłodze, a nie w ścianie. A i musi być w ograniczonej liczbie. :) Póki co, generator działa ze zbyt dużą częstotliwością, więc szansa na pojawienie się przeciwnika jest bardzo duża - za duża.
Ale cóż, ważne, że takim oto sposobem, nasz czerwony wróg pojawił się na mapie !

[caption id="attachment_1699" align="aligncenter" width="744"]<a href="http://szymonmotyka.pl/wp-content/uploads/2017/04/Screenshot-2017-04-16-16.20.51.png"><img class="size-full wp-image-1699" src="http://szymonmotyka.pl/wp-content/uploads/2017/04/Screenshot-2017-04-16-16.20.51.png" alt="" width="744" height="672" /></a> Luke ! I am Your Enemy[/caption]
<h2>Przeciwniku, bądź Oznaczony!</h2>
Kolejnym kluczowym elementem, jest wiedza … kogo zaatakowaliśmy. :)
…
Przeciwnik dostał ten sam <strong>shader</strong>, co podłoga, więc nie jest widoczny w nocy, ale dodałem mu jakiś element oznaczenia. Małą lampkę, która oznacza, że przeciwnik jest zaznaczony. Zaznaczenia zmieniamy, przez kliknięcie TAB (lub innego przypisanego klawisza)

[csharp]
  private void SelectEnemy()
    {
        if (Enemies.Count &lt; = 0) return;
        if (EnemyUtils.EnemyIndex == Enemies.Count) EnemyUtils.EnemyIndex = 0;
        foreach (var enemy in Enemies)
        {
            enemy.IsSelected = false;
        }
        Debug.Log(&quot;Selected Enemy: &quot;+EnemyUtils.SelectedEnemy.EnemyCharacter.Name + &quot;Current Index: &quot;+ EnemyUtils.EnemyIndex);
        Enemies[EnemyUtils.EnemyIndex].IsSelected = true;
        EnemyUtils.EnemyIndex++;
    }
[/csharp]

<a href="http://szymonmotyka.pl/wp-content/uploads/2017/04/giphy-2.gif"><img class="aligncenter size-full wp-image-1707" src="http://szymonmotyka.pl/wp-content/uploads/2017/04/giphy-2.gif" alt="" width="480" height="300" /></a>
<h2>Podsumowanie</h2>
To tyle w dzisiejszym odcinku. Temat kontynuowany będzie też w następny wpisie. Jak widać, nie jest to wcale mało rozbudowany system, a gdy będziemy chcieli do tego dodać jeszcze walkę dystansową i mierzenie, czy dany przeciwnik faktycznie jest w zasięgu bezpośredniego czy dalekiego ataku, to system będzie naprawdę sporo rozbudowany. Nie zapominajmy też, że będzie UI, szansa trafienia oraz okno z logiem naszych ataków.

Link do gry i aktualnej wersji jak zwykle na <a href="https://github.com/aluspl/RogueLikeDSP">githubie</a>
