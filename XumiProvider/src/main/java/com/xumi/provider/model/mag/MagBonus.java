package com.xumi.provider.model.mag;

import com.fasterxml.jackson.annotation.JsonProperty;

/**
 * 线下惊喜，比如注册后邮寄物品等
 * @author
 *
 */
public class MagBonus implements MagAsset {

	@Override
	public String tocken() {
		return "bonus";
	}
	
	@JsonProperty("value")
	String value;
}
