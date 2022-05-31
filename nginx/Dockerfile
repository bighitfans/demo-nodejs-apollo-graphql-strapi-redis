FROM nginx:alpine

RUN mkdir -p /etc/nginx/templates

ADD default.conf.template /etc/nginx/templates

ADD conf /etc/nginx/conf.d

CMD ["nginx","-g","daemon off;"]
