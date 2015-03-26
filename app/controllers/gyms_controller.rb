class GymsController < ApplicationController
  def index
    @gyms = Gym.all
  end

  def new
    @gyms = Gym.new
  end

  def show
    @gym = Gym.find(params[:id])
  end

  def edit
    @gym = Gym.find(params[:id])
  end

  def update
    new_phone_number = params["gym"]["phone_number"]
    gym = Gym.find(params[:id])
    if gym.update_attributes(phone_number: new_phone_number)
      flash[:notice] = ["Gym updated."]
      redirect_to "/gyms/#{params[:id]}"
    else
      flash[:notice] = gym.errors.full_messages
      redirect_to "/gyms/#{params[:id]}/edit"
    end
  end


  def create
    name = params["gym"]["name"]
    street = params["gym"]["street"]
    state = params["gym"]["state"]
    zipcode = params["gym"]["zipcode"]
    phone = params["gym"]["phone_number"]
    gym = Gym.new(name: name, street: street, state: state, zipcode: zipcode, phone_number: phone)
    if gym.save
      flash[:notice] = ['Gym added.']
      redirect_to "/gyms"
    else
      flash[:notice] = gym.errors.full_messages
      redirect_to "/gyms/new"
    end
  end
end
