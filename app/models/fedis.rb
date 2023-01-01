class Fedis
  attr_reader :data
  def initialize
    @data = {}
    @lfu = Lfu.new
  end

  def present
    @data.to_json
  end

  def size
    @data.keys.count
  end

  def get key
    @data[key]
  end

  def set key, value
    raise "key: { #{key} } type is not supported" unless key.is_a? ::String
    raise "value: { #{value} } type is not supported" unless value.is_a? ::String

    @lfu.set(key)
    @data[key] = value
  end

  def remove key
    if @data[key].present?
      @lfu.remove(key)
      @data.delete(key)
    else
      raise "#{key} doesn't exist"
    end
  end
end
