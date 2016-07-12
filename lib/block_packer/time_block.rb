class TimeBlock
  attr_accessor :lat, :lng

  def initialize(lat:, lng:)
    self.lat = lat
    self.lng = lng
  end

  def -(other)
    (lat - other.lat)**2 + (lng - other.lng)**2
  end

  def inspect
    "lat: #{lat.round(2)}, lng: #{lng.round(2)}"
  end
end
