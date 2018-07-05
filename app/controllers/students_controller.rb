class StudentsController < ApplicationController
  
  def index
    @students = Student.search(params[:search])
  end
  
  def new
    @student = Student.new
  end
  
  def show
    @student = Student.find(params[:id])
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to @student
    else
      render 'new'
    end
  end

  def edit
    @student = Student.find(params[:id])
  end
  
  def update 
    @student = Student.update(student_params)
    if @student.save 
      redirect_to @student 
    else 
      render "edit"
    end 
  end


  private 
  
  def student_params
    params.require(:student).permit(:student, :name, :birthday, :hometown, :search)
  end
end
