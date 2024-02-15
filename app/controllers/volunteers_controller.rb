class VolunteersController < ApplicationController
    before_action :set_volunteer, only: %i[show update destroy]
    before_action :authorize_request, only: %i[ index show create update destroy]  
    before_action :set_event, only: [:index, :create]
    
    # GET events/event_id/volunteers
    def index
      @volunteers = Volunteer.where(event: @event)
      .where(user: @current_user)
      render json: @volunteers
     
    end
  
    # GET /volunteers/1
    def show
     
      
      render json: @volunteer
  
     
    end
  
    # POST /volunteers
    def create
      @volunteer = Volunteer.new(volunteer_params)
      @volunteer.user = @current_user
      @volunteer.event = @event
  
      if @volunteer.save
        render json: @volunteer, status: :created, location: @volunteer
      else
        render json: @volunteer.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /volunteers/1
    def update
      if @volunteer.update(volunteer_params)
        render json: @volunteer
      else
        render json: @volunteer.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /volunteers/1
    def destroy
      @volunteer.destroy
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_event
        @event = Event.find(params[:event_id])
      end
      
      def set_volunteer
        @volunteer = Volunteer.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def volunteer_params
        params.require(:volunteer).permit(:first_name, :last_name, :email, :message)
      end
end
