FROM registry.cn-hongkong.aliyuncs.com/sync-dockerimage/docker:20.10-dind

COPY ./entrypoint.sh /usr/local/bin/newentrypoint.sh

ENTRYPOINT ["newentrypoint.sh"]