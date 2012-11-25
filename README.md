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
 
bindi = Bindi.new YAML # Works with Marshal, YAML, JSON, etc.
 
bindi[:state_gemstones] = { alabama: 'Star Blue Quartz',
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
 
bindi.keys
 #=> "state_gemstones"
 
bindi[:state_gemstones]
 #=> #=> {:alabama=>"Star Blue Quartz", ...
```

### Ruby Hash Methods

```ruby
bindi[:key] = 'value'
 #=> "value"

bindi[:key]
 #=> "value"
 
bindi.clear # Flushes entire DB

bindi.delete :key
 #=> 1
 
bindi.each do |key|
  puts key
end

bindi.empty?
 #=> false

bindi.inspect

bindi.key? :nope
 #=> false
 
bindi.keys
 #=> "key"
```

### Redis Helper Methods

```ruby
bindi.info
 #=> {"redis_version"=>"2.4.15", ...

bindi.inspect_redis
 #=> "#<Redis client v2.2.2 connected to redis://127.0.0.1:6379 ..."
```

## Contributing

1. Fork it
2. Commit your changes
3. Pull request
