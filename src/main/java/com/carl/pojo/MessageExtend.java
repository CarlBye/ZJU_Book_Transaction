package com.carl.pojo;

public class MessageExtend {
	private Books books;
	private User sender;
	private User receiver;
	private Message message;

	public Message getMessage() {
		return message;
	}

	public void setMessage(Message message) {
		this.message = message;
	}


	public Books getBooks() {
		return books;
	}
	public void setBooks(Books books) {
		this.books = books;
	}

	public User getSender() {
		return sender;
	}

	public void setSender(User sender) {
		this.sender = sender;
	}

	public User getReceiver() {
		return receiver;
	}

	public void setReceiver(User receiver) {
		this.receiver = receiver;
	}

}