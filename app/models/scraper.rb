require 'nokogiri'
require 'open-uri'
require_relative "../../config/environment"

class Scraper
    attr_reader :url

    def initialize(url = "https://coinmarketcap.com/all/views/all/")
        @url = url
    end

    def get_page
        Nokogiri::HTML(URI.open(url))
    end

    def make_coins
        get_page.css("table tbody tr").each do |row|
            name = row.css("td:nth-child(2) a.cmc-link").text if row.css("td:nth-child(2) a.cmc-link")
            symbol = row.css("td:nth-child(3) div").text if row.css("td:nth-child(3) div")
            value = row.css("td:nth-child(5) div a").text.gsub(/[$,]/, "") if row.css("td:nth-child(5) div a")
            avatar = row.css("td:nth-child(2) img").attr("src").value if row.css("td:nth-child(2) img").attr("src")
            # binding.pry
            Coin.create(name: name, value: value, avatar: avatar)
        end
    end

    def daily_value_check
        get_page.css("table tbody tr").each do |row|
            name = row.css("td:nth-child(2) a.cmc-link").text if row.css("td:nth-child(2) a.cmc-link")
            value = row.css("td:nth-child(5) div a").text.gsub(/[$,]/, "") if row.css("td:nth-child(5) div a")
            coin = Coin.where("name LIKE ?", name)
            coin.update(value: value)
        end
    end

    def print_current_values
        values = Coin.all.map {|c| c.value}
        File.write("log-values.txt", values, mode: "a")
    end

end