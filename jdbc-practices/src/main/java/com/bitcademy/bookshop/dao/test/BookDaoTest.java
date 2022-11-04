package com.bitcademy.bookshop.dao.test;

import com.bitcademy.bookshop.dao.BookDao;
import com.bitcademy.bookshop.vo.BookVo;

public class BookDaoTest {

	public static void main(String[] args) {
		testInsert(2L, "트와일라잇");
		testInsert(2L, "뉴문");
		testInsert(2L, "이클립스");
		testInsert(2L, "브레이킹던");
		testInsert(3L, "아리랑");
		testInsert(4L, "젊은그들");
		testInsert(5L, "아프니깐 청춘이다");
		testInsert(6L, "귀천");
		testInsert(3L, "태백산맥");
		testInsert(7L, "풀하우스");
	}

	private static void testInsert(Long authorNo, String title) {
		BookVo vo = new BookVo();
		
		vo.setTitle(title);
		vo.setStatus("재고있음");
		vo.setAuthorNo(authorNo);
		
		new BookDao().insert(vo);
	}

}
