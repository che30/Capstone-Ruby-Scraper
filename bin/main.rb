#!/usr/bin/env ruby
# rubocop: disable Style/GlobalVars
require 'nokogiri'
require 'open-uri'
require_relative '../lib/product'
require_relative '../lib/scraper'

def display_scrape
  scraper = Scraper.new($url)
  scraper.scrape
  i = 0
  while i < scraper.product.length
    puts "phone brand  #{i} #{scraper.product[i].name}\n"
    puts "phone price  #{scraper.product[i].price}"
    puts "phone address #{scraper.product[i].address}\n\n"
    i += 1
  end
end
scrape_again = true
while scrape_again
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
  until choice2.positive? && choice2 < 9740
    puts 'enter a number beteen 1...9740'
    choice2 = gets.chomp.to_i
  end
  $url = 'https://www.jumia.cm/en/mobile-phones?page='
  $url += choice2.to_s
  print "webpage #{choice2} has url "
  puts "\n#{$url}\n\n"
  scraper = Scraper.new($url)
  scraper.scrape
  display_scrape
  puts 'enter any key to scrape again or  N to quit'
  answer= gets.chomp
  if answer.upcase=='N'
  scrape_again=false
  end
  system 'clear'
else
  puts 'enter the maximum range'
  choice2 = gets.chomp.to_i
  until choice2.positive? && choice2 < 9740
    puts 'enter a number between 1...9740'
    choice2 = gets.chomp.to_i
  end
  count = 1
  while count <= choice2
    $url = 'https://www.jumia.cm/en/mobile-phones?page='
    $url += count.to_s
    print "webpage #{count} has url \n\n"
    puts "\n#{$url}\n\n"
    scraper = Scraper.new($url)
    scraper.scrape
    display_scrape
    count += 1
  end
  puts 'enter any key to scrape again or  N to quit'
  answer= gets.chomp
  if answer.upcase=='N'
  scrape_again=false
  end
  system 'clear'
end
end
# rubocop: enable Style/GlobalVars
