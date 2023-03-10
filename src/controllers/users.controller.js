import { getConnection, queries, sql } from "../database";
import { config } from "dotenv";



//GET###############################################################################################################################################################################################
export const getAllUsers = async (req, res) => {
    try {
        const pool = await getConnection();
        const result = await pool
            .request()
            .query(queries.getAllUsers);
        res.json(result.recordset);
    } catch (error) {
        res.status(500);
        res.send(error.message);
    }
};

export const getLogin = async (req, res) => {
    try {
        const pool = await getConnection();

        const result = await pool
            .request()
            .input("email", req.query.email)
            .input("passwd", req.query.passwd)
            .query(queries.getLogin);
        res.json(result.recordset);
    } catch (error) {
        res.status(500);
        res.send(error.message);
    }
};

//POST##############################################################################################################################################################################################
export const addNewUsuario = async (req, res) =>{
    const { username, email, passwd} = req.body;

    try {
        const pool = await getConnection();

        await pool
            .request()
            .input("username", sql.VarChar, username)
            .input("email", sql.VarChar, email)
            .input("passwd", sql.VarChar, passwd)
            .query(queries.addNewUser);

        res.json("Usuario has been registered");
    } catch (error) {
        res.status(500);
        res.send(error.message);
    }
};

// var moment = require('moment-timezone');
//     var a = moment.tz("America/Monterrey");
export const addNewDatosPersona = async (req, res) => {
    const { nombre, apellido_p, apellido_m, foto, persona_2040, fecha_nacimiento, sexo, telefono, estatus_acomp, seguro_medico } = req.body;

    // validating (NO necesario)
    // if (nombre_usr == null || email == null) {
    //     return res.status(400).json({ msg: "Bad Request. Please fill all fields" });
    // }
    
    if(foto == null) foto = 0;
    if(sexo == null) foto = 0;

    try {
        const pool = await getConnection();

        await pool
            .request()
            .input("nombre", sql.VarChar, nombre)
            .input("apellido_p", sql.VarChar, apellido_p)
            .input("apellido_m", sql.VarChar, apellido_m)
            .input("foto", sql.Bit, foto)
            .input("persona_2040", sql.VarChar, persona_2040)
            .input("fecha_nacimiento", sql.DateTime, fecha_nacimiento)
            .input("sexo", sql.Bit, sexo)
            .input("telefono", sql.VarChar, telefono)
            .input("estatus_acomp", sql.VarChar, estatus_acomp)
            .input("seguro_medico", sql.VarChar, seguro_medico)
            .query(queries.addNewDatosPersona);

        res.json("Datos Persona has been registered");
    } catch (error) {
        res.status(500);
        res.send(error.message);
    }
};

//PUT###############################################################################################################################################################################################

//DELETE###############################################################################################################################################################################################

