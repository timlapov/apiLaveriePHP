<?php
namespace src\Entity;
class User {
    private $connection;
    private $table_name = "users";
    public $user_id;
    public $user_name;
    public $user_surname;
    public $user_email;
    public $user_password;
    public $user_birthdate;
    public $id_city;
    public $user_addresse;
    public $id_role;
    public $id_gender;

    public function __construct($db) {
        $this->connection = $db;
    }

    // Create
    public function create() {
        $query = "INSERT INTO " . $this->table_name . " 
            SET
                user_name = :user_name,
                user_surname = :user_surname,
                user_email = :user_email,
                user_password = :user_password,
                user_birthdate = :user_birthdate,
                id_city = :id_city,
                user_addresse = :user_addresse,
                id_role = :id_role,
                id_gender = :id_gender";

        $stmt = $this->conn->prepare($query);

        // sanitize
        $this->user_name = htmlspecialchars(strip_tags($this->user_name));
        $this->user_surname = htmlspecialchars(strip_tags($this->user_surname));
        $this->user_email = htmlspecialchars(strip_tags($this->user_email));
        $this->user_password = htmlspecialchars(strip_tags($this->user_password));
        $this->user_birthdate = htmlspecialchars(strip_tags($this->user_birthdate));
        $this->id_city = htmlspecialchars(strip_tags($this->id_city));
        $this->user_addresse = htmlspecialchars(strip_tags($this->user_addresse));
        $this->id_role = htmlspecialchars(strip_tags($this->id_role));
        $this->id_gender = htmlspecialchars(strip_tags($this->id_gender));

        // bind values
        $stmt->bindParam(":user_name", $this->user_name);
        $stmt->bindParam(":user_surname", $this->user_surname);
        $stmt->bindParam(":user_email", $this->user_email);
        $stmt->bindParam(":user_password", $this->user_password);
        $stmt->bindParam(":user_birthdate", $this->user_birthdate);
        $stmt->bindParam(":id_city", $this->id_city);
        $stmt->bindParam(":user_addresse", $this->user_addresse);
        $stmt->bindParam(":id_role", $this->id_role);
        $stmt->bindParam(":id_gender", $this->id_gender);

        if($stmt->execute()) {
            return true;
        }
        return false;
    }

    // Read
    public function read() {
        $query = "SELECT * FROM " . $this->table_name;
        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        return $stmt;
    }

    // Update
    public function update() {
        $query = "UPDATE " . $this->table_name . " 
            SET
                user_name = :user_name,
                user_surname = :user_surname,
                user_email = :user_email,
                user_password = :user_password,
                user_birthdate = :user_birthdate,
                id_city = :id_city,
                user_addresse = :user_addresse,
                id_role = :id_role,
                id_gender = :id_gender
            WHERE
                user_id = :user_id";

        $stmt = $this->conn->prepare($query);

        // sanitize
        $this->user_name = htmlspecialchars(strip_tags($this->user_name));
        $this->user_surname = htmlspecialchars(strip_tags($this->user_surname));
        $this->user_email = htmlspecialchars(strip_tags($this->user_email));
        $this->user_password = htmlspecialchars(strip_tags($this->user_password));
        $this->user_birthdate = htmlspecialchars(strip_tags($this->user_birthdate));
        $this->id_city = htmlspecialchars(strip_tags($this->id_city));
        $this->user_addresse = htmlspecialchars(strip_tags($this->user_addresse));
        $this->id_role = htmlspecialchars(strip_tags($this->id_role));
        $this->id_gender = htmlspecialchars(strip_tags($this->id_gender));
        $this->user_id = htmlspecialchars(strip_tags($this->user_id));

        // bind values
        $stmt->bindParam(":user_name", $this->user_name);
        $stmt->bindParam(":user_surname", $this->user_surname);
        $stmt->bindParam(":user_email", $this->user_email);
        $stmt->bindParam(":user_password", $this->user_password);
        $stmt->bindParam(":user_birthdate", $this->user_birthdate);
        $stmt->bindParam(":id_city", $this->id_city);
        $stmt->bindParam(":user_addresse", $this->user_addresse);
        $stmt->bindParam(":id_role", $this->id_role);
        $stmt->bindParam(":id_gender", $this->id_gender);
        $stmt->bindParam(":user_id", $this->user_id);

        if($stmt->execute()) {
            return true;
        }
        return false;
    }

    // Delete
    public function delete() {
        $query = "DELETE FROM " . $this->table_name . " WHERE user_id = ?";
        $stmt = $this->conn->prepare($query);

        // sanitize
        $this->user_id = htmlspecialchars(strip_tags($this->user_id));

        // bind id of record to delete
        $stmt->bindParam(1, $this->user_id);

        if($stmt->execute()) {
            return true;
        }
        return false;
    }

    // Get single user data
    public function getUserById() {
        $query = "SELECT * FROM " . $this->table_name . " WHERE user_id = ? LIMIT 0,1";
        $stmt = $this->conn->prepare($query);

        // sanitize
        $this->user_id = htmlspecialchars(strip_tags($this->user_id));

        // bind id of record to retrieve
        $stmt->bindParam(1, $this->user_id);

        $stmt->execute();
        return $stmt;
    }
}
?>
