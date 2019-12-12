class Building
  attr_reader :units

  def initialize
    @units = []
    # @occupied_units = nil
  end

  def add_unit(apartment)
    # @units << apartment
    @units.push(apartment)
  end

  def average_rent
    return "No Units in this Building" if @units.empty?

    # total = 0
    # @units.each do |unit|
    #   total += unit.monthly_rent
    # end
    # total / @units.length.to_f

    # all_rents = @units.map do |unit|
    #   unit.monthly_rent
    # end
    #
    # all_rents.sum / @units.length.to_f
    #
    total = @units.sum do |unit|
      unit.monthly_rent
    end

    total / @units.length.to_f

    # @units.sum do |unit|
    #   unit.monthly_rent.to_f / @units.length
    # end
  end

  def renter_with_highest_rent
    expensivest_unit = occupied_units.max_by do |unit|
      unit.monthly_rent
    end

    expensivest_unit.renter
  end

  def annual_breakdown
    # annual_breakdown = {}
    #
    # occupied_units.each do |unit|
    #   annual_breakdown[unit.renter.name] = unit.monthly_rent * 12
    # end
    #
    # annual_breakdown

    occupied_units.reduce({}) do |annual_breakdown, unit|
      annual_breakdown[unit.renter.name] = unit.monthly_rent * 12
      annual_breakdown
    end
  end

  def occupied_units
    @units.find_all do |unit|
      !unit.renter.nil?
    end
  end
end
