package com.heno.airock.dto;

public class ChatMessageDetailVO extends ChatMessageVO{
	
	private String Contents; // 채팅 내용
	private String chatDt; //채팅 시간
	
	public String getContents() {
		return Contents;
	}

	public void setContents(String contents) {
		Contents = contents;
	}
	
	public String getChatSeq() {
		return super.getChatSeq();
	}
	
	public void setChatSeq(String chatSeq) {
		super.setChatSeq(chatSeq);
	}
	
	public String getChatDiv() {
		return super.getChatDiv();
	}
	
	public void setChatDiv(String chatDiv) {
		super.setChatDiv(chatDiv);
	}

	public String getChatDt() {
		return chatDt;
	}

	public void setChatDt(String chatDt) {
		this.chatDt = chatDt;
	}

	@Override
	public String toString() {
		return "ChatMessageDetailVO [Contents=" + Contents + ", chatDt=" + chatDt + "]";
	}

	public ChatMessageDetailVO(String chatSeq, String chatDiv, String contents, String chatDt) {
		super(chatSeq, chatDiv);
		Contents = contents;
		this.chatDt = chatDt;
	}
	
	
	
	
	
}
