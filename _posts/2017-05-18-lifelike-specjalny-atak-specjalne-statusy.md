---
layout: post
title: LifeLike: Specjalny Atak i Specjalne Statusy
date: 2017-05-18 22:11
author: Alus
comments: true
categories: [Daj Się poznać, dsp, dsp2017, LifeLike, Programowanie, Unity3d, unity3d]
---
Witam w 1. bonusowym wpisie na temat LifeLike i DSP2017. Jak wspominałem wcześniej konkurs zbliża się ku końcowi, a ja nie zamierzam się poddać. W dzisiejszym odcinku znajdziecie specjalne ataki, jak je wywołać oraz co one powodują.
<!--more-->
<h2>Refaktoring</h2>
Jak zwykle, coś nowego wyjdzie i coś się zmieni. Tym razem dodałem namespace LifeLike i zostały przeniesione niektóre klasy do folderów i namespace im odpowiadającym :)
<h2>Jak użyć specjalnego ataku</h2>
Zacznę od drobnej modyfikacji w Input Managerze, gdzie dodałem nowy klawisz, zwany SelectSpecialAttackKey (B na padzie lub Q na klawiaturze). Po każdym jego kliknięciu, przełączamy się pomiędzy specjalnymi atakami, a następnie za pomocą klawisza LB (Kontroler) lub E, używamy wybranego przez nas ataku.
<h2>Tech Talk i Couch Trainer w praktyce</h2>
Inne statystyki niż Siła, Zręczność czy Wytrzymałość stają się w końcu użyteczne.
W przypadku IT Guy (czyli każdego z nas) w skillu zwanym Tech Talk możemy użyć naszej inteligencji, aby uspić przeciwnika… Chyba, że cechuje się dużą Wytrzymałością - wtedy możemy mieć “przerypane” … żałować, że nie poszliśmy w Siłę!
Póki co, tylko ten atak jest użyteczny :)

W przypadku Couch Trainer, możemy zamienić przeciwnika w zombie (a w późniejszej wersji gry w sojusznika), o ile nasza Charyzma przewyższa Inteligencję przeciwnika (oczywiście, jest tu też element szczęścia - tzn. losowanie od 0 do wybranej statystyki.

<a href="http://szymonmotyka.pl/wp-content/uploads/2017/05/Screenshot-2017-05-18-23.18.27.png"><img class="aligncenter size-large wp-image-1784" src="http://szymonmotyka.pl/wp-content/uploads/2017/05/Screenshot-2017-05-18-23.18.27-785x491.png" alt="" width="640" height="400" /></a>
<h2>Unity Build Cloud</h2>
Wiem, że wiele z was już to zna i używa. Inni pewnie używają swoje systemy typu Jenkins, ale w ramach drobnego researchu poszukałem, jak sprawnie budować grę na paru platformach. Tutaj z pomocą przyszedł Unity Cloud Services. Jedną opcją jest dodanie linku do githuba, drugą Collaborate- czyli Unitowskie repozytorium do wspólnej pracy nad kodem projektu. Oba równie wygodne i oba generują wyznaczone przez nas platformy. Niestety w wersji darmowej trochę trwa budowanie, które nie zawsze musi skończyć się sukcesem.
<h2>Podsumowanie</h2>
No i nowa wersja gry wylądowała na <a href="https://aluspl.github.io/RogueLikeDSP/Versions/version7">webie</a>, <a href="https://github.com/aluspl/RogueLikeDSP">githubie</a>,

a także w Unity Build Cloud: (Pisać w sprawie aktualnych binarek lub wpisania się na liste testerów )
Prośba: Jeśli posiadacie inne kontrolery niż od Xbox’a dajcie znać. Chętnie potestuję albo wyślę specjalną wersję gry, w której możecie zobaczyć, co kliknęliście, dzięki czemu sprawdzimy, jak kontrola poruszania działa na innych padach.

Przy okazji jestem na etapie tworzenia strony projektu i przy okazji portfolio :)

&nbsp;
