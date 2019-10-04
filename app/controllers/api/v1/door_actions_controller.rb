class Api::V1::DoorActionsController < ApplicationController
  def open_main_door
    HTTParty.post(
      'http://hass-local.platan.us:8123/api/services/switch/turn_on',
      body: { entity_id: 'switch.main_door' }.to_json,
      headers: { 'Content-Type' => 'application/json', 'Accept' => 'application/json' }
    )
  end
end
