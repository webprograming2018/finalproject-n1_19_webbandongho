/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package connect;
import java.awt.Color;
import org.apache.pdfbox.pdmodel.*;
import java.io.*;
import org.apache.pdfbox.pdmodel.font.PDFont;
import org.apache.pdfbox.pdmodel.font.PDType1Font;
import org.apache.pdfbox.text.PDFTextStripper;
/**
 *
 * @author NHUNG_COI
 */
public class NewClass {
    
    
    public static void main(String[] args) {
      	 
        	PDDocument doc = null;
        PDPage page = null;

        try {
	    	doc = new PDDocument();
	        page = new PDPage();

	        doc.addPage(page);
	        PDFont font = PDType1Font.HELVETICA_BOLD;

	        PDPageContentStream content = new PDPageContentStream(doc, page);
	        content.beginText();
	        content.setFont( font, 20 );
	        content.setNonStrokingColor(Color.BLUE);
	        content.moveTextPositionByAmount( 100, 700 );
	        content.drawString("Hello It's me");

	        content.endText();
	        content.close();

	        doc.save("HoaDon.pdf");
	        doc.close();
		} catch (Exception ex) {
			System.out.println(ex);
		}
    }
    }
    
     

