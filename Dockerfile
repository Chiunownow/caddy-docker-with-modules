FROM caddy:alpine

#COPY ./caddy /usr/bin/caddy
ARG packages
RUN /usr/bin/caddy add-package ${packages}

# 输出caddy list-modules和caddy version到日志
RUN /usr/bin/caddy list-modules
RUN /usr/bin/caddy version