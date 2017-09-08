---
author: Alus
comments: true
date: 2017-03-25 18:25:21+00:00
layout: post
link: http://szymonmotyka.pl/lifelike-tdd/
slug: lifelike-tdd
title: LifeLike - TDD
wordpress_id: 1664
categories:
- Daj Się poznać
- Unity3d
tags:
- dsp
- dsp2017
---

Po tygodniu na Islandii wypadłem z obiegu i wprawy w pisaniu bloga.
Jednak po powrocie, trzeba ruszyć pełną parą. Tematem dzisiejszego postu są Testy i początek wprowadzenia TDD do projektu. Coś, co mi się przyda do projektów prywatnych jak i służbowych.
Tak więc zacznijmy!
<!-- more -->


## Narzędzia (TDD)


Przyznam, że przeszukałem wiele dokumentacji i znalazłem albo szczątkowe dane, albo z użyciem Unity Test Framework.
Jednocześnie odkryłem, że za pomocą Rider EAP, do solucji można dodać projekt, który używa NUnit 3.
Wiem, że takim sposobem nie przetestuje funkcjonalnych funkcji z Unity, a ograniczę się do tych, typu generatory, tworzenie mapy czy sprawdzenia poprawności danych itp.
Uwaga! Trzeba ustawić referencję do NUnit 3.5+. U mnie pojawiły się, gdy z AssetStore pobrałem Unity Test Tools. Albo z nuget albo innych źródeł. Jest to ważne dla kompatybilności z poniższym wpisem.

[caption id="attachment_1668" align="aligncenter" width="785"][![TDD](http://szymonmotyka.pl/wp-content/uploads/2017/03/Screen-Shot-2017-03-23-at-19.03.22-785x490.png)](http://szymonmotyka.pl/wp-content/uploads/2017/03/Screen-Shot-2017-03-23-at-19.03.22.png) Narzedzia do testow, nie obowiazkowe, ale zawiera m.in NUnit 3[/caption]

[caption id="attachment_1669" align="aligncenter" width="785"][![TDD](http://szymonmotyka.pl/wp-content/uploads/2017/03/Screen-Shot-2017-03-24-at-23.34.01-785x458.png)](http://szymonmotyka.pl/wp-content/uploads/2017/03/Screen-Shot-2017-03-24-at-23.34.01.png) Nowy projekt typu NUNit[/caption]


## Map Generator


Na potrzeby testu zrobiłem drobny refactoring w klasie Map Generator. Zmieniłem statyczne metody na normalne i wrzuciłem w interfejs IMapGenerator (na potrzeby późniejszego refactoringu i łatwiejszych testów z użyciem Mock w przyszłości).
Klasa dodatkowa implementuje IDisposable dla drobnej optymalizacji, gdy przestaniemy go używać i nie pracować na statycznych danych w tej klasie.


## Konfiguracja


Metoda z atrybutem TestFixtureSetup służy do inicjacji, czyli jeśli potrzebujemy ustawić potrzebne klasy, referencje, które użyjemy w testach i chcemy wywołać tylko raz, robimy to tutaj:

```
 [TestFixtureSetUp]
        public void Configure()
        {
            _generator=new MapGenerator();
        }
```



## Pierwszy Test


Przejdźmy do pierwszego podstawowego testu. Sprawdźmy, czy nasz wywołany generator jest nullem. Wywołujemy testy za pomocą klasy Assert, która jest w metodzie oznaczonej atrybutem [Test]. Oczywiście, można dodać wiele innych warunków, które chcemy sprawdzić. W końcu to podstawa TDD, aby podać warunki, nie tylko które ma spełnić, ale które również ma oblać, żeby być pewnym czy aplikacja działa poprawnie.
Efekt wszystkich testów można sprawdzić uruchamiając projekt z testem np w Rider za pomocą prawego przycisku i “Run Unit Test”.

```  
[Test]
        public void IsGeneratorExist()
        {
            Assert.IsNotNull(_generator);
        }
```

Poniżej przykład wyniku takiego podstawowego testu.


## Oblany Test


Skoro poprzedni test się udał, to wypadałoby sprawdzić, jakich warunków nie spełnia i co oblewa.
Sprawdźmy, czy nasz array jest równy 0.

```
    int x = 10, y = 10;
            var map =  new MapElement[x,y];
                Assert.AreEqual(map.GetLength(0), 0);
```

UUU … test Failed :( oczekiwało 0, a wyskoczyło 10.


## Testy na wielu warunkach


Aby tak nie testować jednostkowo, wypada sprawdzić to bardziej zaawansowanie.
Przejdźmy do *TestCase*:

```
[Test, TestCaseSource(typeof(SampleData),"SizeCases")]
        public int IsValidSize(int x, int y, int element)
        {
            var map =  new MapElement[x,y];
            return map.GetLength(element);
        }
```

W tym przypadku tworzymy funkcję, w której określamy, co chcemy zwrócić, aby potem sprawdzić poprawność.
Zwracam rozmiar danej ściany (map.GetLength(0) powinien zwrócić x, a GetLength(1) zwrócić y)
Atrybut TestCaseSource ustawia z jakiej klasy oraz z której właściwości ma brać dane.
Tworzymy więc nową klasę (u mnie SampleData), w której wrzucamy warunki testów w postaci właściwości typu IEnumerate

```
   public static IEnumerable SizeCases
        {
            get
            {
                yield return new TestCaseData( 10, 10,0 ).Returns( 0 ); //failed
                yield return new TestCaseData( 12, 2 ,0).Returns( 12 ); //success
                yield return new TestCaseData( 12, 4,1).Returns( 0 );
                yield return new TestCaseData( 12, 4,1).Returns( 4 );
            }
        }
```

TestCaseData jako parametry przyjmuje parametry do metody, którą wywołujemy a w Returns sprawdza, czy metoda zwraca wybrane elementy. Poniżej wyniki testów dla danego przykładu.

[![](http://szymonmotyka.pl/wp-content/uploads/2017/03/Screen-Shot-2017-03-25-at-00.38.00-785x165.png)](http://szymonmotyka.pl/wp-content/uploads/2017/03/Screen-Shot-2017-03-25-at-00.38.00.png)


## Podziękowanie


Postaram się nadrobić wpisy na #DSP, tak aby nie straciło to na jakości, więc proszę wybaczyć opóźnienia.
Jako nagrodę pocieszenia zapraszam na film Miłego dnia !

[embed]https://www.youtube.com/watch?v=Q8v0KHMtwBs[/embed]

Jeśli macie jakieś opinie, rady i sugestie natemat TDD - PISZCIE!
