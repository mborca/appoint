<?php
/**
 * Helper class for database queries
 *
 * @author marian.borca
 */
class DB_Helper
{
    static public function EscapeQuery($query)
    {
        return str_replace(';', '', $query);
    }

    static public function Connection()
    {
        $mysqli = new mysqli(DB_SERVER, DB_USERNAME, DB_PASSWORD, DB_DATABASE);
        if (mysqli_connect_error())
            throw new Exception('Connect Error ('.mysqli_connect_errno().') '.mysqli_connect_error());
        return $mysqli;
    }
    
    static public function Execute($query, $query_type, $class=NULL)
    {
        $results = NULL;
        $mysqli = self::Connection();
        $query = self::EscapeQuery($query);
        $result = $mysqli->query($query);
        if(!$result)
            throw new Exception("ERROR ({$mysqli->errno}): {$mysqli->error}, QUERY: $query");
        switch ($query_type)
        {
            case QueryType::Reader:
                while ($row = $result->fetch_assoc())
                    $results[] = $row;
                break;
            case QueryType::Row:
                $results = $result->fetch_assoc();
                break;
            case QueryType::Scalar:
                $row = $result->fetch_row();
                $results = $row[0];
                break;
            case QueryType::NonQuery;
                $results = $result->num_rows;
                break;
            case QueryType::SingleObject:
                if(is_null($class))
                    throw new Exception("ERROR: Undefined class, cannot instantiate NULL class");
                $results = $result->fetch_object($class);
//                if($results->id == 0)
//                    $results = NULL;
                break;
            case QueryType::ObjectArray:
                if(is_null($class))
                    throw new Exception("ERROR: Undefined class, cannot instantiate NULL class");
                while ($row = $result->fetch_object($class))
                {
//                    if($row->id == 0)
//                        $row = NULL;
                    $results[] = $row;
                }
                break;
            default:
                throw new Exception("ERROR: Undefined query type: $query_type");
        }
        $result->close();
        $mysqli->close();
        return $results;
    }

    static public function ExecuteSingleObject($query, $class)
    {
        return self::Execute($query, QueryType::SingleObject, $class);
    }
    static public function ExecuteObjectArray($query, $class)
    {
        return self::Execute($query, QueryType::ObjectArray, $class);
    }
    static public function ExecuteMultiReader($query)
    {
        return self::Execute($query, QueryType::MultiReader, NULL);
    }
    static public function ExecuteReader($query)
    {
        return self::Execute($query, QueryType::Reader, NULL);
    }
    static public function ExecuteRow($query)
    {
        return self::Execute($query, QueryType::Row, NULL);
    }
    static public function ExecuteScalar($query)
    {
        return self::Execute($query, QueryType::Scalar, NULL);
    }
    static public function ExecuteNonQuery($query)
    {
        return self::Execute($query, QueryType::NonQuery, NULL);
    }
}

?>
