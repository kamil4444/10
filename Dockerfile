FROM alpine:latest
COPY pluto.sh /pluto.sh
VOLUME [/logi]
WORKDIR /logi
RUN apk add --no-cache --upgrade bash && \
    chmod +x /pluto.sh && \
    chmod 740 /logi && \
    /pluto.sh > info.log
CMD ["sh"]
