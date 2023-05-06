class HomeController < ApplicationController

  def signup
    user = User.new(user_params)

    if user.save
      render json: user, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end
  def student_list
    students = Student.all
    render json: {students: students}
  end

  def student_name_age
    students = Student.select(:id, :name, :age)
    render json: {students: students}
  end

  def student_sex_city
    students = Student.select(:id, :sex, :city)
    render json: {students: students}
  end
  def login
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      render json: { message: "Logged in successfully." }
    else
      render json: { message: "Invalid email or password." }, status: :unprocessable_entity
    end
  end
  
  def logout
    session[:user_id] = nil
    render json: { message: "Logged out successfully." }
  end

  def add_student
    student = Student.new(student_params)

    if student.save
      render json: student, status: :created
    else
      render json: { errors: student.errors.full_messages }, status: :unprocessable_entity
    end
    
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end 

  def student_params
    params.permit(:name, :age, :sex, :city)
  end 


end
