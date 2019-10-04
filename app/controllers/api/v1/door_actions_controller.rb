class Api::V1::DoorActionsController < ApplicationController
  CODE = ENV.fetch('MAIN_DOOR_CODE')
  API_KEY = ENV.fetch('HASS_API_KEY')

  def open_main_door
    if CODE == params[:code]
      HTTParty.post(
        "http://hass.platan.us:8123/api/services/switch/turn_on?api_password=#{API_KEY}",
        body: { entity_id: 'switch.main_door' }.to_json,
        headers: { 'Content-Type' => 'application/json', 'Accept' => 'application/json' }
      )
    else
      render json: {}, status: 401
    end
  end

  def open_outside_door
    HTTParty.post(
      "http://hass.platan.us:8123/api/services/switch/turn_on?api_password=#{API_KEY}",
      body: { entity_id: 'switch.outside_door' }.to_json,
      headers: { 'Content-Type' => 'application/json', 'Accept' => 'application/json' }
    )
  end
end
