require 'redis'

class Bindi
  def initialize serializer = Marshal
    @serializer = serializer
    @redis = Redis.new
  end

  def [] key
    @serializer.load(@redis.get key) if @redis.exists key
  end

  def []= key, value
    @redis.set key, @serializer.dump(value)
  end

  def clear
    [] if @redis.flushdb == "OK"
  end

  def delete key
    if key? key
      value = @serializer.load(@redis.get key)
      @redis.del key
      value
    end
  end

  def empty?
    @redis.keys.empty?
  end

  def info
    @redis.info
  end

  def inspect
    @redis.inspect
  end
  alias to_s inspect

  def key? key
    @redis.exists key
  end
  alias has_key key?

  def keys
    @redis.keys
  end
end
