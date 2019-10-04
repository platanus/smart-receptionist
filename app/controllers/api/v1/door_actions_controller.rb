class Api::V1::DoorActionsController < ApplicationController
  CODE = ENV.fetch('MAIN_DOOR_CODE')

  def open_main_door
    if CODE == params[:code]
      HTTParty.post(
        'http://hass-local.platan.us:8123/api/services/switch/turn_on',
        body: { entity_id: 'switch.main_door' }.to_json,
        headers: { 'Content-Type' => 'application/json', 'Accept' => 'application/json' }
      )
    else
      render json: {}, status: 401
    end
  end
end
