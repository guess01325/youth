class StudentsController < ApplicationController
    before_action :set_student, only: %i[ show update destroy ]
  before_action :authorize_request, only: %i[index show create update destroy]
  before_action :set_event, only: %i[ index create ]
  # before_action :set_volunteer, only: %i[index create]
  

  # GET /students
  def index
    @students = Student.where(event: @event).where(user: @current_user)

    render json: @students
  end

  # GET /students/1
  def show
    render json: @student
  end

  # POST /students
  def create
    @student = Student.new(student_params)
    @student.user = @current_user
    @student.event = @event
    


    if @student.save
      render json: @student, status: :created, location: @student
    else
      render json: @student.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /students/1
  def update
    if @student.update(student_params)
      render json: @student
    else
      render json: @student.errors, status: :unprocessable_entity
    end
  end

  # DELETE /students/1
  def destroy
    @student.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_volunteer
    #   @volunteer = Volunteer.find(params[:volunteer_id])
    # end
      def set_event
        @event = Event.find(params[:event_id])
      end
    def set_student
      @student = Student.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def student_params
      params.require(:student).permit(:name, :address, :contact)
    end
end
