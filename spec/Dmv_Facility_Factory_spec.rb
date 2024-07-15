require './lib/facility'
require './lib/dmv_data_service'
require './lib/Dmv_Facility_Factory'

RSpec.describe DmvFacilityFactory do 
  describe 'create facilities' do 
    before(:each) do 
     @co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
     @new_york_facilities = DmvDataService.new.ny_dmv_office_locations
     @missouri_facilities = DmvDataService.new.mo_dmv_office_locations
    end 
    describe 'creates facilities ' do 
      it 'creates Colorado objects' do 
        facilities = DmvFacilityFactory.new.colorado_facilities(@co_dmv_office_locations)
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
      describe 'Creates NY objects'
        it 'creates NY facilites' do 
          facilities = DmvFacilityFactory.new.new_york_facilities(@new_york_facilities)
          expect(facilities).to be_an_instance_of(Array) 
          expect(facilities.length).to eq(@new_york_facilities.length)
          facilities.each do |facility|
            expect(facility).to be_a(Facility) 
            expect(facility.name).to be_truthy
            expect(facility.address).to be_truthy
            expect(facility.phone).to be_truthy
        end
      end
      describe 'Creates Missouri objects'
        it 'creates Missouri facilites' do 
          facilities = DmvFacilityFactory.new.missouri_facilities(@missouri_facilities)
          expect(facilities).to be_an_instance_of(Array) 
          expect(facilities.length).to eq(@missouri_facilities.length)
          facilities.each do |facility|
            expect(facility).to be_a(Facility) 
            expect(facility.name).to be_truthy
            expect(facility.address).to be_truthy
            expect(facility.phone).to be_truthy
        end
      end
    end
  end
