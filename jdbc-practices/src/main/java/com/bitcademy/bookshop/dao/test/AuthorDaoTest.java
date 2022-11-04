package com.bitcademy.bookshop.dao.test;

import com.bitcademy.bookshop.dao.AuthorDao;
import com.bitcademy.bookshop.vo.AuthorVo;

public class AuthorDaoTest {

	public static void main(String[] args) {
		testInsert("스테파니메이어");
		testInsert("조정래");
		testInsert("김동인");
		testInsert("김난도");
		testInsert("천상병");
		testInsert("원수연");
	}

	private static void testInsert(String name) {
		AuthorDao dao = new AuthorDao();
		
//		AuthorVo vo = null;
//		vo = new AuthorVo();
		
		AuthorVo vo = new AuthorVo();
		vo.setName(name);
		dao.insert(vo);
		
		
	}

}
