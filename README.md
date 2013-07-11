# Bindi
Persist your Ruby objects to [Redis](http://redis.io/)!

Bindi provides a simple Hash-like syntax for serializing and storing Ruby objects using the [redis](https://github.com/redis/redis-rb#readme) gem. Serialize with Marshal, YAML, JSON or your serializer of choice (as long as it supports #dump and #load methods).

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
#### Install Bindi

    $ gem install bindi

#### Install Redis

Brew package:

    `brew install redis`

Apt-get package:

    `sudo apt-get install redis-server`

Or build from source:
```bash
wget http://download.redis.io/redis-stable.tar.gz
tar xvzf redis-stable.tar.gz
cd redis-stable
make
```

Start Redis if it isn't running:

    $ redis-server

## Contributing
1. Fork it
2. Commit your changes
3. Pull request
4.  :cake: 
