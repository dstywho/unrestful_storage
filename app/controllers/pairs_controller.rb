class PairsController < ApplicationController
  #UNREST Begins

  def grow_a
    append
  end
    
  def append
    params[:pair] ||= {}
    params[:pair][:key] ||= params[:key]
    params[:pair][:value] ||= params[:key]
    create
  end

  def find_a
    query
  end

  def query
    params[:id] ||= Pair.find_by_key(params[:key]).id
    @pair = Pair.find(params[:id])
    show
  end

  def modify
    params[:id] ||= Pair.find_by_key(params[:pair][:key]).id
    update
  end

  def append_or_modify
    params[:id] ||= Pair.find_by_key(params[:pair][:key]).id if params[:pair]
    if params[:id]
      modify
    else
      append
    end
  end

  #REST STARTS HERE

  def index
    @pairs = Pair.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pairs }
    end
  end

  # GET /pairs/1
  # GET /pairs/1.xml
  def show
    params[:id] ||= Pair.find_by_key(params[:key]).id
    @pair = Pair.find(params[:id])

    respond_to do |format|
      format.html { render :template => 'pairs/show' }
      format.xml  { render :xml => @pair }
      format.json { render :json => @pair }
    end
  end

  # GET /pairs/new
  # GET /pairs/new.xml
  def new
    @pair = Pair.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @pair }
    end
  end

  # GET /pairs/1/edit
  def edit
    @pair = Pair.find(params[:id])
  end

  # POST /pairs
  # POST /pairs.xml
  def create
    @pair = Pair.new(params[:pair])

    respond_to do |format|
      if @pair.save
        format.html { redirect_to(@pair, :notice => 'Pair was successfully created.') }
        format.xml  { render :xml => @pair, :status => :created, :location => @pair }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @pair.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pairs/1
  # PUT /pairs/1.xml
  def update
    @pair = Pair.find(params[:id])

    respond_to do |format|
      if @pair.update_attributes(params[:pair])
        format.html { redirect_to(@pair, :notice => 'Pair was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @pair.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pairs/1
  # DELETE /pairs/1.xml
  def destroy
    @pair = Pair.find(params[:id])
    @pair.destroy

    respond_to do |format|
      format.html { redirect_to(pairs_url) }
      format.xml  { head :ok }
    end
  end
end
