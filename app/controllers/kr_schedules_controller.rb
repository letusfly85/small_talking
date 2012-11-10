class KrSchedulesController < ApplicationController
  # GET /kr_schedules
  # GET /kr_schedules.json
  def index
    range = calendar_range
    
    start_date = (Date.today - range[0]).strftime("%Y%m%d")
    end_date   = (Date.today - range[1]).strftime("%Y%m%d")
    list = KrSchedule.all(:conditions => [" lesson_date between ? and ?" , start_date, end_date])
    @kr_schedules = {}
    cache = []
    if list.length > 0
      list.each do |entity|
        cache = @kr_schedule[entity.lesson_date]
        cache << entity
        @kr_schedules.merge!(entity.lesson_date => cache)
        cache = []
      end
    end

    render :action => "index", :kr_schedules => @kr_schedules
  end

  # GET /kr_schedules/1
  # GET /kr_schedules/1.json
  def show
    @kr_schedule = KrSchedule.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @kr_schedule }
    end
  end

  # GET /kr_schedules/new
  # GET /kr_schedules/new.json
  def new
    @kr_schedule = KrSchedule.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @kr_schedule }
    end
  end

  # GET /kr_schedules/1/edit
  def edit
    @kr_schedule = KrSchedule.find(params[:id])
  end

  # POST /kr_schedules
  # POST /kr_schedules.json
  def create
    @kr_schedule = KrSchedule.new(params[:kr_schedule])

    respond_to do |format|
      if @kr_schedule.save
        format.html { redirect_to @kr_schedule, notice: 'Kr schedule was successfully created.' }
        format.json { render json: @kr_schedule, status: :created, location: @kr_schedule }
      else
        format.html { render action: "new" }
        format.json { render json: @kr_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /kr_schedules/1
  # PUT /kr_schedules/1.json
  def update
    @kr_schedule = KrSchedule.find(params[:id])

    respond_to do |format|
      if @kr_schedule.update_attributes(params[:kr_schedule])
        format.html { redirect_to @kr_schedule, notice: 'Kr schedule was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @kr_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kr_schedules/1
  # DELETE /kr_schedules/1.json
  def destroy
    @kr_schedule = KrSchedule.find(params[:id])
    @kr_schedule.destroy

    respond_to do |format|
      format.html { redirect_to kr_schedules_url }
      format.json { head :no_content }
    end
  end
  
  def calendar_range
    
    n = 0
    10.times do |i|
      date_cd = (Date.today - i).strftime("%u")
      n = i
      puts date_cd, (Date.today - i)
      break if date_cd == "7"
    end
    
    return [n+7, n - 13]
  end
end
