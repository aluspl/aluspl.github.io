---
layout: post
title: Od Zera do Dockera: ASP.NET Core
date: 2017-08-26 15:20
author: Alus
comments: true
categories: [asp.net, ASP.NET Core, c#, C#, czyjebnie.pl, Docker, lifelike.pl, Programowanie, Programowanie, Programowanie c++, webapi]
---
Tym razem, zamiast dzielić się “lifestylowymi” i projektowymi newsami, zacznę cykl “koderski”.
Jak wcześniej wspominałem, stworzyłem open sourcową pogodynkę, którą można znaleźć pod domeną <a href="http://czyjebnie.pl">http://czyjebnie.pl </a>.
Żeby nie przedłużać: Miłej zabawy!
<h2>Wstęp</h2>
Do zabawy z dockerami zmotywowały mnie warsztaty Michała Franca (<a href="http://www.mfranc.com">link</a>) oraz blog Piotra Gankiewicza (<a href="http://piotrgankiewicz.com/blog/">link</a>), który pomógł mi w poprawnym deploymencie oraz konfiguracji serwera. W 1. części kursu zajmę się stroną ASP.NET Core 2.0, a w drugiej zagadnieniem samego docker’a.
Czemu Docker? Dla sportu. Mogłem użyć normalnego deploymentu, jak w przypadku http://lifelike.pl , ale chciałem sprawdzić jak to działa w praktyce. Poza tym, jeszcze można sporo rozwinąć i podzielić logikę na parę mikroserwisów.
<h2>ASP.NET Core</h2>
Dlaczego ASP.NET Core? Bo nie przepadam za JS w tym Node.js, Ruby’m, a co najgorsze php, pewnie wielu odradzi, ale wciąż wolę starego dobrego <strong>Razor’a</strong>. W <strong>czyjebnie</strong>.pl oprę się jednak na <strong>webapi</strong>. Strona jest statyczna, a do poglądu API użyłem <strong>Swagger’a</strong>.
Zatem zacznijmy od pobrania runtime i sdk do .Net Core ze strony: <a href="https://www.microsoft.com/net/download/core#/runtime">https://www.microsoft.com/net/download/core#/runtime</a>. W chwili pisania, jest to wersja 2.0. Osobiście, z racji poręczności instaluję wersję pod MacOS, ale jeśli używasz innego systemu, dobierz pod siebie … tzn. swój system. :)
<h2>Pierwszy projekt</h2>
Tu z pomocą i ułatwieniem przyszły template’y, które udostępnił MS  (<a href="https://github.com/dotnet/templating/wiki/Available-templates-for-dotnet-new">https://github.com/dotnet/templating/wiki/Available-templates-for-dotnet-new</a>) oraz w przypadku mikroserwisów, event busów itp. pomocny był template od wspomniany wcześniej Michała (link do jego template).
W przypadku tego projektu, użyłem template’u zwanego ASP.NET Core Web API.

Aby utworzyć projekt wystarczy użyć komendy w terminalu:

[code]
	dotnet new webapi -n nazwaprojektu -o scieżkaprojektu
[/code]

<h2>Omówienie projektu</h2>
Teraz przejdźmy do omówienia stworzonego przez nas projektu, opiszę to na przykładzie wcześniej stworzonego projektu:

[caption id="attachment_1859" align="aligncenter" width="418"]<a href="http://szymonmotyka.pl/wp-content/uploads/2017/08/Screenshot-2017-08-25-15.06.05.png"><img class="size-large wp-image-1859" src="http://szymonmotyka.pl/wp-content/uploads/2017/08/Screenshot-2017-08-25-15.06.05-418x1024.png" alt="" width="418" height="1024" /></a> Drzewo projektu[/caption]

Tu mała ciekawostka, do tej pory Nuget (repozytorium bibliotek) przyzwyczaiło nas, że wszystkie paczki znajdują się w odpowiednim pliku, który był tylko listą paczek package.config. Nie ukrywam, brakuje mi tego pliku :)
Tutaj, wszystkie paczki dodajemy w pliku projektu w grupie obiektu. Tak samo konfigurujemy obsługę <strong>CLI</strong> np. do <strong>Entity Framework</strong>, czy innych wybranych narzędzi.

[code]
	&lt;ItemGroup&gt;
    		&lt;PackageReference Include=&quot;Microsoft.AspNetCore&quot; Version=&quot;2.0.0&quot; /&gt;
	&lt;/ItemGroup&gt;
[/code]

W dokumencie program.cs ustalamy parametry do inicjacji serwera, a w startup.cs możemy “wczepić” nasze moduły, oraz konfigurację serwera, zawierającą takie informacje jak lokalizacja plików, przekierowywanie czy ustawienia.
<h2>Kontrolery</h2>
Jeśli ktoś miał już doczynienia z asp.net mvc czy z web api, to może pominąć ten akapit, ponieważ nic odkrywczego tutaj nie znajdziecie. Jeśli jednak jesteś ciekaw - zapraszam. Generalnie, kontroler służy do obsługi zapytań na poziomie HTTP - w przypadku API -&gt; REST, a w przypadku Razor’a -&gt; zwrot Widoków (CSHTML).
<h3>Przekierowywanie zapytań</h3>
Aby ułatwić sobie zapytania - “adresologię” (do zapytań) - w asp.net core używamy Routingu. Może się odbyć to na 2 sposoby:

1. Startup.cs
W metodzie Configure, dodajemy kolejne ścieżki:

[csharp]
     app.UseMvc(routes =&gt;
            {
                routes.MapRoute(
                    name: &quot;default&quot;,
                    template: &quot;{controller=Home}/{action=Index}/{id?}&quot;);
            });
[/csharp]

Ważne! nazwy routingów nie mogą się powtarzać :)

