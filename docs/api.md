# Документация по Researcher API V2

Основным путём для каталога с API является `/api/v2/`,
например, *http://researcher.genbank.vsu.ru/api/v2/primers* выдаст список праймеров.

Каждый запрос должен содержать в себе следующие заголовки:

* **Content-type: application/json** - все данные выдаются в формате JSON.
* **Accept: application/vnd.genbank-v2+json** - точное определение необходимой версии API.
* **X-API-Key** - ключ для доступа к API, выданный администратором (на данный момент пустой).

## Основные разделы

> Все последующие примеры не будут учитываться путь до API, например, при запросе *GET **/primers*** подразумевается запрос к **/api/v2/primers**.

Каждая коллекция (список) данных на каждую страницу содержит 20 элементов, для перехода по страницам необходимо добавлять целочисленный GET-параметр `page`. Подробная информация о разбиение по страницам находится в выдаваемом JSON-объекте под ключом `meta`.

### Праймеры

#### Список праймеров

> GET **/primers**

Параметры:

* `param_code` [String] - поиск по коду.
* `param_direction` [String] (forward/reverse)- поиск по направлению.
* `param_sequence` [String] - поиск по последовательности.
* `param_order` [String] (asc/desc) - атрибут для сортировки результата.
* `param_order_type` [String] (asc/desc) - тип сортировки.

Пример результата:

~~~~json
{
  "primers": [
    {
      "id": 6,
      "code": "HCO2100",
      "sequence": "GTAATAGCACCAGCTAAAACT",
      "direction": "forward",
      "created_at": "2016-12-21T06:07:56.213Z",
      "updated_at": "2016-12-21T06:07:56.213Z",
      "position_ids": [
        60,
        132
      ]
    },
  ],
    "meta": {
    "total_pages": 1,
    "total_entries": 11,
    "prev_page": null,
    "current_page": 1,
    "next_page": null
  }
}
~~~~

#### Праймер

> GET **/primers/:id**

Пример результата:

~~~~json
{
  "primer": {
    "id": 6,
    "code": "HCO2100",
    "sequence": "GTAATAGCACCAGCTAAAACT",
    "direction": "forward",
    "created_at": "2016-12-21T06:07:56.213Z",
    "updated_at": "2016-12-21T06:07:56.213Z",
    "position_ids": [
      60,
      132
    ]
  }
}
~~~~

### Генетические маркеры

#### Список

> GET **/genetic_markers**

Параметры:

* `param_marker` [String] - поиск по маркеру

Пример результата:

~~~~json
{
  "genetic_markers": [
    {
      "id": 2,
      "marker": "Внутренний транскрибируемый спейсер; 28S, 5.8S и 18S рибосомальная РНК",
      "created_at": "2016-12-28T09:57:43.381Z",
      "updated_at": "2016-12-28T09:57:43.381Z",
      "position_ids": [
        141,
        140,
        139
      ]
    }
  ],
  "meta": {
    "total_pages": 1,
    "total_entries": 2,
    "prev_page": null,
    "current_page": 1,
    "next_page": null
  }
}
~~~~

#### Маркер

> GET **/genetic_markers/:id**

Пример результата:

~~~~json
{
  "genetic_marker": {
    "id": 2,
    "marker": "Внутренний транскрибируемый спейсер; 28S, 5.8S и 18S рибосомальная РНК",
    "created_at": "2016-12-28T09:57:43.381Z",
    "updated_at": "2016-12-28T09:57:43.381Z",
    "position_ids": [
      141,
      140,
      139
    ]
  }
}
~~~~

### Вид полезности

#### Список

> GET **/useful_types**

Пример результата:

~~~~json
{
  "useful_types": [
    {
      "id": 3,
      "parent_id": null,
      "name": "Вредители",
      "created_at": "2016-12-22T17:42:19.026Z",
      "updated_at": "2016-12-22T17:42:19.026Z",
      "subtype_ids": [
        5,
        7,
        6,
        4
      ],
      "position_ids": []
    }
  ],
  "meta": {
    "total_pages": 1,
    "total_entries": 7,
    "prev_page": null,
    "current_page": 1,
    "next_page": null
  }
}
~~~~

#### Объект

