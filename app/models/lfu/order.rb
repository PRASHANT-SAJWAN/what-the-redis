class Lfu
  class Order < Base
    INITIAL_SIZE = 2.freeze

    def initialize
        # LFU_START, LFU_END should never be removed
      @data = [Base::LFU_START, Base::LFU_END]
    end

    def add key, freq
      pos = get_position key, freq
      @data.insert(pos, key)
      puts ">>>>>>>>>>>>> #{@data}"
      "OK"
    end

    def remove key
      @data.delete(key)
    end

    def lfu_key
      @data[-2]
    end
    
    def get_size
      @data.count - INITIAL_SIZE
    end

    private

    # leftmost value in order having frequency equal to key
    # to maintain LRU within LFU of keys having same frequency
    def get_position key, freq
      @data.delete(key) if freq.exist?(key) # relocation of key according to new frequency

      l_pos = 1
      r_pos = @data.count - 2
      
      count = 0 # test

      while l_pos <= r_pos && count < 20
        count += 1 # test

        mid = (l_pos + r_pos) / 2
        # puts ">>>>>>>>>>> #{l_pos}, #{r_pos}"
        element = @data[mid]
        if freq.get(element) < freq.get(key)
          r_pos = mid - 1
        elsif freq.get(element) > freq.get(key)
          l_pos = mid + 1
        else
          r_pos = mid - 1
        end
      end

      l_pos
    end
  end
end
