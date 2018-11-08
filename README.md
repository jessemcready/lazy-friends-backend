# Lazy Friends Backend

This is the Rails API associated with [Lazy Friends](https://github.com/jessemcready/lazy-friends).

## How to use

Make sure you have Postgres on your computer and that it is up and running. After cloning down this repo, change into the file's directory and open your terminal. Inside run `rails db:create && rails db:migrate`. If you want some starter data, run `rails db:seed`. After that's done, run `rails s` and you'll have a server up and running.

## Technology Stack

The backend api is written in Rails and is used to store user information and associations, as well as render those as JSON to the page so our fetch can get data.
