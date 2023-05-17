echo "without cache"

echo "время 60 количество потоков 1 количество соединений 1"
wrk -d 60 -c 1 -t 1 --latency -s ./get.lua http://localhost:8081/
sleep 1

echo "время 60 количество потоков 10 количество соединений 10"
wrk -d 60 -c 10 -t 10 --latency -s ./get.lua http://localhost:8081/
sleep 1

echo "время 60 количество потоков 50 количество соединений 50"
wrk -d 60 -c 50 -t 50 --latency -s ./get.lua http://localhost:8081/
sleep 1

echo "with cache"

echo "время 60 количество потоков 1 количество соединений 1"
wrk -d 60 -c 1 -t 1 --latency -s ./get.lua http://localhost:8082/
sleep 1

echo "время 60 количество потоков 10 количество соединений 10"
wrk -d 60 -c 10 -t 10 --latency -s ./get.lua http://localhost:8082/
sleep 1

echo "время 60 количество потоков 50 количество соединений 50"
wrk -d 60 -c 50 -t 50 --latency -s ./get.lua http://localhost:8082/