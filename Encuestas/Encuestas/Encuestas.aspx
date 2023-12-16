<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Encuesta</title>
    <!-- Estilos de Bootstrap (CDN) -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <form id="encuestaForm" method="post" action="ProcesarEncuesta.aspx">
                    <div class="mb-3">
                        <label for="nombre" class="form-label">Nombre</label>
                        <input type="text" class="form-control" id="nombre" name="nombre" required>
                    </div>
                    <div class="mb-3">
                        <label for="edad" class="form-label">Edad</label>
                        <input type="number" class="form-control" id="edad" name="edad" min="18" max="50" required>
                    </div>
                    <div class="mb-3">
                        <label for="correo" class="form-label">Correo Electrónico</label>
                        <input type="email" class="form-control" id="correo" name="correo" required>
                    </div>
                    <div class="mb-3">
                        <label for="partidoPolitico" class="form-label">Partido Político</label>
                        <select class="form-select" id="partidoPolitico" name="partidoPolitico" required>
                            <option value="">Seleccionar partido</option>
                            <option value="PLN">PLN</option>
                            <option value="PUSC">PUSC</option>
                            <option value="PAC">PAC</option>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary">Enviar Encuesta</button>
                </form>
            </div>
        </div>
    </div>

<link rel="stylesheet" href="estilos.css">


    <!-- Scripts de Bootstrap (CDN) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>


