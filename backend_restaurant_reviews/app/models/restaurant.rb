class Restaurant < ApplicationRecord
    has_many :reviews, :dependent => :destroy # DEPENDENT added because of our seed data was sending error 
    # previous error => ActiveRecord::InvalidForeignKey: SQLite3::ConstraintException: FOREIGN KEY constraint failed

    # before_create :slugify    

    # def slugify # Everytime we create a new Restaurant we want to slugify(make the name URL friendly) the name
    #     self.slugify = name.parameterize
    #     # parameterize will in fact covert a name ("Burger King") to something apporpreate("burger-king")
    # end 

    before_create -> (restaurant) do
        restaurant.slug = restaurant.name.parameterize
      end
        # why slugify? ex: instead of having => localhost:3000/restaurants/4/BurgerKing 
        # we will get =>  burger-king in URL - making it user friendly!!

    def avg_score
        return 0 unless reviews.size.positive?

        avg = reviews.average(:score).to_f.round(2) * 100
        update_column(:average_score, avg)
    end
 
    #NOTE: kept throwing an ERROR so I copied from the source for this model - everthing seems to work as planned!
    # https://github.com/zayneio/open-flights/blob/master/app/models/airline.rb
    
end
