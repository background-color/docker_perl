FROM httpd:2.4
USER root

RUN apt-get -y update && apt-get -y install wget unzip vim
RUN sed -ri 's/#LoadModule cgid_module/LoadModule cgid_module/g; \
             s/DirectoryIndex index.html/DirectoryIndex index.html index.cgi/g; \
             s/#ServerName www.example.com:80/ServerName localhost:80/g; \
             s/# CustomLog \"logs\/access_log\" combined/CustomLog \"logs\/access_log\" combined/g; \
             s/Options Indexes FollowSymLinks/Options Indexes FollowSymLinks ExecCGI/g; \
             s/#AddHandler cgi-script .cgi/AddHandler cgi-script .pl .cgi/g' /usr/local/apache2/conf/httpd.conf
RUN echo  "alias ll='ls -la'" >> /root/.bashrc
COPY .vimrc /root/.vimrc
COPY cgi-bin/test.cgi /usr/local/apache2/cgi-bin/
# COPY httpd.conf /usr/local/apache2/conf/httpd.conf
# CMD bash -c "chmod -R 755 /usr/local/apache2/cgi-bin/"
EXPOSE 80
