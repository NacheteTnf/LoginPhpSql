<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="estilos.css">
</head>
<body>
    <?php
    $conexion = new mysqli("127.0.0.1", "root" , "", "facturas");
    $conexion->set_charset("utf8");
    $sql = "SELECT Clientes.NifOCif, Clientes.Password, Clientes.NombreYApellidos FROM Clientes WHERE (((Clientes.NifOCif)=?) AND ((Clientes.Password)=?))";
    $instruccion = $conexion->prepare($sql);
    $instruccion->bind_param("ss", $_POST["nif"], $_POST["password"]);
    $instruccion->execute();
    $tabla = $instruccion->get_result();

    if($tabla->num_rows == 0){
        echo "ERROR! Los datos introduccidos son incorrectos";

        echo "<a href='factura.html'>Volver a la pagina principal</a>";
        
    }else{
        $registro = $tabla->fetch_object();
    
    ?>
    <div id="Contenedor2">
        <div id="rojo">
            <?=$registro->NombreYApellidos?>
        </div>
        <div id="negro">
            <img src="imagenes/muneco.png" alt="">
        </div>
        <div id="azul">
            Facturas
        </div>
        <p id="TotalFactura">
            TOTAL FACTURADO: <span>185,27$</span>
        </p>
        <article>
            <div>
                <p>
                    Love MARINO HIDALGO
                </p>
                <p>
                    87,74$
                    <img src="imagenes/flecha.png" alt="">
                </p>
            </div>
            <p>
                27 de septiembre de 2021
            </p>
        </article>
    </div>
    <?php
    }
    ?>
</body>
</html>