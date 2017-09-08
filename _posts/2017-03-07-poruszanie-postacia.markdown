---
author: admin
comments: true
date: 2017-03-07 08:30:46+00:00
layout: post
link: http://szymonmotyka.pl/poruszanie-postacia/
slug: poruszanie-postacia
title: LifeLike - Poruszanie postacią
wordpress_id: 1621
categories:
- Daj Się poznać
- Programowanie
- Unity3d
tags:
- dsp
- Programowanie
- unity3d
---

W LifeLike mamy Mapę  , ścianę, ale pozostał kluczowy motyw: Poruszanie Postacią! Przyznam, że był to jeden z trudniejszych dla mnie fragmentów, gdzie pomogła mi dokumentacja dostarczona przez Unity.
<!-- more -->


## Refactoring


Przed rozpoczęciem kursu zrobiłem drobny, ale nie ostatni refactoring. GameManager jest teraz jako singleton, struktura jest też trochę bardziej czytelna oraz dodałem BaseCharacterClass z atrybutami charakterystycznymi dla RPG.
Przy okazji, na potrzeby projektu, zwiększyłem skale pokoju do 1 :) tzn rozmiar kafelek ścian, itp. jest defaultowy - x=1, y=1 ;)


## Grafika Postaci


Postać malowana była w **Gimpie** - tym przestarzałym, mało intuicyjnym, jeśli chodzi o UI, oprogramowaniu do tworzenia grafiki rastrowej.
Zamysł był prosty :) Nie mam graphic designera, czyli idę w pixel art. Nasza postać jest na grafice 100x100px i złożona jest z kółka i elipsy (ahh te barki). Dzięki prostej grafice, będzie łatwo dodać wszelkiego rodzaju animacje ruchu w przyszłości.
Paaaanie i Paaanowie! Przedstawiamy naszego Ludka:

[caption id="attachment_1626" align="aligncenter" width="100"][![Poruszanie Postacią](http://szymonmotyka.pl/wp-content/uploads/2017/03/Character.png)](http://szymonmotyka.pl/wp-content/uploads/2017/03/Character.png) Ludek od góry[/caption]

Skoro już przestaliście się śmiać, zapraszam dalej :)


## Moving Object


Gdy już zaimportowałem sprite (grafika 2D) z postacią i stworzyłem prefab (obiekt) z tą postacią oraz boxcollider i rigidbody, aby umożliwić poruszanie w przestrzeni 2D. Dodatkowo klasa abstrakcyjna MovingObject zawiera elementy potrzebne do ruchu nie tylko naszej postaci, ale i każdej **NPC** (_ang. non-player character_) dostępnej w naszej grze.


## Poruszanie w praktyce


Zacznijmy od metody Move oraz kluczowych punktów.

```
	  _boxCollider2D.enabled = false;
            hit = Physics2D.Linecast(start, end, BlockingLayer);
            _boxCollider2D.enabled = true;
```

Wywołujemy ten fragment kodu, aby sprawdzić, czy początkowy punkt obiektu oraz końcowy nie będą nachodziły na element, który tą postać ma blokować.
Jeśli nie, wywołujemy funkcję zwracającą IEnumerator o nazwie Movement (ależ jestem oryginalny) .
Dodatkowo nasz **BlockingLayer** jest przypisany do ściany, ale można go też przypisać do innych rzeczy, czyli np. elementów otoczenia, zablokowanych drzwi czy przeciwników. W zależności od *blockingLayer*, będziemy później wykonywać określone akcje, typu włamywanie do pokoi, bezpośredni atak itp. lub próba spacyfikowania ściany za pomocą głowy lub innych skilli :)

```
            var remainingDistance = (transform.position - destination).sqrMagnitude;
            while (remainingDistance&amp;amp;gt;float.Epsilon)
            {
                var newPosition=Vector3.MoveTowards(_rb2D.position, destination, _inverseMoveTime * Time.deltaTime);
                _rb2D.MovePosition(newPosition);
                remainingDistance = (transform.position - destination).sqrMagnitude;
                yield return null;
            }
        }


```

Powyższa metoda służy do poruszania naszym RigidBody (pamiętajcie, aby ustawić go jako **Kinematic**, chyba, że chcecie widzieć jak postać próbuje poruszać się po pionowej ścianie do góry, niczym **Deadpool** próbujący udawać **Spidermana** … czyli bezsktucznie :)

A tak przy okazji Deadpool'a

[embed]https://www.youtube.com/watch?v=wLeGWcVeIZ4[/embed]

