Результаты работы wrk приведены в файле [./mystart.log](./mystart.log)

| with(out) cache | wrk -d 60 -c 1 -t 1 | wrk -d 60 -c 10 -t 10 | wrk -d 60 -c 50 -t 50 |
|:---------------:|:-------------------:|:---------------------:|:---------------------:|
| **without cache** | Requests/sec: 305.16; Avg. Latency: 3.30ms |  Requests/sec: 266.68; Avg. Latency: 37.46ms | Requests/sec: 0.67; Avg. Latency: 147.19ms |
| **with cache** | Requests/sec: 600.61; Avg. Latency: 1.74ms | Requests/sec: 732.16; Avg. Latency: 13.75ms | Requests/sec: 0.97; Avg. Latency: 157.88ms |