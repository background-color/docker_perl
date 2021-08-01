# perl 開発環境用
perlアプリケーションを保守する機会があるので
手元で開発環境すぐ用意できるように
apache2, cgi(perl) のDocker環境を作る

http://localhost:8080/ で html/index.html が<br>
http://localhost:8080/cgi-bin/ で cgi-bin/index.cgi が表示される

### 起動
```
docker-compose up -d --build
```

### 終了
```
docker-compose down
```

### エラーログ
```
docker logs -f web
```

### ログイン
```
docker-compose exec web bash
```

### apache2再起動
```
# apachectl restart
```
