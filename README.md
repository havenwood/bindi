# Bindi
Persist your Ruby objects to [Redis](http://redis.io/)!

Bindi provides a simple Hash-like syntax for serializing and storing Ruby objects using the [redis](https://github.com/redis/redis-rb#readme) gem. Serialize with Marshal, YAML, JSON or your serializer of choice (as long as it supports #dump and #load methods).

## Usage
```ruby
require 'bindi'

bindi = Bindi.new # Marshal is the default serializer.
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

### Additional Hash-like methods:
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

### Alternative Serializers
The default serializer is Marshal but you an alternative serializer can be specified when creating a new Bindi instance:
```ruby
require 'bindi'
require 'json'

bindi = Bindi.new JSON
#=> #<Redis client v3.0.2 for redis://127.0.0.1:6379/0>
```

A serializer without #dump and #load methods, like [Message Pack](http://msgpack.org), can be used by implementing those methods:
```ruby
require 'bindi'
require 'msgpack'

module MessagePack
  def self.dump(data)
    pack(data)
  end

  def self.load(data)
    unpack(data)
  end
end

bindi = Bindi.new MessagePack
#=> #<Redis client v3.0.4 for redis://127.0.0.1:6379/0>
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
