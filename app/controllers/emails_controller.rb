class EmailsController < ApplicationController

  def index
  	@emails = Email.all
  end

  def show
  	update
  	@email = Email.find(params[:id])
  	respond_to do |format|
  		format.js { }
      format.html { redirect_to root_path }
       
   	end
  end

  def new
  end

  def create
  	@email = Email.new(email_params)

  	if @email.save
      respond_to do |format|
      flash[:success] = "Un nouveau mail a été créé !"
       format.html { redirect_to root_path }
       format.js { }
      end
    else
      redirect_to root_path
      flash[:notice] = "Please try again"
    end
  end
end

  def destroy
  	@email = Email.find(params[:id])
  	@email.destroy
  	flash[:notice] = "L'email a bien été supprimé."
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
  	end
	end

	def update
		@email = Email.find(params[:id])
		@email.update(read: true)
		
		respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end
  end

private

def email_params
  params.permit(:object, :body, :read)
end
