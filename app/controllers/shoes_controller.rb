class ShoesController < ApplicationController
    def index 
        shoes = Shoe.all 
        render json:shoes
    end

    def show
    end

    def create
        shoe = Shoe.create(shoe_params)
        render json: shoe
    end

    def update 
        shoe = Shoe.find(params[:id])
        shoe.update(shoe_params)
        render json: shoe
    end

    def destroy
        shoe = Shoe.find(params[:id])
        shoe.destroy
        render json: shoe
    end
    private
    def shoe_params 
    params.require(:shoe).permit(:name, :age, :enjoys, :image)
    end
end
