---
author: Alus
comments: true
date: 2017-06-27 16:41:51+00:00
layout: post
link: http://szymonmotyka.pl/dev-portfolio-vlog-i-dsp/
slug: dev-portfolio-vlog-i-dsp
title: Dev-Portfolio, VLOG i DSP - Podsumowanie
wordpress_id: 1818
categories:
- Blog
- Programowanie
- Wydarzenie
tags:
- Blog
- dsp
- dsp2017
- news
- VLOG
---

Daj Się Poznać się skończyło, ale nie planuję przez to kończyć “pogodzinnego” programowania. Wchodzę w to jeszcze intesywniej. Szczegóły i podsumowanie poniżej!
<!-- more -->


## Gala DSP 2017


Dnia 17.06 udaliśmy się z drugą połówką do Warszawy na Galę **Daj Się Poznać 2017**, gdzie wysłuchaliśmy licznych prezwntacji, poznaliśmy innych uczestników przy pizzy i kanapkach z Subway, a organizator oraz sponsorzy ogłosili swoich faworytów.

```id="attachment_1827" align="aligncenter" width="720"][![](http://szymonmotyka.pl/wp-content/uploads/2017/06/clip_image001-1-785x524.jpg)](http://szymonmotyka.pl/wp-content/uploads/2017/06/clip_image001-1.jpg) Cała Ferajna```

Ku mojemu zaskoczeniu zająłem 7 miejsce, tuż obok **Programmer_girl** i **JavaDevMatt** za co serdecznie Wam dziękuje. Oczywiście zwycięzcom serdecznie gratuluję zajęcia wyższych miejsc:

