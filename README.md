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