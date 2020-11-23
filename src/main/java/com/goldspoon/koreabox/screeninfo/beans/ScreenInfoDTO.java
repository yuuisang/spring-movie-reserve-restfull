package com.goldspoon.koreabox.screeninfo.beans;

import java.sql.Timestamp;

// DTO : Data Transfer Object
public class ScreenInfoDTO {
	private int uid;    // wr_uid
	private String subject;  // wr_subject
	private String content;  // wr_content
	private String name;   // wr_name
	private int viewCnt;   // wr_viewcnt
	private Timestamp regDate;   // wr_regdate
	
	
	// 웹개발시..
	// 가능한, 다음의 3가지 이름을 일치시켜 주는게 좋습니다.
	// DB필드명 = 클래스필드명 = form 의 name 명
	
	// 기본생성자
	public ScreenInfoDTO() {
		super();
//		System.out.println("WriteDTO() 객체 생성");
	}
	
	// 매개변수 받는 생성자
	public ScreenInfoDTO(int uid, String subject, String content, String name, int viewCnt) {
		super();
		this.uid = uid;
		this.subject = subject;
		this.content = content;
		this.name = name;
		this.viewCnt = viewCnt;
//		System.out.printf("WriteDTO(%d, %s, %s, %s, %d) 객체 생성", 
//				uid, subject, content, name, viewCnt);
	}

	// getter & setter
	public int getUid() {
//		System.out.println("getUid() 호출");
		return uid;
	}
	public void setUid(int uid) {
//		System.out.println("setUid(" + uid + ") 호출");
		this.uid = uid;
	}
	public String getSubject() {
//		System.out.println("getSubject() 호출");
		return subject;
	}
	public void setSubject(String subject) {
//		System.out.println("setSubject(" + subject + ") 호출");
		this.subject = subject;
	}
	public String getContent() {
//		System.out.println("getContent() 호출");
		return content;
	}
	public void setContent(String content) {
//		System.out.println("setContent(" + content + ") 호출");
		this.content = content;
	}
	public String getName() {
//		System.out.println("getName() 호출");
		return name;
	}
	public void setName(String name) {
//		System.out.println("setName(" + name + ") 호출");
		this.name = name;
	}
	public int getViewCnt() {
//		System.out.println("getViewCnt() 호출");
		return viewCnt;
	}
	public void setViewCnt(int viewCnt) {
//		System.out.println("setViewCnt(" + viewCnt + ") 호출");
		this.viewCnt = viewCnt;
	}
	public Timestamp getRegDate() {
//		System.out.println("getRegDate() 호출");
		return regDate;
	}
	public void setRegDate(Timestamp regDate) {
//		System.out.println("setRegDate(" + regDate + ") 호출");
		this.regDate = regDate;
	}
	

	// 개발할때  Class 의   toString() 오버라이딩 해주면
	// 디버깅이나 테스트 하기 좋다.
	@Override
	public String toString() {
		return String.format("WriteDTO] %d : %s : %s : %s : %d : %s", 
				uid, subject, content, name, viewCnt, regDate);
	}
	

		
} // end DTO

















