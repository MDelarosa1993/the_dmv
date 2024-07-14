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
  end
end