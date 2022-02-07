class RootController < ApplicationController



    # Functions

    def index
        puts "-----------------------"
        @posts = Post.all

        render "index"
        end
    

    def about
        puts "-----------------------"
        render "about"
        end
    
    def contact
        # How to redirect in ruby on rails
        # redirect_to('/about')
       puts "-----------------------"
       render "contact"
    end
    
    # Api controller
    def api
        @response = {
            :status => 200,
            :message => "Hello Trainy"
        }
        render json: @response
    end

    # Query params
    def user
    # selected params
       render json: params[:id]

    # all params
        #  render json: params
    end
    
    # Add task api
    def add
        @posts = Post.new
        @posts.title = params[:title]
        @posts.description = params[:description]
        @posts.save

        puts "-----------------------"
        @response = {
            :status => 200,
            :message => "Data is saved successfully.."
        }

        # Access data
        @posts = Post.all

        redirect_to('/')
        # render json: @response
        # render current page
        # render "index"
    end

    # Delete task api
    def deleteTask
        @posts = Post.find(params[:id])
        @posts.destroy
        @posts = Post.all

        puts "-----------------------"
        @response = {
            :status => 200,
            :message => "Task is deleted successfully.."
        }
        redirect_to('/')
        # render "index"
            
    end

    # update task api
    def update
        
        @posts = Post.find(params[:id])
        @id = @posts.id
        @title = @posts.title
        @description = @posts.description
        
        # redirect_to('/update')
        render "update"
            
    end

    # update task api
    def updateForm
        @posts = Post.find(params[:id])
        @posts.title = params[:title]
        @posts.description = params[:description]
        @posts.save
        @posts = Post.all
        redirect_to('/')

            
    end

        # Search task api
    def search
        @query = params[:query]

        @posts = Post.where("posts.title LIKE ?",["%#{@query}%"])
        render "index"


    end
    
    
end
