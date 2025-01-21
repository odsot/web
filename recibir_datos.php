<?php
include('conexion.php');

if (isset($_GET['n']) && isset($_GET['p']) && isset($_GET['k'])) {
    $n = $_GET['n'];
    $p = $_GET['p'];
    $k = $_GET['k'];

    $sql = "INSERT INTO datos_sensor (nitrógeno, fósforo, potasio) VALUES ('$n', '$p', '$k')";
    if ($conn->query($sql)) {
        echo "Datos guardados correctamente.";
    } else {
        echo "Error al guardar datos: " . $conn->error;
    }
} else {
    echo "Faltan datos.";
}
?>