> GET **/genetic_markers/:id**

Пример результата:

~~~~json
{
  "useful_type": {
    "id": 3,
    "parent_id": null,
    "name": "Вредители",
    "created_at": "2016-12-22T17:42:19.026Z",
    "updated_at": "2016-12-22T17:42:19.026Z",
    "subtype_ids": [
      5,
      7,
      6,
      4
    ],
    "position_ids": []
  }
}
~~~~


### Фотографии позиций

#### Список

> GET **/position_photos**

Пример результата:

~~~~json
{
  "position_photos": [
    {
      "id": 72,
      "priority": 0,
      "photo": {
      "url": "/uploads/position_photo/48dc943d-ad00-4a4b-bb52-1554d37de523.jpg",
      "thumb": {
      "url": "/uploads/position_photo/thumb_48dc943d-ad00-4a4b-bb52-1554d37de523.jpg"
      }
      },
      "photo_url": "/uploads/position_photo/48dc943d-ad00-4a4b-bb52-1554d37de523.jpg",
      "thumb_url": "/uploads/position_photo/thumb_48dc943d-ad00-4a4b-bb52-1554d37de523.jpg",
      "position_id": 55,
      "created_at": "2016-12-21T08:48:02.949Z",
      "updated_at": "2016-12-21T08:48:57.878Z"
    }
  ],
  "meta": {
    "total_pages": 5,
    "total_entries": 125,
    "prev_page": null,
    "current_page": 1,
    "next_page": 2
  }
}
~~~~

#### Фотограция

> GET **/position_photos/:id**

Пример результата:

~~~~json
{
  "position_photo": {
    "id": 72,
    "priority": 0,
    "photo": {
    "url": "/uploads/position_photo/48dc943d-ad00-4a4b-bb52-1554d37de523.jpg",
    "thumb": {
    "url": "/uploads/position_photo/thumb_48dc943d-ad00-4a4b-bb52-1554d37de523.jpg"
    }
    },
    "photo_url": "/uploads/position_photo/48dc943d-ad00-4a4b-bb52-1554d37de523.jpg",
    "thumb_url": "/uploads/position_photo/thumb_48dc943d-ad00-4a4b-bb52-1554d37de523.jpg",
    "position_id": 55,
    "created_at": "2016-12-21T08:48:02.949Z",
    "updated_at": "2016-12-21T08:48:57.878Z"
  }
}
~~~~

### Классификация (категории)

#### Список категорий

> GET **/categories**

Параметры:

* `param_parent_id` [Integer] - поиск по родительскому разделу.
* `param_full_name` [String] - поиск по названию.
* `param_original_name` [String] - поиск по латинскому названию.
* `param_name` [String] - поиск по русскому названию.
* `param_main_type` [String] (class, order, suborder, family) - поиск по типу классификации.
* `param_expect_id` [Integer] - исключить по ID.

Пример результата:

~~~~json
{
  "categories": [
    {
      "id": 47,
      "original_name": "Acaridae",
      "name": "Мучные клещи",
      "full_name": "Acaridae - Мучные клещи",
      "main_type": "family",
      "parent_id": 48,
      "created_at": "2016-12-24T12:26:34.828Z",
      "updated_at": "2016-12-27T07:36:05.266Z",
      "position_ids": [
        114
      ],
      "subcategory_ids": []
    }
  ],
  "meta": {
    "total_pages": 2,
    "total_entries": 53,
    "prev_page": null,
    "current_page": 1,
    "next_page": 2
  }
}
~~~~

#### Категория

> GET **/categories/:id**


Пример результата:

~~~~json
{
  "category": {
    "id": 47,
    "original_name": "Acaridae",
    "name": "Мучные клещи",
    "full_name": "Acaridae - Мучные клещи",
    "main_type": "family",
    "parent_id": 48,
    "created_at": "2016-12-24T12:26:34.828Z",
    "updated_at": "2016-12-27T07:36:05.266Z",
    "position_ids": [
      114
    ],
    "subcategory_ids": []
  }
}
~~~~

### Позиция

#### Список позиций

> GET **/positions**

Параметры:

