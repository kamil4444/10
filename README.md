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

