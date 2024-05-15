<?php
namespace Src\Manager;
use Src\Entity\City;
class CityManager extends DatabaseManager {
    public function findAll()
    {
        $query = $this->getPdo()->prepare("SELECT * FROM city");
        $query->execute([]);

        $results = $query->fetchAll();
        $cities = [];

        foreach ($results as $result) {
            $cities[] = City::fromArray($result);
        }
        return $cities;
    }

    public function findById(int $id)
    {

        $query = $this->getPdo()->prepare("SELECT * FROM city WHERE id = :id");
        $query->execute([":id" => $id]);

        //Convertir le resultat de la requete en Objet
        return City::fromArray($query->fetch());
    }

    public function addByName(string $city_name, int $id_country): bool
    {
        try {
            $query = $this->getPdo()->prepare("INSERT INTO city (name, id_country) VALUES (:city_name, :id_country)");
            $result = $query->execute([
                ":city_name" => $city_name,
                ":id_country" => $id_country
            ]);
            return $result;
        } catch (\PDOException $e) {
            error_log("Error inserting city: " . $e->getMessage());
            return false;
        }
    }

    public function edit(City $city)
    {

    }

    public function delete(int $id)
    {

    }
}