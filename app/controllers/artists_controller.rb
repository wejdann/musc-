class ArtistsController < ApplicationController
  before_action :authenticate_user!, only: [:new , :show]  
  before_action :find_artist, except: [:index, :new, :create]  
    def index 
      @artists = Artist.all  
        end 
    def show
      if @artist.user != current_user
        flash[:notice] = 'Not allowed!'
        @songs = @artist.songs
        redirect_to artists_path
      end

    end 
    def new
        @artist = Artist.new
      end

      def create
        @artist = Artist.new(person_params)
        @artist.user = current_user
        if @artist.save
        redirect_to artists_path
      else
        render 'new'
    end 
      end

      def edit
        @artist = Artist.find(find_artist)
      end
      
      def update
        artist = Artist.find(find_artist)
        artist.update(params.require(:artist).permit(:name, :albums, :hometown, :img))
          
        redirect_to artist
      end

      def destroy
        @artist.delete
      
        redirect_to artists_path
      end
      private
    
    def person_params
      params.require(:artist).permit(:name, :albums, :hometown, :img)
    end

    def find_artist
      @artist = Artist.find(params[:id])
    end
    
end
