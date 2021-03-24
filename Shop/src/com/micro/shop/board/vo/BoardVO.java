package com.micro.shop.board.vo;

import java.util.Date;//주로 쓰이는 데이터 타입. sql은 잘안쓰임(까다로음)시,분,초가 필요없을때 사용.

public class BoardVO {
	private int id;
	private String writer;
	private Date wDate;
	private String title;
	private String content;
	private int hit;

	public BoardVO() {

	}//java는생성자가 없을때 디폴트 생성자 만듬.

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public Date getwDate() {
		return wDate;
	}

	public void setwDate(Date wDate) {
		this.wDate = wDate;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	

}
