package priv.test;

import static org.junit.jupiter.api.Assertions.*;

import java.lang.reflect.InvocationTargetException;

import org.apache.commons.beanutils.BeanUtils;
import org.junit.jupiter.api.Test;

import com.Model.TravelUser;

class BeanUtilsTest {

	@Test
	void testSetProperty() throws IllegalAccessException, InvocationTargetException {
		Object object = new TravelUser();
		System.out.println(object);
		
		BeanUtils.setProperty(object, "userID","1123");
		System.out.println(object);
	}

}
