class Vote < ActiveRecord::Base
  require 'mechanize'
  require 'nokogiri'



  def click quantity
    counter = 0
    quantity.times do
      url = Rails.application.secrets.vote_url
      @driver = Selenium::WebDriver.for :firefox
      @driver.navigate.to url
      up_heart = @driver.find_element(:class, 'voting_hot').find_element(:class, 'hot')
      up_heart.click
      counter += 1
      @driver.quit
      puts counter
    end
  end

end
