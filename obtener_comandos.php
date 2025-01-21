<?php
include('conexion.php');

$sql = "SELECT accion FROM control_log ORDER BY fecha DESC LIMIT 1";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    echo $row['accion'];
} else {
    echo "sin_comandos";
}
?>
