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
        puntaje = 0.0
        @nas = Nascore.all
        @nas.each do |n|
            if !params['check-'+n.id.to_s].nil?
                puntaje = puntaje + params['check-'+n.id.to_s].to_f
            end

        end
        
        @reg = Registro.new(rut: reg_params['rut'],fecha: reg_params['fecha'], puntaje:puntaje,turno: reg_params['turno'])
        if @reg.save
            redirect_to :action => "index"
        else
            render :new
        end
    end
    def edit
        @reg = Registro.find(params[:id])
    end
    def update
        @reg = Registro.find(params[:id])
        if @reg.update(reg_params)
          redirect_to :action => "admin"
        else
          render :edit
        end
    end
    def destroy
    registro = Registro.find(params[:id])
    registro.destroy
    redirect_to :action => "admin"
    end
    
    private
    def reg_params
        params.require(:registro).permit(:rut, :fecha, :puntaje, :turno)
    end
end
