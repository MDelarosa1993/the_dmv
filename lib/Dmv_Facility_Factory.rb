class DmvFacilityFactory 
  def colorado_facilities(co_dmv_office_locations)

      facilities = co_dmv_office_locations.map do |co_dmv_office_location|
      name = co_dmv_office_location[:dmv_office]
      address = "#{co_dmv_office_location[:address_li]}, #{co_dmv_office_location[:address__1]}, #{co_dmv_office_location[:city]}, #{co_dmv_office_location[:state]} #{co_dmv_office_location[:zip]}"
      phone = co_dmv_office_location[:phone]
      Facility.new({name: name, address: address, phone: phone})
    end
   facilities
  end

  def new_york_facilities(new_york_facilities)
      facilities = new_york_facilities.map do |new_york_facility|
      name = new_york_facility[:office_name]
      address = "#{new_york_facility[:street_address_line_1]}, #{new_york_facility[:city]}, #{new_york_facility[:state]}, #{new_york_facility[:zip_code]}"
      phone = if new_york_facility[:public_phone_number]
        new_york_facility[:public_phone_number]
      else
       "Not available"
      end
      Facility.new({name: name, address: address, phone: phone})  
    end
    facilities
  end

  def missouri_facilities(missouri_facilities)
    facilities = missouri_facilities.map do |new_york_facility|
    name = new_york_facility[:office_name]
    address = "#{[]}, #{[]}, #{[]}, #{[]}"
    phone = new_york_facility[:public_phone_number]
    Facility.new({name: name, address: address, phone: phone})  
  end
  facilities
end
end