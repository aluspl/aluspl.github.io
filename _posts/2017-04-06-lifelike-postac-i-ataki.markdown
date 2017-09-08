---
author: Alus
comments: true
date: 2017-04-06 15:02:17+00:00
layout: post
link: http://szymonmotyka.pl/lifelike-postac-i-ataki/
slug: lifelike-postac-i-ataki
title: LifeLike - Postać i Ataki
wordpress_id: 1684
categories:
- Daj Się poznać
- Unity3d
tags:
- dsp
- dsp2017
- unity3d
---


 	
  1. Już dzisiaj wyjazd do Grecji, ale nie mogę zaniedbać czytelników (o ile jakichś mam, ale jeśli wierzyć statystykom Google Analytics wychodzi na to, że ktoś to jednak czyta).
Tym razem krótko, ale rzetelnie - ataki. Szanse powodzenia oraz przykładowy atak specjalny - **Tech Talk**! <!-- more -->




## Zwykły atak


W poprzednim wpisie, atak był dość uproszczony, powiedziałbym … mamy 100% szans, że trafimy, czyli atakując przeciwnika, zadamy mu obrażenia - równoważne naszej sile. Żeby nie było więc za łatwo, dodajmy trochę losowości do tej walki.
W **BaseCharacterClass** są 3 metody odpowiedzialne za atak:
- **Critical Chance**, który sprawdza, czy mamy szansę, na zwiększenie liczby obrażeń dwukrotnie.

```
   public bool CriticalChance()
        {
            return _random.Next(100)*Agility>90;
        }
```

- **ChanceToAttack**, który w praktyce pokazuje, czy udało się nam trafić, czy może skutecznie minęliśmy się z celem. Im większa zręczność, tym większa szansa na atak lub unik.

```
  public bool ChanceToAttack(BaseCharacter enemy)
        {
            return _random.Next(Agility)>_random.Next(enemy.Agility);
        }
```

- **Attack** …czyli nasz atak, który jako parametr przyjmuje naszego przeciwnika - czyli mamy dostępne wszystkie informacje o przeciwniku, jest to czysta referencja do obiekt. Metoda ta zwraca string - z logiem, który wyświetlimy potem w odpowiedniej konsoli. Oczywiście atak będzie brał pod uwagę także ekwipunek zarówno nasz jak i przeciwnika.

```
 public virtual string Attack(BaseCharacter enemy)
        {
            if (!ChanceToAttack(enemy)) return GameLogSystem.MissAttack();
            var damage = CriticalChance() ? _random.Next(Strength) : _random.Next(Strength) * 2;
            damage=enemy.Defense(damage);
            return GameLogSystem.Attack(damage);
        }
```



## Atak specjalny


Przykład pokazany w tym akapicie, został wykonany na pierwszej opracowanej klasie, bliskiej każdemu z nas. Jak wiadomo, niektórzy w branży IT nie mają wykreowanej charyzmy, co gorsze, wiedzą lub nie wiedzą, że ludzie, z którymi rozmawiają totalnie nie rozumieją nic na temat świata IT … a oni dalej nawijają “**gadką IT**”. Dodajmy do tego odpowiednią inteligencję i ton, którego każdy anestezjolog może mu pozazdrości.

Liczbę ataków pobieramy z metody przeciążonej:

```
public override List SpecialActionsList()

```

U nas zwraca na obecną chwilę: “**Tech Talk**" i "**Phantom IT Device Attack**" ( w końcu, nikt nie wie, skąd oni tę klawiaturę biorą).

Następnie po wybraniu ataku (np. context menu)

```
        public override string SpecialAction(BaseCharacter enemyCharacter, string actionName)
        {
            switch (actionName)
            {
                case "Tech Talk":
                    return AttackTechTalk(enemyCharacter);
                    break;
                case "Phantom IT Device Attack":
                    return AttackPhantomDevice(enemyCharacter);
                    break;
                default:
                    return Attack(enemyCharacter);
            }
        }
```

I atakujemy Tech Talkiem, który w zależności od sukcesu zwraca:

```
            return success ? 
 "You are successfully bored enemy! He is sleeping now.  Good Job" :
 "You are not so boring for your enemy";
```

i … usypiamy przeciwnika! :)


## Podsumowanie


No to tyle na dzisiaj, wybaczcie, że tak krótko ale liczę, że podsyci to Wasz zapał i nie spowoduje utraty wiary we mnie . W końcu ktoś stworzył post w ramach #**DSP** “wrzucam tu byle co, byle był post w tym tygodniu”.
Do zobaczenia za tydzień :)
P.S. będę przymierzał się do grafiki pixelart dla postaci :)

Resztę wpisów znajdziesz tu

[caption id="attachment_1685" align="aligncenter" width="785"][![Postać i Ataki](http://szymonmotyka.pl/wp-content/uploads/2017/04/20170406_100620-785x589.jpg)](http://szymonmotyka.pl/wp-content/uploads/2017/04/20170406_100620.jpg) No to w drogę[/caption]
