package net.daum.controller;

import java.util.List;

import com.naver.dao.Gu2DAOImpl;

import net.daum.vo.Gu2Vo;

public class Gu_List {
	public static void main(String[] args) {
		Gu2DAOImpl gdao = new Gu2DAOImpl();
		List<Gu2Vo> gl = gdao.getGulist();
		System.out.println("no \t name \t title \t cont \t date");
		System.out.println("=========================");
		if(gl != null && gl.size()>0) {
			for(Gu2Vo g:gl) {
				System.out.println(g.getGno()+" "+g.getGname()+" "+g.getGtitle()+" "+g.getGcont()+" "+g.getGdate());
				
			}
		}
		else {
			System.out.println("방명록이 없습니다");
		}
	}
}
