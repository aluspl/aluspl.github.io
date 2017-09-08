---
author: Alus
comments: true
date: 2017-08-26 14:20:58+00:00
layout: post
link: http://szymonmotyka.pl/od-zera-do-dockera-web-api/
slug: od-zera-do-dockera-web-api
title: 'Od Zera do Dockera: ASP.NET Core'
wordpress_id: 1857
categories:
- C#
- Programowanie
tags:
- asp.net
- ASP.NET Core
- c#
- czyjebnie.pl
- Docker
- lifelike.pl
- Programowanie
- Programowanie c++
- webapi
---

Tym razem, zamiast dzielić się “lifestylowymi” i projektowymi newsami, zacznę cykl “koderski”.
Jak wcześniej wspominałem, stworzyłem open sourcową pogodynkę, którą można znaleźć pod domeną [http://czyjebnie.pl ](http://czyjebnie.pl).
Żeby nie przedłużać: Miłej zabawy!


## Wstęp


Do zabawy z dockerami zmotywowały mnie warsztaty Michała Franca ([link](http://www.mfranc.com)) oraz blog Piotra Gankiewicza ([link](http://piotrgankiewicz.com/blog/)), który pomógł mi w poprawnym deploymencie oraz konfiguracji serwera. W 1. części kursu zajmę się stroną ASP.NET Core 2.0, a w drugiej zagadnieniem samego docker’a.
Czemu Docker? Dla sportu. Mogłem użyć normalnego deploymentu, jak w przypadku http://lifelike.pl , ale chciałem sprawdzić jak to działa w praktyce. Poza tym, jeszcze można sporo rozwinąć i podzielić logikę na parę mikroserwisów.


## ASP.NET Core


Dlaczego ASP.NET Core? Bo nie przepadam za JS w tym Node.js, Ruby’m, a co najgorsze php, pewnie wielu odradzi, ale wciąż wolę starego dobrego **Razor’a**. W **czyjebnie**.pl oprę się jednak na **webapi**. Strona jest statyczna, a do poglądu API użyłem **Swagger’a**.
Zatem zacznijmy od pobrania runtime i sdk do .Net Core ze strony: [https://www.microsoft.com/net/download/core#/runtime](https://www.microsoft.com/net/download/core#/runtime). W chwili pisania, jest to wersja 2.0. Osobiście, z racji poręczności instaluję wersję pod MacOS, ale jeśli używasz innego systemu, dobierz pod siebie … tzn. swój system. :)


## Pierwszy projekt


Tu z pomocą i ułatwieniem przyszły template’y, które udostępnił MS  ([https://github.com/dotnet/templating/wiki/Available-templates-for-dotnet-new](https://github.com/dotnet/templating/wiki/Available-templates-for-dotnet-new)) oraz w przypadku mikroserwisów, event busów itp. pomocny był template od wspomniany wcześniej Michała (link do jego template).
W przypadku tego projektu, użyłem template’u zwanego ASP.NET Core Web API.

Aby utworzyć projekt wystarczy użyć komendy w terminalu:

[code]
	dotnet new webapi -n nazwaprojektu -o scieżkaprojektu
[/code]



## Omówienie projektu


Teraz przejdźmy do omówienia stworzonego przez nas projektu, opiszę to na przykładzie wcześniej stworzonego projektu:

[![](http://szymonmotyka.pl/wp-content/uploads/2017/08/Screenshot-2017-08-25-15.06.05-418x1024.png)](http://szymonmotyka.pl/wp-content/uploads/2017/08/Screenshot-2017-08-25-15.06.05.png) Drzewo projektu

Tu mała ciekawostka, do tej pory Nuget (repozytorium bibliotek) przyzwyczaiło nas, że wszystkie paczki znajdują się w odpowiednim pliku, który był tylko listą paczek package.config. Nie ukrywam, brakuje mi tego pliku :)
Tutaj, wszystkie paczki dodajemy w pliku projektu w grupie obiektu. Tak samo konfigurujemy obsługę **CLI** np. do **Entity Framework**, czy innych wybranych narzędzi.

[code]
	<ItemGroup>
    		<PackageReference Include="Microsoft.AspNetCore" Version="2.0.0" />
	</ItemGroup>
[/code]

W dokumencie program.cs ustalamy parametry do inicjacji serwera, a w startup.cs możemy “wczepić” nasze moduły, oraz konfigurację serwera, zawierającą takie informacje jak lokalizacja plików, przekierowywanie czy ustawienia.


## Kontrolery


Jeśli ktoś miał już doczynienia z asp.net mvc czy z web api, to może pominąć ten akapit, ponieważ nic odkrywczego tutaj nie znajdziecie. Jeśli jednak jesteś ciekaw - zapraszam. Generalnie, kontroler służy do obsługi zapytań na poziomie HTTP - w przypadku API -> REST, a w przypadku Razor’a -> zwrot Widoków (CSHTML).


### Przekierowywanie zapytań


Aby ułatwić sobie zapytania - “adresologię” (do zapytań) - w asp.net core używamy Routingu. Może się odbyć to na 2 sposoby:

1. Startup.cs
W metodzie Configure, dodajemy kolejne ścieżki:


 ```c# 

     app.UseMvc(routes =>
            {
                routes.MapRoute(
                    name: "default",
                    template: "{controller=Home}/{action=Index}/{id?}");
            });

 ```c# 


Ważne! nazwy routingów nie mogą się powtarzać :)

2. Atrybuty w kontrolerze
Ten sposób jest jak dla mnie bardziej intuicyjny i żałuję, że go wcześniej nie odkryłem. Przy nazwie klasy kontrolera, umieszczamy główne przekierowanie:


 ```c# 

    [Route("Pogoda")]
    public class WeatherController: Controller

 ```c# 


Dzięki czemu, zapytania zaczynają się od adres:port/Pogoda/
A następnie przy metodach ustalamy szczegółowe zapytania, jak np:


 ```c# 

        [HttpGet("{miasto}")]
        public async Task<IActionResult> Get(string miasto)
	[HttpGet("Full/{miasto}")]
        public async Task<IActionResult> GetFull(string miasto)

 ```c# 


Tak więc w 1. przykładzie mamy adres:port/Pogoda/{miasto} a w drugim adres:port/Pogoda/Full/{miasto}


### Wstrzykiwanie zależności


Niektórzy wstrzykują sobie morfinę, inni kofeinę (np. **aeropressem**). W programowaniu, **Depedency Injection** nie jest aż tak inwazyjne, a nawet zbawienne. Jest to przydatny **pattern**, zwłaszcza jak robimy większe serwisy.
Dla przykładu: **WeatherService**
Serwis, który implementuje interfejs IWeatherService ( w którym wrzuciliśmy metody: )


 ```c# 

        Task<Weather> GetForCity(string city);
        Task<WeatherSummary>  StatusForCity(string city);
        Task<FileStream> ImageForCity(string city);
        Task<FileStream> ImageForCity(string city, int hour);
        Task<WeatherSummar>  StatusForCity(string city, int hour);

 ```c# 


A następnie wrzuciliśmy do **Startup.cs** w **ConfigureService**:


 ```c# 

            services.AddSingleton<IWeatherService, WeatherService>();

 ```c# 


Równie dobrze, w **WeatherService** możemy wrzucić inne klasy, bazujące na tym samym interfejsie, ale korzystające np. z innego API pogodynki, czy z API testowego, podkładającego nam dane z kosmosu, czy nawet ze Słońca (na które podobno w Korei Północnej dolecieli w nocy oraz wrócili tego samego dnia) :)
A teraz najlepsze, żeby dostać się do naszego serwisu, czy każdego innego istniejącego, w konstruktorze kontrolera (lub innego serwisu)
dodajemy parametr **IWeatherService** oraz przypisujemy go do lokalnej zmiennej.
O taaaak:


 ```c# 

public WeatherController(IWeatherService weather)
        {
            _weather = weather;
        }
        private readonly IWeatherService _weather;

 ```c# 


Możemy pójść **GŁĘĘBIEJ** i wejść w kolejny stan snu!
W lifelike.pl użyłem repozytoria do danych **ILinkRepository** , w **LinkRepository** odwołuję się do wstrzykniętej w startup.cs bazy:


 ```c# 

  private readonly PortalContext _context;
        public LinkRepository(PortalContext context)
        {
            _context = context;
        }

 ```c# 


Dzięki temu, warstwa operowania na danych jest pomiędzy, a bazę… zawsze można zmienić :) tak samo zapytania do bazy. Dzięki temu kontroler nie musi wiedzieć co głębiej dokładnie siedzi. Tylko dostaje metody, które może użyć :)

Szczegóły na : **Dependency Injection** in ASP.NET Core

([https://docs.microsoft.com/en-us/aspnet/core/fundamentals/dependency-injection](https://docs.microsoft.com/en-us/aspnet/core/fundamentals/dependency-injection))


## Podgląd API


Jestem człowiekiem praktycznym, jeśli coś dobrze działa, to używam, jeśli chcę odkryć jak coś działa.. piszę to sam. Tu jednak posłużę się gotowcem. Jeśli tworzymy API, które dostarczamy innym programistom czy klientowi, polecam użyć biblioteki **Swagger**. Generuje ona stronę, która wyświetla wszystkie zapytania API, które mamy w naszych kontrolerach, opierając się na atrybutach oraz tworzy od razu tester tych metod.
Przykład można znaleźć na [Swagger UI](http://czyjebnie.pl/swagger/)
Instalacja tego jest prosta.
Dodajemy paczki:
[![](http://szymonmotyka.pl/wp-content/uploads/2017/08/Screenshot-2017-08-25-15.08.23-785x604.png)](http://szymonmotyka.pl/wp-content/uploads/2017/08/Screenshot-2017-08-25-15.08.23.png) Swagger
[code]
    <PackageReference Include="Swashbuckle.AspNetCore" Version="1.0.0" />
    <PackageReference Include="Swashbuckle.AspNetCore.Swagger" Version="1.0.0" />
    <PackageReference Include="Swashbuckle.AspNetCore.SwaggerGen" Version="1.0.0" />
    <PackageReference Include="Swashbuckle.AspNetCore.SwaggerUI" Version="1.0.0" />
[/code]

A następnie w startup w **ConfigureServices** dodajemy:


 ```c# 

  services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new Info { Title = "CzyJebnie API", 
                    Version = "v1",
                    Description = "API do pogodynki pod tytułem CzyJebnie",
                    TermsOfService = "None",
                    Contact = new Contact { Name = "Szymon Motyka", Email = "szymon@lifelike.pl", Url = "https://lifelike.pl"}
                });
            });
}

 ```c# 


oraz w **Configure**:


 ```c# 

  app.UseSwagger();

            // Enable middleware to serve swagger-ui (HTML, JS, CSS etc.), specifying the Swagger JSON endpoint.
            app.UseSwaggerUI(c =>
            {
                c.SwaggerEndpoint("/swagger/v1/swagger.json", "My API V1");
            });

 ```c# 


A podgląd dostępny na adres:port/swagger/
Proste, czyż nie :) ? Taki “rocket science” na poziomie Korei Północnej!
I nie… to nie jebnie!

[![](http://szymonmotyka.pl/wp-content/uploads/2017/08/northkorea.gif)](http://szymonmotyka.pl/wp-content/uploads/2017/08/northkorea.gif)


## Podsumowanie


Zostawiam was z takim cliffhangerem i każę czekać do następnego odcinka, który pojawi się za tydzień. Przy okazji, mały screenshot z nowego feature’a w **lifelike** : rpg (muszę jakoś sensowniej ponazywać projekty). Jest to drop system grafiki w postaci aeropressu oraz apteczki polowej, zostały wykonane przez Olę. Web player będzie dostępny, jak skończę cały ten motyw.
