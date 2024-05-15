<?php

namespace Src\Manager;
use PDO;
use PDOException;
class DatabaseManager
{

    private string $localhost;
    private string $username;
    private string $password;
    private string $database;
    private ?PDO $pdo = null;

    public function __construct(
        string $localhost = "localhost",
        string $username = "root",
        string $password = "root",
        string $database = "pressing"
    )
    {
        $this->localhost = $localhost;
        $this->username = $username;
        $this->password = $password;
        $this->database = $database;
    }

    private function connectToDatabase(): void
    {
        try {
            $this->pdo = new PDO("mysql:host={$this->localhost};dbname={$this->database}", $this->username, $this->password);
            $this->configPdo();
        } catch (PDOException $e) {
            echo('Connection failed: ' . $e->getMessage());
        }
    }

    public function getPdo(): PDO
    {
        if (!$this->pdo) {
            $this->connectToDatabase();
        }
        return $this->pdo;
    }

    private function configPdo(): void
    {
        if ($this->pdo) {
            $this->pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            $this->pdo->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
        }
    }
}

