class PropublicaService
  def members_of_house(state)
    response = conn.get("/congress/vi/members/house/#{state}/current.json")
    json = JSON.parse(response.body, symbolize_names: true)
  end

  def conn 
    Faraday.new(url: "https://api.propublica.org") do |faraday|
      faraday.headers["X-API-KEY"] = ENV["PROPUBLICA_API_KEY"]
    end
  end
end