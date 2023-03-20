package com.project.movie.util;

import java.io.IOException;

import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;
import net.nurigo.sdk.message.service.DefaultMessageService;

public class SmsService {

	final DefaultMessageService messageService = NurigoApp.INSTANCE.initialize("NCSHZ0XH9OY0TE3B",
			"AL0LT469JEKMDT3UK7ZVY7VX7I2D5XY3", "https://api.coolsms.co.kr");;

	public SingleMessageSentResponse sendMmsByResourcePath(String sendPhone, String recievePhone, String msg)
			throws IOException {
		Message message = new Message();
		// 諛쒖떊踰덊샇 諛� �닔�떊踰덊샇�뒗 諛섎뱶�떆 01012345678 �삎�깭濡� �엯�젰�릺�뼱�빞 �빀�땲�떎.
		message.setFrom(sendPhone);
		message.setTo(recievePhone);
		message.setText(msg);

//		// �뿬�윭 嫄� 硫붿떆吏� 諛쒖넚�씪 寃쎌슦 send many �삁�젣�� �룞�씪�븯寃� 援ъ꽦�븯�뿬 諛쒖넚�븷 �닔 �엳�뒿�땲�떎.
		SingleMessageSentResponse response = messageService.sendOne(new SingleMessageSendingRequest(message));
		System.out.println(response);
		return response;
//		return null;
	}
}
