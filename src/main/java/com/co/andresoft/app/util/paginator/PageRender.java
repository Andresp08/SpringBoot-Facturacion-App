package com.co.andresoft.app.util.paginator;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.domain.Page;

public class PageRender<T> { // generico

	private String url;
	private Page<T> page;

	private int totalPaginas;
	private int numeroElementosPorPagina;
	private int paginaActual;
	
	private List<PageItem> paginas;

	public PageRender(String url, Page<T> page) {
		this.url = url;
		this.page = page;
		this.paginas = new ArrayList<PageItem>();

		numeroElementosPorPagina = page.getSize();
		totalPaginas = page.getTotalPages();
		paginaActual = page.getNumber() + 1; // porque en el controller empieza en cero

		int desde, hasta;
		if (totalPaginas <= numeroElementosPorPagina) { 
			desde = 1; 
			hasta = totalPaginas; 
		} else {
			if (paginaActual <= numeroElementosPorPagina / 2) { 
				desde = 1;
				hasta = numeroElementosPorPagina; 
			} else if (paginaActual >= totalPaginas - numeroElementosPorPagina / 2) { 
				desde = totalPaginas - numeroElementosPorPagina + 1; 
				hasta = numeroElementosPorPagina;
			} else {
				desde = paginaActual - numeroElementosPorPagina / 2;
				hasta = numeroElementosPorPagina;
			}
		}
		
		for (int i = 0; i < hasta ; i++) {
			paginas.add(new PageItem(desde + i, paginaActual == desde + i));
		}
		
		
	}
	
	public boolean isFirst() {
		return page.isFirst();
	}
	
	public boolean isLast() {
		return page.isLast();
	}
	
	public boolean hasNext() {
		return page.hasNext();
	}
	
	public boolean hasPrevious() {
		return page.hasPrevious();
	}

	public String getUrl() {
		return url;
	}

	public int getTotalPaginas() {
		return totalPaginas;
	}

	public int getPaginaActual() {
		return paginaActual;
	}

	public List<PageItem> getPaginas() {
		return paginas;
	}
}
