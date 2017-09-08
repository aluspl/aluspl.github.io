---
author: Alus
comments: true
date: 2017-04-23 21:49:31+00:00
layout: post
link: http://szymonmotyka.pl/lifelike-kreator-tworzenia-postaci/
slug: lifelike-kreator-tworzenia-postaci
title: LifeLike - UI i Kreator Tworzenia Postaci
wordpress_id: 1720
categories:
- Daj Się poznać
- Programowanie
- Unity3d
tags:
- dsp
- dsp2-
- dsp2017
- LifeLike
- unity3d
---

W poprzedniej części było coś na temat tworzenia UI, teraz przejdziemy do tworzenia naszej postaci. Czyli tworzymy “czarodzieja” dla postaci. (ang. Wizard - Czarodziej - czyli okno z kreatorem)
Kod prezentowany w dalszej części, jak zwykle dostępny w całości na [GitHubie](https://github.com/aluspl/RogueLikeDSP).

<!-- more -->


## Okno Modalne


Kreator zacząłem od stworzenia Obiektu CharacterCreator ze skryptem do zarządzania oraz z canvas od UI do okna w środku. Przyznam, że długo myślałem, jak to rozwiązać od strony Unity, a nie jako typowy desktopowy UI z użyciem WPF i MVVM. Czytaj - praca po staremu, akcje na wybór elementu z menu rozwijanego. A także wkrótce statystyki.
Tak, o to wygląda kod do tworzenia widoku oraz wszelkich ustawień dla kontrolek, typu listenery dla zmieniającego się tekstu, klikania w przyciski czy wybór postaci.

```
private void SetupView()
    {
        GameManager.Instance.GameUI.enabled = false;
        _characterUiCanvas = GetComponentInChildren<Canvas>();
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

            ClassListDropdown.options = _characterClasses.Select(p => new Dropdown.OptionData(name=p.Value)).ToList();;
            ClassListDropdown.onValueChanged.AddListener(OnClassSelect);
            OnClassSelect(ClassListDropdown.value);
        }

    }
```

Dodatkowo przy zamykaniu okna, wyłączamy ten Canvas i włączamy nowy poprzez:

```
    public void OnDestroy()
    {
        GameManager.Instance.GameUI.enabled = true;
        _characterUiCanvas.enabled = false;
    }
```

[![UI](http://szymonmotyka.pl/wp-content/uploads/2017/04/Screenshot-2017-04-23-23.28.52-785x402.png)](http://szymonmotyka.pl/wp-content/uploads/2017/04/Screenshot-2017-04-23-23.28.52.png)


## Lista klas dla tworzenia postaci


Jak wspominałem przy tworzeniu CharacterFactory, powstał słownik z listą klas postaci -> Klucz to nazwa skrócona (dla fabryki) oraz Wartość - jako dłuższa i widoczna nazwa klasy. Tak więc SuperHobo - Super Hobo itp. Pobrałem więc listę i przekształciłem w:

```
ClassListDropdown.options = _characterClasses.Select(p => new Dropdown.OptionData(name=p.Value)).ToList();
```

_CharacterClasses jest dodatkowo potrzebne po to, aby pobrać wartość dla wybranego elementu z dropdown elementu.

[caption id="attachment_1723" align="aligncenter" width="785"][![LifeLIke](http://szymonmotyka.pl/wp-content/uploads/2017/04/Screenshot-2017-04-23-23.29.06-785x394.png)](http://szymonmotyka.pl/wp-content/uploads/2017/04/Screenshot-2017-04-23-23.29.06.png) Okno Wyboru Postaci[/caption]


## Statystyki


Jest to element, nad którym pomyślę w najbliższym czasie, powiadomię o tym w następnym wpisie, czy już się pojawił, bo jak juz stworzyliśmy postać, wypada nadać mu też statystyki.


## Podsumowanie


To tyle na dzisiaj. Wybaczcie, że tak krótko, ale nie udało mi się napisać więcej kodu. Oczekujcie, że w tym tygodniu, ale i także w trakcie majówki nadrobię swoją nieobecność. W końcu jeszcze podróżniczy blog i video w natarciu!

Pozdrawiam!


## !!


Można wypróbować kolejną wersję [Aplikacji](http://aluspl.github.io/RogueLikeDSP/Versions/GUIAndCharacterCreator/) ;)
