# Zadanie 1
# pluto.sh



```sh
#!/bin/sh
Year=`date +%Y`
Month=`date +%m`
Day=`date +%d`
Hour=`date +%H`
Minute=`date +%M`
Second=`date +%S`
echo `date`
cat /proc/meminfo | awk -F, 'FNR == 3 {print $1;}'
```



# Komentarz
Data brana jest ze zmiennych z systemu, potem w katalogu proc/meminfo używając awk wyświetlam kolumnę z MemoryAvailable w kilobajtach

# Dockerfile
```Docker
FROM alpine:latest
COPY pluto.sh /pluto.sh
VOLUME [/logi]
WORKDIR /logi
RUN apk add --no-cache --upgrade bash && \
    chmod +x /pluto.sh && \
    /pluto.sh > info.log
CMD ["sh"]
```

# Komentarz
Pobieram najnowszy obraz alpine i kopiuje skrypt pluto.sh. Następnie tworzę volumen i przenoszę się do tego katalogu.
Wtedy dokonuje upg basha, daje uprawnienia wykonywania i zapisuje wynik skryptu do pliku info.log w wolumenie.
# Zadanie 2
# Budowanie Obrazu
![docker](https://user-images.githubusercontent.com/103449118/170571651-f85e45aa-635b-4572-baf7-ac9cbbd379f0.png)

# Zadanie 3/4/5
docker run -it --rm --mount source=RemoteVol,target=/logi --memory="512m" lab10docker

docker volume create --driver local --opt type=cifs --opt device=//192.168.1.19/data --opt "o=username=rytel,password=****" RemoteVol
# Komentarz
Wszystko szło dobrze do czasu ostatniego polecenia czyli startu kontenera.
![Untitled](https://user-images.githubusercontent.com/103449118/170771677-2437b739-ba31-4bda-889f-fea0c18ef92d.png)
# Komentarz
Na dysku macierzystym został stworzony folder data, ale chyba hasło się nie zgadzało (mam pin ale próbowałem też pustego - nic nie działało, a może to nie to?) dlatego wolumen nie chciał się podłączyć.

![Untitled](https://user-images.githubusercontent.com/103449118/170771928-0baad03e-6636-40af-9366-7723b92390f4.png)

Ogólnie skrypt z Z1 działa, zapisuje się info do pliku.
