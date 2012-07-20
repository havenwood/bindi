require 'ohm'
require 'bindi/version'

module Bindi
  class << self
    def connect
      Ohm.connect
    end

    def [] key
      Marshal.load(Ohm.redis.get key)
    end

    def []= key, value
      Ohm.redis.set key, Marshal.dump(value)
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
      Ohm.redis.all
    end

    alias to_s inspect

    def inspect_redis
      Ohm.redis.inspect
    end

    def key? key
      Ohm.redis.exists key
    end

    alias has_key key?

    def keys
      Ohm.redis.keys
    end
  end
end