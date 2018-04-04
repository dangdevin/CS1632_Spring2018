class Market

  STOCKS = ['BI', 'LL', 'LA', 'BO', 'ON']

  attr_accessor :prices
  
  def initial_price(seed = nil)
    r = nil
    if (seed.nil?)
      r = Random.new
    else
      r = Random.new(seed)
    end
    r.rand(1..31).to_f.round(2)
  end
  
  def initialize
    @prices = Hash.new
    STOCKS.each do |name|
      @prices[name] = initial_price
    end
  end

  def iterate
    @prices.each do |k, v|
      @prices[k] += Random.rand(-5.0..5.0)
    end
  end

  # Returns the price of a named stock
  # If the stock does not exist, return -1
  def price name
    @prices[name.upcase]
  end

  def calculate_cost share_price, num_shares
    share_price * num_shares
  end
  
  def print
    puts "Stock market:"
    @prices.each do |k, v|
      puts "#{k.upcase}.... $#{v.round(2)}"
    end
  end
  
end