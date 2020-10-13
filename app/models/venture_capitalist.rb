class VentureCapitalist

    @@all = []

    def self.all
        @@all
    end

    def self.tres_commas_club
        self.all.select { |vc| vc.total_worth >= 1_000_000_000 }
    end

    attr_accessor :total_worth
    attr_reader :name

    def initialize(name, total_worth)
        @name, @total_worth = name, total_worth
        save
    end

    def offer_contract(startup, type, investment)
        FundingRound.new(startup, self, type, investment)
    end

    def funding_rounds
        FundingRound.all.select { |fr| fr.venture_capitalist == self }
    end

    def portfolio
        self.funding_rounds.map { |fr| fr.startup }.uniq
    end

    def biggest_investment
        self.funding_rounds.max_by { |fr| fr.investment }
    end

    def funding_rounds_by_domain(domain)
        self.funding_rounds.select { |fr| fr.startup.domain == domain }
    end

    def invested(domain)
        self.funding_rounds_by_domain(domain).map { |fr| fr.investment }.sum
    end

    private
    def save
        self.class.all << self
    end
end
