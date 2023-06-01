docker 启动数据库

```bash
# mac
docker run -v /home/mysql57/data:/var/lib/mysql57/data --name=mysql -it -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root -d mysql:5.7

# windows oh-my-env mysql
docker run -v mysql57-data:/var/lib/mysql57/data --name db-for-mysql -it -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root --network=network1 -d mysql:5.7
```

初始化项目

```bash
rails _5.2.6_ new rails-share-blog --database=mysql --api
bundle exec rails db:drop
bundle exec rails db:create
bundle exec rails g model User email:string password_digest:string
bundle exec rails db:migrate
```

发送邮件
```
bundle exec rails g mailer UserMailer
```

Session Control
```
bundle exec rails g controller sessions
```

Blog
```
bundle exec rails g model Blog
bundle exec rails g migration AddUserRefToBlogs user:references
```

Deploy
```
bin/pack_for_remote.sh
need_migrate=1 bin/pack_for_remote.sh
```