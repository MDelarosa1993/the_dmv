require'./lib/vehicle'
require './lib/dmv_data_service'
require './lib/vehicle_factory'

RSpec.describe VehicleFactory do 
  before (:each) do 
    @factory = VehicleFactory.new
    @wa_ev_registrations = DmvDataService.new.wa_ev_registrations 
  end

  describe 'create vehicles' do 
    it 'creates vehicles' do 
      vehicles = @factory.create_vehicles(@wa_ev_registrations)
      expect(vehicles).to be_an_instance_of(Array) 
      expect(vehicles.length).to eq(@wa_ev_registrations.length)
      vehicles.each do |vehicle|
        expect(vehicle).to be_a(Vehicle)
        expect(vehicle.engine).to eq(:ev)
        expect(vehicle.make).to be_truthy
        expect(vehicle.model).to be_truthy
        expect(vehicle.vin).to be_truthy
        expect(vehicle.year).to be_truthy
      end
    end
  end
end