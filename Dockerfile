FROM alpine:3.16.2 as builder

ENV SERVERBIN q3srv
ENV BUILD_CLIENT 0
ENV COPYDIR /quake3

COPY ioq3 /ioq3

RUN apk --no-cache add curl g++ gcc make
RUN cd /ioq3 && make && make copyfiles

FROM alpine:3.16.2

COPY --from=builder /quake3 /quake3
COPY entrypoint.sh /entrypoint.sh
COPY cpma /quake3/cpma
COPY baseq3 /root/.q3a/baseq3

RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]