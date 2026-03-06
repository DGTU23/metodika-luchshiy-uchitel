bash
#!/bin/bash
# Скрипт для нагрузочного тестирования TCP-сервера с помощью tcpkali

SERVER="127.0.0.1"
PORT="8080"
DURATION="60"
WARMUP="10"
PAYLOAD="PING"

# Сценарий S1: 5000 соединений, 50000 req/s
echo "Running S1: 5000 conn, 50000 req/s"
tcpkali -c 5000 -r 50000 -T $DURATION -w $WARMUP -m "$PAYLOAD" $SERVER:$PORT > results_S1.txt

# Сценарий S2: 10000 соединений, 80000 req/s
echo "Running S2: 10000 conn, 80000 req/s"
tcpkali -c 10000 -r 80000 -T $DURATION -w $WARMUP -m "$PAYLOAD" $SERVER:$PORT > results_S2.txt

echo "Тестирование завершено. Результаты в results_*.txt"

