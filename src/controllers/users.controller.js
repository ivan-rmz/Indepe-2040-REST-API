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
//POST##############################################################################################################################################################################################

//PUT###############################################################################################################################################################################################

//DELETE###############################################################################################################################################################################################
