package com.co.andresoft.app.dao;

import org.springframework.data.repository.CrudRepository;

import com.co.andresoft.app.models.entity.Factura;

public interface IFacturaDao extends CrudRepository<Factura, Long>{

}
