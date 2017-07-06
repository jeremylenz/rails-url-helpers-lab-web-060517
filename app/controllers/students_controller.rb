class StudentsController < ApplicationController
  before_action :set_student, only: :show

  def index
    @students = Student.all
  end

  def show

    @status = "This student is currently "
    @student = Student.find(params[:id])
    if @student.active == true
      @status << "active."
    else
      @status << "inactive."
    end

  end

  def activate
    @student = Student.find(params[:id])
    if @student.active == true
      @student.active = false
      @student.save
      @result =  "Student has been inactivated."
    else
      @student.active = true
      @student.save
      @result = "Student #{@student.to_s} activated."
    end
    redirect_to student_path
  end

  private

    def set_student
      @student = Student.find(params[:id])
    end
end
