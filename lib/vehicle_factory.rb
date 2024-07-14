class VehicleFactory 
  
  def create_vehicles(wa_ev_registrations)
    
    vehicles = wa_ev_registrations.map do |wa_ev_registration|
      make = wa_ev_registration[:make]
      model = wa_ev_registration[:model]
      vin = wa_ev_registration[:vin_1_10]
      year = wa_ev_registration[:model_year]
      engine = :ev
      
      Vehicle.new(make: make, model: model, vin: vin, year: year, engine: engine)
    end
    vehicles
  end
end