# Bindi
[Bindi](https://github.com/havenwood/bindi#readme) makes it quite simple to store native Ruby object in Redis!

Bindi provides a nice Hash-like syntax for serializing Ruby objects with Marshal, YAML or JSON, and then persisting to [Redis](http://redis.io/) with the [redis gem](https://github.com/redis/redis-rb#readme).

## Usage
```ruby
require 'bindi'

bindi = Bindi.new
#=> #<Redis client v3.0.2 for redis://127.0.0.1:6379/0>
 
bindi[:state_gemstones] = {alabama: 'Star Blue Quartz',
                           alaska: 'Nephrite Jade'}

exit
```

Your Ruby Object is now stored in Redis:
```ruby
require 'bindi'

bindi = Bindi.new
#=> #<Redis client v3.0.2 for redis://127.0.0.1:6379/0>

bindi[:state_gemstones]
  #=> {:alabama=>"Star Blue Quartz", :alaska=>"Nephrite Jade"}
```

```ruby
bindi.keys
 #=> [:state_gemstones]

bindi.key? :nope
 #=> false

bindi.delete :state_gemstones
 #=> {:alabama=>"Star Blue Quartz", :alaska=>"Nephrite Jade"}

bindi.empty?
 #=> true
```

## Installation

Install Bindi:

    $ gem install bindi

Dependencies:

    - Redis

#### brew

`brew install redis`

#### apt

`sudo apt-get install redis-server`

#### or source

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
4: :cake:
