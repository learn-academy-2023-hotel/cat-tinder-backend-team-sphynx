shoes = [
    {
        name: 'Air Jordan 1',
        age: 30,
        enjoys: 'Streetwear clothing and special occasions ;) ',
        image: 'https://live.staticflickr.com/5497/12606475325_03fb9d694d_b.jpg'
    },
    {
        name: 'Air Force 1',
        age: 2,
        enjoys: 'Casual clothing and date nights',
        image: 'https://images.unsplash.com/photo-1614689540269-7f9315660d59?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fGFpciUyMGZvcmNlJTIwMXxlbnwwfHwwfHx8MA%3D%3D'
    },
    {
        name: 'Kobe 6',
        age: 31,
        enjoys: 'Basketball and breaking ankles!',
        image: 'https://live.staticflickr.com/5229/5612136011_9137f234c0.jpg'
    }
]

shoes.each do |shoe|
    Shoe.create shoe
    puts "Show our #{shoe}"
end