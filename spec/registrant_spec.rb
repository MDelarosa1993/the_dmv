require './lib/registrant'
require './lib/facility'

RSpec.describe Registrant do 
  before(:each) do 
    @registrant_1 = Registrant.new('Bruce', 18, true)
    @registrant_2 = Registrant.new('Penny', 15)
    @registrant_3 = Registrant.new('Tucker', 15 )
    @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
    @facility_1.add_service('Written Test')
    @facility_1.add_service('Road Test')
    @facility_1.add_service('Renew License')
    
  end

  describe 'Initialize' do
    it 'gives registrant with correct info' do 
      expect(@registrant_1.name).to eq('Bruce')
      expect(@registrant_1.age).to eq(18)
      expect(@registrant_1.permit).to eq(true)
      expect(@registrant_1.license_data).to eq({ written: false, license: false, renewed: false })
    end
  end

  it 'has a name for first registrant 1' do 
    expect(@registrant_1.name).to eq('Bruce')
  end

  describe 'age' do 
    it 'gives the right age' do 
      expect(@registrant_1.name).to eq('Bruce')
    end
  end

  describe 'permit?' do 
    it 'shows true if registrant has a permit' do  
      expect(@registrant_1.permit?).to eq(true)
    end

    it 'shows if registrant doesnot have a permit' do 
      expect(@registrant_2.permit?).to eq(false)
    end
  end
  describe 'earn permit' do 
    it 'earns permit'do 
      @registrant_2.earn_permit
      expect(@registrant_2.permit?).to eq(true)
    end
  end

  it 'allows eligible registrants to take the written test' do
    expect(@facility_1.administer_written_test(@registrant_1)).to be true
    expect(@registrant_1.license_data[:written]).to be true
  end
end
  
