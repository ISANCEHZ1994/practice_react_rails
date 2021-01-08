# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).


Restaurant.destroy_all #Just in case we get doubles of something!
Review.destroy_all

# NOTE: this was my old way of writing seeds - I want to improve so I will do something different!
# chickfila = Restaurant.create({
#     name: "Chick-Fil-A",
#     image_url: "https://www.chick-fil-a.com/-/media/images/cfacom/default-images/chick-fil-a-logo-vector.ashx"
# })

# whataburger = Restaurant.create({
#     name: "Whataburger",
#     image_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/9/94/Whataburger_logo.svg/1200px-Whataburger_logo.svg.png"
# })

# mcdonalds = Restaurant.create({
#     name: "McDonld's",
#     image_url: "https://blog.logomyway.com/wp-content/uploads/2017/01/mcdonalds-logo-1.jpg"
# })

# review1 = Review.create({
#     title: "Absolutly Perfect!",
#     description: "It was my first time trying Chick-Fil-a and I loved everything about it!",
#     score: 5,
#     restaurant: chickfila.id
# })

restaurants = Restaurant.create([
    {
        name: "Chick-Fil-A",
        image_url: "https://www.chick-fil-a.com/-/media/images/cfacom/default-images/chick-fil-a-logo-vector.ashx" 
    },
    {
        name: "Whataburger",
        image_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/9/94/Whataburger_logo.svg/1200px-Whataburger_logo.svg.png"
    },
    {
        name: "McDonald's",
        image_url: "https://blog.logomyway.com/wp-content/uploads/2017/01/mcdonalds-logo-1.jpg"
    }
]);

reviews = Review.create([
    {
        title: "Absolutly Perfect!",
        description: "It was my first time trying Chick-Fil-a and I loved everything about it!",
        score: 5,
        restaurant: restaurants.first # I believe that it should get ChickFila
    },
    {
        title: "Bad Restaurant",
        description: "Not a good time",
        score: 1,
        restaurant: restaurants.first
    },
    {
        title: "Not Bad",
        description: "Pretty ok",
        score: 3,
        restaurant: restaurants.first
    },
    {
        title: "SUCKS",
        description: "GARBAGE!!!",
        score: 1,
        restaurant: restaurants.third
    }
]);

puts "we gots data!";