1. Mariusz Bugajski - Mistrzu! Gratuluję zebranych głosów i trzymam kciuki za trzymanie poziomu bloga, aby był tak samo dobry, jak i nie lepszy ([https://blog.bugajsky.pl/](https://blog.bugajsky.pl/))
2. KrzaQ - tak wiem, przegrałeś o czym napisałeś i było słychać głośno z widowni (“Czyli Przegrał”) ([https://dsp.krzaq.cc/](https://dsp.krzaq.cc/))
3. Sowa Programuje ([http://sowaprogramuje.pl/](http://sowaprogramuje.pl/))
4. Żaneta Jażdżyk ([http://nettelog.pl/](http://nettelog.pl/))
5. Programmer_Girl ([https://programmer-girl.com/](https://programmer-girl.com/))
6. JavaDevMatt ([http://www.javadevmatt.pl/](http://www.javadevmatt.pl/))
7. Ja

Dla mnie nagrodą było dostanie się do TOP 4 (od 4-7 było liczone jako 4 :) ) oraz przyjechanie z roczną e-prenumeratą magazynu Programista.
Dodatkowo wielkie dzięki dla organizatora - Maćka Aniserowicza ([devstyle.pl](http://devstyle.pl)), który świetnie przygotował konkurs, jak i galę, oraz życzę Mu, aby za rok też wrócił z kolejnym etapem Daj Się Poznać.

[embed]https://www.youtube.com/watch?v=Qi5tp0eZHt8[/embed]

[embed]https://www.youtube.com/watch?v=kHMqiPbrKx8[/embed]

Poniżej znajdziecie wykres, jak szło głosowanie. Wykres wygenerował KrzaQ:

```id="attachment_1819" align="aligncenter" width="720"][![](http://szymonmotyka.pl/wp-content/uploads/2017/06/DSPWykres-785x458.png)](http://szymonmotyka.pl/wp-content/uploads/2017/06/DSPWykres.png) Wykres Głosowań by KrzaQ```


## Projekt LifeLike: RPG


Jak zauważyliście, projekt jest wciąż daleki od ukończenia, ale nie jest zaniedbany. Zmieniłem trochę ostatnio strukturę na bardziej modułową oraz poprawiłem generowanie map. Na githubie możecie zresztą zobaczyć kod źródłowy, a wkrótce po kolejnych zmianach - dodaniu okna ekwipunku skupię się na innych istotnych rzeczach. Na githubie projektu można znaleźć plik todo.md  ([https://github.com/aluspl/RogueLikeDSP](https://github.com/aluspl/RogueLikeDSP))
Oczywiście zmieniłem trochę zabarwienie dnia, na bardziej szary i stworzyłem **WindowManager** do obsługi okien.
Jak wspominałem w poprzednich postach z podsumowaniem ( [Tutaj](http://szymonmotyka.pl/lifelike-podsumowanie/) ) będę brał się za to pełną gębą, ale przed tym:

```id="attachment_1822" align="aligncenter" width="720"][![Podsumowanie](http://szymonmotyka.pl/wp-content/uploads/2017/06/Screenshot-2017-06-27-18.31.04-785x491.png)](http://szymonmotyka.pl/wp-content/uploads/2017/06/Screenshot-2017-06-27-18.31.04.png) LifeLIke.pl```


## Projekt LifeLike: CMS


Chwaliłem się ostatnio stroną LifeLike.pl, która stała się też oficjalną stroną projektów oraz działalności gospodarczej. Z racji, że cenie sobie mobilność, a u mnie istnieje ona pod postacią **Macbook Pro** (13”), zacząłem tworzyć swoją oficjalną stronę. Będzie to taka wizytówka, agregator treści ( w tym **RSS** z blogów), podsumowanie projektów oraz najciekawsze stworzone video i zdjęcia. Czyli tym, czym zajmuje się **LifeLike** w głównej mierze oraz jako dodatkowe usługi. Jest to też serwis, który prowadzę w języku angielskim, jako osobisty trening, aby posługiwać się nim z większą płynnością.

[![Podsumowanie](http://szymonmotyka.pl/wp-content/uploads/2017/06/Screenshot-2017-06-27-18.25.40-785x498.png)](http://szymonmotyka.pl/wp-content/uploads/2017/06/Screenshot-2017-06-27-18.25.40.png)
Na początku skupiłem się na github pages i Jekyll w Ruby On Rails, gdzie przeniosłem swoją kupioną w połowie konkursu domenę, ale kiedy dowiedziałem się, że każdy, kto ma konto na hotmail (konto emailowe MS), może ubiegać się o darmowy roczny dostęp do Azure. (Aby to osiągnąć, należy zalogować się na [Visual Studio IDE, Code Editor, Team Services, & Mobile Center](https://www.visualstudio.com/) i w Visual Studio Dev Essentials kliknąć na Use your benefits)

Zmotywowało mnie to, do zaaktualizowania mojej wiedzy na temat ASP.Net w wersji Core (z racji użytego wspomnianego wcześniej OSX, jest to w sumie jedyna opcja). W pierwszej kolejności stworzyłem stronę główną oraz dodałem trochę opisów oraz boczny panel. Wszystko oparte na bootstrapie. Z czasem zmotywowany dodałem bazę (EF Core), a strukturę strony oparłem na Depedency Injection, którego tak bardzo do tej pory się bałem. Obecnie pracuję nad Admin Panelem, który będzie dostępny po zalogowaniu, gdzie będziemy mogli zmienić kanały RSS, treści na stronach, oraz linki dostępne w menu i sidebarze oraz na stronie z Video (tu powinienem pewnie zrobić osobny datamodel, oraz parser przy dodawaniu).

Obecnie pracuję też nad systemem wpisów oraz obsługą znaczników markdown, którego brak w Wordpressie boli, a do którego przyzwyczaiłem się dzięki genialnemu i minimalistycznemu edytorowi tekstu “Bear” (można pisać też w każdym innym, np. **Visual Studio Code**).
Podsumowując projekt: ([https://github.com/aluspl/LifeLIke](https://github.com/aluspl/LifeLIke))



 	
  * Framework ASP.Net MVC Core 1.1

 	
  * Hostowany na Azure i publikowane tam dzięki CI (Continuous Integration ).

 	
  * Repozytoria dostępne na githubie, gdzie możecie “forkować” skończoną wersję.

 	
  * **ORM**: Entity Framework Core

 	
  * **IDE**: JetBrains Rider


```id="attachment_1821" align="aligncenter" width="720"][![Podsumowanie](http://szymonmotyka.pl/wp-content/uploads/2017/06/Screenshot-2017-06-27-18.25.21-785x509.png)](http://szymonmotyka.pl/wp-content/uploads/2017/06/Screenshot-2017-06-27-18.25.21.png) Strona główna lifelike.pl wkrótce wszystko będzie konfigurowane```


## VLOG


Kolejnym projektem, związanym z blogiem jest VLOG. Były podróżnicze, ale postanowiłem rozszerzyć bardziej personalną, gadżetową i technologiczną część VLOG’a. Będzie można znaleźć ciekawostki z projektów, więcej gadżetów oraz mniej formalności. Póki co kręcone jest za pomocą smartfona i z pomocą aparatu, ale czekam na dostawę specjalnego sprzętu. Zapraszam więc na kanał do subskrypcji.
Przy okazji jestem na etapie testowania aplikacji do montażu:



 	
  1. **IMovie** na macu jest super, ale czasami brakuje więcej opcji korekcji kolorów oraz presetów.

 	
  2. ** Vegas Pro 14 Edit** (już nie Sony). Ale najpierw sprawdzę Triala, którego niestety nie ma na Mac’a, ale jest w mocno kuszącej propozycji obecnie na steamie (do 6 lipca 2017).

 	
  3. **Adobe Premiere** nie miałem okazji za mocno przetestować z racji zbyt krótkiego triala. W sumie ciekawą ma też ofertę za 60 Euro miesięcznie za pakiet Photoshop, Lightroom, After Effect, Premiere.

 	
  4. **Final Cut Pro** za drogi, ale jest satysfakcjonującym rozszerzeniem IMovie. Zmontowałem w nim film z Grecji. Więc najbliższy film na kanale, będzie efektem pracy w Vegas Pro 14.

 	
  5. Podsumowanie


To tyle w tym poście. W chwili pisania powinienem skupić się na obróbce zdjęć z ostatniego eventu, w którym pomagałem lub po prostu pójść spać. Ale jakoś dopadła mnie nocna inspiracja, więc piszę ten blog i modyfikuję [lifelike.pl](http://lifelike.pl). Jeśli macie jakieś sugestię, co do programu do montowania filmów oraz powyższych projektów, zapraszam do komentowania! Sugestie mile widziane :)

KEEP CALM AND DRINK COOFEE!

```id="attachment_1790" align="aligncenter" width="480"][![Podsumowanie](http://szymonmotyka.pl/wp-content/uploads/2017/05/20170531_203833.gif)](http://szymonmotyka.pl/wp-content/uploads/2017/05/20170531_203833.gif) Toast po raz 3. :)```
