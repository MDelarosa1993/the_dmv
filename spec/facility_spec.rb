require 'spec_helper'
require './lib/facility'
require './lib/vehicle'

RSpec.describe Facility do
  before (:each) do 
    @facility_1 = Facility.new({
      name: 'DMV Tremont Branch',
      address: '2855 Tremont Place Suite 118 Denver CO 80205',
      phone: '(720) 865-4600'
    })
    @facility_2 = Facility.new({
      name: 'DMV Northeast Branch',
      address: '4685 Peoria Street Suite 101 Denver CO 80239',
      phone: '(720) 865-4600'
    })
  end
  describe '#initialize' do
    it 'can initialize' do
      expect(@facility_1.name).to eq('DMV Tremont Branch')
      expect(@facility_1.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
      expect(@facility_1.phone).to eq('(720) 865-4600')
      expect(@facility_1.services).to eq([])
    end
  end

  describe '#add service' do
    it 'can add available services' do
      expect(@facility_1.services).to eq([])
      @facility_1.add_service('Vehicle Registration')
      expect(@facility_1.services).to eq(['Vehicle Registration'])
    end
  end

  describe 'colllected fees' do 
    it 'collects fees' do 
      expect(@facility_1.collected_fees).to eq(0)
    end
  end

end
