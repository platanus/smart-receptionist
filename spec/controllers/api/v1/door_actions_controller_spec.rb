RSpec.describe Api::V1::DoorActionsController, type: :controller do
  describe '#open_main_door' do
    before do
      stub_const("Api::V1::DoorActionsController::CODE", '12345')
    end

    context 'with correct code' do
      before do
        allow(HTTParty).to receive(:post)
        post :open_main_door, params: { format: :json, code: '12345' }
      end

      it 'makes HTTParty request if code is correct' do
        expect(HTTParty).to have_received(:post)
      end
    end

    context 'with wrong code' do
      before do
        post :open_main_door, params: { format: :json, code: '00000' }
      end

      it 'returns status 401' do
        expect(response.status).to eq(401)
      end
    end
  end
end
