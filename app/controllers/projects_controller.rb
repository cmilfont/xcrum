#require 'json/pure'

class ProjectsController < ApplicationController
  # GET /projects
  # GET /projects.xml
  def index
    #ActiveRecord::Base.include_root_in_json = false
    @projects = Project.find(:all, :offset => params[:start], :limit => params[:limit])
    @dto = DataTransferObject.new
    @dto.total = Project.count
    @dto.results = @projects.to_a

    respond_to do |format|
      format.json { render :layout => false,
                           :json => @dto.to_json }
      format.html # index.html.erb
      format.xml  { render :xml => @projects }
      #format.ext_json { render :json => @projects.to_ext_json(:class => :project, :count => Project.count) }
    end
  end

  # GET /projects/1
  # GET /projects/1.xml
  def show
    @project = Project.find(params[:id])

    respond_to do |format|
      format.json { render :json => @project.to_json }
      format.html # show.html.erb
      format.xml  { render :xml => @project }
    end
  end

  # GET /projects/new
  # GET /projects/new.xml
  def new
    @project = Project.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @project }
    end
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
  end

  # POST /projects
  # POST /projects.xml
  def create
    #ActiveRecord::Base.include_root_in_json = false
    #@p = ActiveSupport::JSON.decode(params[:project])
    #@t = request.env['RAW_POST_DATA']
    #@json = params[:project]
    #@p = JSON.parse(@t, opts = {
    #  :max_nesting => 19,
    #  :allow_nan => true
    #})

    items = params[:project].delete("items")
    @project = Project.new(params[:project])

    if items
       items.each do |item|
         @project.items << Item.new(item)
            #@project.items.create(item)
       end
    end

    respond_to do |format|

      if @project.save
        flash[:notice] = 'Project was successfully created.'
        format.json { render :json => @project.to_json, :status => :created, :location => @project  }
        format.html { redirect_to(@project) }
        format.xml  { render :xml => @project, :status => :created, :location => @project }
      else
        format.json { render :json => @project.errors, :status => :unprocessable_entity }
        format.html { render :action => "new" }
        format.xml  { render :xml => @project.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /projects/1
  # PUT /projects/1.xml
  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        flash[:notice] = 'Project was successfully updated.'
        format.html { redirect_to(@project) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @project.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.xml
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.json { head :ok }
      format.html { redirect_to(projects_url) }
      format.xml  { head :ok }
    end
  end
end
