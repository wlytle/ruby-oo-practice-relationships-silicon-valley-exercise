class FundingRound

    @@all = []

    def self.all
        @@all
    end

    attr_reader :startup, :venture_capitalist, :type, :investment
    

    def initialize(su, vc, type, investment)
        @startup, @venture_capitalist, @type, @investment = su, vc, type, investment
        check_investment        
        save
    end

    private
    def save
        self.class.all << self
    end

    def check_investment
        @investment >= 0 ? @investment.to_f : "Investment must be an amount greater than $0.00"
    end
end

