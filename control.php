<?php
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $accion = $_POST['accion'];

    // Aquí se enviará el comando al ESP32
    // Puedes usar solicitudes HTTP o guardar el estado en la base de datos
    $mensaje = "";
    switch ($accion) {
        case 'bomba_on':
            $mensaje = "Encendiendo bomba de agua...";
            break;
        case 'bomba_off':
            $mensaje = "Apagando bomba de agua...";
            break;
        case 'valvula_on':
            $mensaje = "Activando electroválvulas...";
            break;
        case 'valvula_off':
            $mensaje = "Desactivando electroválvulas...";
            break;
    }

    // Ejemplo para registrar en la base de datos
    include('conexion.php');
    $sql = "INSERT INTO control_log (accion, fecha) VALUES ('$mensaje', NOW())";
    $conn->query($sql);

    echo "<script>alert('$mensaje'); window.location.href='dashboard.html';</script>";
}
?>
