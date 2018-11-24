# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite
  Using codeceptjs for BDD https://codecept.io/

  Make sure you have installed java before install the followings

  - **sudo npm install -g codeceptjs webdriverio**
  - **sudo npm install -g selenium-standalone**
  - **sudo selenium-standalone install**

  ##NOTE: For selenium webdriverIO 64-Bit OS is mandate

  For running the test do `rake db:test:prepare`

  To run the test we need to three tabs

  - In one tab run `rails s -e test`
  - In one tab run `selenium-standalone start` 
  - In another run `codeceptjs run --steps`

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
