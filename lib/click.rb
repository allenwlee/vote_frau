require 'uri'
require 'net-http'
def post_uri
  uri = URI('http://www.gq-magazin.de/ezjscore/call/')
  req = Net::HTTP::Post.new(uri, initheader = {'Content-Type' =>'application/json', 'User-Agent' => 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0) Gecko/20100101 Firefox/45.0'})
  req.set_form_data('participant_id' => '254296', 'type' => 'hot', 'ezjscServer_function_arguments' => 'cntoplist::addVote')
  res = Net::HTTP.start(uri.hostname, uri.port) do |http|
    http.request(req)
  end
  puts res.body
end

def func1
   i=0
   while i<=2
      puts "func1 at: #{Time.now}"
      post_uri
      i=i+1
   end
end

def func2
   j=0
   while j<=2
      puts "func2 at: #{Time.now}"
      post_uri
      j=j+1
   end
end

puts "Started At #{Time.now}"
t1=Thread.new{func1()}
t2=Thread.new{func2()}
t1.join
t2.join
puts "End at #{Time.now}"
