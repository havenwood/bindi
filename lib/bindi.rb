require 'ohm'
require 'bindi/version'

class Bindi
  def initialize serializer = Marhsal
    @serializer = serializer
  end
  
  def connect
    Ohm.connect
  end

  def [] key
    @serializer.load(Ohm.redis.get key)
  end

  def []= key, value
    Ohm.redis.set key, @serializer.dump(value)
  end

  def clear
    Ohm.redis.flushdb
  end

  def delete key
    Ohm.redis.del key
  end

  def each
    Ohm.redis.keys.each do
      yield
    end
  end

  def empty?
    Ohm.redis.keys.empty?
  end

  def info
    Ohm.redis.info
  end
    
  def inspect
    Ohm.redis.inspect
  end

  alias to_s inspect

  def key? key
    Ohm.redis.exists key
  end

  alias has_key key?

  def keys
    Ohm.redis.keys.map &:to_sym
  end
end
