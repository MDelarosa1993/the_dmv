require './lib/Dmv_Facilities'
require '/lib/DmvFacilityFactory'
require './lib/dmv_data_service'

RSpec.describe DmvFacilities do 
  before(:each) do 
    @factory = Factory.Dmv_facility
    @co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
  end

  it 'creates Dmv facilities' do 
    facilities = @factory.create_facilities(@co_dmv_office_locations)
      expect(facilities).to be_an(Array)
      expect(facilities.length).to eq(@co_dmv_office_locations.length)
      facilities.each do |facility|
        expect(facility).to be_a(DmvFacility)
        expect(facility.dmv_id).to be_truthy
        expect(facility.dmv_office).to be_truthy
        expect(facility.address_li).to be_truthy
        expect(facility.address_1).to be_truthy
        expect(facility.city).to be_truthy
        expect(facility.state).to be_truthy
        expect(facility.zip).to be_truthy
        expect(facility.phone).to be_truthy
        expect(facility.hours).to be_truthy
        expect(facility.services_p).to be_truthy
        expect(facility.parking_no).to be_truthy
        expect(facility.photo).to be_truthy
        expect(facility.address_id).to be_truthy
      end
  end
end