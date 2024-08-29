FROM nginx
RUN rm -rf /usr/share/nginx/html/index.html
ADD index.html /usr/share/nginx/html/
