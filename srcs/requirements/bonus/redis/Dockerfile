# syntax=docker/dockerfile:1
FROM debian:buster

RUN apt-get update && apt-get install -y \
    apt-utils \
    libterm-readline-gnu-perl dialog \
    init-system-helpers \
    libc6 \
    lsb-base \
    lsb-release \
    redis-tools \
    redis-server \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /tmp/* \
    && sed -i 's|bind 127.0.0.1|#bind127.0.0.1|g' /etc/redis/redis.conf \
    && sed -i 's|# maxmemory <bytes>|maxmemory 256mb|g' /etc/redis/redis.conf \
    && sed -i 's|# maxmemory-policy noeviction|maxmemory-policy allkeys-lru|g' /etc/redis/redis.conf
    # && sed -i 's|supervised no|supervised systemd|g' /etc/redis/redis.conf \
    # && echo "maxmemory-policy allkeys-lru" >> /etc/redis/redis.conf

# EXPOSE 6379

CMD ["sh", "-c", "redis-server /etc/redis/redis.conf && tail -f"]
# CMD ["redis-server", "/etc/redis/redis.conf"]