2. Atrybuty w kontrolerze
Ten sposób jest jak dla mnie bardziej intuicyjny i żałuję, że go wcześniej nie odkryłem. Przy nazwie klasy kontrolera, umieszczamy główne przekierowanie:

[csharp]
    [Route(&quot;Pogoda&quot;)]
    public class WeatherController: Controller
[/csharp]

Dzięki czemu, zapytania zaczynają się od adres:port/Pogoda/
A następnie przy metodach ustalamy szczegółowe zapytania, jak np:

[csharp]
        [HttpGet(&quot;{miasto}&quot;)]
        public async Task&lt;IActionResult&gt; Get(string miasto)
	[HttpGet(&quot;Full/{miasto}&quot;)]
        public async Task&lt;IActionResult&gt; GetFull(string miasto)
[/csharp]

Tak więc w 1. przykładzie mamy adres:port/Pogoda/{miasto} a w drugim adres:port/Pogoda/Full/{miasto}
<h3>Wstrzykiwanie zależności</h3>
Niektórzy wstrzykują sobie morfinę, inni kofeinę (np. <strong>aeropressem</strong>). W programowaniu, <strong>Depedency Injection</strong> nie jest aż tak inwazyjne, a nawet zbawienne. Jest to przydatny <strong>pattern</strong>, zwłaszcza jak robimy większe serwisy.
Dla przykładu: <strong>WeatherService</strong>
Serwis, który implementuje interfejs IWeatherService ( w którym wrzuciliśmy metody: )

[csharp]
        Task&lt;Weather&gt; GetForCity(string city);
        Task&lt;WeatherSummary&gt;  StatusForCity(string city);
        Task&lt;FileStream&gt; ImageForCity(string city);
        Task&lt;FileStream&gt; ImageForCity(string city, int hour);
        Task&lt;WeatherSummar&gt;  StatusForCity(string city, int hour);
[/csharp]

A następnie wrzuciliśmy do <strong>Startup.cs</strong> w <strong>ConfigureService</strong>:

[csharp]
            services.AddSingleton&lt;IWeatherService, WeatherService&gt;();
[/csharp]

Równie dobrze, w <strong>WeatherService</strong> możemy wrzucić inne klasy, bazujące na tym samym interfejsie, ale korzystające np. z innego API pogodynki, czy z API testowego, podkładającego nam dane z kosmosu, czy nawet ze Słońca (na które podobno w Korei Północnej dolecieli w nocy oraz wrócili tego samego dnia) :)
A teraz najlepsze, żeby dostać się do naszego serwisu, czy każdego innego istniejącego, w konstruktorze kontrolera (lub innego serwisu)
dodajemy parametr <strong>IWeatherService</strong> oraz przypisujemy go do lokalnej zmiennej.
O taaaak:

[csharp]
public WeatherController(IWeatherService weather)
        {
            _weather = weather;
        }
        private readonly IWeatherService _weather;
[/csharp]

Możemy pójść <strong>GŁĘĘBIEJ</strong> i wejść w kolejny stan snu!
W lifelike.pl użyłem repozytoria do danych <strong>ILinkRepository</strong> , w <strong>LinkRepository</strong> odwołuję się do wstrzykniętej w startup.cs bazy:

