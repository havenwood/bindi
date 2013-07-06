# Bindi

[Bindi](https://github.com/havenwood/bindi#readme) makes it very, very simple to store native Ruby object in Redis!

Bindi provides an easy to use Hash-like syntax for serializing Ruby objects with Marshal, YAML or JSON, and then persisting to [Redis](http://redis.io/) with the [redis gem](https://github.com/redis/redis-rb#readme).

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
require 'yaml'

bindi = Bindi.new YAML # Choose between Marshal, YAML, JSON, etcetera for serializing.
#=> #<Redis client v3.0.2 for redis://127.0.0.1:6379/0>
 
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

bindi = Bindi.new YAML
#=> #<Redis client v3.0.2 for redis://127.0.0.1:6379/0>

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

bindi.key? :nope
 #=> false

bindi.keys
 #=> [:key]

bindi.delete :key
 #=> "value"

bindi.clear # Flushes entire DB
 #=> []

bindi.empty?
 #=> true
```

### Redis Info

```ruby
bindi
 #=> #<Redis client v3.0.4 for redis://127.0.0.1:6379/0>

bindi.info
 #=> {"redis_version"=>"2.6.14",
 "redis_git_sha1"=>"00000000",
 "redis_git_dirty"=>"0",
 "redis_mode"=>"standalone",
 ...}
```

## Contributing

1. Fork it
2. Commit your changes
3. Pull request
