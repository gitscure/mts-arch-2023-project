# Сравнение производительности MariaDB и MongoDB

## Тестирование производительность MariaDB

Результаты работы wrk приведены в файле [/module_06/mystart.log](/module_06/mystart.log)

| with(out) cache | wrk -d 60 -c 1 -t 1 | wrk -d 60 -c 10 -t 10 | wrk -d 60 -c 50 -t 50 |
|:---------------:|:-------------------:|:---------------------:|:---------------------:|
| **without cache** | Requests/sec: 305.16; Avg. Latency: 3.30ms |  Requests/sec: 266.68; Avg. Latency: 37.46ms | Requests/sec: 0.67; Avg. Latency: 147.19ms |
| **with cache** | Requests/sec: 600.61; Avg. Latency: 1.74ms | Requests/sec: 732.16; Avg. Latency: 13.75ms | Requests/sec: 0.97; Avg. Latency: 157.88ms |

## Тестирование производительности MongoDB

Результаты работы wrk приведены в файле [./mystart.log](./mystart.log)

| with(out) cache | wrk -d 60 -c 1 -t 1 | wrk -d 60 -c 10 -t 10 | wrk -d 60 -c 50 -t 50 |
|:---------------:|:-------------------:|:---------------------:|:---------------------:|
| **without cache** | Requests/sec: 440.91; Avg. Latency: 2.25ms |  Requests/sec: 763.88; Avg. Latency: 13.07ms | Requests/sec: 834.73; Avg. Latency: 60.23ms |
| **with cache** | Requests/sec: 708.17; Avg. Latency: 1.39ms | Requests/sec: 1748.51; Avg. Latency: 5.70ms | Requests/sec: 1875.52; Avg. Latency: 27.76ms |

## Выводы
По результатам тестирования очевидно лидерство MongoDB по производительности. Даже при низкой нагрузке MongoDB выигрывает по количество запросов и задержке примерно в 1.5 раза, а при высокой нагрузке и использовании кэширования число запросов в минуту увеличивается на несколько порядков.