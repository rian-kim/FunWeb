<%@page import="member.MemberDAO"%>
<%@page import="member.MemberDTO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//member/joinPro.jsp

// 서버에 request 저장
// requst 한글처리
request.setCharacterEncoding("utf-8");
// request 파라미터 가져오기 id, pass, name
String id=request.getParameter("id");
String pass=request.getParameter("pass");
String name=request.getParameter("name");
// 현시스템 날짜 Timestamp 가져오기 => date 변수 저장
Timestamp date=new Timestamp(System.currentTimeMillis());
// 추가 email, address, phone, mobile
String email=request.getParameter("email");
String address=request.getParameter("address");
String phone=request.getParameter("phone");
String mobile=request.getParameter("mobile");

// member 패키지 MemberDAO, MemberDTO 가져오기

// MemberDTO 객체생성
MemberDTO dto=new MemberDTO();
System.out.println("MemberDTO 바구니 주소 : "+dto);
//set호출해서 값을 저장
dto.setId(id);
dto.setPass(pass);
dto.setName(name);
dto.setDate(date);
//추가 email, address, phone, mobile
dto.setEmail(email);
dto.setAddress(address);
dto.setPhone(phone);
dto.setMobile(mobile);

// WEB-INF-lib - mysql-connector-j-8.0.31.jar 
// META-INF => context.xml 가져오기
// MemberDAO 객체생성
MemberDAO dao=new MemberDAO();
System.out.println("MemberDAO 주소 : "+dao);
// inserMember(dto) 메서드 호출 => // 추가 email, address, phone, mobile
dao.insertMember(dto);
// login.jsp 이동
response.sendRedirect("login.jsp");
%>