require 'pry'

class Startup

    @@all = []

    def self.all
        @@all
    end

    # find all startups founded by the foudner provided
    def self.find_by_founder(founder)
        self.all.find { |su| su.founder == founder }
    end

    # Return all domains for which we have Startup data
    def self.domains
        self.all.map { |su| su.domain }
    end

    #attr_accessor :domain
    attr_reader :name, :founder, :domain

    def initialize(name, founder, domain)
        @name, @founder, @domain = name, founder, domain
        save
    end

    #change to the domain of a the given startup
    def pivot(name, new_domain)
        @domain = new_domain
        @name = name
    end

    def sign_contract(vc, type, investment)
        FundingRound.new(self, vc, type, investment)
    end

    #return an array of all funding rounds this startup has been through
    def funding_rounds
        FundingRound.all.select { |fr| fr.startup == self }
    end

    #returns number of funding rounds for SU
    def num_funding_rounds
        self.funding_rounds.size
    end

    # retunr total funds so far invested
    def total_funds
        self.funding_rounds.map { |fr| fr.investment }.sum
    end

    #ALL VCS that have invested in thsi SU
    def investors
        self.funding_rounds.map { |fr| fr.venture_capitalist }.uniq
    end

    #returns unique array of VCs that have invested and are worth more than 1 G$ 
    def big_investors
        tcc = VentureCapitalist.tres_commas_club
        self.investors.select { |investor| tcc.include?(investor) }
    end

    private
    attr_writer :domain

    def save
        self.class.all << self
    end

    # def domain=(domain)
    #     @domain = domain
    #     binding.pry
    # end
end
