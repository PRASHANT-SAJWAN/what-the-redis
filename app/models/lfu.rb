class Lfu
  def initialize
    @frequency = Lfu::Frequency.new
    @order = Lfu::Order.new
    @limit_size = 5
  end

  def set key
    invalid_error_message if invalid_key? key
    remove_lfu if full?

    @frequency.add key
    @order.add key, @frequency
  end

  def remove key
    invalid_error_message if invalid_key? key

    @frequency.remove key
    @order.remove key if @frequency.exist? key
  end

  def exist? key
    invalid_error_message if invalid_key? key

    @frequency.exist? key
  end

  private

  def invalid_error_message
    raise "Server Error!! Cannot set #{Lfu::Base::LFU_START}, #{Lfu::Base::LFU_END} as key"
  end

  def invalid_key? key
    [Base::LFU_START, Base::LFU_END].include?(key)
  end

  def remove_lfu
    key = @order.lfu_key
    @frequency.remove(key)
    @order.remove(key)
  end

  def current_size
    @order.get_size
  end

  def full?
    current_size == @limit_size
  end
end