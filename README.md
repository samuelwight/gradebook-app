# README

A simple gradebook app that I made for the ACTE Tech Fair.

## To Run:

Start by cloning the repo:

    git clone https://github.com/samuelwight/gradebook-app.git

Next, make sure that you have the latest version of Ruby and Rails installed. After that, install all the gems from the gemfile:

    bundle install

This project should work with any database that ActiveRecord supports. By default, it uses SQLLite. If you want to use mysql, uncomment the relevant portion in `config/database.yml`.

    development:
      <<: *default
      database: db/development.sqlite3
    #   Uncomment these and comment the top for mysql
    #  adapter: mysql2
    #  encoding: utf8
    #  database: grades
    #  pool: 5
    #  user: your_user_name_here
    #  password: your_password_here
    #  then run the following command:
    #  rails db:create db:migrate --trace
    #  This should initialize all the tables needed in your mysql database.

Make sure to replace `your_user_name_here` and `your_password_here` with your MySQL username and password.

After you've finished all of that, run the Rails server:

    rails server
    
Enjoy!