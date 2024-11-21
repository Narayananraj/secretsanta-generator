
FROM httpd:2.4


WORKDIR /usr/local/apache2/htdocs/


COPY dony/index.html /usr/local/apache2/htdocs/index.html


EXPOSE 8090
CMD ["httpd-foreground"]
