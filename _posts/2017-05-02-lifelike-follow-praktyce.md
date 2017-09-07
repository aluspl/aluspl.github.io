---
layout: post
title: LifeLike - Follow Me w praktyce
date: 2017-05-02 18:49
author: Alus
comments: true
categories: [Daj Się poznać, dsp, dsp2017, LifeLike, Programowanie, Unity3d, unity3d]
---
Witam na majówkowym wpisie :) Pogoda za oknem nie rozpieszcza, aby chodzić na długie spacery po górach. Dzisiaj trochę o kontrataku oraz modernizacji modelu ruchu na mniej dynamiczny, ale za to bardziej stabilny.<!--more-->
<h2>Podsumowanie poprzednich wpisów na temat LifeLike</h2>
W poprzednim odcinku atakowaliśmy wroga (<a href="http://szymonmotyka.pl/lifelike-przyloz-swojemu-wrogowi/">link</a>). Tym razem, wrócimy do tematu i go rozwiniemy o kontratak ze strony przeciwnika. Dodatkowo wprowadziłem zatrzymanie się na innym obiekcie, a nie na graczu, więc nie wejdziemy na niego, a jednocześnie go zaznaczymy (tzn. przeciwnika).
<h2>Edytor kodu</h2>
Od ostatniego odcinka zmieniłem IDE. Wiecie, na Macu mam średni wybór do c#, a Mono Develop i jego klony … to nie wybór. InteliJ wydał świetnego Ridera, ale potrafi być “klocowaty” dla pamięci i czasami niestabilny. Wybór padł na Visual Studio Code, który jest klonem lekkiego edytora, zwanego ATOM. Ma świetne wsparcie dla C# oraz Unity. Także dla innych języków. Obsługuje git’a, a nawet i posiada debugger. Czyli dużo potrzebnego stuffu… poza sprawny refactoringiem, który dostarcza nam np. wspomniany InteliJ Rider, czy wtyczka do VS - Resharper (także od InteliJ).

[caption id="attachment_1749" align="aligncenter" width="640"]<a href="http://szymonmotyka.pl/wp-content/uploads/2017/05/Screenshot-2017-05-02-19.18.27.png"><img class="size-large wp-image-1749" src="http://szymonmotyka.pl/wp-content/uploads/2017/05/Screenshot-2017-05-02-19.18.27-785x491.png" alt="LifeLike" width="640" height="400" /></a> Visual Studio Code[/caption]
<h2>Ruch</h2>
Poprzedni model ruchu inspirowany był kursem od Unity - Rogue Like. Nie był on doskonały, ponieważ, gdy naciśnęliśmy zbyt dużo klawiszy na raz, nasza postać poruszała się zbyt niestabilnie i wychodziła poza kratkę. Tym razem poruszamy się my oraz przeciwnik o całą klatkę.

[csharp]
  public IEnumerator Movement(Vector3 destination)
        {
            var remainingDistance = (transform.position - destination).sqrMagnitude;
            //Tak było wcześniej:
            // while (remainingDistance&gt;float.Epsilon)
            // {
            //     var newPosition=Vector3.MoveTowards(_rb2D.position, destination, _inverseMoveTime * Time.deltaTime);
            //     _rb2D.MovePosition(newPosition);
            //     remainingDistance = (transform.position - destination).sqrMagnitude;
            //     yield return null;
            // }      
	//Tak jest teraz:
            transform.position=destination;
            yield return null;
        }
[/csharp]

<h2>System Turowy</h2>
Jest to prosty system - On atakuje albo my atakujemy. Życie jest Proste! :)
W GameManagerze dodałem nową zmienną “IsPlayerTurn”, od której zależy, do kogo należy obecnie tura. Tzn. ruch jest zablokowany, a przeciwnicy jeden po drugim się poruszają.

[csharp]
   public void EndPlayerTurn()
    {  
	//Zostanie zmienione na coś konkretniejszego o ruchach
        UiUtils.AddLog(&quot;Enemies Turn&quot;);
        IsPlayerTurn = false;
        if (PlayerObject!=null &amp;&amp; PlayerStatistic!=null)
        	EnemyUtils.EnemiesMove(PlayerObject);
  	//Zostanie zmienione na coś konkretniejszego o ruchach
      	UiUtils.AddLog(&quot;Player Turn&quot;);
        IsPlayerTurn = true;
    }
[/csharp]

Dodatkowo parametr PlayerObject zostanie omówiony w następnym punkcie.
<h2>Poruszanie się za nami</h2>
Skoro już wiemy, za kim mają się ruszać, to przejdźmy do ruchu za nami. W klasie <strong>Enemy</strong>, dodałem metodę <strong>MoveToPlayer</strong>, w której pobieramy vector ruchu pomiędzy graczem a przeciwnikiem, a następnie skracamy do wartości -1,0,1 ( w zależności, do strony, w którą ma się poruszać). Odbywa się to w metodzie <strong>RoundEnemyMoves</strong>

[csharp]
 public void MoveToPlayer(GameObject playerObject)
        {       
            var moveVector = (Vector2)(transform.position- playerObject.transform.position);
            RoundEnemyMoves(ref moveVector);
            transform.eulerAngles=SetRotation(moveVector);
       
           if (Math.Abs(moveVector.x) &gt; TOLERANCE || Math.Abs(moveVector.y) &gt; TOLERANCE)
                AttemtMove&lt;MovingObject&gt;(moveVector);        
        }
[/csharp]

<h2>Atak na gracza</h2>
Jak wspominałem na wstępie, wprowadziłem także kolizję, gdy przeciwnik wejdzie na gracza. Dodatkowo, dzięki nowemu systemowi walki musiałem sporo zmienić logi. :) Ze względu na charakter, jakbyśmy mówili sami do siebie. Wypadałoby to przebudować bardziej, ale to już, gdy będę pracował nad system słownika.
W każdym razie, jeśli przeciwnik natknie się na nas, a dystans między nami wyniesie 1 (w przypadku walki bezpośrednie) … to wówczas przystępuje do ataku na nas.

[csharp] 
 if (Distance==1)
    GameManager.Instance.FightSystem.AttackPlayer(EnemyCharacter);
[/csharp]

<h2>Update UI</h2>
Dodatkowo dodałem parę zmian do <strong>Interfejsu Użytkownika</strong>. Czyli jakiś początkowy <strong>UI</strong> do naszych statystyk, póki co HP i imię, wkrótce doświadczenie i poziom również znajdą swoje miejsce.

[caption id="attachment_1751" align="aligncenter" width="640"]<a href="http://szymonmotyka.pl/wp-content/uploads/2017/05/Screenshot-2017-05-02-19.38.14.png"><img class="size-large wp-image-1751" src="http://szymonmotyka.pl/wp-content/uploads/2017/05/Screenshot-2017-05-02-19.38.14-785x491.png" alt="LifeLike" width="640" height="400" /></a> Nowy panel w lewym Górnym rogu[/caption]
<h2>Podsumowanie</h2>
To tyle na dzisiaj! My atakujemy przeciwnika, on atakuje nas.
Linki jak zwykle na <strong>githubie</strong> : <a href="https://github.com/aluspl/RogueLikeDSP">https://github.com/aluspl/RogueLikeDSP</a>
Nowy Player pod : <a href="https://aluspl.github.io/RogueLikeDSP/Versions/version5contrattack/">https://aluspl.github.io/RogueLikeDSP/Versions/version5contrattack/</a>
