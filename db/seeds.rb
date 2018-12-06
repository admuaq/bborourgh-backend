# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'
# require 'json'
# require 'net/http'
require 'httparty'
# require 'byebug'
require 'date'

#Parses Date for Third Party API calls later, find way to make dynamic
#As of 13th of October 2018, latest data is correct, for the month of August for most API's
# Switch to DateTime.now, it requires 'date'
# DateTime.now.strftime("%Y-%m") => "2018-10"
# DateTime.now.last_month.last_month.strftime("%Y-%m") => "2018-08"
d = Date.parse('1st Aug 2018')

def randomNumberGenerator(lowLimit, upLimit)
  number = rand(lowLimit..upLimit)
end

def randomNumberGeneratorSalary
  number = rand(20000..90000)
end

def callAdzuna(areacode)
 path = "https://api.adzuna.com/v1/api/jobs/gb/history?app_id=#{Group.first.app_id}&app_key=#{Group.first.ssn}&where=#{areacode}&content-type=application/json"
 response = HTTParty.get(path)
end 

def callMetPol(latitude, longitude, date)
  path = "https://data.police.uk/api/crimes-street/all-crime?lat=#{latitude}&lng=#{longitude}&date=#{date.year}-0#{date.month}"
  response = HTTParty.get(path)
end

puts "Destroying existing seeds for repopulation"
Borough.all.destroy_all
Postcode.all.destroy_all

puts "Starting Seed"

boroughs = []
CSV.foreach('./data/boroughs-1.csv', headers: true) do |row|
  addBorough = Borough.new(row.to_h)
  # addBorough.health = randomNumberGenerator(50,80)
  addBorough.population = randomNumberGenerator(10000,30000)
  boroughs << addBorough
  
end
Borough.import(boroughs)
puts "Completed Boroughs, starting Postcodes"
# economicActivity: randomNumberGenerator, 
#       health: randomNumberGenerator, 

# # boroughs = Borough.create([
    # #     { name: 'Lambeth', income: 5, economicActivity: 4, health:3, crimeRate: 5 },
    # #     { name: 'Wandsworth', income: 6, economicActivity: 2, health:6, crimeRate: 2 },
    # #     { name: 'Westminister', income: 9, economicActivity: 7, health:8, crimeRate: 3 },
    # #     ])

