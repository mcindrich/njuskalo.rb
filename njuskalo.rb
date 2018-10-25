#!/usr/bin/ruby -w
require 'rubygems'
require 'nokogiri'
require 'io/console'  
require 'optparse'  
require './ad.rb'

OPTIONS = {:result_number=>0, :page_number=>"1", :limit=>-1, :show_type=>0, :category=>""}

def parseArgs
  OptionParser.new do |opts|
    opts.banner = "Usage: njuskalo.rb [options]"
    
    opts.on("-p PAGE_NUMBER", "--page PAGE_NUMBER", "Select a page (default = 1)") do |o|
      OPTIONS[:page_number] = o
    end
  
    opts.on("-r RESULT_NUMBER", "--result RESULT_NUMBER", "Number of results to show") do |o|
      OPTIONS[:result_number] = o
    end
  
    opts.on("-l LIMIT", "--limit LIMIT", "Cash limit") do |o|
      OPTIONS[:limit] = o
    end

    opts.on("-s SHOW_TYPE", "--show SHOW_TYPE", "Number (0-2)") do |o|
      OPTIONS[:show_type] = o
    end

    opts.on("-c CATEGORY", "--category CATEGORY", "Category to look in (example: apple-iphone)") do |o|
      OPTIONS[:category] = o
    end
  end.parse!
end

def printAd(ad, num)
  case OPTIONS[:show_type]
  when 0
    print "Ad ##{num}: \n"
    print "\t"
    print ad.getTitle
    puts ""
    print "\t"
    print ad.getPrice
    puts ""
  when 1
  when 2
  end
end

def main
  ads = []
  url="https://www.njuskalo.hr/"

  if OPTIONS[:category] != ""
    url += OPTIONS[:category]
  else
    puts "No category specified.\nExiting..."
    exit
  end

  url += "?page=" + OPTIONS[:page_number]

  command = "curl -A 'random_ua' \"" + url + "\" -s"
  html = `#{command}`
  page = Nokogiri::HTML(html)

  articles = page.css('[class="entity-body cf"]')

  articles.each do |article| 
    if article.children[1].name == "h3" and article.children.count > 5
      ads.push(Ad.new(article))
    end
  end
  
  counter = 0

  if OPTIONS[:result_number].to_i > 0
    for i in 0..ads.size-1
      if i+1 > OPTIONS[:result_number].to_i
        break
      end
      if OPTIONS[:limit].to_i != -1
        str_size = ads[i].getPrice.size
        price_int = ads[i].getPrice[0..str_size-4].split('.')
        if price_int.size == 1
          price_int = price_int[0].to_i
        else
          price_int = price_int[0].to_i * 1000 + price_int[1].to_i
        end
        if price_int < OPTIONS[:limit].to_i
          printAd(ads[i], counter+1)
          counter += 1
        end
      else
        printAd(ads[i], i)
      end
    end
  end
end

parseArgs
main