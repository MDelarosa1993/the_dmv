require './lib/facility'
require './lib/dmv_data_service'
require './lib/Dmv_Facility_Factory'

RSpec.describe DmvFacilityFactory do 
  describe 'create facilities' do 
    before(:each) do 
     
      @co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
    end
    describe 'creates facilites' do 
      it 'creates facilities' do 
        facilities = DmvFacilityFactory.new.create_facilities(@co_dmv_office_locations)
        expect(facilities).to be_an_instance_of(Array) 
        expect(facilities.length).to eq(@co_dmv_office_locations.length)
        facilities.each do |facility|
          expect(facility).to be_a(Facility) 
          expect(facility.name).to be_truthy
          expect(facility.address).to be_truthy
          expect(facility.phone).to be_truthy
        end
      end
    end
  end
end