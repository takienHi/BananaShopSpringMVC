/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package unit;

import java.text.NumberFormat;
import java.util.Locale;

/**
 *
 * @author PC
 */
public class XuLyTien {
    public static String dinhDangTien(double tien) {
		Locale localeVN = new Locale("vi", "VN");
	NumberFormat currencyVN = NumberFormat.getCurrencyInstance(localeVN);
		return currencyVN.format(tien);
		
	}
}
