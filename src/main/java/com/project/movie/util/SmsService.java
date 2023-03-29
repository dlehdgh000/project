package com.project.movie.util;

import java.io.IOException;

import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;
import net.nurigo.sdk.message.service.DefaultMessageService;

public class SmsService {

	//cool sms 계정 내 등록된 유효한 API 키, API Secret Key를 입력
	final DefaultMessageService messageService = NurigoApp.INSTANCE.initialize("NCSHZ0XH9OY0TE3B",
			"AL0LT469JEKMDT3UK7ZVY7VX7I2D5XY3", "https://api.coolsms.co.kr");;

	// 전송할 번호, 수신자번호 ,메세지 저장
	public SingleMessageSentResponse sendMmsByResourcePath(String sendPhone, String recievePhone, String msg)
			throws IOException {
		Message message = new Message();
		// 발신,수신 번호에 - 제거
		message.setFrom(sendPhone);
		message.setTo(recievePhone);
		message.setText(msg);

//		단일 발송
		SingleMessageSentResponse response = messageService.sendOne(new SingleMessageSendingRequest(message));
		System.out.println(response);
		return response;

	}
}
