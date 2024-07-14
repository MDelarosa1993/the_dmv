require './lib/Dmv_facility'
require './lib/dmv_data_service'

RSpec.describe DmvFacilities do 
  before(:each) do 
    @factory = Factory.Dmv_facility
    @co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
  end
end