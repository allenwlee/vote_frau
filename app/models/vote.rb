class Vote < ActiveRecord::Base
  require 'mechanize'
  require 'nokogiri'



  def job type, person, quantity
    url = 'http://www.gq-magazin.de/unterhaltung/top-100-frauen/janina-uhse'
    @agent = Mechanize.new
    page = @agent.get url
    up_button = page.search('.voting_hot').css('a').first
    down_button = page.search('.voting_not').css('a').first
    type = 'up' ? button = up_button : button = down_button
    quantity.times { click(@agent, button) }
  end

  def vote type
    up_number = 1461339825038
    down_number = 1461339741016
    "http://de.ioam.de/tx.io?st=gqcom&cp=gqn_unterhaltung_top100frauen&sv=i2&pt=CP&rf=&r2=&ur=www.gq-magazin.de&xy=1280x800x24&lo=US%2FCalifornia&cb=0011&vr=308&id=r0rp3k&lt=#{1461339825038}&ev=&cs=ed8dj9&mo=1"
  end

  def up_marloes
    "http://de.ioam.de/tx.io?st=gqcom&cp=gqn_unterhaltung_top100frauen&sv=i2&pt=CP&rf=www.gq-magazin.de&r2=http%3A%2F%2Fwww.gq-magazin.de%2Funterhaltung%2Ftop-100-frauen%2Fjanina-uhse&ur=www.gq-magazin.de&xy=1280x800x24&lo=US%2FCalifornia&cb=0011&vr=308&id=r0rp3k&lt=1461339991478&ev=&cs=or8tax&mo=1"
    
  end

  def refresh_marloes
    'http://de.ioam.de/tx.io?st=gqcom&cp=gqn_unterhaltung_top100frauen&sv=in&pt=CP&rf=www.gq-magazin.de&r2=http%3A%2F%2Fwww.gq-magazin.de%2Funterhaltung%2Ftop-100-frauen%2Fjanina-uhse&ur=www.gq-magazin.de&xy=1280x800x24&lo=US%2FCalifornia&cb=0011&vr=308&id=r0rp3k&lt=1461340522477&ev=&cs=rv2lt3&mo=1'
  end

  def up_janina
    'http://de.ioam.de/tx.io?st=gqcom&cp=gqn_unterhaltung_top100frauen&sv=i2&pt=CP&rf=&r2=&ur=www.gq-magazin.de&xy=1280x800x24&lo=US%2FCalifornia&cb=0011&vr=308&id=r0rp3k&lt=1461340316409&ev=&cs=jrobfj&mo=1'
    'http://de.ioam.de/tx.io?st=gqcom&cp=gqn_unterhaltung_top100frauen&sv=i2&pt=CP&rf=&r2=&ur=www.gq-magazin.de&xy=1280x800x24&lo=US%2FCalifornia&cb=0011&vr=308&id=r0rp3k&lt=1461340450727&ev=&cs=rsdn20&mo=1'

  end

  def refresh_janina
    'http://de.ioam.de/tx.io?st=gqcom&cp=gqn_unterhaltung_top100frauen&sv=in&pt=CP&rf=&r2=&ur=www.gq-magazin.de&xy=1280x800x24&lo=US%2FCalifornia&cb=0011&vr=308&id=r0rp3k&lt=1461340380410&ev=&cs=d6gz79&mo=1'
  end


  def down_vote
    'http://de.ioam.de/tx.io?st=gqcom&cp=gqn_unterhaltung_top100frauen&sv=i2&pt=CP&rf=&r2=&ur=www.gq-magazin.de&xy=1280x800x24&lo=US%2FCalifornia&cb=0011&vr=308&id=r0rp3k&lt=1461339741016&ev=&cs=d8bfr6&mo=1'
  end


  def click agent, button
    agent.click button

  end


end
