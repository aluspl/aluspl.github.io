---
layout: post
title: LifeLike - UI i Kreator Tworzenia Postaci
date: 2017-04-23 22:49
author: Alus
comments: true
categories: [Daj Się poznać, dsp, dsp2-, dsp2017, LifeLike, Programowanie, Unity3d, unity3d]
---
W poprzedniej części było coś na temat tworzenia UI, teraz przejdziemy do tworzenia naszej postaci. Czyli tworzymy “czarodzieja” dla postaci. (ang. Wizard - Czarodziej - czyli okno z kreatorem)
Kod prezentowany w dalszej części, jak zwykle dostępny w całości na <a href="https://github.com/aluspl/RogueLikeDSP">GitHubie</a>.

<!--more-->
<h2>Okno Modalne</h2>
Kreator zacząłem od stworzenia Obiektu CharacterCreator ze skryptem do zarządzania oraz z canvas od UI do okna w środku. Przyznam, że długo myślałem, jak to rozwiązać od strony Unity, a nie jako typowy desktopowy UI z użyciem WPF i MVVM. Czytaj - praca po staremu, akcje na wybór elementu z menu rozwijanego. A także wkrótce statystyki.
Tak, o to wygląda kod do tworzenia widoku oraz wszelkich ustawień dla kontrolek, typu listenery dla zmieniającego się tekstu, klikania w przyciski czy wybór postaci.

[csharp]
private void SetupView()
    {
        GameManager.Instance.GameUI.enabled = false;
        _characterUiCanvas = GetComponentInChildren&lt;Canvas&gt;();
        if (SaveButton!=null) SaveButton.onClick.AddListener(OnSaveClick);
        if (CharacterLeftPoint != null)
        {
            CharacterLeftPoint.text = CharacterLeftPointValue.ToString();
        }
        if (CharacterName != null)
        {
            CharacterName.onEndEdit.AddListener(EditName);
        }
        if (ClassListDropdown != null)
        {
            _characterClasses = CharacterFactory.PlayerClassList();

            ClassListDropdown.options = _characterClasses.Select(p =&gt; new Dropdown.OptionData(name=p.Value)).ToList();;
            ClassListDropdown.onValueChanged.AddListener(OnClassSelect);
            OnClassSelect(ClassListDropdown.value);
        }

    }
[/csharp]

Dodatkowo przy zamykaniu okna, wyłączamy ten Canvas i włączamy nowy poprzez:

[csharp]
    public void OnDestroy()
    {
        GameManager.Instance.GameUI.enabled = true;
        _characterUiCanvas.enabled = false;
    }
[/csharp]

<a href="http://szymonmotyka.pl/wp-content/uploads/2017/04/Screenshot-2017-04-23-23.28.52.png"><img class="aligncenter wp-image-1722 size-large" src="http://szymonmotyka.pl/wp-content/uploads/2017/04/Screenshot-2017-04-23-23.28.52-785x402.png" alt="UI" width="785" height="402" /></a>
<h2>Lista klas dla tworzenia postaci</h2>
Jak wspominałem przy tworzeniu CharacterFactory, powstał słownik z listą klas postaci -&gt; Klucz to nazwa skrócona (dla fabryki) oraz Wartość - jako dłuższa i widoczna nazwa klasy. Tak więc SuperHobo - Super Hobo itp. Pobrałem więc listę i przekształciłem w:

[csharp]
ClassListDropdown.options = _characterClasses.Select(p =&gt; new Dropdown.OptionData(name=p.Value)).ToList();
[/csharp]

_CharacterClasses jest dodatkowo potrzebne po to, aby pobrać wartość dla wybranego elementu z dropdown elementu.

[caption id="attachment_1723" align="aligncenter" width="785"]<a href="http://szymonmotyka.pl/wp-content/uploads/2017/04/Screenshot-2017-04-23-23.29.06.png"><img class="wp-image-1723 size-large" src="http://szymonmotyka.pl/wp-content/uploads/2017/04/Screenshot-2017-04-23-23.29.06-785x394.png" alt="LifeLIke" width="785" height="394" /></a> Okno Wyboru Postaci[/caption]
<h2>Statystyki</h2>
Jest to element, nad którym pomyślę w najbliższym czasie, powiadomię o tym w następnym wpisie, czy już się pojawił, bo jak juz stworzyliśmy postać, wypada nadać mu też statystyki.
<h2>Podsumowanie</h2>
To tyle na dzisiaj. Wybaczcie, że tak krótko, ale nie udało mi się napisać więcej kodu. Oczekujcie, że w tym tygodniu, ale i także w trakcie majówki nadrobię swoją nieobecność. W końcu jeszcze podróżniczy blog i video w natarciu!

Pozdrawiam!
<h2>!!</h2>
Można wypróbować kolejną wersję <a href="http://aluspl.github.io/RogueLikeDSP/Versions/GUIAndCharacterCreator/">Aplikacji</a> ;)
