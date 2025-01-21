<?php
// Iniciar conexión con la base de datos
include('conexion.php');

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Obtener datos del formulario
    $usuario = $_POST['usuario'];
    $password = $_POST['password'];

    // Validar si el usuario ya existe
    $sql_check = "SELECT * FROM usuarios WHERE usuario = ?";
    $stmt_check = $conn->prepare($sql_check);
    $stmt_check->bind_param("s", $usuario);
    $stmt_check->execute();
    $result = $stmt_check->get_result();

    if ($result->num_rows > 0) {
        echo "<script>alert('El usuario ya existe. Intenta con otro nombre de usuario.'); window.location.href='register.html';</script>";
        exit();
    }

    // Encriptar contraseña
    $password_encriptada = password_hash($password, PASSWORD_BCRYPT);

    // Insertar usuario en la base de datos
    $sql_insert = "INSERT INTO usuarios (usuario, password) VALUES (?, ?)";
    $stmt_insert = $conn->prepare($sql_insert);
    $stmt_insert->bind_param("ss", $usuario, $password_encriptada);

    if ($stmt_insert->execute()) {
        echo "<script>alert('Registro exitoso. Ahora puedes iniciar sesión.'); window.location.href='index.html';</script>";
    } else {
        echo "<script>alert('Error al registrar. Intenta nuevamente.'); window.location.href='register.html';</script>";
    }

    // Cerrar conexiones
    $stmt_check->close();
    $stmt_insert->close();
    $conn->close();
} else {
    header("Location: register.html");
    exit();
}
?>
