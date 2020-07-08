package com.qiusamin.book.saas.domain.dos;

/**
 * @author gu tianbo
 * @version 1.0
 * @date 2020/06/11
 * message do for saas message and user message
 */
public class MessageDO {
    private long messageId;
    private String messageContent;
    private long receiverUserId;
    private int status;

    public long getMessageId() {
        return messageId;
    }

    public void setMessageId(long messageId) {
        this.messageId = messageId;
    }

    public String getMessageContent() {
        return messageContent;
    }

    public void setMessageContent(String messageContent) {
        this.messageContent = messageContent;
    }

    public long getReceiverUserId() {
        return receiverUserId;
    }

    public void setReceiverUserId(long receiverUserId) {
        this.receiverUserId = receiverUserId;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
