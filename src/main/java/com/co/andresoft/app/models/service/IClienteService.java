package com.co.andresoft.app.models.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.co.andresoft.app.models.entity.Cliente;
import com.co.andresoft.app.models.entity.Factura;
import com.co.andresoft.app.models.entity.Producto;

public interface IClienteService {

	public List<Cliente> findAll();

	public Page<Cliente> findAll(Pageable pageable);

	public void save(Cliente cliente);

	public Cliente findOne(Long id);

	public Cliente findClienteByIdWithFacturas(Long id);

	public void delete(Long id);

	public List<Producto> findProductByName(String term);

	public Producto findProductoById(Long id);
	
	public void saveFactura(Factura factura);

	public Factura findFacturaById(Long id);

	public Factura findFacturaByIdWithClienteWithItemFacturaWithProducto(Long id);

	public void deleteFactura(Long id);
}
