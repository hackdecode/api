require 'rest-client'
require 'json'

class NomadController < ApplicationController


	#returns list of available cities
	def cities
		
		res = RestClient.get(@@url, headers={})
		dict = JSON.parse(res.body)
		cities = dict["result"].map{ |item| item["info"]["city"]}
		render json: cities
	end

	#returns cost of chosen destination
	def cost

	end

	#returns full URL for the image of chosen city
	def image
		city_url = params[:url]

		res = RestClient.get(@@url + "/" + city_url, headers={})
		json = JSON.parse(res.body)
		image = json["result"][0]["media"]["image"]["1500"]
		image = "https://nomadlist.com" + image
		render json: { "image": image}
	end

end
