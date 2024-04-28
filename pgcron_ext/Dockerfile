FROM postgres:16

RUN apt-get update && apt-get -y install git build-essential postgresql-server-dev-16 

RUN apt-get update && apt-get install -y gcc make musl-dev wget

# Download su-exec source code
RUN wget -O su-exec.c 'https://raw.githubusercontent.com/ncopa/su-exec/master/su-exec.c'

# Compile su-exec and move it to /usr/local/bin/
RUN gcc su-exec.c -o /usr/local/bin/su-exec && \
    chmod +x /usr/local/bin/su-exec

RUN git clone https://github.com/citusdata/pg_cron.git
RUN cd pg_cron && make && make install

COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]
CMD ["postgres"] 
