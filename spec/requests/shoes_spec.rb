require 'rails_helper'

RSpec.describe "Shoes", type: :request do
  describe "GET /index" do 
    it "gets a list of shoes" do 
      Shoe.create(
        name: 'Air Jordan 1',
        age: 30,
        enjoys: 'Streetwear clothing and special occasions ;) ',
        image: 'https://live.staticflickr.com/5497/12606475325_03fb9d694d_b.jpg'
      )
      get '/shoes'

      shoe = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(shoe.length).to eq 1
    end
  end
  describe "POST/create" do 
    it "creates a pair of shoes" do 
      shoe_params = {
        shoe: {
          name: 'Air Jordan 1',
          age: 30,
          enjoys: 'Streetwear clothing and special occasions ;)',
          image: 'https://live.staticflickr.com/5497/12606475325_03fb9d694d_b.jpg'
        }
      }

        post '/shoes', params: shoe_params
        expect(response).to have_http_status(200)
        shoe=Shoe.first 
        expect(shoe.name).to eq 'Air Jordan 1'
        expect(shoe.enjoys).to eq 'Streetwear clothing and special occasions ;)'
        expect(shoe.image).to eq 'https://live.staticflickr.com/5497/12606475325_03fb9d694d_b.jpg'
    end
  end

  describe 'PUT/update' do 
    it 'updates a pair of shoes' do 
      shoe_params = {
          shoe: {
            name: 'Air Jordan 1',
            age: 30,
            enjoys: 'Streetwear clothing and special occasions ;)',
            image: 'https://live.staticflickr.com/5497/12606475325_03fb9d694d_b.jpg'
           }
      }
      post '/shoes', params: shoe_params
      shoe = Shoe.first
      p shoe 
      
      updated_params = {
        shoe: {
            name: 'Air Jordan 2',
            age: 40,
            enjoys: 'Streetwear clothing and special occasions ;)',
            image: 'https://live.staticflickr.com/5497/12606475325_03fb9d694d_b.jpg'
        }
      }
      patch "/shoes/#{shoe.id}", params: updated_params
      updated_shoe = Shoe.find(shoe.id)
      expect(response).to have_http_status(200)
      expect(updated_shoe.name).to eq 'Air Jordan 2'
      expect(updated_shoe.age).to eq 40
      # expect(shoe.enjoys).to eq 'Streetwear clothing and special occasions ;)'
      # expect(shoe.image).to eq 'https://live.staticflickr.com/5497/12606475325_03fb9d694d_b.jpg'
    end
  end

  describe 'DELETE/destroy' do 
    it 'deletes a pair of shoes' do 
      shoe_params = {
        shoe: {
            name: 'Air Jordan 1',
            age: 30,
            enjoys: 'Streetwear clothing and special occasions ;)',
            image: 'https://live.staticflickr.com/5497/12606475325_03fb9d694d_b.jpg'
        }
      }
     post '/shoes', params:shoe_params 
     shoe = Shoe.first 
     p shoe
    #  deleted_params = {
    #   shoe: {
    #       name: 'Air Jordan 1',
    #       age: 30,
    #       enjoys: 'Streetwear clothing and special occasions ;)',
    #       image: 'https://live.staticflickr.com/5497/12606475325_03fb9d694d_b.jpg'
    #   }
    # }
    delete "/shoes/#{shoe.id}"
    # deleted_shoe = Shoe.find(shoe.id)
    expect(response).to have_http_status(200)
    end
  end
end

# id 
# create 
# update 