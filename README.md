# Bindi

[Bindi](https://github.com/havenwood/bindi#readme) makes it very, very simple to store native Ruby object in Redis!

Bindi provides an easy to use Hash-like syntax for serializing Ruby objects with Marshal, YAML or JSON, and then persisting to [Redis](http://redis.io/) with the [redis gem](https://github.com/redis/redis-rb#readme).

## Usage

### The Basics

```ruby
require 'bindi'

bindi = Bindi.new
#=> #<Redis client v3.0.2 for redis://127.0.0.1:6379/0>
 
bindi[:state_gemstones] = {alabama: 'Star Blue Quartz',
                                           alaska: 'Nephrite Jade'}
exit
```

Your Ruby Object is now stored in Redis.

```ruby
require 'bindi'

bindi = Bindi.new
#=> #<Redis client v3.0.2 for redis://127.0.0.1:6379/0>

bindi.keys
 #=> [:state_gemstones]
 
bindi[:state_gemstones]
  #=> {:alabama=>"Star Blue Quartz", :alaska=>"Nephrite Jade"}

bindi.key? :nope
 #=> false

bindi.delete :state_gemstones
 #=> {:alabama=>"Star Blue Quartz", :alaska=>"Nephrite Jade"}

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
## Installation
### Install Bindi

    $ gem install bindi

### Install Redis
If you don't already have Redis installed, you'll need to install it.

#### Apt-get:
`sudo apt-get install redis-server`

#### Homebrew:
`brew install redis`

#### Build from source:
```bash
wget http://download.redis.io/redis-stable.tar.gz
tar xvzf redis-stable.tar.gz
cd redis-stable
make
```

And start Redis if it isn't configured to autostart:
 
    $ redis-server

## Contributing

1. Fork it
2. Commit your changes
3. Pull request
