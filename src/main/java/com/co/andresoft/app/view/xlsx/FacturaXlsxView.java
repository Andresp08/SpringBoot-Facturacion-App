package com.co.andresoft.app.view.xlsx;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.view.document.AbstractXlsxView;

import com.co.andresoft.app.models.entity.Factura;
import com.co.andresoft.app.models.entity.ItemFactura;

@Component("factura/ver.xlsx")
public class FacturaXlsxView extends AbstractXlsxView{

	@Override
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		response.setHeader("Content-Disposition", "attachment; filename=\"factura_detalle.xlsx\"");
		Factura factura = (Factura)model.get("factura");
		Sheet sheet = workbook.createSheet();
		
		MessageSourceAccessor mensajes =  getMessageSourceAccessor();
		
		//Estilos para Factura
		CellStyle theaderStyle = workbook.createCellStyle();
		theaderStyle.setBorderBottom(BorderStyle.MEDIUM);
		theaderStyle.setBorderTop(BorderStyle.MEDIUM);
		theaderStyle.setBorderRight(BorderStyle.MEDIUM);
		theaderStyle.setBorderLeft(BorderStyle.MEDIUM);
		theaderStyle.setFillForegroundColor(IndexedColors.GOLD.index);
		theaderStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
		
		CellStyle tbodyStyle = workbook.createCellStyle();
		tbodyStyle.setBorderBottom(BorderStyle.THIN);
		tbodyStyle.setBorderTop(BorderStyle.THIN);
		tbodyStyle.setBorderRight(BorderStyle.THIN);
		tbodyStyle.setBorderLeft(BorderStyle.THIN);
		
		//**DATOS DEL CLIENTE**//
		Row row = sheet.createRow(0); //primera fila
		Cell cell = row.createCell(0); //primera columna
		
		cell.setCellValue(mensajes.getMessage("text.factura.ver.datos.cliente"));
		
		row.getCell(0).setCellStyle(theaderStyle);
		
		row = sheet.createRow(1);
		cell = row.createCell(0); 
		cell.setCellValue(factura.getCliente().getNombre() .concat(" " + factura.getCliente().getApellido()));
		
		row = sheet.createRow(2);
		cell = row.createCell(0);
		cell.setCellValue(factura.getCliente().getEmail());
		
		
		//**DATOS DE LA FACTURA//
		Row datosFactura = sheet.createRow(4); //crear fila
		
		datosFactura.createCell(0).setCellValue(mensajes.getMessage("text.factura.ver.datos.factura"));
		datosFactura.getCell(0).setCellStyle(theaderStyle);
		
		datosFactura = sheet.createRow(5);
		datosFactura.createCell(0).setCellValue(mensajes.getMessage("text.cliente.factura.folio") + ": " +  factura.getId());
		
		datosFactura = sheet.createRow(6);
		datosFactura.createCell(0).setCellValue(mensajes.getMessage("text.cliente.factura.descripcion") + ": " + factura.getDescripcion());
		
		datosFactura = sheet.createRow(7);
		datosFactura.createCell(0).setCellValue(mensajes.getMessage("text.cliente.factura.fecha") + ": " + factura.getCreatedAt());
		
		
		//**DATOS DETALLE FACTURA**//
		Row header = sheet.createRow(9);
		header.createCell(0).setCellValue(mensajes.getMessage("text.factura.form.item.nombre"));
		header.createCell(1).setCellValue(mensajes.getMessage("text.factura.form.item.precio"));
		header.createCell(2).setCellValue(mensajes.getMessage("text.factura.form.item.cantidad"));
		header.createCell(3).setCellValue(mensajes.getMessage("text.factura.form.item.total"));
		
		
		header.getCell(0).setCellStyle(theaderStyle);
		header.getCell(1).setCellStyle(theaderStyle);
		header.getCell(2).setCellStyle(theaderStyle);
		header.getCell(3).setCellStyle(theaderStyle);
		
		int rowNum  = 10;
		
		for (ItemFactura item : factura.getItems()) {
			Row fila = sheet.createRow(rowNum++);
			
			//aplicar bordes
			cell = fila.createCell(0);
			cell.setCellValue(item.getProducto().getNombre());
			cell.setCellStyle(tbodyStyle);
			
			cell = fila.createCell(1);
			cell.setCellValue(item.getProducto().getPrecio());
			cell.setCellStyle(tbodyStyle);
			
			cell = fila.createCell(2);
			cell.setCellValue(item.getCantidad());
			cell.setCellStyle(tbodyStyle);
			
			cell = fila.createCell(3);
			cell.setCellValue(item.calcularImporte());
			cell.setCellStyle(tbodyStyle);
		}
		
		//DATOS DEL GRAN TOTAL
		Row filaTotal = sheet.createRow(rowNum);
		
		cell = filaTotal.createCell(2);
		cell.setCellValue(mensajes.getMessage("text.factura.form.total") + ": ");
		cell.setCellStyle(tbodyStyle);
		
		cell = filaTotal.createCell(3);
		cell.setCellValue(factura.getTotalFactura());
		cell.setCellStyle(tbodyStyle);
	}

}

