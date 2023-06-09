package com.jsfw.config;

import org.apache.commons.codec.digest.DigestUtils;

public class ConvertPasswordToMD5 {
	public static String ConvertToMD5(String password) {
		return DigestUtils.md5Hex(password).toUpperCase();
	}
}
