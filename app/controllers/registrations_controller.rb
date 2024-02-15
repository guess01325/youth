class RegistrationsController < ApplicationController
    before_action :set_registration, only: %i[ destroy ]


    def index
        @registrations = Registration.all

        render json: @registrations
    end
    
    # PATCH/PUT /registrations/1
    def create 
        @registration = Registration.new(registration_params)

        if @registration.save
            render json: @registration, status: :created, location: @registration
        else
            render json: @registration.errors, status:
            :unprocessable_entity
        end

    end

    def destroy 
        @registration.destroy
    end


    private

    def registration_params
        params.require(:registration).permit(:first_name, :last_name, :email, :how_often)
    end

    def set_registration
        @registration = Registration.find(params[:id])
    end

end
