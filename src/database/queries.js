import { updateEmailByID } from "../controllers/users.controller";

export const queries = {
    //GET###############################################################################################################################################################################################
    //User
    getLogin: "SELECT * FROM Usuario WHERE email = @email AND passwd = @passwd",

    //POST##############################################################################################################################################################################################
    //User
    addNewUser: "INSERT INTO Usuario (username, email, passwd) VALUES (@username, @email, @passwd)",
    
    //Datos_Persona
    addNewDatosPersona:"INSERT INTO Datos_Persona (nombre,apellido_p,apellido_m,foto,persona_2040,fecha_nacimiento,sexo,telefono,estatus_acomp,seguro_medico) VALUES (@nombre, @apellido_p, @apellido_m, @foto, @persona_2040, @fecha_nacimiento, @sexo, @telefono, @estatus_acomp, @seguro_medico)",
    
    //PUT###############################################################################################################################################################################################
    updateEmailByID: "UPDATE Usuario SET email = @email WHERE id_usr = @id_usr",
    //DELETE############################################################################################################################################################################################
    deleteUserByID: "DELETE FROM Usuario WHERE id_usr = @id_usr"
}