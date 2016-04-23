


def post_uri participant
  uri = URI('http://www.gq-magazin.de/ezjscore/call/')
  req = Net::HTTP::Post.new(uri, initheader = {'Content-Type' =>'application/json', 'User-Agent' => 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0) Gecko/20100101 Firefox/45.0'})
  req.set_form_data('participant_id' => '254296', 'type' => 'hot', 'ezjscServer_function_arguments' => 'cntoplist::addVote')
  res = Net::HTTP.start(uri.hostname, uri.port) do |http|
    http.request(req)
  end
  puts res.body
end

for i in `seq 1 100000`; do curl 'http://www.gq-magazin.de/ezjscore/call/' -H 'Accept: application/json, text/javascript, */*; q=0.01' -H 'Content-Type: application/x-www-form-urlencoded; charset=UTF-8' -H 'Host: www.gq-magazin.de' -H 'Referer: http://www.gq-magazin.de/unterhaltung/top-100-frauen/janina-uhse' -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0) Gecko/20100101 Firefox/45.0' -H 'X-Requested-With: XMLHttpRequest' --data 'participant_id=254296&type=hot&ezjscServer_function_arguments=cntoplist%3A%3AaddVote'; done

ab -n 20 'http://www.gq-magazin.de/ezjscore/call/' -H 'Accept: application/json, text/javascript, */*; q=0.01' -H 'Content-Type: application/x-www-form-urlencoded; charset=UTF-8' -H 'Host: www.gq-magazin.de' -H 'Referer: http://www.gq-magazin.de/unterhaltung/top-100-frauen/janina-uhse' -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0) Gecko/20100101 Firefox/45.0' -H 'X-Requested-With: XMLHttpRequest' --data 'participant_id=254296&type=hot&ezjscServer_function_arguments=cntoplist%3A%3AaddVote'

ab -n 500 -c 20 

  # def post_url
  #   @agent.post(
  #     'http://www.gq-magazin.de', 
  #     "User-Agent" => "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:40.0) Gecko/20100101 Firefox/40.0", 
  #     "Accept" => "application/json, text/javascript, */*; q=0.01",
  #     'Referer' => 'http://www.gq-magazin.de/unterhaltung/top-100-frauen/janina-uhse',   
  #     'X-Requested-With' => 'XMLHttpRequest', 
  #     'Content-Type' => 'application/x-www-form-urlencoded; charset=UTF-8',
  #     'participant_id' => "254296",
  #     'type' => 'hot',
  #     'ezjscServer_function_arguments' => "cntoplist::addVote"      
  #   )
    

  #   'Accept: application/json, text/javascript, */*; q=0.01' -H 
  #   'Content-Type: application/x-www-form-urlencoded; charset=UTF-8' -H 
  #   'Host: www.gq-magazin.de' -H 
  #   'Referer: http://www.gq-magazin.de/unterhaltung/top-100-frauen/janina-uhse' -H 
  #   'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0) Gecko/20100101 Firefox/45.0' -H 
  #   'X-Requested-With: XMLHttpRequest' --data 
  #   'participant_id=254296&type=hot&ezjscServer_function_arguments=cntoplist%3A%3AaddVote'
  # end
