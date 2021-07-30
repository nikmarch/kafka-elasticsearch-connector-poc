curl "http://0.0.0.0:9092/"
curl "http://0.0.0.0:9092/"
curl "http://0.0.0.0:9092/"
for i in `seq 1 30`;
do
  nc -z localhost 3000 && echo Success && exit 0
  echo -n .
  sleep 1
done
echo Failed waiting for PIM-API && exit 1
