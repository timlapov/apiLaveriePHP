<?php


require_once 'src/Manager/DatabaseManager.php';
require_once 'vendor/autoload.php';

use Src\Entity\City;
use Src\Manager\DatabaseManager;
use Src\Manager\CityManager;
$password = "bove123";
$hashedPassword = password_hash($password, PASSWORD_DEFAULT);
echo $hashedPassword;

$db = new DatabaseManager();
try {
    // Получаем PDO соединение
    $pdo = $db->getPdo();

    // Вывод структуры объекта DatabaseManager
    dump($db);

    // Вывод структуры объекта PDO
    dump($pdo);

    // Выполняем тестовый запрос, например, получаем список таблиц
    $stmt = $pdo->query("SHOW TABLES");

    // Получаем результаты и выводим их
    $tables = $stmt->fetchAll();
    echo "Tables in the database: </br>";
    foreach ($tables as $table) {
        echo reset($table) . "</br>";
    }
    echo "DatabaseManager is working correctly!";
} catch (Exception $e) {
    echo "Error: " . $e->getMessage();
}

$query = $pdo->prepare("SELECT * FROM `city`");
$query->execute();
$cities = $query->fetchAll();
dump($cities);
$cityObject = [];
foreach ($cities as $city) {
    $cityObject[] = new City($city['city_id'], $city['city_name'], $city['id_country']);
}

dump($cityObject);
echo json_encode($cityObject);

//$query = $pdo->prepare("SHOW COLUMNS FROM `user`");
//$query->execute();
//$tableStructure = $query->fetchAll();
//
//echo "<pre>";
//foreach ($tableStructure as $column) {
//    echo "Field: " . $column['Field'] . "\n";
//    echo "Type: " . $column['Type'] . "\n";
//    echo "Null: " . $column['Null'] . "\n";
//    echo "Key: " . $column['Key'] . "\n";
//    echo "Default: " . $column['Default'] . "\n";
//    echo "Extra: " . $column['Extra'] . "\n";
//    echo "-------------------------\n";
//}
//echo "</pre>";

dump(\Src\Manager\CityManager->findAll())
?>
