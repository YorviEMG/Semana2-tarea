<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<script type="text/javascript" src="js/global.js"></script>

<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>
<title>Ejemplos de CIBERTEC - Jorge Jacinto </title>
</head>
<body>

<div class="container">
<h1>Registra Jugador</h1>
	<form id="id_form"> 
		<div class="row" style="margin-top: 5%">
			<div class="form-group col-sm-6">
				<div class="col-sm-3">
					<label class="control-label" for="id_nombre">Nombre</label>
				</div>
				<div class="col-sm-9">
					<input class="form-control" type="text" id="id_nombre" name="nombre" placeholder="Ingrese el nombre" maxlength="40">
				</div>
			</div>
			<div class="form-group  col-sm-6">
				<div class="col-sm-2">
					<label class="control-label" for="id_alias">Alias</label>
				</div>
				<div class="col-sm-10">
					<input class="form-control" type="text" id="id_alias" name="alias" placeholder="Ingrese el alias" maxlength="12">
		 		</div>
			</div>
		</div>
		<div class="row" style="margin-top: 0%">
			<div class="form-group col-sm-6">
				<div class="col-sm-3">
					<label class="control-label" for="id_juego">Juego</label>
				</div>
				<div class="col-sm-9">
					<input class="form-control" type="text" id="id_juego" name="juego" placeholder="Ingrese el juego" maxlength="100">
				</div>
			</div>
			<div class="form-group col-sm-3">
				<div class="col-sm-4">
					<label class="control-label" for="id_pais">País</label>
				</div>
				<div class="col-sm-8">
					<input class="form-control" type="text" id="id_pais" name="pais" placeholder="Ingrese el país" maxlength="100">
				</div>
			</div>
			<div class="form-group col-sm-3">
				<div class="col-sm-6">
					<label class="control-label" for="id_experiencia">Experiencia</label>
				</div>
				<div class="col-sm-6">
					<input class="form-control" type="number" id="id_experiencia" name="experiencia" value="0" maxlength="2">
				</div>
			</div>
		</div>
		
		<div class="row" style="margin-top: 2%" align="center"	>
				<button id="id_registrar" type="button" class="btn btn-primary" >Crear Jugador</button>
		</div>	
	</form>
	
	
</div>

<script type="text/javascript">
	$("#id_registrar").click(function(){
		
		var validator = $("#id_form").data('bootstrapValidator');
		validator.validate();
		
		if(validator.isValid()){
			$.ajax({
				type: "POST",
				url: "registraJugador",
				data: $("#id_form").serialize(),
				success: function(data){
					mostrarMensaje(data.MENSAJE);
					validator.resetForm();
					limpiarFormulario();
				},
				error: function(){
					mostrarMensaje(data.MSG_ERROR);
				}
			});
		}
		
	});
	
	function limpiarFormulario(){
		$('#id_nombre').val('');
		$('#id_alias').val('');
		$('#id_pais').val('');
		$('#id_juego').val('');
		$('#id_experiencia').val('');
	}
	$(document).ready(function() {
	    $('#id_form').bootstrapValidator({
	        message: 'This value is not valid',
	        feedbackIcons: {
	            valid: 'glyphicon glyphicon-ok',
	            invalid: 'glyphicon glyphicon-remove',
	            validating: 'glyphicon glyphicon-refresh'
	        },
	        fields: {
	        		nombre:{
	                    selector: "#id_nombre",
	                    validators:{
	                        notEmpty: {
	                             message: 'El nombre es obligatorio'
	                        },
	                        stringLength: {
	                            min: 3,
	                            max: 40,
	                            message: 'El nombre es de 3 a 40 caracteres'
	                        },
	                    }
	                },
	                alias:{
	                    selector: "#id_alias",
	                    validators:{
	                        notEmpty: {
	                             message: 'El alias es obligatorio'
	                        },
	                        stringLength: {
	                            min: 3,
	                            max: 40,
	                            message: 'El alias es de 3 a 40 caracteres'
	                        },
	                    }
	                },
	                pais:{
	                    selector: "#id_pais",
	                    validators:{
	                        notEmpty: {
	                             message: 'El pais es obligatorio'
	                        },
		                    }
	                },
	                juego:{
	                    selector: "#id_juego",
	                    validators:{
	                        notEmpty: {
	                             message: 'El juego es obligatorio'
	                        }
	                    }
	                },
	                experiencia:{
	                    selector: "#id_experiencia",
	                    validators:{
	                    	 regexp: {
	                             regexp: /^[1-9]{1}\d?$/,
	                             message: 'No válido'
	                         }
	                    }
	                },
	        }   
	    });

	    
	});

</script>

</body>
</html>




