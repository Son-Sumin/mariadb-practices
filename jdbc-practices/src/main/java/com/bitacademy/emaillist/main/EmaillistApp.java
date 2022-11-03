package com.bitacademy.emaillist.main;

import java.util.List;
import java.util.Scanner;

import com.bitacademy.emaillist.dao.EmaillistDao;
import com.bitacademy.emaillist.vo.EmaillistVo;

public class EmaillistApp {

	private static Scanner scanner = null;
	
	public static void main(String[] args) {
		scanner = new Scanner(System.in);

		while (true) {
			System.out.println("(l)ist, (a)dd, (d)elete, (q)uit > ");
			String command = scanner.nextLine();

			if ("l".equals(command)) {
				doList();
			} else if ("a".equals(command)) {
				doAdd();
			} else if ("d".equals(command)) {
				doDelete();
			} else if ("q".equals(command)) {
				break;
			}

		}
		scanner.close();
	}

	private static void doDelete() {
		// TODO Auto-generated method stub
		doList();
	}

	private static void doAdd() {
		System.out.print("성: ");
		String firstName = scanner.nextLine();
		
		System.out.print("이름: ");
		String lastName = scanner.nextLine();	
		
		System.out.print("이메일: ");
		String email = scanner.nextLine();	
		
		System.out.println(firstName + ":" + lastName + ":" + "email");
		doList();
		}

	private static void doList() {
		List<EmaillistVo> list = new EmaillistDao().findAll();
		for(EmaillistVo vo : list) {
			System.out.println("이름: " + vo.getFirst_name() + " " + vo.getLast_name() + ", 이메일: " + vo.getEmail());
		}
		
	}

}
