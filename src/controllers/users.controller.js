import { getConnection, queries} from "../database";
import { config } from "dotenv";



//GET###############################################################################################################################################################################################
export const getAllUsers = async (req, res) => {
    try {
      const pool = await getConnection();
      const result = await pool.request().query(queries.getAllUsers);
      res.json(result.recordset);
    } catch (error) {
      res.status(500);
      res.send(error.message);
    }
  };

export const getUserByEmail = async (req, res) => {
try {
    const pool = await getConnection();

    const result = await pool
    .request()
    .input("email", req.query.email)
    .input("password", req.query.password)
    .query(queries.getUserByEmail);
    res.json(result.recordset);
} catch (error) {
    res.status(500);
    res.send(error.message);
}
};
//POST##############################################################################################################################################################################################

//PUT###############################################################################################################################################################################################

//DELETE###############################################################################################################################################################################################

