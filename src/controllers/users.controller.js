import { getConnection, queries } from "../database";
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

//PUT###############################################################################################################################################################################################

//DELETE###############################################################################################################################################################################################

