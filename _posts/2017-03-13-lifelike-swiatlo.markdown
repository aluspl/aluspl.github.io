---
author: Alus
comments: true
date: 2017-03-13 11:00:10+00:00
layout: post
link: http://szymonmotyka.pl/lifelike-swiatlo/
slug: lifelike-swiatlo
title: LifeLike - Światło
wordpress_id: 1648
categories:
- Daj Się poznać
- Unity3d
tags:
- csharp
- dsp
- dsp2017
- mono
- unity3d
---

W chwili, gdy czytacie ten post, ja podróżuję po Islandii, polując na zorze polarną. W grze także zapolujmy trochę na światło, aby dodać jej trochę uroku, a nawet i mroku.
<!-- more -->


## Postać


Zanim to jednak nastąpi, pozwolę sobie wrócić do postaci. Mam ku temu 2 powody:
* Obrót postaci w zależności od wciśniętego klawisza
* Oświetlenie postaci
Po stronie edytora dodałem możliwość wybrania pomiędzy Input.GetButtownDown a AxisRaw . Domyślnie ustawiona jest opcja 1. ze względu na łatwiejsze poruszanie - co kratkę. Będzie to przydatne w przypadku wprowadzenia w późniejszej fazie systemu tur.


## Obrót


Przyznam, że początkowo miałem ten wpis ograniczyć tylko do tego zagadnienia, ale jak się za chwilę przekonacie rzeczywistość okazała się być inna, a to wszystko przez to, że przysiadłem troszkę dłużej przy kwestii oświetlenia/światła, które różni się w Unity2d w stosunku do 3d. Ale o tym będzie później, a teraz wróćmy do głównego gościa tego paragrafu, czyli obrotu. :)
Obrót postacią odbywa się za pomocą metody:


 ```c# 
   if (Input.GetKeyDown(GameManager.Instance.KeyLeft))
      transform.eulerAngles=new Vector3(0,0,90); 

 ```c# 


Wartość kąta zależy od tego, w którą stronę chcemy się obrócić, tutaj mamy przypadek dla skrętu w lewo.

Wartość kąta podajemy dla osi Z, gdyż to wokół niej obraca się postać. Wartości dla osi X i Y pozostają zerowe, gdyż w przypadku gier 2D (płaskich), obrót postaci wokół tych osi pokazałby jak bardzo nasza postać jest płaska (no offence).


## Materiał światłoczuły


Przyznam, że temat który mnie długo zastanawiał, był efektem prób i błędów.
Koniec końców, rozwiązanie jest całkiem łatwe: na nasze grafiki trzeba nałożyć shader typu sprite -> diffuse.[![](http://szymonmotyka.pl/wp-content/uploads/2017/03/Screen-Shot-2017-03-10-at-15.20.08-469x1024.png)](http://szymonmotyka.pl/wp-content/uploads/2017/03/Screen-Shot-2017-03-10-at-15.20.08.png)

[![](http://szymonmotyka.pl/wp-content/uploads/2017/03/Screen-Shot-2017-03-10-at-15.20.46.png)](http://szymonmotyka.pl/wp-content/uploads/2017/03/Screen-Shot-2017-03-10-at-15.20.46.png)

[![](http://szymonmotyka.pl/wp-content/uploads/2017/03/Screen-Shot-2017-03-10-at-15.20.23.png)](http://szymonmotyka.pl/wp-content/uploads/2017/03/Screen-Shot-2017-03-10-at-15.20.23.png)



Następnie przeciągamy go do np. **p****refab** z podłogą i nasza podłoga jest tym sposobem podatna już na warunki świetlne. Możemy ustalić teraz światło globalne, a także w narożnikach, czy jak w moim przypadku przy postaci. Kolor światła, intensywność i wszystko zależy od wyobraźni autora :) Ja osobiście ustawiłem światło typu point.


## ŚWIATŁO! KAMERA! AKCJA!


Kolejny etap, to odpowiednie “przyćmienie” naszego pomieszczenia. Aby uzyskać efekt, jak na poniższym screenie - takiej ciemności, mamy do wyboru 2 sposoby:
* W edytorze Unity można rozwiązać to za pomocą okna lighting, którego można wywołać z menu Górnego:
Unity3d -> Window -> Lighting -> Ambient Color ( u mnie jest czarny na noc i biały na dzień)
* Drugi sposób to przy pomocy kodu - jednej linijki:
RenderSettings.ambientLight = Color.black; (lub white, lub dowolny inny kolor)
(screen)
Tak oto stworzony został łatwy system dnia i nocy w klasię FollowPlayer i metodzie **LateUpdate**. Nazwa klasy będzie zmieniona przy następnym refactoringu.
W GameManager do Klawisza F przypisałem zmianę zmiennej “**isDay**”. W klasie **FollowPlayer**, w zależności od wartości isDay, ustawia _ambientlight color _i tło na zewnątrz (_skybox_ dla kamery), aby dodatkowo, także poza obszarem mapy, zmieniało się otoczenie z dnia na noc lub odwrotnie.
W przypadku gracza, stworzyłem **gameobject** typu Light i skrypt, który także sprawdza IsDay z GameManagera i odpowiednio uruchamia lub gasi światło.


## Podsumowanie


To tyle na dzisiaj. Następny wpis będzie dostępny za tydzień, więc spokojnie, nie będziecie zaniedbani. W międzyczasie, zapraszam do testów na [2. Demo Technologiczne](https://aluspl.github.io/RogueLikeDSP/Versions/light/)
Miłej zabawy ! :)

[![Światło](http://szymonmotyka.pl/wp-content/uploads/2017/03/Screen-Shot-2017-03-10-at-14.38.37-785x489.png)](http://szymonmotyka.pl/wp-content/uploads/2017/03/Screen-Shot-2017-03-10-at-14.38.37.png) Światło!

[![Światło](http://szymonmotyka.pl/wp-content/uploads/2017/03/Screen-Shot-2017-03-10-at-14.38.19-785x490.png)](http://szymonmotyka.pl/wp-content/uploads/2017/03/Screen-Shot-2017-03-10-at-14.38.19.png) Kliknij F aby przelaczyć na dzien/noc



Bonus:

[![światło](http://szymonmotyka.pl/wp-content/uploads/2017/03/giphy-1.gif)](http://szymonmotyka.pl/wp-content/uploads/2017/03/giphy-1.gif)
