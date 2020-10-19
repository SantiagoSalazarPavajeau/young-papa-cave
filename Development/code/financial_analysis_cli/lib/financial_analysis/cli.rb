class FinancialAnalysis::CLI
  
  attr_accessor :companies
  
  def start
    puts "Time for some Financial Analysis"
    FinancialAnalysis::API.get_companies
    list_companies
    menu
  end
  
  def list_companies
    FinancialAnalysis::Company.all.each.with_index(1) do |company, i|
      puts "#{i}. #{company.companyName} -> ticker: #{company.ticker}"
    end
  end
  
  def menu
    input = nil
    while input != 'EXIT'
    puts "Choose a company you would like more information on by typing its ticker (e.g. AAPL). Type LIST to see some available companies or type EXIT."
      input = gets.strip.upcase
      if input == 'LIST'
        list_companies
      elsif FinancialAnalysis::Company.all.detect{ |company| company.ticker == input}
        company = FinancialAnalysis::Company.all.detect{ |company| company.ticker == input}
         puts ""
         puts "#{company.companyName}:" if company.companyName != ""
         puts ""
         puts "#{company.description}" if company.description != ""
         puts ""
         puts "Sector: #{company.sector}" if company.sector != ""
         puts "CEO: #{company.ceo}" if company.ceo != ""
         puts "Industry: #{company.industry}" if company.industry != ""
         puts "Website: #{company.website}" if company.website != ""
         puts "Stock price: #{company.price}" if company.price != ""
         puts "Market capitalization: #{company.mktCap}" if company.mktCap != ""
         puts ""
         puts "Would you like to see the balance sheet and income statment of this company? Y/N"
          input = gets.strip.upcase
          if input == "Y"
            puts "Balance Sheet:" 
            Pry::ColorPrinter.pp(company.balance_sheets)
            puts "Income Statment:"
            Pry::ColorPrinter.pp(company.income_statements)
          else
          end
      else
        puts "OK! If you would like to try again, try typing a company's ticker, or LIST, or EXIT while in the gem."
      end
    end
  end
end