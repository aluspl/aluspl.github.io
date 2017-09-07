---
layout: post
title: LifeLike - Światło
date: 2017-03-13 12:00
author: Alus
comments: true
categories: [csharp, Daj Się poznać, dsp, dsp2017, mono, Unity3d, unity3d]
---
W chwili, gdy czytacie ten post, ja podróżuję po Islandii, polując na zorze polarną. W grze także zapolujmy trochę na światło, aby dodać jej trochę uroku, a nawet i mroku.
<!--more-->
<h2>Postać</h2>
Zanim to jednak nastąpi, pozwolę sobie wrócić do postaci. Mam ku temu 2 powody:
* Obrót postaci w zależności od wciśniętego klawisza
* Oświetlenie postaci
Po stronie edytora dodałem możliwość wybrania pomiędzy Input.GetButtownDown a AxisRaw . Domyślnie ustawiona jest opcja 1. ze względu na łatwiejsze poruszanie - co kratkę. Będzie to przydatne w przypadku wprowadzenia w późniejszej fazie systemu tur.
<h2>Obrót</h2>
Przyznam, że początkowo miałem ten wpis ograniczyć tylko do tego zagadnienia, ale jak się za chwilę przekonacie rzeczywistość okazała się być inna, a to wszystko przez to, że przysiadłem troszkę dłużej przy kwestii oświetlenia/światła, które różni się w Unity2d w stosunku do 3d. Ale o tym będzie później, a teraz wróćmy do głównego gościa tego paragrafu, czyli obrotu. :)
Obrót postacią odbywa się za pomocą metody:

[csharp]   if (Input.GetKeyDown(GameManager.Instance.KeyLeft))
      transform.eulerAngles=new Vector3(0,0,90); 
[/csharp]

Wartość kąta zależy od tego, w którą stronę chcemy się obrócić, tutaj mamy przypadek dla skrętu w lewo.

Wartość kąta podajemy dla osi Z, gdyż to wokół niej obraca się postać. Wartości dla osi X i Y pozostają zerowe, gdyż w przypadku gier 2D (płaskich), obrót postaci wokół tych osi pokazałby jak bardzo nasza postać jest płaska (no offence).
<h2>Materiał światłoczuły</h2>
Przyznam, że temat który mnie długo zastanawiał, był efektem prób i błędów.
Koniec końców, rozwiązanie jest całkiem łatwe: na nasze grafiki trzeba nałożyć shader typu sprite -&gt; diffuse.<a href="http://szymonmotyka.pl/wp-content/uploads/2017/03/Screen-Shot-2017-03-10-at-15.20.08.png"><img class="aligncenter size-large wp-image-1652" src="http://szymonmotyka.pl/wp-content/uploads/2017/03/Screen-Shot-2017-03-10-at-15.20.08-469x1024.png" alt="" width="469" height="1024" /></a>

<a href="http://szymonmotyka.pl/wp-content/uploads/2017/03/Screen-Shot-2017-03-10-at-15.20.46.png"><img class="aligncenter size-full wp-image-1654" src="http://szymonmotyka.pl/wp-content/uploads/2017/03/Screen-Shot-2017-03-10-at-15.20.46.png" alt="" width="600" height="568" /></a>

<a href="http://szymonmotyka.pl/wp-content/uploads/2017/03/Screen-Shot-2017-03-10-at-15.20.23.png"><img class="aligncenter size-full wp-image-1653" src="http://szymonmotyka.pl/wp-content/uploads/2017/03/Screen-Shot-2017-03-10-at-15.20.23.png" alt="" width="650" height="230" /></a>

&nbsp;

Następnie przeciągamy go do np. <strong>p</strong><strong>refab</strong> z podłogą i nasza podłoga jest tym sposobem podatna już na warunki świetlne. Możemy ustalić teraz światło globalne, a także w narożnikach, czy jak w moim przypadku przy postaci. Kolor światła, intensywność i wszystko zależy od wyobraźni autora :) Ja osobiście ustawiłem światło typu point.
<h2>ŚWIATŁO! KAMERA! AKCJA!</h2>
Kolejny etap, to odpowiednie “przyćmienie” naszego pomieszczenia. Aby uzyskać efekt, jak na poniższym screenie - takiej ciemności, mamy do wyboru 2 sposoby:
* W edytorze Unity można rozwiązać to za pomocą okna lighting, którego można wywołać z menu Górnego:
Unity3d -&gt; Window -&gt; Lighting -&gt; Ambient Color ( u mnie jest czarny na noc i biały na dzień)
* Drugi sposób to przy pomocy kodu - jednej linijki:
RenderSettings.ambientLight = Color.black; (lub white, lub dowolny inny kolor)
(screen)
Tak oto stworzony został łatwy system dnia i nocy w klasię FollowPlayer i metodzie <strong>LateUpdate</strong>. Nazwa klasy będzie zmieniona przy następnym refactoringu.
W GameManager do Klawisza F przypisałem zmianę zmiennej “<strong>isDay</strong>”. W klasie <strong>FollowPlayer</strong>, w zależności od wartości isDay, ustawia <em>ambientlight color </em>i tło na zewnątrz (<em>skybox</em> dla kamery), aby dodatkowo, także poza obszarem mapy, zmieniało się otoczenie z dnia na noc lub odwrotnie.
W przypadku gracza, stworzyłem <strong>gameobject</strong> typu Light i skrypt, który także sprawdza IsDay z GameManagera i odpowiednio uruchamia lub gasi światło.
<h2>Podsumowanie</h2>
To tyle na dzisiaj. Następny wpis będzie dostępny za tydzień, więc spokojnie, nie będziecie zaniedbani. W międzyczasie, zapraszam do testów na <a href="https://aluspl.github.io/RogueLikeDSP/Versions/light/" target="_blank">2. Demo Technologiczne</a>
Miłej zabawy ! :)

[caption id="attachment_1651" align="aligncenter" width="785"]<a href="http://szymonmotyka.pl/wp-content/uploads/2017/03/Screen-Shot-2017-03-10-at-14.38.37.png"><img class="wp-image-1651 size-large" src="http://szymonmotyka.pl/wp-content/uploads/2017/03/Screen-Shot-2017-03-10-at-14.38.37-785x489.png" alt="Światło" width="785" height="489" /></a> Światło![/caption]

[caption id="attachment_1650" align="aligncenter" width="785"]<a href="http://szymonmotyka.pl/wp-content/uploads/2017/03/Screen-Shot-2017-03-10-at-14.38.19.png"><img class="wp-image-1650 size-large" src="http://szymonmotyka.pl/wp-content/uploads/2017/03/Screen-Shot-2017-03-10-at-14.38.19-785x490.png" alt="Światło" width="785" height="490" /></a> Kliknij F aby przelaczyć na dzien/noc[/caption]

&nbsp;

Bonus:

<a href="http://szymonmotyka.pl/wp-content/uploads/2017/03/giphy-1.gif"><img class="aligncenter size-full wp-image-1655" src="http://szymonmotyka.pl/wp-content/uploads/2017/03/giphy-1.gif" alt="światło" width="480" height="299" /></a>