* `param_full_name` [String] - поиск по названию.
* `param_original_name` [String] - поиск по латинскому названию.
* `param_name` [String] - поиск по русскому названию.
* `param_category_id`[Integer] - позиции по категории.
* `param_primer_id` [Integer] - позиции по праймерую.
* `param_genetick_marker_id` [Integer] - позиции по генетическому маркеру.
* `param_aligned_sequence` [String] - поиск по выровненной последовательности.
* `param_useful_type_id` [Integer] - позиции по полезности.
* `param_experiment_sequence` - поиск по последовательности эксперимента.

Пример результата:

~~~~json
{
  "positions": [
    {
      "id": 66,
      "original_name": "Adelphocoris lineolatus (Goeze, 1778) ",
      "name": "Слепняк люцерновый",
      "full_name": "Adelphocoris lineolatus (Goeze, 1778)  - Слепняк люцерновый",
      "description": "Тело взрослого клопа серо-зеленого или серовато-желтого цвета, длина 7,5-9,5 мм. Голова поперечная, усики едва короче тела. Переднеспинка одноцветная или с 2-4 темными пятнами; щиток вдоль середины с двумя сближенными коричневыми штрихами. Зимует в стадии яйца. В среднем самки откладывают 80-120 яиц, отдельные особи до 300 . При оптимальных условиях (среднесуточная температура воздуха 19-30° и влажность 60-70%) яйца развиваются в среднем 8-12 дней. Часть яиц диапаузирует до весны следующего года. Продолжительность личиночной стадии 1 поколения 20-30 дней. Развитие личинок 2 поколения длится 20-25 дней.",
      "importance": "Вредитель бобовых культур. Повреждает люцерну, эспарцет, реже донник, клевер, люпин и другие бобовые травы, спорадически - хлопчатник, арахис, нут, чечевицу, сою, фасоль, подсолнечник. Иногда во 2 поколении повреждает семенники сахарной свеклы. Может развиваться на многих дикорастущих бобовых, а также и на некоторых сложноцветных, крестоцветных и маревых. Личинки и имаго уничтожают всходы или повреждают их точки роста, угнетают прирост молодых побегов и цветоносов, уничтожают листовые и цветочные почки, повреждают молодые, еще не затвердевшие бобы и семена. Обитает в Западной Европе, Северной Африке, Передней Азии, Афганистане, Пакистане, Монголии, Китае, Японии; Северной Америке (завезен). Широко распространен в европейской части России к югу от Петрозаводска, Котласа и Ухты, на юге Сибири и Дальнего Востока; Казахстан; Средняя Азия.\r\n",
      "restriction_map": "<table border=\"0\" cellpadding=\"0\" class=\"ui celled selectable small striped table\" style=\"width:100%\">\r\n\t<thead>\r\n\t\t<tr>\r\n\t\t\t<th style=\"width:112px\">\r\n\t\t\t<p><strong>Рестриктаза</strong></p>\r\n\t\t\t</th>\r\n\t\t\t<th style=\"width:130px\">\r\n\t\t\t<p><strong>Сайт узнавания</strong></p>\r\n\t\t\t</th>\r\n\t\t\t<th style=\"width:139px\">\r\n\t\t\t<p><strong>Место разреза</strong></p>\r\n\t\t\t</th>\r\n\t\t</tr>\r\n\t</thead>\r\n\t<tbody>\r\n\t\t<tr>\r\n\t\t\t<td style=\"width:112px\">\r\n\t\t\t<p><a href=\"http://rebase.neb.com/rebase/enz/SspI.html\">SspI</a></p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:130px\">\r\n\t\t\t<p>AATATT</p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:139px\">\r\n\t\t\t<p>335</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td style=\"width:112px\">\r\n\t\t\t<p><a href=\"http://rebase.neb.com/rebase/enz/XmnI.html\">XmnI</a></p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:130px\">\r\n\t\t\t<p>GAANNNNTTC</p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:139px\">\r\n\t\t\t<p>251</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td style=\"width:112px\">\r\n\t\t\t<p><a href=\"http://rebase.neb.com/rebase/enz/BclI.html\">BclI</a></p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:130px\">\r\n\t\t\t<p>TGATCA</p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:139px\">\r\n\t\t\t<p>268</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td style=\"width:112px\">\r\n\t\t\t<p><a href=\"http://rebase.neb.com/rebase/enz/BseYI.html\">BseYI</a></p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:130px\">\r\n\t\t\t<p>CCCAGC</p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:139px\">\r\n\t\t\t<p>375</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td style=\"width:112px\">\r\n\t\t\t<p><a href=\"http://rebase.neb.com/rebase/enz/BsmAI.html\">BsmAI</a></p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:130px\">\r\n\t\t\t<p>GTCTC</p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:139px\">\r\n\t\t\t<p>383</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td style=\"width:112px\">\r\n\t\t\t<p><a href=\"http://rebase.neb.com/rebase/enz/BspMI.html\">BspMI</a></p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:130px\">\r\n\t\t\t<p>ACCTGC</p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:139px\">\r\n\t\t\t<p>67</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td style=\"width:112px\">\r\n\t\t\t<p><a href=\"http://rebase.neb.com/rebase/enz/Eco31I.html\">Eco31I</a></p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:130px\">\r\n\t\t\t<p>GGTCTC</p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:139px\">\r\n\t\t\t<p>383</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td style=\"width:112px\">\r\n\t\t\t<p><a href=\"http://rebase.neb.com/rebase/enz/EcoRI.html\">EcoRI</a></p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:130px\">\r\n\t\t\t<p>GAATTC</p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:139px\">\r\n\t\t\t<p>251</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td style=\"width:112px\">\r\n\t\t\t<p><a href=\"http://rebase.neb.com/rebase/enz/SfaNI.html\">SfaNI</a></p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:130px\">\r\n\t\t\t<p>GCATC</p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:139px\">\r\n\t\t\t<p>142</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\      1,
      2,
      3,
      21t\t\t<td style=\"width:112px\">\r\n\t\t\t<p><a href=\"http://rebase.neb.com/rebase/enz/TfiI.html\">TfiI</a></p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:130px\">\r\n\t\t\t<p>GAWTC</p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:139px\">\r\n\t\t\t<p>14</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td style=\"width:112px\">\r\n\t\t\t<p><a href=\"http://rebase.neb.com/rebase/enz/VspI.html\">VspI</a></p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:130px\">\r\n\t\t\t<p>ATTAAT</p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:139px\">\r\n\t\t\t<p>46</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td style=\"width:112px\">\r\n\t\t\t<p><a href=\"http://rebase.neb.com/rebase/enz/AlwNI.html\">AlwNI</a></p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:130px\">\r\n\t\t\t<p>CAGNNNCTG</p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:139px\">\r\n\t\t\t<p>82</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td style=\"width:112px\">\r\n\t\t\t<p><a href=\"http://rebase.neb.com/rebase/enz/BsgI.html\">BsgI</a></p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:130px\">\r\n\t\t\t<p>GTGCAG</p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:139px\">\r\n\t\t\t<p>95</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td style=\"width:112px\">\r\n\t\t\t<p><a href=\"http://rebase.neb.com/rebase/enz/TspDTI.html\">TspDTI</a></p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:130px\">\r\n\t\t\t<p>ATGAA</p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:139px\">\r\n\t\t\t<p>102</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td style=\"width:112px\">\r\n\t\t\t<p><a href=\"http://rebase.neb.com/rebase/enz/ApoI.html\">ApoI</a></p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:130px\">\r\n\t\t\t<p>RAATTY</p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:139px\">\r\n\t\t\t<p>198, 251</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td style=\"width:112px\">\r\n\t\t\t<p><a href=\"http://rebase.neb.com/rebase/enz/EcoP15I.html\">EcoP15I</a></p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:130px\">\r\n\t\t\t<p>CAGCAG</p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:139px\">\r\n\t\t\t<p>214, 407</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td style=\"width:112px\">\r\n\t\t\t<p><a href=\"http://rebase.neb.com/rebase/enz/FokI.html\">FokI</a></p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:130px\">\r\n\t\t\t<p>GGATG</p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:139px\">\r\n\t\t\t<p>98, 348</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td style=\"width:112px\">\r\n\t\t\t<p><a href=\"http://rebase.neb.com/rebase/enz/AgsI.html\">AgsI</a></p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:130px\">\r\n\t\t\t<p>TTSAA</p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:139px\">\r\n\t\t\t<p>219, 357</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td style=\"width:112px\">\r\n\t\t\t<p><a href=\"http://rebase.neb.com/rebase/enz/AloI.html\">AloI</a></p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:130px\">\r\n\t\t\t<p>GAACNNNNNNTCC</p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:139px\">\r\n\t\t\t<p>81, 113</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td style=\"width:112px\">\r\n\t\t\t<p><a href=\"http://rebase.neb.com/rebase/enz/BseRI.html\">BseRI</a></p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:130px\">\r\n\t\t\t<p>GAGGAG</p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:139px\">\r\n\t\t\t<p>398, 401</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td style=\"width:112px\">\r\n\t\t\t<p><a href=\"http://rebase.neb.com/rebase/enz/BsrI.html\">BsrI</a></p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:130px\">\r\n\t\t\t<p>ACTGG</p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:139px\">\r\n\t\t\t<p>87, 229</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td style=\"width:112px\">\r\n\t\t\t<p><a href=\"http://rebase.neb.com/rebase/enz/TaqII.html\">TaqII</a></p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:130px\">\r\n\t\t\t<p>GACCGA</p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:139px\">\r\n\t\t\t<p>336, 362</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td style=\"width:112px\">\r\n\t\t\t<p><a href=\"http://rebase.neb.com/rebase/enz/MboII.html\">MboII</a></p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:130px\">\r\n\t\t\t<p>GAAGA</p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:139px\">\r\n\t\t\t<p>68, 144, 360</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t</tbody>\r\n</table>\r\n",
      "aligned_sequence": "ATAAATAATATAAGATTCTGATTATTACCCCCCTCAATTACATTATTAATCATAAGAAGAATTGTAGAAAAAGGTGCAGGTACTGGATGAACAGTATATCCACCATTATCAGCAAATATCGCACATAACGGGGCATCAGTAGATTTAGCAATCTTCTCACTCCATTTAGCAGGAGTATCATCAATTCTAGGAGCAGTAAATTTTATCTCAACCATTTTCAATATACGACCAGTAGGAATAACTGCTGAACGAATTCCATTATTCGTATGATCAGTAGGAATTACTGCTTTACTTCTATTATTATCATTACCTGTATTAGCAGGAGCAATTACAATATTATTAACTGACCGAAACTTCAATACATCCTTCTTCGACCCAGCAGGAGGAGGAGACCCAATTTTATATCAACATCTATTTTGATTTTTTGGACAT",
      "created_at": "2016-12-21T09:13:51.496Z",
      "updated_at": "2016-12-27T10:24:22.234Z",
      "category_ids": [
        1,
        2,
        3,
        21
      ],
      "primer_ids": [
        2,
        1
      ],
      "experiment_ids": [
        66
      ],
      "position_photo_ids": [],
      "genetic_marker_id": 1,
      "useful_type_id": 4
    }
  ],
  "meta": {
    "total_pages": 8,
    "total_entries": 143,
    "prev_page": null,
    "current_page": 1,
    "next_page": 2
  }
}
~~~~

