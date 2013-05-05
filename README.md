Mephisto
========

What is Mephisto?
-----------------

Histogram generator on the web.

Like (Graphico)[https://github.com/yuya-takeyama/graphico], Statistics data can be saved via RESTful Web API and your data will be displayed as chart immediately.

Installation
------------

```
# Checkout
$ git clone https://github.com/yuya-takeyama/mephisto.git
$ cd mephisto

# Make your own settings
$ cp config/apps.example.rb config/apps.rb
$ cp config/database.example.rb config/database.rb

# Create tables
$ bundle exec rake dm:auto:upgrade

# Boot as rack application
```

Basic Usage
-----------

### Input data

```
# POST /api/v0/charts/:service_name/:section_name/:chart_group_name/:chart_name
# label = Label of the data (string)
# value = value of the data (integer or float)

$ curl -i -d 'label=01&value=100' 'http://mephisto.dev/api/v0/charts/awesome_sns/blog/access_frequency/2013-01'
```

Author
------

Yuya Takeyama
