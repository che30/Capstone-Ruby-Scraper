#!/usr/bin/env ruby
# rubocop: disable Style/GlobalVars
require 'nokogiri'
require 'open-uri'
require 'byebug'
require_relative '../lib/product'
require_relative '../lib/scraper'

def display_scrape
  scraper = Scraper.new($url)
  scraper.scrape
  i = 0
  while i < scraper.product_info.length
    puts "phone brand  #{i} #{scraper.product_info[i].name}\n"
    puts "phone price  #{scraper.product_info[i].price}"
    puts "phone address #{scraper.product_info[i].address}\n\n"
    i += 1
  end
end
puts "\nwelcome to my scraper of jumia page\n\n"
puts "there are 9740 pages to be scraped  \n\n"
puts " enter 1 to scrape single page or 2 a range of pages \n"
choice1 = gets.chomp.to_i
until [1, 2].any?(choice1)
  puts 'invalid choice'
  puts ' enter 1 to scrape single page or 2 a range of pages '
  choice1 = gets.chomp.to_i
end
if choice1 == 1
  puts 'enter the page number'
  choice2 = gets.chomp.to_i
  $url = 'https://www.jumia.cm/en/mobile-phones?page'
  $url += choice2.to_s
  print "webpage #{choice2} has url "
  puts $url
  scraper = Scraper.new($url)
  scraper.scrape
  display_scrape

else
  puts 'enter the maximum range'
  choice2 = gets.chomp.to_i
  count = 1
  while count < choice2
    $url = 'https://www.jumia.cm/en/mobile-phones?page'
    $url += count.to_s
    print "webpage #{count} has url "
    puts $url
    scraper = Scraper.new($url)
    scraper.scrape
    display_scrape
    count += 1
  end

end
# rubocop: enable Style/GlobalVars
