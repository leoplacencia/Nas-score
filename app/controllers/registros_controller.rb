class RegistrosController < ApplicationController
    # Formulario para crear un registro
    def index
        @reg = Registro.all
    end
    def admin
        @reg = Registro.all
    end
    def new
        @reg = Registro.new
        @nas = Nascore.all
    end
    def create
        s
        count = nas_params['cod']
        if Nascore.where("cod = "+count ).length > 0
            tipo = 'multiple'
        else
            tipo = 'simple'
        end
        @nas = Nascore.new(cod: nas_params['cod'],description: nas_params['description'],score: nas_params['score'],tipo: tipo)
        
        if @nas.save
            redirect_to :action => "index"
        else
            render :new
        end
    end
    def edit
        @nas = Nascore.find(params[:id])
        @nascores = Nascore.select(:cod).distinct
        if Nascore.maximum('cod').nil?
            @max = 1
        else
            @max = 1 + Nascore.maximum('cod')
        end
    end
    def update
        @nas = Nascore.find(params[:id])
        count = nas_params['cod']
        if Nascore.where("cod = "+count+" and id !="+params[:id]  ).length > 0
            tipo = 'multiple'
        else 
            tipo = 'simple'
        end
        if @nas.update(cod: nas_params['cod'],description: nas_params['description'],score: nas_params['score'],tipo: tipo)
          redirect_to :action => "index"
        else
          render :edit
        end
    end
    def destroy
    registro = Registro.find(params[:id])
    registro.destroy
    redirect_to :action => "index"
    end
    
    private
    def reg_params
        
        params.require(:nascore).permit(:cod, :description, :score, :tipo)
    end
end
