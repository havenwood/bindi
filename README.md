# Bindi

[Bindi](https://github.com/Havenwood/bindi) is a DSL for storing marshallable Ruby Objects in [Redis](http://redis.io/) using [Ohm](http://ohm.keyvalue.org/) (Object-hash mapping gem for Redis).

## Installation

Add this line to your application's Gemfile:

    gem 'bindi'

Or install it yourself:

    $ gem install bindi

Then install Redis:

    $ brew install redis
	
And start Redis:
 
    $ redis-server
	
## Usage

### The Basics

```ruby
require 'bindi'
 #=> true

Bindi.connect
 #=> nil
 
Bindi[:state_gemstones] = { alabama: 'Star Blue Quartz',
                              alaska: 'Nephrite Jade', 
							  arizona: 'Turquoise', 
							  arkansas: 'Diamond' }
							  
 #=> {:alabama=>"Star Blue Quartz", ...

exit
```

Your Ruby Object is now stored in Redis.

```ruby
require 'bindi'
 #=> true
 
Bindi.keys
 #=> "state_gemstones"
 
Bindi[:state_gemstones]
 #=> #=> {:alabama=>"Star Blue Quartz", ...
```

### Ruby Hash Methods

```ruby
Bindi[:key] = 'value'
 #=> "value"

Bindi[:key]
 #=> "value"
 
Bindi.clear # Flushes entire DB

Bindi.delete :key
 #=> 1
 
Bindi.each do |key|
  puts key
end

Bindi.empty?
 #=> false

Bindi.inspect

Bindi.key? :nope
 #=> false
 
Bindi.keys
 #=> "key"
```

### Redis Helper Methods

```ruby
Bindi.info
 #=> {"redis_version"=>"2.4.15", ...

Bindi.inspect_redis
 #=> "#<Redis client v2.2.2 connected to redis://127.0.0.1:6379 ..."
```

## Contributing

1. Fork it
2. Commit your changes
3. Pull request
