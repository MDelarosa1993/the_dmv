class DmvFacilityFactory 
  def create_facilities(co_dmv_office_locations)

      facilities = co_dmv_office_locations.map do |co_dmv_office_location|
      name = co_dmv_office_location[:dmv_office]
      address = "#{co_dmv_office_location[:address_li]}, #{co_dmv_office_location[:address__1]}, #{co_dmv_office_location[:city]}, #{co_dmv_office_location[:state]} #{co_dmv_office_location[:zip]}"
      phone = co_dmv_office_location[:phone]
      Facility.new({name: name, address: address, phone: phone})
    end
   facilities
  end
end