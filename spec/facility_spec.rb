require 'spec_helper'
require './lib/facility'
require './lib/vehicle'
require './lib/registrant'
require 'date'

RSpec.describe Facility do
  let(:facility_1) do
    Facility.new({
      name: 'DMV Tremont Branch',
      address: '2855 Tremont Place Suite 118 Denver CO 80205',
      phone: '(720) 865-4600'
    })
    
  end

  let(:facility_2) do
    Facility.new({
      name: 'DMV Northeast Branch',
      address: '4685 Peoria Street Suite 101 Denver CO 80239',
      phone: '(720) 865-4600'
    })
  end

  let(:cruz) do
    Vehicle.new({
      vin: '123456789abcdefgh',
      year: 2012,
      make: 'Chevrolet',
      model: 'Cruz',
      engine: :ice,
      plate_type: :regular
    })
  end

  let(:bolt) do
    Vehicle.new({
      vin: '987654321abcdefgh',
      year: 2019,
      make: 'Chevrolet',
      model: 'Bolt',
      engine: :ev
    })
  end

  let(:camaro) do
    Vehicle.new({
      vin: '1a2b3c4d5e6f',
      year: 1969,
      make: 'Chevrolet',
      model: 'Camaro',
      engine: :ice
    })
    
  end

  describe '#initialize' do
    it 'initializes with correct attributes' do
      expect(facility_1.name).to eq('DMV Tremont Branch')
      expect(facility_1.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
      expect(facility_1.phone).to eq('(720) 865-4600')
      expect(facility_1.services).to eq([])
      expect(facility_1.collected_fees).to eq(0)
    end
  end

  describe '#add_service' do
    it 'adds a service to the facility' do
      facility_1.add_service('Vehicle Registration')
      expect(facility_1.services).to include('Vehicle Registration')
    end
  end

  describe '#register_vehicle' do
      it 'registers a vehicle with plate_type :regular' do 
        facility_1.add_service('Vehicle Registration')
        facility_1.register_vehicle(cruz)
        expect(cruz.registration_date).to eq(nil)
        expect(cruz.plate_type).to eq(:regular)
        expect(facility_1.registered_vehicles).to include(cruz)
        expect(facility_1.collected_fees).to eq(100)
      end

      it 'registers plate_type :antique' do 
        facility_1.add_service('Vehicle Registration')
        facility_1.register_vehicle(camaro)
        expect(camaro.registration_date).to eq(nil)
        expect(camaro.plate_type).to eq(:antique)
        expect(facility_1.registered_vehicles).to include(camaro)
        expect(facility_1.collected_fees).to eq(25)
      end

      it 'registers a third vehicle with plate_type :ev' do
        facility_1.add_service('Vehicle Registration')
        facility_1.register_vehicle(bolt)
        expect(bolt.registration_date).to eq(nil)
        expect(bolt.plate_type).to eq(:ev)
        expect(facility_1.registered_vehicles).to include(bolt)
        expect(facility_1.collected_fees).to eq(200)
      end
        it 'does not register a vehicle' do
        expect(facility_2.register_vehicle(bolt)).to eq(nil)
        expect(facility_2.registered_vehicles).to eq([])
        expect(facility_2.collected_fees).to eq(0)
      end

      describe 'administer_written_test' do
      it 'allows eligible registrants to take the written test' do
        @registrant_1 = Registrant.new('Bruce', 18, true)
        facility_1.add_service('Written Test')
        expect(facility_1.administer_written_test(@registrant_1)).to be true
        expect(@registrant_1.license_data[:written]).to be true
      end
  
      it 'does not allow ineligible registrants to take the written test' do
        @registrant_3 = Registrant.new('Tucker',15)
        expect(facility_1.administer_written_test(@registrant_3)).to be false
        expect(@registrant_3.license_data[:written]).to be false
      end
    end
    end
end
