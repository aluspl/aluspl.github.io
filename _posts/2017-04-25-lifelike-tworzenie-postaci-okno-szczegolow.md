---
layout: post
title: LifeLike - Tworzenie Postaci i Okno Szczegółów
date: 2017-04-25 20:18
author: Alus
comments: true
categories: [Daj Się poznać, dsp, dsp2017, LifeLike, Programowanie, Unity3d, unity3d]
---
Już słyszę ten chór ludzi, którzy wołają “<strong>Buuuu</strong>! Gdzie ta cholerna walka i te cholerne tury!”.
I wiecie co? Macie rację … ale pomęczę was dłużej. W dzisiejszym odcinku naszej telenoweli pod tytułem “LifeLike - żmudny proces tworzenia prostej gry”, kontynuuje temat UI.
<h2>Dług technologiczny</h2>
Na swoim blogu i prezentacjach Arek (<a href="http://www.benedykt.net/">http://www.benedykt.net/</a>) wielokrotnie wspominał na temat długu technologicznego i zasadach Solid. Ten pierwszy jest kluczowy i rozwija trochę temat długiego tworzenia projektu i każdego modułu. Jak wiadomo, gdy pójdziemy na skróty w tworzeniu i wykonamy dużo rzeczy na odpieprz, zemści się to na nas w procesie refaktoryzacji czy optymalizacji lub w późniejszym rozwoju. Czyli wszelako źle zaprojektowany projekt, kod będzie szybkim rozwiązaniem, ale za przeproszeniem ch.. rozwiązaniem. Wiem, że nie jest to idealnie <strong>SOLIDowy</strong> projekt, gdyż nie ma depedency injector. Pewnie wiele modułów i rozwiązań można by było lepiej oprogramować , a sposób otwarcia paneli też mógłby być lepszy, ale staram się wciąż rozwijać w technologii tworzenia gier.
<h2>Tworzenie Postaci - Ciąg dalszy</h2>
Wiecie, czego najbardziej brakuje mi w tworzeniu UI do Unity? <strong>MVVM</strong> (<strong>Model View ViewModel</strong>), gdzie w warstwie <strong>ViewModel</strong> mamy tylko Properties i logikę biznesową. Naszym modelem byłby np. <strong>CharacterStatisticDataModel</strong>, a w warstwie <strong>View</strong> bindowalibyśmy elementy z Widoku. Wiecie ile zaoszczędziło by to kodu i pracy w implementacji okien, które mają dość dużo pól? … Sporo. Marudzę na to, ponieważ w oknie tworzenia postaci dodałem nowe pola i kontrolki - do ustawiania statystyk. Na tę chwilę wszystkie nasze statystyki zaczynają się od 1. Limit punktów dla postaci wynosi 10. Poniżej 0 nie stworzymy postaci. Wyżej niż 10 .. no way!
Jak zauważyliście w poprzedniej części, dla kontrolek tworzy się listenery z delegatami zamiast akcji z delegatami. Dla Sliderów, których używamy do rozdysponowania punktów dla każdej wartości używamy onValueChanged.

[csharp]
StrengthSlider.onValueChanged.AddListener(StrengthChanged);
[/csharp]

Brakuje trochę wpf parametru, do jakiej kontrolki się odwołujemy. Uprościłoby to trochę kod.<a href="http://szymonmotyka.pl/wp-content/uploads/2017/04/Screenshot-2017-04-25-21.07.40.png"><img class="aligncenter size-large wp-image-1732" src="http://szymonmotyka.pl/wp-content/uploads/2017/04/Screenshot-2017-04-25-21.07.40-785x491.png" alt="Tworzenie Postaci" width="785" height="491" /></a>

Następnym kluczowym dla projektu elementem jest okno postaci. W obecnej wersji tylko ze statystykami i imieniem. W przyszłości -&gt; z ekwipunkiem i dodatkowym atrybutami.
Pod klawiszem <strong>i</strong> otwieramy nasze okienko z postacią. Kiedy je otwieramy, wyłączamy obsługę klawiszy i wyłączamy UI gry.

[csharp]
 if (!OpenedWindow)
        {
            if (Input.GetKeyDown(LightKey)) IsDay = !IsDay;
            if (Input.GetKeyDown(FightNormalKey)) FightSystem.AttackEnemy();
            if (Input.GetKeyDown(SelectEnemyKey)) SelectEnemy();
            if (Input.GetKeyDown(ExitKey)) EndGame();
            if (Input.GetKeyDown(OpenDetailKey)) OpenDetail();
            _gameUI.enabled = true;
        }
        else
        {
            _gameUI.enabled = false;
        }
[/csharp]

Dotyczy to również okna kreatora postaci (w końcu, kto chce manipulować światłem w trakcie wpisywania swojego imienia).
Na obecną chwilę, zamknięcie Okna ze szczegółami postaci lub kreatora polega na … zabiciu go i Zmianie *OpenedWindow* na false.
Szczerze, w tym oknie tak samo brakowało mi MVVM, ale w mniejszym stopniu, pewnie odczuję brak na późniejszym etapie - w przypadku nowych poziomów i opcji dodania skill point.<a href="http://szymonmotyka.pl/wp-content/uploads/2017/04/Screenshot-2017-04-25-21.06.32.png"><img class="aligncenter size-large wp-image-1731" src="http://szymonmotyka.pl/wp-content/uploads/2017/04/Screenshot-2017-04-25-21.06.32-785x491.png" alt="Tworzenie Postaci" width="785" height="491" /></a>
<h2>Podsumowanie</h2>
To tyle na dzisiaj w tematyce <strong>UI</strong>. Pod <a href="https://github.com/aluspl/RogueLikeDSP">adresem</a>: Dostępna jest również zaaktualizowana wersja gry, m.in wzbogacona o nowe okno postaci. Następny wpis już w weekend :)
Cheers

<a href="http://szymonmotyka.pl/wp-content/uploads/2017/04/lifelike.mov">Filmik z gry</a> w mov (quick time) inaczej nie zapisuje