#### Позиция

> GET **/positions/:id**


Пример результата:

~~~~json
{
  "position": {
    "id": 66,
    "original_name": "Adelphocoris lineolatus (Goeze, 1778) ",
    "name": "Слепняк люцерновый",
    "full_name": "Adelphocoris lineolatus (Goeze, 1778)  - Слепняк люцерновый",
    "description": "Тело взрослого клопа серо-зеленого или серовато-желтого цвета, длина 7,5-9,5 мм. Голова поперечная, усики едва короче тела. Переднеспинка одноцветная или с 2-4 темными пятнами; щиток вдоль середины с двумя сближенными коричневыми штрихами. Зимует в стадии яйца. В среднем самки откладывают 80-120 яиц, отдельные особи до 300 . При оптимальных условиях (среднесуточная температура воздуха 19-30° и влажность 60-70%) яйца развиваются в среднем 8-12 дней. Часть яиц диапаузирует до весны следующего года. Продолжительность личиночной стадии 1 поколения 20-30 дней. Развитие личинок 2 поколения длится 20-25 дней.",
    "importance": "Вредитель бобовых культур. Повреждает люцерну, эспарцет, реже донник, клевер, люпин и другие бобовые травы, спорадически - хлопчатник, арахис, нут, чечевицу, сою, фасоль, подсолнечник. Иногда во 2 поколении повреждает семенники сахарной свеклы. Может развиваться на многих дикорастущих бобовых, а также и на некоторых сложноцветных, крестоцветных и маревых. Личинки и имаго уничтожают всходы или повреждают их точки роста, угнетают прирост молодых побегов и цветоносов, уничтожают листовые и цветочные почки, повреждают молодые, еще не затвердевшие бобы и семена. Обитает в Западной Европе, Северной Африке, Передней Азии, Афганистане, Пакистане, Монголии, Китае, Японии; Северной Америке (завезен). Широко распространен в европейской части России к югу от Петрозаводска, Котласа и Ухты, на юге Сибири и Дальнего Востока; Казахстан; Средняя Азия.\r\n",
    "restriction_map": "<table border=\"0\" cellpadding=\"0\" class=\"ui celled selectable small striped table\" style=\"width:100%\">\r\n\t<thead>\r\n\t\t<tr>\r\n\t\t\t<th style=\"width:112px\">\r\n\t\t\t<p><strong>Рестриктаза</strong></p>\r\n\t\t\t</th>\r\n\t\t\t<th style=\"width:130px\">\r\n\t\t\t<p><strong>Сайт узнавания</strong></p>\r\n\t\t\t</th>\r\n\t\t\t<th style=\"width:139px\">\r\n\t\t\t<p><strong>Место разреза</strong></p>\r\n\t\t\t</th>\r\n\t\t</tr>\r\n\t</thead>\r\n\t<tbody>\r\n\t\t<tr>\r\n\t\t\t<td style=\"width:112px\">\r\n\t\t\t<p><a href=\"http://rebase.neb.com/rebase/enz/SspI.html\">SspI</a></p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:130px\">\r\n\t\t\t<p>AATATT</p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:139px\">\r\n\t\t\t<p>335</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td style=\"width:112px\">\r\n\t\t\t<p><a href=\"http://rebase.neb.com/rebase/enz/XmnI.html\">XmnI</a></p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:130px\">\r\n\t\t\t<p>GAANNNNTTC</p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:139px\">\r\n\t\t\t<p>251</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td style=\"width:112px\">\r\n\t\t\t<p><a href=\"http://rebase.neb.com/rebase/enz/BclI.html\">BclI</a></p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:130px\">\r\n\t\t\t<p>TGATCA</p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:139px\">\r\n\t\t\t<p>268</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td style=\"width:112px\">\r\n\t\t\t<p><a href=\"http://rebase.neb.com/rebase/enz/BseYI.html\">BseYI</a></p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:130px\">\r\n\t\t\t<p>CCCAGC</p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:139px\">\r\n\t\t\t<p>375</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td style=\"width:112px\">\r\n\t\t\t<p><a href=\"http://rebase.neb.com/rebase/enz/BsmAI.html\">BsmAI</a></p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:130px\">\r\n\t\t\t<p>GTCTC</p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:139px\">\r\n\t\t\t<p>383</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td style=\"width:112px\">\r\n\t\t\t<p><a href=\"http://rebase.neb.com/rebase/enz/BspMI.html\">BspMI</a></p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:130px\">\r\n\t\t\t<p>ACCTGC</p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:139px\">\r\n\t\t\t<p>67</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td style=\"width:112px\">\r\n\t\t\t<p><a href=\"http://rebase.neb.com/rebase/enz/Eco31I.html\">Eco31I</a></p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:130px\">\r\n\t\t\t<p>GGTCTC</p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:139px\">\r\n\t\t\t<p>383</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td style=\"width:112px\">\r\n\t\t\t<p><a href=\"http://rebase.neb.com/rebase/enz/EcoRI.html\">EcoRI</a></p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:130px\">\r\n\t\t\t<p>GAATTC</p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:139px\">\r\n\t\t\t<p>251</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td style=\"width:112px\">\r\n\t\t\t<p><a href=\"http://rebase.neb.com/rebase/enz/SfaNI.html\">SfaNI</a></p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:130px\">\r\n\t\t\t<p>GCATC</p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:139px\">\r\n\t\t\t<p>142</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\      1,
    2,
    3,
    21t\t\t<td style=\"width:112px\">\r\n\t\t\t<p><a href=\"http://rebase.neb.com/rebase/enz/TfiI.html\">TfiI</a></p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:130px\">\r\n\t\t\t<p>GAWTC</p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:139px\">\r\n\t\t\t<p>14</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td style=\"width:112px\">\r\n\t\t\t<p><a href=\"http://rebase.neb.com/rebase/enz/VspI.html\">VspI</a></p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:130px\">\r\n\t\t\t<p>ATTAAT</p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:139px\">\r\n\t\t\t<p>46</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td style=\"width:112px\">\r\n\t\t\t<p><a href=\"http://rebase.neb.com/rebase/enz/AlwNI.html\">AlwNI</a></p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:130px\">\r\n\t\t\t<p>CAGNNNCTG</p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:139px\">\r\n\t\t\t<p>82</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td style=\"width:112px\">\r\n\t\t\t<p><a href=\"http://rebase.neb.com/rebase/enz/BsgI.html\">BsgI</a></p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:130px\">\r\n\t\t\t<p>GTGCAG</p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:139px\">\r\n\t\t\t<p>95</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td style=\"width:112px\">\r\n\t\t\t<p><a href=\"http://rebase.neb.com/rebase/enz/TspDTI.html\">TspDTI</a></p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:130px\">\r\n\t\t\t<p>ATGAA</p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:139px\">\r\n\t\t\t<p>102</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td style=\"width:112px\">\r\n\t\t\t<p><a href=\"http://rebase.neb.com/rebase/enz/ApoI.html\">ApoI</a></p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:130px\">\r\n\t\t\t<p>RAATTY</p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:139px\">\r\n\t\t\t<p>198, 251</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td style=\"width:112px\">\r\n\t\t\t<p><a href=\"http://rebase.neb.com/rebase/enz/EcoP15I.html\">EcoP15I</a></p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:130px\">\r\n\t\t\t<p>CAGCAG</p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:139px\">\r\n\t\t\t<p>214, 407</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td style=\"width:112px\">\r\n\t\t\t<p><a href=\"http://rebase.neb.com/rebase/enz/FokI.html\">FokI</a></p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:130px\">\r\n\t\t\t<p>GGATG</p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:139px\">\r\n\t\t\t<p>98, 348</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td style=\"width:112px\">\r\n\t\t\t<p><a href=\"http://rebase.neb.com/rebase/enz/AgsI.html\">AgsI</a></p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:130px\">\r\n\t\t\t<p>TTSAA</p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:139px\">\r\n\t\t\t<p>219, 357</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td style=\"width:112px\">\r\n\t\t\t<p><a href=\"http://rebase.neb.com/rebase/enz/AloI.html\">AloI</a></p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:130px\">\r\n\t\t\t<p>GAACNNNNNNTCC</p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:139px\">\r\n\t\t\t<p>81, 113</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td style=\"width:112px\">\r\n\t\t\t<p><a href=\"http://rebase.neb.com/rebase/enz/BseRI.html\">BseRI</a></p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:130px\">\r\n\t\t\t<p>GAGGAG</p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:139px\">\r\n\t\t\t<p>398, 401</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td style=\"width:112px\">\r\n\t\t\t<p><a href=\"http://rebase.neb.com/rebase/enz/BsrI.html\">BsrI</a></p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:130px\">\r\n\t\t\t<p>ACTGG</p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:139px\">\r\n\t\t\t<p>87, 229</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td style=\"width:112px\">\r\n\t\t\t<p><a href=\"http://rebase.neb.com/rebase/enz/TaqII.html\">TaqII</a></p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:130px\">\r\n\t\t\t<p>GACCGA</p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:139px\">\r\n\t\t\t<p>336, 362</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t\t<tr>\r\n\t\t\t<td style=\"width:112px\">\r\n\t\t\t<p><a href=\"http://rebase.neb.com/rebase/enz/MboII.html\">MboII</a></p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:130px\">\r\n\t\t\t<p>GAAGA</p>\r\n\t\t\t</td>\r\n\t\t\t<td style=\"width:139px\">\r\n\t\t\t<p>68, 144, 360</p>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t</tbody>\r\n</table>\r\n",
    "aligned_sequence": "ATAAATAATATAAGATTCTGATTATTACCCCCCTCAATTACATTATTAATCATAAGAAGAATTGTAGAAAAAGGTGCAGGTACTGGATGAACAGTATATCCACCATTATCAGCAAATATCGCACATAACGGGGCATCAGTAGATTTAGCAATCTTCTCACTCCATTTAGCAGGAGTATCATCAATTCTAGGAGCAGTAAATTTTATCTCAACCATTTTCAATATACGACCAGTAGGAATAACTGCTGAACGAATTCCATTATTCGTATGATCAGTAGGAATTACTGCTTTACTTCTATTATTATCATTACCTGTATTAGCAGGAGCAATTACAATATTATTAACTGACCGAAACTTCAATACATCCTTCTTCGACCCAGCAGGAGGAGGAGACCCAATTTTATATCAACATCTATTTTGATTTTTTGGACAT",
    "created_at": "2016-12-21T09:13:51.496Z",
    "updated_at": "2016-12-27T10:24:22.234Z",
    "category_ids": [
      1,
      2,
      3,
      21
    ],
    "primer_ids": [
      2,
      1
    ],
    "experiment_ids": [
      66
    ],
    "position_photo_ids": [],
    "genetic_marker_id": 1,
    "useful_type_id": 4
  }
}
~~~~

