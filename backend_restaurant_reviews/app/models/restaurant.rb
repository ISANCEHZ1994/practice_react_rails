class Restaurant < ApplicationRecord
    has_many :reviews, :dependent => :destroy # DEPENDENT added because of our seed data was sending error 
    # previous error => ActiveRecord::InvalidForeignKey: SQLite3::ConstraintException: FOREIGN KEY constraint failed

    before_create :slugify    

    def slugify # Everytime we create a new Restaurant we want to slugify(make the name URL friendly) the name
        self.slugify = name.parameterize
        # parameterize will in fact covert a name ("Burger King") to something apporpreate("burger-king")
    end 
        # why slugify? ex: instead of having => localhost:3000/restaurants/4/BurgerKing 
        # we will get =>  burger-king in URL - making it user friendly!!

    def avg_score
        reviews.average(:score).round(2).to_f # NOTE: 2 for now!!
    end

end
