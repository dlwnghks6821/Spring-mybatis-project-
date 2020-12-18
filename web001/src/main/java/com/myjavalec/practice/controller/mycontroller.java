package com.myjavalec.practice.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.myjavalec.practice.DAO.DAO;

@Controller
public class mycontroller {
	@Autowired
	private SqlSession sqlSession;
	//==> ����������<==//
	@RequestMapping("/firstpage1")
	public String firstpage() {
		return "firstpage";
	}
	//==>�α��� ������<==//
	@RequestMapping("/login")
	public String doLogin() {
		return "loginform";
	}
	//==> ȸ������ ������<==//
	@RequestMapping("/signup")
	public String doSignup() {
		return "usersignup";
	}
	@RequestMapping(value="/TrySignup",method = RequestMethod.POST)
	public String trySignup(HttpServletRequest req, Model model) {
		String userid = req.getParameter("userid");
		String useremail = req.getParameter("useremail");
		String userpassword = req.getParameter("userpassword");
		HttpSession session = req.getSession( );
		DAO dao = sqlSession.getMapper(DAO.class);
		dao.Signup(userid,userpassword,useremail);
		return "redirect:login";
	}
	
	
	@RequestMapping(value="/loginCheck",method=RequestMethod.POST)
	public String loginCheck(HttpServletRequest req , Model model) {
		String userid = req.getParameter("userid");
		System.out.println(userid);
		System.out.println("console.log1");
		String userpassword = req.getParameter("userpassword");

		System.out.println("console.log2");
		System.out.println(userpassword);

		System.out.println("console.log3");
		HttpSession session = req.getSession( );
		DAO dao = sqlSession.getMapper(DAO.class);
		System.out.println("console.log100");
		int cnt = dao.memberCheck(userid,userpassword);
		System.out.println("console.log200");
		System.out.println(cnt);
		if(cnt == 1) {
			System.out.println(cnt);
			System.out.println("console.log4");
			System.out.println(userid);
			System.out.println("console.log5");
			System.out.println(userpassword);
			System.out.println("console.log6");
			//==>ȸ�������� ���� �Ѵ�<==//
			//==>���ǿ� ������ ������ ����ش�<==//
			session.setAttribute("uid",userid);
			System.out.println ("console.log7");
			return "redirect:firstpage1";
		}else{
			//==>���̺� ȸ�������� ����(0)<==//
			return "redirect:login";
			//==> ȸ�������� �����Ƿ� �ٽ� �α��� �ϰ� �����<==//
		}
		//==>�α��� ���� �ϸ� , �۸������ ���Բ��Ѵ�<==//
		
	}
	
}
