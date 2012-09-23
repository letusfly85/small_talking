class RsStoriesController < ApplicationController
  # GET /rs_stories
  # GET /rs_stories.json
  def index
    @rs_stories = RsStory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @rs_stories }
    end
  end

  # GET /rs_stories/1
  # GET /rs_stories/1.json
  def show
    @rs_story = RsStory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @rs_story }
    end
  end

  # GET /rs_stories/new
  # GET /rs_stories/new.json
  def new
    @rs_story = RsStory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @rs_story }
    end
  end

  # GET /rs_stories/1/edit
  def edit
    @rs_story = RsStory.find(params[:id])
  end

  # POST /rs_stories
  # POST /rs_stories.json
  def create
    @rs_story = RsStory.new(params[:rs_story])

    respond_to do |format|
      if @rs_story.save
        format.html { redirect_to @rs_story, notice: 'Rs story was successfully created.' }
        format.json { render json: @rs_story, status: :created, location: @rs_story }
      else
        format.html { render action: "new" }
        format.json { render json: @rs_story.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /rs_stories/1
  # PUT /rs_stories/1.json
  def update
    @rs_story = RsStory.find(params[:id])

    respond_to do |format|
      if @rs_story.update_attributes(params[:rs_story])
        format.html { redirect_to @rs_story, notice: 'Rs story was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @rs_story.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rs_stories/1
  # DELETE /rs_stories/1.json
  def destroy
    @rs_story = RsStory.find(params[:id])
    @rs_story.destroy

    respond_to do |format|
      format.html { redirect_to rs_stories_url }
      format.json { head :no_content }
    end
  end
end
