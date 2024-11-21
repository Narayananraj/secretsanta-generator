
FROM httpd:2.4


WORKDIR /usr/local/apache2/htdocs/


COPY ./root/dony /usr/local/apache2/htdocs/


EXPOSE 8090
CMD ["httpd-foreground"]
