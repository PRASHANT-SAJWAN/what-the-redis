class Lfu
  class Frequency < Base
    KEY_ABSENT_ERROR_MESSAGE = "key doesn't exist in record".freeze

    def initialize
      @data = {
        Base::LFU_START => 0,
        Base::LFU_END => -1,
      }
    end

    def add key
      if @data[key].nil?
        @data[key] = 1 
      else
        @data[key] += 1
      end
    end

    def get key
      # raise KEY_ABSENT_ERROR_MESSAGE if freq.get(key).nil?
      @data[key].to_i
    end

    def remove key
      raise KEY_ABSENT_ERROR_MESSAGE unless exist? key
      @data.delete(key)
    end

    def exist? key
      @data[key].present?
    end
  end
end
