package com.lee.model;

import java.util.Date;

public class Board {
	@Override
	public String toString() {
		return "Board [id=" + id + ", title=" + title + ", author=" + author + ", content=" + content + ", date=" + date
				+ "]";
	}
	private int id;
	private String title;
	private String author;
	private String content;
	private Date date;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getContent() {
		return content;
	}
}
