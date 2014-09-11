class Restaurant

  #TODO add relevant accessors if necessary
  attr_reader :average_rating, :city

  def initialize(city, name)
    #TODO: implement constructor with relevant instance variables
    @city = city
    @name = name
    @nb_ratings = 0
    @sum_ratings = 0
  end

  #TODO: implement #filter_by_city and #rate methods
  def rate(rating)
    @nb_ratings += 1
    @sum_ratings += rating
    @average_rating = @sum_ratings / @nb_ratings
  end

  def self.filter_by_city(restaurants, city)
    restaurants.select { |restaurant| restaurant.city == city }
  end
end
