package com.co.andresoft.app.dao;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.co.andresoft.app.models.entity.Cliente;

public interface IClienteDao extends PagingAndSortingRepository<Cliente, Long>{

	@Query("SELECT c from Cliente c LEFT JOIN FETCH c.facturas f WHERE c.id=?1")
	public Cliente fetchByIdWithFacturas(Long id);
	
}
