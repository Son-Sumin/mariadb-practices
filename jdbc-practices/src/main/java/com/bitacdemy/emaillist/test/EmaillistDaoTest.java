package com.bitacdemy.emaillist.test;

import java.util.List;

import com.bitacdemy.emaillist.dao.EmaillistDao;
import com.bitacdemy.emaillist.vo.EmaillistVo;

public class EmaillistDaoTest {

	public static void main(String[] args) {
		testFindAll();

	}

	private static void testFindAll() {
		List<EmaillistVo> list = new EmaillistDao().findAll();
		for(EmaillistVo vo : list) {
			System.out.println(vo);
		}
	}

}
