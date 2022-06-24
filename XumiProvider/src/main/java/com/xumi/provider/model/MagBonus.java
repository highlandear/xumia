package com.xumi.provider.model;

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
	String value = this.getClass().descriptorString();
}
