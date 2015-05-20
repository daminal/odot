class ResponsesController < ApplicationController
  def create
    phone = params[:phone_number]
    lat = params[:lat]
    lng = params[:lng]
    value = params[:value]


    the_response = Response.new(phone: phone, lat: lat, lng: lng, value: value)

    if the_response.save
      # Return a response of 200 OK
      render text: 'OK'
    else
      # Return a response with data representing the errors
      render json: the_response.errors.to_json
    end
  end
end
