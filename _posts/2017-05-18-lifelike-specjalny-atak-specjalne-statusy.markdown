---
author: Alus
comments: true
date: 2017-05-18 21:11:48+00:00
layout: post
link: http://szymonmotyka.pl/lifelike-specjalny-atak-specjalne-statusy/
slug: lifelike-specjalny-atak-specjalne-statusy
title: 'LifeLike: Specjalny Atak i Specjalne Statusy'
wordpress_id: 1780
categories:
- Daj Się poznać
- Programowanie
- Unity3d
tags:
- dsp
- dsp2017
- LifeLike
- unity3d
---

Witam w 1. bonusowym wpisie na temat LifeLike i DSP2017. Jak wspominałem wcześniej konkurs zbliża się ku końcowi, a ja nie zamierzam się poddać. W dzisiejszym odcinku znajdziecie specjalne ataki, jak je wywołać oraz co one powodują.
<!-- more -->


## Refaktoring


Jak zwykle, coś nowego wyjdzie i coś się zmieni. Tym razem dodałem namespace LifeLike i zostały przeniesione niektóre klasy do folderów i namespace im odpowiadającym :)


## Jak użyć specjalnego ataku


Zacznę od drobnej modyfikacji w Input Managerze, gdzie dodałem nowy klawisz, zwany SelectSpecialAttackKey (B na padzie lub Q na klawiaturze). Po każdym jego kliknięciu, przełączamy się pomiędzy specjalnymi atakami, a następnie za pomocą klawisza LB (Kontroler) lub E, używamy wybranego przez nas ataku.


## Tech Talk i Couch Trainer w praktyce


Inne statystyki niż Siła, Zręczność czy Wytrzymałość stają się w końcu użyteczne.
W przypadku IT Guy (czyli każdego z nas) w skillu zwanym Tech Talk możemy użyć naszej inteligencji, aby uspić przeciwnika… Chyba, że cechuje się dużą Wytrzymałością - wtedy możemy mieć “przerypane” … żałować, że nie poszliśmy w Siłę!
Póki co, tylko ten atak jest użyteczny :)

W przypadku Couch Trainer, możemy zamienić przeciwnika w zombie (a w późniejszej wersji gry w sojusznika), o ile nasza Charyzma przewyższa Inteligencję przeciwnika (oczywiście, jest tu też element szczęścia - tzn. losowanie od 0 do wybranej statystyki.

[![](http://szymonmotyka.pl/wp-content/uploads/2017/05/Screenshot-2017-05-18-23.18.27-785x491.png)](http://szymonmotyka.pl/wp-content/uploads/2017/05/Screenshot-2017-05-18-23.18.27.png)


## Unity Build Cloud


Wiem, że wiele z was już to zna i używa. Inni pewnie używają swoje systemy typu Jenkins, ale w ramach drobnego researchu poszukałem, jak sprawnie budować grę na paru platformach. Tutaj z pomocą przyszedł Unity Cloud Services. Jedną opcją jest dodanie linku do githuba, drugą Collaborate- czyli Unitowskie repozytorium do wspólnej pracy nad kodem projektu. Oba równie wygodne i oba generują wyznaczone przez nas platformy. Niestety w wersji darmowej trochę trwa budowanie, które nie zawsze musi skończyć się sukcesem.


## Podsumowanie


No i nowa wersja gry wylądowała na [webie](https://aluspl.github.io/RogueLikeDSP/Versions/version7), [githubie](https://github.com/aluspl/RogueLikeDSP),

a także w Unity Build Cloud: (Pisać w sprawie aktualnych binarek lub wpisania się na liste testerów )
Prośba: Jeśli posiadacie inne kontrolery niż od Xbox’a dajcie znać. Chętnie potestuję albo wyślę specjalną wersję gry, w której możecie zobaczyć, co kliknęliście, dzięki czemu sprawdzimy, jak kontrola poruszania działa na innych padach.

Przy okazji jestem na etapie tworzenia strony projektu i przy okazji portfolio :)


