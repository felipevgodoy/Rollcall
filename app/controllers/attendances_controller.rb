class AttendancesController < ApplicationController

  def index
    @attendances = Attendance.all
  end

  def show
    @attendance = Attendance.find_by(:id => params[:id])
  end

  def new
    @meeting = Meeting.all
    @student = Student.all
  end

  def create
    @attendance = Attendance.new
    @attendance.meeting_id = params[:meeting_id]
    @attendance.student_id = params[:student_id]
    
    if @attendance.save
      redirect_to attendances_url
    else
      render 'new'
    end
  end

  def edit
    @attendance = Attendance.find_by(:id => params[:id])
    @meeting = Meeting.all
    @student = Student.all
  end

  def update
    @attendance = Attendance.find_by(:id => params[:id])
    @attendance.meeting_id = params[:meeting_id]
    @attendance.student_id = params[:student_id]
    
    if @attendance.save
      redirect_to attendances_url
    else
      render 'new'
    end
  end

  def destroy
    @attendance = Attendance.find_by(:id => params[:id])
    @attendance.destroy
    redirect_to attendances_url
  end
end
