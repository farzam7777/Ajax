class CommentsController < ApplicationController
  
  def index
  	@comments = Comment.all
  	@comment  = Comment.new
  end

  def create
  	@comment = Comment.create(comment_params)

  	respond_to do |format|
	  	if @comment.save
	  		format.html { redirect_to comments_path }
	  		format.js
		else
	  		format.html { render "index" }
	  		format.js
	  	end
	end  					
  end	

  def destroy
  	@comment = Comment.find(params[:id])
  	respond_to do |format|
	  	if @comment.destroy
	  		format.html { redirect_to comments_path }
	  		format.js
		else
	  		format.html { render "index" }
	  		format.js
	  	end
	end 
  end

  def edit
  	@comment = Comment.find(params[:id])
  	respond_to do |format|
  		format.js
	end
  end

  def update
  	@comment = Comment.find(params[:id])
  	
  	respond_to do |format|
  		if @comment.update(comment_params)
  			format.html { redirect_to comments_path }
  			format.js
  		else
  			format.html { "index" }
  			format.js
  		end		
  	end		
  end	

  def show
  end

  def comment_params 
  	params.require(:comment).permit(:body)
  end	

end
