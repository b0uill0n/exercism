class SpaceAge
  attr_reader :seconds

  EARTH_YEAR = 31557600

  def initialize(seconds)
    @seconds = seconds
    @planets = {
      on_earth: 1.0,
      on_mercury: 0.2408467,
      on_venus: 0.61519726,
      on_mars: 1.8808158,
      on_jupiter: 11.862615,
      on_saturn: 29.447498,
      on_uranus: 84.016846,
      on_neptune: 164.79132
    }
  end

    def method_missing(method)
      @planets.key?(method) ? @seconds / (EARTH_YEAR * @planets[method]) : super
    end
end
