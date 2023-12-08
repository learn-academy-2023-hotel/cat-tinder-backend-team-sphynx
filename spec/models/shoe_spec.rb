require 'rails_helper'

#Validations testing
#name, age, enjoys, image

# shoe = Shoe.create(
#     name: 'Air Jordan 1',
#     age: 10,
#     enjoys: 'nice walks on the beach',
#     image: 'http://fakeimage.com'
# )

# So we create a test for each component. Then we go into our app/models/shoe.rb and validate upon good failure

RSpec.describe Shoe, type: :model do
  it "Verifies we have a name" do
    shoe = Shoe.create(
        age: 10,
        enjoys: 'nice walks on the beach',
        image: 'http://fakeimage.com'
    )
    expect(shoe.errors[:name]).to_not be_empty
  end
end

RSpec.describe Shoe, type: :model do
  it "verifies we have a age" do
    shoe = Shoe.create(
    name: 'Air Jordan 1',
    enjoys: 'nice walks on the beach',
    image: 'http://fakeimage.com'
  )

  expect(shoe.errors[:age]).to_not be_empty
  end
end

RSpec.describe Shoe, type: :model do
  it "validates a enjoys" do
    shoe = Shoe.create(
      name: 'Air Jordan 1',
      age: 10,
      image: 'http://fakeimage.com'
    )
  expect(shoe.errors[:enjoys]).to_not be_empty
  end
end

RSpec.describe Shoe, type: :model do
  it 'validates we have an image' do
    shoe = Shoe.create(
      name: 'Air Jordan 1',
      age: 10,
      enjoys: 'nice walks on the beach'
    )
    expect(shoe.errors[:image]).to_not be_empty
  end
end

# Since our enjoy is less than 10 characters, we want an error message. to not be empty just means theres an error present, when validations are entered it should pass a test b/c an error should occurs. 4 /= 10, if changed to niceeeeeeeeeeeeee it will show red b/c test passed. but no error message shows
RSpec.describe Shoe, type: :model do 
  it "verifies that you have 10 characters in your enjoys" do
    shoe = Shoe.create(
    name: 'Air Jordan 1',
    age: 10,
    enjoys: 'nice'
    )

    expect(shoe.errors[:enjoys]).to_not be_empty
  end
end

