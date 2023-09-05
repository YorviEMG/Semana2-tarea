package com.empresa.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.empresa.entity.Concurso;
import com.empresa.service.ConcursoService;

@Controller
public class ConcursoController {
	
	
	private final ConcursoService service;
	
	//Spring automáticamente agrega @Autowired
	public ConcursoController(ConcursoService service) {
		this.service = service;
	}
	
	@GetMapping("/verConcurso")
	public String verConcurso() {
		return "registraConcurso";
	}
	
	@PostMapping("/registraConcurso")
	@ResponseBody
	public Map<?, ?> registra(Concurso obj){
		final String estado = "Activo";
		HashMap<String, String> map = new HashMap<String, String>();
		obj.setEstado(estado);
		Concurso objSalida = service.insertaConcurso(obj);
		if(objSalida == null) {
			map.put("MENSAJE", "ERROR");
		} else {
			map.put("MENSAJE", "Registro Exitoso");
		}
		return map;
	}
	
}