### Эксперименты

#### Список экспериментов

> GET **/positions/:position_id/experiments**

Пример результата:

~~~~json
{
  "experiments": [
    {
      "id": 66,
      "sequence": "ATAAATAATATAAGATTCTGATTATTACCCCCCTCAATTACATTATTAATCATAAGAAGAATTGTAGAAAAAGGTGCAGGTACTGGATGAACAGTATATCCACCATTATCAGCAAATATCGCACATAACGGGGCATCAGTAGATTTAGCAATCTTCTCACTCCATTTAGCAGGAGTATCATCAATTCTAGGAGCAGTAAATTTTATCTCAACCATTTTCAATATACGACCAGTAGGAATAACTGCTGAACGAATTCCATTATTCGTATGATCAGTAGGAATTACTGCTTTACTTCTATTATTATCATTACCTGTATTAGCAGGAGCAATTACAATATTATTAACTGACCGAAACTTCAATACATCCTTCTTCGACCCAGCAGGAGGAGGAGACCCAATTTTATATCAACATCTATTTTGATTTTTTGGACAT",
      "position_id": 66,
      "genbank_id": "",
      "created_at": "2016-12-21T09:13:51.508Z"
    }
  ],
  "meta": {
    "total_pages": 1,
    "total_entries": 1,
    "prev_page": null,
    "current_page": 1,
    "next_page": null
  }
}
~~~~

#### Эксперимент

> GET **/positions/:position_id/experiments/:id**

Пример результата:

~~~~json
{
  "experiment": {
    "id": 66,
    "sequence": "ATAAATAATATAAGATTCTGATTATTACCCCCCTCAATTACATTATTAATCATAAGAAGAATTGTAGAAAAAGGTGCAGGTACTGGATGAACAGTATATCCACCATTATCAGCAAATATCGCACATAACGGGGCATCAGTAGATTTAGCAATCTTCTCACTCCATTTAGCAGGAGTATCATCAATTCTAGGAGCAGTAAATTTTATCTCAACCATTTTCAATATACGACCAGTAGGAATAACTGCTGAACGAATTCCATTATTCGTATGATCAGTAGGAATTACTGCTTTACTTCTATTATTATCATTACCTGTATTAGCAGGAGCAATTACAATATTATTAACTGACCGAAACTTCAATACATCCTTCTTCGACCCAGCAGGAGGAGGAGACCCAATTTTATATCAACATCTATTTTGATTTTTTGGACAT",
    "position_id": 66,
    "genbank_id": "",
    "created_at": "2016-12-21T09:13:51.508Z"
  }
}
~~~~
