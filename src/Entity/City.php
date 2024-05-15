<?php

namespace Src\Entity;
use JsonSerializable;
class City implements JsonSerializable {
    private int $city_id;
    private string $city_name;
    private int $id_country;
    public function __construct(int $city_id, string $city_name, int $id_country) {
    $this->city_id = $city_id;
    $this->city_name = $city_name;
    $this->id_country = $id_country;
    }
    public function jsonSerialize(): mixed
    {
        // TODO: Implement jsonSerialize() method.
        return [
            'city_id' => $this->city_id,
            'city_name' => $this->city_name,
            'id_country' => $this->id_country
        ];
    }
}