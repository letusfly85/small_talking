class MsUsersController < ApplicationController
  # GET /ms_users
  # GET /ms_users.json
  def index
    @ms_users = MsUser.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ms_users }
    end
  end

  # GET /ms_users/1
  # GET /ms_users/1.json
  def show
    @ms_user = MsUser.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ms_user }
    end
  end

  # GET /ms_users/new
  # GET /ms_users/new.json
  def new
    @ms_user = MsUser.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ms_user }
    end
  end

  # GET /ms_users/1/edit
  def edit
    @ms_user = MsUser.find(params[:id])
  end

  # POST /ms_users
  # POST /ms_users.json
  def create
    @ms_user = MsUser.new(params[:ms_user])

    respond_to do |format|
      if @ms_user.save
        format.html { redirect_to @ms_user, notice: 'Ms user was successfully created.' }
        format.json { render json: @ms_user, status: :created, location: @ms_user }
      else
        format.html { render action: "new" }
        format.json { render json: @ms_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ms_users/1
  # PUT /ms_users/1.json
  def update
    @ms_user = MsUser.find(params[:id])

    respond_to do |format|
      if @ms_user.update_attributes(params[:ms_user])
        format.html { redirect_to @ms_user, notice: 'Ms user was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ms_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ms_users/1
  # DELETE /ms_users/1.json
  def destroy
    @ms_user = MsUser.find(params[:id])
    @ms_user.destroy

    respond_to do |format|
      format.html { redirect_to ms_users_url }
      format.json { head :no_content }
    end
  end
end
