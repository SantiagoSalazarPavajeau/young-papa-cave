class FinancialAnalysis::Company
  
  attr_accessor :ticker, :balance_sheets, :income_statements, :price, :beta, :volAvg, :mktCap, :lastDiv, :range, :changes, :changesPercentage, :companyName, :exchange, :industry, :website, :description, :ceo, :sector, :image
  
  @@all = []
  
  def initialize(ticker)
    @ticker = ticker
    company_hash = FinancialAnalysis::API.profile(ticker)
    company_hash["profile"].each { |k,v| self.send("#{k}=", v) }
    @@all << self
  end
  
  def self.all
    @@all
  end
  
end