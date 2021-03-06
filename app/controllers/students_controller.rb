class StudentsController < ApplicationController
  before_action :set_student, only: %i[show edit update destroy]

  def index
    @search = Student.ransack(params[:q])
    @students = @search.result(distinct: true).paginate(page: params[:page], per_page: 15)
    @students_count = Student.count
  end

  def show; end

  def new
    @student = Student.new
  end

  def edit; end

  def create
    @student = Student.new(student_params)
    if @student.valid?
      @student.save
      redirect_to @student, notice: 'Студент успешно добавлен'
    else
      render :new
    end
  end

  def update
    if @student.update(student_params)
      redirect_to @student, notice: 'Студент успешно обновлён'
    else
      render :edit
    end
  end

  def destroy
    @student.destroy
    redirect_to students_path, notice: 'Студент успешно удалён'
  end

  private

  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:first_name, :middle_name, :last_name, :gender, :signal)
  end
end
