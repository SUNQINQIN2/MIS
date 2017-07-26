/**
 * Copyright 2015 Shanghai bojcf investment management co., LTD All rights reserved.
 * @description
 * @author CF
 * @date 2015年8月24日
 */
package mis.common;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.UUID;

/**
 * @description MD5加密相关的工具类
 * @author CF
 * @date 2015年8月24日
 */
public class EncoderMD5 {
	private static final String MESSAGE_ENCRYPT_TYPE = "MD5";
	private EncoderMD5(){
		
	}
	/** 
	 * 加密：MD5
	 * 
	 * @param str
	 * @return
	 */
	public static String str2md5(String str) {
		try {
			MessageDigest alga = MessageDigest.getInstance(MESSAGE_ENCRYPT_TYPE);
			alga.update(str.getBytes());
			byte[] digesta = alga.digest();
			return byte2hex(digesta);
		} catch (NoSuchAlgorithmException ex) {
			return str;
		}
	}

	/**
	 * 二进制转字符串
	 * 
	 * @param b
	 * @return
	 */
	public static String byte2hex(byte[] b) {
		String hs = "";
		String stmp = "";
		for (int n = 0; n < b.length; n++) {
			stmp = (Integer.toHexString(b[n] & 0XFF));
			if (stmp.length() == 1) {
				hs = hs + "0" + stmp;
			} else {
				hs = hs + stmp;
			}
		}
		return hs.toUpperCase();
	}

	/**
	 * IP字符串转换成二进制字符串
	 * 
	 * @param ip
	 * @return
	 */
	public static String ip2hex(final String ip) {
		byte[] b = new byte[4];
		String[] items = ip.split("[.]");
		for (int i = 0; i < 4; i++) {
			b[i] = str2byte(items[i]);
		}
		return byte2hex(b);
	}

	/**
	 * IP字符段转byte
	 * 
	 * @param value
	 * @return
	 */
	private static byte str2byte(final String value) {
		final int iValue = Integer.parseInt(value);
		return (byte) (iValue - 128);
	}

	public static String genUuid() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
}
