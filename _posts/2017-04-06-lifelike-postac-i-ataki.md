---
layout: post
title: LifeLike - Postać i Ataki
date: 2017-04-06 16:02
author: Alus
comments: true
categories: [Daj Się poznać, dsp, dsp2017, Unity3d, unity3d]
---
<ol>
 	<li>Już dzisiaj wyjazd do Grecji, ale nie mogę zaniedbać czytelników (o ile jakichś mam, ale jeśli wierzyć statystykom Google Analytics wychodzi na to, że ktoś to jednak czyta).
Tym razem krótko, ale rzetelnie - ataki. Szanse powodzenia oraz przykładowy atak specjalny - <strong>Tech Talk</strong>! <!--more--></li>
</ol>
<h2>Zwykły atak</h2>
W poprzednim wpisie, atak był dość uproszczony, powiedziałbym … mamy 100% szans, że trafimy, czyli atakując przeciwnika, zadamy mu obrażenia - równoważne naszej sile. Żeby nie było więc za łatwo, dodajmy trochę losowości do tej walki.
W <strong>BaseCharacterClass</strong> są 3 metody odpowiedzialne za atak:
- <strong>Critical Chance</strong>, który sprawdza, czy mamy szansę, na zwiększenie liczby obrażeń dwukrotnie.

[csharp]
   public bool CriticalChance()
        {
            return _random.Next(100)*Agility&gt;90;
        }
[/csharp]

- <strong>ChanceToAttack</strong>, który w praktyce pokazuje, czy udało się nam trafić, czy może skutecznie minęliśmy się z celem. Im większa zręczność, tym większa szansa na atak lub unik.

[csharp]
  public bool ChanceToAttack(BaseCharacter enemy)
        {
            return _random.Next(Agility)&gt;_random.Next(enemy.Agility);
        }
[/csharp]

- <strong>Attack</strong> …czyli nasz atak, który jako parametr przyjmuje naszego przeciwnika - czyli mamy dostępne wszystkie informacje o przeciwniku, jest to czysta referencja do obiekt. Metoda ta zwraca string - z logiem, który wyświetlimy potem w odpowiedniej konsoli. Oczywiście atak będzie brał pod uwagę także ekwipunek zarówno nasz jak i przeciwnika.

[csharp]
 public virtual string Attack(BaseCharacter enemy)
        {
            if (!ChanceToAttack(enemy)) return GameLogSystem.MissAttack();
            var damage = CriticalChance() ? _random.Next(Strength) : _random.Next(Strength) * 2;
            damage=enemy.Defense(damage);
            return GameLogSystem.Attack(damage);
        }
[/csharp]

<h2>Atak specjalny</h2>
Przykład pokazany w tym akapicie, został wykonany na pierwszej opracowanej klasie, bliskiej każdemu z nas. Jak wiadomo, niektórzy w branży IT nie mają wykreowanej charyzmy, co gorsze, wiedzą lub nie wiedzą, że ludzie, z którymi rozmawiają totalnie nie rozumieją nic na temat świata IT … a oni dalej nawijają “<strong>gadką IT</strong>”. Dodajmy do tego odpowiednią inteligencję i ton, którego każdy anestezjolog może mu pozazdrości.

Liczbę ataków pobieramy z metody przeciążonej:

[csharp]
public override List SpecialActionsList()

[/csharp]

U nas zwraca na obecną chwilę: “<strong>Tech Talk</strong>" i "<strong>Phantom IT Device Attack</strong>" ( w końcu, nikt nie wie, skąd oni tę klawiaturę biorą).

Następnie po wybraniu ataku (np. context menu)

[csharp]
        public override string SpecialAction(BaseCharacter enemyCharacter, string actionName)
        {
            switch (actionName)
            {
                case &quot;Tech Talk&quot;:
                    return AttackTechTalk(enemyCharacter);
                    break;
                case &quot;Phantom IT Device Attack&quot;:
                    return AttackPhantomDevice(enemyCharacter);
                    break;
                default:
                    return Attack(enemyCharacter);
            }
        }
[/csharp]

I atakujemy Tech Talkiem, który w zależności od sukcesu zwraca:

[csharp]
            return success ? 
 &quot;You are successfully bored enemy! He is sleeping now.  Good Job&quot; :
 &quot;You are not so boring for your enemy&quot;;
[/csharp]

i … usypiamy przeciwnika! :)
<h2>Podsumowanie</h2>
No to tyle na dzisiaj, wybaczcie, że tak krótko ale liczę, że podsyci to Wasz zapał i nie spowoduje utraty wiary we mnie . W końcu ktoś stworzył post w ramach #<strong>DSP</strong> “wrzucam tu byle co, byle był post w tym tygodniu”.
Do zobaczenia za tydzień :)
P.S. będę przymierzał się do grafiki pixelart dla postaci :)

Resztę wpisów znajdziesz tu

[caption id="attachment_1685" align="aligncenter" width="785"]<a href="http://szymonmotyka.pl/wp-content/uploads/2017/04/20170406_100620.jpg"><img class="size-large wp-image-1685" src="http://szymonmotyka.pl/wp-content/uploads/2017/04/20170406_100620-785x589.jpg" alt="Postać i Ataki" width="785" height="589" /></a> No to w drogę[/caption]