postcodes = []
areacodes = ['RM10',
    'RM11','RM12','RM13','RM14','RM15','RM16','RM17','RM18','RM19','RM20','RM21','RM22','RM23','RM24','RM25','RM26','RM27','RM28','RM29','RM30','IG9','IG10','IG11','IG12','IG13','IG14','IG15','IG16','IG17','IG18','IG19','IG20','IG21','IG22','IG23','IG24','IG25','IG26','IG27','IG28','IG29','IG30','NW2','NW4','NW9','NW11','N3','N2','N12','N20','N10','N11','N14','HA8','EN4','EN5','NW7','DA14','DA15','DA16','DA17','DA18','SE9','SE2','SE28','DA5','DA6','DA7','DA8','HA9','HA0','NW10','NW9','NW6','NW2','BR1','BR2','BR3','BR4','BR5','BR6','BR7','BR8','BR9','BR10','BR11','BR12','BR13','BR14','BR15','BR16','BR17','BR18','BR19','BR20','BR21','BR22','BR23','BR24','BR25','BR26','BR27','BR28','BR29','BR30','SE20','NW1','NW2','NW3','NW5','NW6','NW8','W1','W9','WC1','WC2','N6','N7','N19','EC1','CR1','CR2','CR3','CR4','CR5','CR6','CR7','CR8','CR9','CR10','CR11','CR12','CR13','CR14','CR15','CR16','CR17','CR18','CR19','CR20','CR21','CR22','CR23','CR24','CR25','CR26','CR27','CR28','CR29','CR30','CR0','SE25','W7','W13','UB5','W3','W5','NW10','TW8','W12','UB1','UB2','UB6','HA0','W4','EN1','E4','EN3','EN2','EN4','EN9','N21','N13','N14','EN8','N11','N18','N9','N22','SE28','SE28','SE18','SE10','SE13','SE12','SE9','SE8','SE7','N1','E2','E8','E5','E9','N4','N16','SW6','W6','W12','W14','W10','W11','NW10','SW10','N6','N8','N10','N15','N17','N22','HA1','HA2','HA3','HA4','HA5','HA7','HA8','RM1','RM2','RM3','RM4','RM5','RM6','RM7','RM8','RM9','HA4','HA6','UB1','UB3','UB4','UB5','UB6','UB7','UB8','UB9','UB10','UB11','UB12','UB13','UB14','UB15','UB16','UB17','UB18','UB19','UB20','UB21','UB22','UB23','UB24','UB25','UB26','UB27','UB28','UB29','UB30','TW1','TW3','TW4','TW5','TW6','TW7','TW8','TW13','TW14','TW15','TW19','UB2','W3','W4','W5','W6','N1','N6','N5','N4','EC1','WC','N7','N16','N19','W11','W10','W8','W14','SW1','SW7','SW3','SW5','SW10','KT1','KT2','KT3','KT4','KT5','KT6','KT9','SW2','SE1','SW9','SE27','SW8','SE24','SE11','SW4','SW16','SE19','SE3','SE4','SE6','SE8','SE9','SE10','SE12','SE13','SE14','SE16','SE15','SE23','SE26','SE20','SE25','SW19','SW20','CR4','SM4','E15','E7','E12','E13','E6','E16','E11','E18','IG1','IG2','IG3','IG4','IG5','IG6','IG7','TW1','TW2','TW3','TW4','TW7','TW9','TW10','TW11','TW13','SW13','SW14','SW15','KT1','KT8','SE11','SE14','SE15','SE16','SE17','SE5','SE19','SE21','SE22','SE23','SE24','SE1','SE4','SE8','SE16','SM1','SM2','SM3','SM4','SM5','SM6','SM7','SM8','SM9','SM10','SM11','SM12','SM13','SM14','SM15','SM16','SM17','SM18','SM19','SM20','SM21','SM22','SM23','SM24','SM25','SM26','SM27','SM28','SM29','SM30','E1','E2','E3','E14','E1W','E17','E4','E10','E11','IG8','SW8','SW11','SW12','SW16','SW17','SW18','SW19','SW16','W1','WC2','NW6','W9','NW1','W10','W11','W2','W8','SW7','SW1','SW1P','EC1','WC1','EC2','WC2','EC1A','EC1B','EC1C','EC1D','EC1E','EC1F','EC1G','EC1H','EC1I','EC1J','EC2o','EC2p','EC2q','EC2r','EC2s','EC2t','EC2u','EC2v','EC2w','EC2x','EC2y','EC2z','W1a','W1b','W1c','W1d','W1e','W1f','W1g','W1h','W1I','W1j','W1k','W1l','W1m','W1n','W1o','W1p','W1q','W1r','W1s','W1t','W1u','W1v','W1w','W1x','W1y','W1z','WC2a','WC2b','WC2c','WC2d','WC2e','WC2f','WC2g','WC2h','WC2I','WC2j','WC2k','WC2l','WC2m','WC2n','WC2o','WC2p','WC2q','WC2r','EC1k','EC1l','EC1m','EC1n','EC1o','EC1p','EC1q','EC1r','EC1s','EC1t','EC1u','EC1v','EC1w','EC1x','EC1y','EC1z','WC1a','WC1b','WC1c','WC1d','WC1e','WC1f','WC1g','WC1h','WC1I','WC1j','WC1k','WC1l','WC1m','WC1n','WC1o','WC1p','WC1q','WC1r','WC1s','WC1t','WC1u','WC1v','WC1w','WC1x','WC1y','WC1z','EC2a','EC2b','EC2c','EC2d','EC2e','EC2f','EC2g','EC2h','EC2I','EC2j','EC2k','EC2l','EC2m','EC2n','WC2s','WC2t','WC2u','WC2v','WC2w','WC2x','WC2y','WC2z','SW1a','SW1b','SW1c','SW1d','SW1e','SW1f','SW1g','SW1h','SW1I','SW1j','SW1k','SW1l','SW1m','SW1n','SW1o','SW1p','SW1q','SW1r','SW1s','SW1t','SW1u','SW1v','SW1w','SW1x','SW1y','SW1z','EC3a','EC3b','EC3c','EC3d','EC3e','EC3f','EC3g','EC3h','EC3I','EC3j','EC3k','EC3l','EC3m','EC3n','EC3o','EC3p','EC3q','EC3r','EC3s','EC3t','EC3u','EC3v','EC3w','EC3x','EC3y','EC3z']
# areacodes = ['SW16']

areacodes.uniq.each do |areacode| 
url_base = "https://api.postcodes.io/outcodes/#{areacode}"

response = HTTParty.get(url_base)
# puts "Got response from"
# puts "Adding postcodes"

if response.parsed_response['result'] === nil
  next
else
  postcodes << response.parsed_response['result']
end

end

postcodes - [nil]

postcodes.each do |code|

  # Unmute following code to pull Data information from API's

  averageSalaryPostedJob = callAdzuna("#{code['outcode']}")
  metData = callMetPol(("#{code['latitude']}"), ("#{code['longitude']}"), d )

     item = Postcode.create({ 
      outcode: code['outcode'],
      latitude: code['latitude'],
      longitude: code['longitude'],
      averageSalaryPostedJob: averageSalaryPostedJob.parsed_response['month']["#{d.year}-0#{d.month}"], 
      crimeRate: metData.length,
      houseListings: randomNumberGenerator(1,30) })

    # IMPORTANT NOTE TO SELF: You need to add the health (CSV), (Zoopla?) house listings and education (CSV) attributes to the item above!!!
     
     code['admin_district'].each{ |district| 
      borough = Borough.find_by(name: district )
      if borough === nil 
        next
      else
        borough.postcodes << item 
      end
    }

    # Use this code below for testing
    # item = Postcode.create({ 
    #   outcode: code['outcode'],
    #   latitude: code['latitude'],
    #   longitude: code['longitude'],
    #   averageSalaryPostedJob: randomNumberGeneratorSalary, 
    #   crimeRate: randomNumberGenerator(1,10),
    #   houseListings: randomNumberGenerator(1,30)
    #  }) 
     
    #  code['admin_district'].each{ |district| 
    #   borough = Borough.find_by(name: district )
    #   if borough === nil 
    #     next
    #   else
    #     borough.postcodes << item 
    #   end
    # }
     
end 
puts "Completed Postcodes"
puts "Got list"
# "To find specific postcode, type: 'request['result'].find{|postcode| postcode['query'] === 'POSTCODE HERE'}' for example"
# To find borough: 'request['result'].find{|postcode| postcode['query'] === 'POSTCODE HERE'}['result']['admin_district']'