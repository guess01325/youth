class MentoringsController < ApplicationController
    before_action :set_mentoring, only: %i[ destroy ]


    def index
        @mentorings = Mentoring.all

        render json: @mentorings
    end
    
    # PATCH/PUT /registrations/1
    def create 
        @mentoring = Mentoring.new(mentoring_params)

        if @mentoring.save
            render json: @mentoring, status: :created, location: @mentoring
        else
            render json: @mentoring.errors, status:
            :unprocessable_entity
        end

    end

    def destroy 
        @mentoring.destroy
    end

    def default_values
        
                @values =  ["In Person", "online", "yes", "no", "one OnOne","Creative Foundation", "Video Games and Life Skills", "Facebook", "Instagram", "Word Of Mouth", "Event Invite", "Website"]
           render json: @values
               

        
    end


    private

    def mentoring_params
        params.require(:mentoring).permit(:first_name, :last_name, :email, :school_district, :phone, :how_many, tags: [])
    end

    def set_mentoring
        @mentoring = Mentoring.find(params[:id])
    end
end