[csharp]
  private readonly PortalContext _context;
        public LinkRepository(PortalContext context)
        {
            _context = context;
        }
[/csharp]

Dzięki temu, warstwa operowania na danych jest pomiędzy, a bazę… zawsze można zmienić :) tak samo zapytania do bazy. Dzięki temu kontroler nie musi wiedzieć co głębiej dokładnie siedzi. Tylko dostaje metody, które może użyć :)

Szczegóły na : <strong>Dependency Injection</strong> in ASP.NET Core

(<a href="https://docs.microsoft.com/en-us/aspnet/core/fundamentals/dependency-injection">https://docs.microsoft.com/en-us/aspnet/core/fundamentals/dependency-injection</a>)
<h2>Podgląd API</h2>
Jestem człowiekiem praktycznym, jeśli coś dobrze działa, to używam, jeśli chcę odkryć jak coś działa.. piszę to sam. Tu jednak posłużę się gotowcem. Jeśli tworzymy API, które dostarczamy innym programistom czy klientowi, polecam użyć biblioteki <strong>Swagger</strong>. Generuje ona stronę, która wyświetla wszystkie zapytania API, które mamy w naszych kontrolerach, opierając się na atrybutach oraz tworzy od razu tester tych metod.
Przykład można znaleźć na [Swagger UI](http://czyjebnie.pl/swagger/)
Instalacja tego jest prosta.
Dodajemy paczki:
[caption id="attachment_1861" align="aligncenter" width="720"]<a href="http://szymonmotyka.pl/wp-content/uploads/2017/08/Screenshot-2017-08-25-15.08.23.png"><img src="http://szymonmotyka.pl/wp-content/uploads/2017/08/Screenshot-2017-08-25-15.08.23-785x604.png" alt="" width="720" height="554" class="size-large wp-image-1861" /></a> Swagger[/caption]
[code]
    &lt;PackageReference Include=&quot;Swashbuckle.AspNetCore&quot; Version=&quot;1.0.0&quot; /&gt;
    &lt;PackageReference Include=&quot;Swashbuckle.AspNetCore.Swagger&quot; Version=&quot;1.0.0&quot; /&gt;
    &lt;PackageReference Include=&quot;Swashbuckle.AspNetCore.SwaggerGen&quot; Version=&quot;1.0.0&quot; /&gt;
    &lt;PackageReference Include=&quot;Swashbuckle.AspNetCore.SwaggerUI&quot; Version=&quot;1.0.0&quot; /&gt;
[/code]

A następnie w startup w <strong>ConfigureServices</strong> dodajemy:

[csharp]
  services.AddSwaggerGen(c =&gt;
            {
                c.SwaggerDoc(&quot;v1&quot;, new Info { Title = &quot;CzyJebnie API&quot;, 
                    Version = &quot;v1&quot;,
                    Description = &quot;API do pogodynki pod tytułem CzyJebnie&quot;,
                    TermsOfService = &quot;None&quot;,
                    Contact = new Contact { Name = &quot;Szymon Motyka&quot;, Email = &quot;szymon@lifelike.pl&quot;, Url = &quot;https://lifelike.pl&quot;}
                });
            });
}
[/csharp]

oraz w <strong>Configure</strong>:

[csharp]
  app.UseSwagger();

            // Enable middleware to serve swagger-ui (HTML, JS, CSS etc.), specifying the Swagger JSON endpoint.
            app.UseSwaggerUI(c =&gt;
            {
                c.SwaggerEndpoint(&quot;/swagger/v1/swagger.json&quot;, &quot;My API V1&quot;);
            });
[/csharp]

A podgląd dostępny na adres:port/swagger/
Proste, czyż nie :) ? Taki “rocket science” na poziomie Korei Północnej!
I nie… to nie jebnie!

<a href="http://szymonmotyka.pl/wp-content/uploads/2017/08/northkorea.gif"><img class="aligncenter size-full wp-image-1862" src="http://szymonmotyka.pl/wp-content/uploads/2017/08/northkorea.gif" alt="" width="246" height="204" /></a>
<h2>Podsumowanie</h2>
Zostawiam was z takim cliffhangerem i każę czekać do następnego odcinka, który pojawi się za tydzień. Przy okazji, mały screenshot z nowego feature’a w <strong>lifelike</strong> : rpg (muszę jakoś sensowniej ponazywać projekty). Jest to drop system grafiki w postaci aeropressu oraz apteczki polowej, zostały wykonane przez Olę. Web player będzie dostępny, jak skończę cały ten motyw.
