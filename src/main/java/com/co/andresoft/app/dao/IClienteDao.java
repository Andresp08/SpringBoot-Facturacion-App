package com.co.andresoft.app.dao;

import org.springframework.data.repository.PagingAndSortingRepository;

import com.co.andresoft.app.models.entity.Cliente;

public interface IClienteDao extends PagingAndSortingRepository<Cliente, Long>{

}
