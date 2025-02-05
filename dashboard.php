<?php
session_start();
if (!isset($_SESSION['usuario'])) {
    header("Location: index.html");
    exit();
}

// Conexión a la base de datos
include('conexion.php');

// Consulta para obtener los datos del sensor
$sql = "SELECT * FROM datos_sensor ORDER BY fecha DESC LIMIT 10";
$result = $conn->query($sql);
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Sistema de Fertirrigación</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="estilos.css">
    <script>
        // Función para imprimir la página
        function imprimirDatos() {
            window.print();
        }
    </script>
</head>
<body>
    <div class="container mt-4">
        <!-- Encabezado -->
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2 class="text-primary">Dashboard - Sistema de Fertirrigación</h2>
            <a href="logout.php" class="btn btn-danger">Cerrar Sesión</a>
        </div>

        <!-- Datos del Sensor -->
        <div class="card mb-4">
            <div class="card-header bg-info text-white">Datos del Sensor NPK</div>
            <div class="card-body">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Fecha</th>
                            <th>Nitrógeno (N)</th>
                            <th>Fósforo (P)</th>
                            <th>Potasio (K)</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php while ($row = $result->fetch_assoc()) { ?>
                            <tr>
                                <td><?php echo $row['fecha']; ?></td>
                                <td><?php echo $row['nitrógeno']; ?></td>
                                <td><?php echo $row['fósforo']; ?></td>
                                <td><?php echo $row['potasio']; ?></td>
                            </tr>
                        <?php } ?>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Botones de Control -->
        <div class="card mb-4">
            <div class="card-header bg-success text-white">Control del Sistema</div>
            <div class="card-body text-center">
                <form action="control.php" method="POST">
                    <button type="submit" name="accion" value="bomba_on" class="btn btn-success m-2">Encender Bomba</button>
                    <button type="submit" name="accion" value="bomba_off" class="btn btn-danger m-2">Apagar Bomba</button>
                    <button type="submit" name="accion" value="valvula_on" class="btn btn-success m-2">Activar Electroválvulas</button>
                    <button type="submit" name="accion" value="valvula_off" class="btn btn-danger m-2">Desactivar Electroválvulas</button>
                </form>
            </div>
        </div>

        <!-- Botón para Imprimir -->
        <div class="text-center">
            <button onclick="imprimirDatos()" class="btn btn-primary">Imprimir Datos</button>
        </div>
    </div>
</body>
</html>
