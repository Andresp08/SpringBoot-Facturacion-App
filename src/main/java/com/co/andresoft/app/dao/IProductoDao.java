package com.co.andresoft.app.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.co.andresoft.app.models.entity.Producto;

public interface IProductoDao extends CrudRepository<Producto, Long>{
	
	@Query("SELECT p FROM Producto p WHERE p.nombre LIKE %?1%")
	public List<Producto> findProductByName(String term);
	
	public List<Producto> findByNombreLikeIgnoreCase(String term);
	
}
