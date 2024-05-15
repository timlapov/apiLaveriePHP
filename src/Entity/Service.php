<?php
namespace Src\Entity;
use JsonSerializable;

class Service implements JsonSerializable {
    private int $service_id;
    private string $service_name;
    private string $service_description;
    private float $service_price;

    public function __construct(int $service_id, string $service_name, string $service_description, float $service_price) {
        $this->service_id = $service_id;
        $this->service_name = $service_name;
        $this->service_description = $service_description;
        $this->service_price = $service_price;
    }


    public function jsonSerialize(): mixed
    {
        // TODO: Implement jsonSerialize() method.
        return [
            'service_id' => $this->service_id,
            'service_name' => $this->service_name,
            'service_description' => $this->service_description,
            'service_price' => $this->service_price
        ]
    }
}