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

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


Project Level
Develop a marketplace API in Ruby on Rails following the next guidelines:
Models and services designed must have unit testing using RSpec
The API must follow REST standard for every object that is handled around it
The API must contain request test for every endpoint and happy/sad paths
The app must contain a proper seeds.rb file that allows a basic initialization with some default data in order to make all endpoints available even before using the API
Endpoints that show more than 10 items should be paginated using any strategy
Plus bonus if JSON API Spec is used
The app should be deployed in heroku free account, plus bonus if CI and CD pipelines are configured using any pipeline engine such as SemaphoreCI, CircleCI, Github actions, Heroku integration, etc
ContextBunkers is a vaping marketplace that sells vaping devices and liquids for users that want to quit traditional cigarette smoking. The structure of their products follow:
There are 3 categories of items Bunkers can sell (take in mind there could be more than 3 categories): Vapers, Liquids, Accessories
Vapers are devices that have a name, price, brand, warranty time.
Liquids are consumable items and they have the strength (soft, medium, hard), flavor, size (measured in mL), and brand.
Accessories are items that match with a device: where a device can use many accessories, and also one accessory can be used in more than one device
Requirements
Develop 2 API interfaces:
Consumer API
Shop API
Consumer API
Allows general users to Get Vapers, Liquids, and Accessories, and create orders using the item ids and valid (format valid) email address
Shop API
This interface is used by the marketplace admins. This interface has to be secured by using authentication over a JWT, json bearer token, or any other picked by the developer (The developer needs to argue why they picked their solution).
The API should have the next capabilities:
Get, Create, Edit, and Delete: Vapers, Liquids, Accessories. Be aware that accessories and papers have a has and belongs to many relations, so these relations have to be cleared upon deletion.
Also, the API should allow querying all orders made in the platform by users, getting orders by user email, and getting one order by using order it