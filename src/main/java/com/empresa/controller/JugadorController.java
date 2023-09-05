package com.empresa.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.empresa.entity.Jugador;
import com.empresa.service.JugadorService;

@Controller
public class JugadorController {

	private final JugadorService service;
	
	public JugadorController(JugadorService service) {
		this.service = service;
	}
	
	@GetMapping("/verJugador")
	public String verJugador() {
		return "registraJugador";
	}
	
	@PostMapping("/registraJugador")
	@ResponseBody
	public Map<?, ?> registraJugador(Jugador obj){
		HashMap<String, String> map = new HashMap<>();
		Jugador objSalida = service.insertaJugador(obj);
		if(objSalida == null) {
			map.put("MENSAJE", "ERROR");
		}else {
			map.put("MENSAJE", "Registro Exitoso");
		}
		
		return map;
	}
}
