class Vote < ActiveRecord::Base
  require 'uri'
  require 'net/http'
  require 'json'
  require 'mechanize'
  require 'nokogiri'

  attr_accessor :response


  # def click quantity
  #   counter = 0
  #   quantity.times do
  #     url = Rails.application.secrets.vote_url
  #     @driver = Selenium::WebDriver.for :firefox
  #     @driver.navigate.to url
  #     up_heart = @driver.find_element(:class, 'voting_hot').find_element(:class, 'hot')
  #     up_heart.click
  #     counter += 1
  #     @driver.quit
  #     puts counter
  #   end
  # end

  def thread thread_count, per_thread
    threads = []
    puts "Started At #{Time.now}"
    thread_count.times.each_with_index do |x, i|
      t = Thread.new { multi_post(i, per_thread) }
      threads << t
    end
    threads.each { |thr| thr.join }
    puts "End at #{Time.now}" 
  end

  def multi_post thread, per_thread
    i = 0
    while i <= per_thread
      puts "thread: #{thread}, per_thread: #{i}"
      post_uri
      i += 1
    end 
  end

  def post_uri
    uri = URI('http://www.gq-magazin.de/ezjscore/call/')
    req = Net::HTTP::Post.new(uri, initheader = {'Content-Type' =>'application/json', 'User-Agent' => 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0) Gecko/20100101 Firefox/45.0'})
    req.set_form_data('participant_id' => '254296', 'type' => 'hot', 'ezjscServer_function_arguments' => 'cntoplist::addVote')
    res = Net::HTTP.start(uri.hostname, uri.port) do |http|
      http.request(req)
    end
    puts Nokogiri::HTML(res.body).text.partition('score').last
  end
  

end