_InverseMoveTime * Time.deltaTIme określa czas ruchu. Aby naszą metodę uruchomić w unitowskim StartCoroutine(Movement(end)) potrzebujemy, żeby zwracało nam yielda. Nasz ruch wywołujemy za pomocą metody AttemtMove<T>(Vector2 Destination), gdzie T jest Componentem, do którego będziemy się potem odwoływać w akcji z wpadnięciem na obiekt :)


## Poruszanie Postacią


Tę klasę wywołujemy również w klasie Player, która dziedziczy po klasie **MovingObject**. Klasa ta obsługuję cały charakter postaci, czyli klasę postaci, atrybuty, poziom, hp, doświadczenie oraz listę dostępnych skilli. Tu też w Update sprawdzana jest reakcja na ruch postaci oraz logika z nią związan. Na obecnym etapie przejdźmy jednak do ruchu, czyli dylemat prawdziwego gracza - odwieczna bitwa - “Klawiatura (+ Mysz) Vs Pad). Nie pomogę rozwiązać tego, ponieważ jestem fanem obu typów i ani jednego nie dyskryminuję.

[caption id="attachment_1625" align="aligncenter" width="409"][![LifeLike](http://szymonmotyka.pl/wp-content/uploads/2017/03/Screen-Shot-2017-03-05-at-16.24.46-409x1024.png)](http://szymonmotyka.pl/wp-content/uploads/2017/03/Screen-Shot-2017-03-05-at-16.24.46.png) Edytor postaci[/caption]


## Klawiatura vs Pad


Tu mam 2 sposoby :) Jeden: zmapowane klawisze i Input.GetKeyDown. Sposób dobry, zwłaszcza, gdy gra jest **turn based** (turowa), a wszystkie klawisze chcemy ręcznie zmapować (w GameManager Prefab mamy do tego edytor). Oczywiście są inne akcje w przypadku trzymania przycisku itp. Ogromną zaletą takiego rozwiązania jest szeroka konfiguralności, jednak minusem jest dodatkowy kod, w przypadku chęci przeportowania gry na coś innego niż klawiaturę.

```

	const int horizontal = 1;
	const int vertical = 1;


            if (Input.GetKeyDown(GameManager.Instance.KeyUp))
                return new Vector2(0,vertical);


            if (Input.GetKeyDown(GameManager.Instance.KeyLeft))
                return new Vector2(horizontal*-1,0);


            if (Input.GetKeyDown(GameManager.Instance.KeyRight))
                return new Vector2(horizontal,0);


            if (Input.GetKeyDown(GameManager.Instance.KeyDown))
                return new Vector2(0,vertical*-1);


```

Oraz drugi sposób, uniwersalny, z pobraniem wartości z osi pionowej i poziomej -> co odpowiada albo za klawisze **Up/Down** i **Left/Right** (zwraca wartosc -1 -> 0 -> 1). Jest to dobre, ponieważ przy podpięciu pada, lewa gałka jest tego odpowiednikiem, także w przypadku telefonu, gałka odpowiada za horizontal i vertical. Czyli teoretycznie wypada idealnie, a jednak _“coś poszło nie tak”_. Czasami nie reaguje poprawnie na ruch gałką, a czasami rusza o 2 pola, zamiast o jedno. Czyli pobiera ciągle, ale nie w równym czasie. Jeśli macie jakieś sugestie, zapraszam do sprawdzenia kodu, przetestowania i podzielenia się radami :)

```


             var x = (int)Input.GetAxisRaw("Horizontal");


             var y = (int)Input.GetAxisRaw("Vertical");

            if (x != 0) y = 0;
            return new Vector2(x,y);


```

Wybór zależy od was :) Ja eksperymentuję z opcją numer 1 i numer 2 :)


## Kamera


Skoro nasza postać się porusza, wypada także, aby kamera śledziła naszą postać :)
Klasa FollowCamera, załączona jako komponent do Main Camera śledzi naszą postać - GameObject jest przypisany na podstawie taga.

```
void LateUpdate ()
{
transform.position = player.transform.position + offset;
}
```



## Podsumowanie


Następne posty pojawią się lekko opóźnione, po naszej wyprawie na Islandię, o której można przeczytać na **kawowipodroznicy.pl.** Prawdopodobnie, będę też uruchamiał WebPlayera z aktualną wersją gry. Poza animacjami postaci, postaram się jeszcze poruszyć (także dla samonauki) **TDD** (_ang. Test-driven Development_).

[https://aluspl.github.io/RogueLikeDSP/Versions/](https://aluspl.github.io/RogueLikeDSP/Versions/) - Link do 1. wersji :)

[caption id="attachment_1624" align="aligncenter" width="480"][![Postać](http://szymonmotyka.pl/wp-content/uploads/2017/03/LifeLike01-1.gif)](http://szymonmotyka.pl/wp-content/uploads/2017/03/LifeLike01-1.gif) LifeLIke GIF[/caption]
