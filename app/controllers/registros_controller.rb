class RegistrosController < ApplicationController
    # Formulario para crear un registro
    def registrar
        @nas = Nascore.all
    end
    # Ver registros
    def ver_registros
        @registros = Registro.all
    end
end
