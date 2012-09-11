class ConclusionsController < ApplicationController
  # GET /conclusions
  # GET /conclusions.json
  def index
    @conclusions = Conclusion.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @conclusions }
    end
  end

  # GET /conclusions/1
  # GET /conclusions/1.json
  def show
    @conclusion = Conclusion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @conclusion }
    end
  end

  # GET /conclusions/new
  # GET /conclusions/new.json
  def new
    @conclusion = Conclusion.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @conclusion }
    end
  end

  # GET /conclusions/1/edit
  def edit
    @conclusion = Conclusion.find(params[:id])
  end

  # POST /conclusions
  # POST /conclusions.json
  def create
    @conclusion = Conclusion.new(params[:conclusion])

    respond_to do |format|
      if @conclusion.save
        format.html { redirect_to Rule.find(@conclusion.rule_id), notice: 'Conclusion was successfully created.' }
        format.json { render json: @conclusion, status: :created, location: @conclusion }
      else
        format.html { render action: "new" }
        format.json { render json: @conclusion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /conclusions/1
  # PUT /conclusions/1.json
  def update
    @conclusion = Conclusion.find(params[:id])

    respond_to do |format|
      if @conclusion.update_attributes(params[:conclusion])
        format.html { redirect_to @conclusion, notice: 'Conclusion was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @conclusion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /conclusions/1
  # DELETE /conclusions/1.json
  def destroy
    @conclusion = Conclusion.find(params[:id])
    @conclusion.destroy

    respond_to do |format|
      format.html { redirect_to conclusions_url }
      format.json { head :no_content }
    end
  end
end
