class FinancialAnalysis::API

  def self.get_companies
    response = HTTParty.get("https://financialmodelingprep.com/api/v3/stock/actives")
    response["mostActiveStock"].each do |hash|
      if hash[:companyName] != ""
        hash[:companyName] = hash[:ticker]
        
      end
    FinancialAnalysis::Company.new(hash["ticker"])
    end
  end
  
  def self.profile(ticker)
    response = HTTParty.get("https://financialmodelingprep.com/api/v3/company/profile/#{ticker}")
    # response_balance = HTTParty.get("https://financialmodelingprep.com/api/v3/financials/balance-sheet-statement/#{ticker}")
    # # self.balance_sheets = response_balance["financials"][0]
    # response_income = HTTParty.get("https://financialmodelingprep.com/api/v3/financials/income-statement/#{ticker}")
    # # self.income_statements = response_income["financials"][0]
    # response['profile']['balance_sheets'] = response_balance["financials"][0]
    # response['profile']['income_statements'] = response_income["financials"][0]
    response
  end

end