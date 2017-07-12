class Search < ApplicationRecord
  def self.get_info(params)
    conn = Faraday.new :url => "https://api.propublica.org/congress/v1/members/house/#{params}/current.json", :headers => {"X-API-Key" => ENV["propublica_api_key"]}
    conn.get do |req|
      req.headers['X-API-Key'] = "#{ENV["propublica_api_key"]}"
    end
  end
end
