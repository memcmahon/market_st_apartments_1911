class Apartment
  attr_reader :number,
              :monthly_rent,
              :bedrooms,
              :bathrooms,
              :renter

  def initialize(apartment_params)
    @number = apartment_params[:number]
    @monthly_rent = apartment_params[:monthly_rent]
    @bedrooms = apartment_params[:bedrooms]
    @bathrooms = apartment_params[:bathrooms]
  end

  def add_renter(renter)
    @renter = renter
  end
end
